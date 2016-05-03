package com.mycompany.controller.fivecard;

import com.mycompany.controller.account.ManageCustomerAddressesController;
import com.mycompany.controller.wrapper.CustomerWrapper;
import com.mycompany.sample.core.catalog.domain.*;
import com.mycompany.sample.service.FiveCardService;
import com.mycompany.sample.service.ShopService;
import com.mycompany.sample.service.WeixinService;
import com.mycompany.sample.util.CommonUtils;
import com.mycompany.sample.util.WaterMarkUtils;
import org.broadleafcommerce.profile.core.domain.Address;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.core.domain.CustomerAddress;
import org.broadleafcommerce.profile.core.domain.CustomerAttribute;
import org.broadleafcommerce.profile.core.service.AddressService;
import org.broadleafcommerce.profile.core.service.CustomerAddressService;
import org.broadleafcommerce.profile.core.service.CustomerService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * Created by jackie on 4/23/2016.
 */
@Controller
@RequestMapping("/fiveCard")
public class FiveCardController {
    private final String retView = "fivecard/5zheka_new";
    @Resource
    private FiveCardService fiveCardService;
    @Resource(name = "blCustomerService")
    private CustomerService customerService;
    @Resource
    private WeixinService weixinService;

    @Resource(name = "blAddressService")
    private AddressService addressService;
    @Resource(name = "blCustomerAddressService")
    private CustomerAddressService customerAddressService;
    @Resource
    private ShopService shopService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String getFiveCardPage(HttpServletRequest request, String shopOutOfRange) {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref cardXref = customer.getFiveCardXref();
        request.setAttribute("cardType", cardXref.getType());
        request.setAttribute("cardStatus", cardXref.getStatus());
        request.setAttribute("referrer", cardXref.getReferer());
        request.setAttribute("shopOutRange", Objects.nonNull(shopOutOfRange));
        FiveCard fiveCard = cardXref.getFiveCard();
        if (Objects.nonNull(fiveCard)) {
            request.setAttribute("cardCode", fiveCard.getNo());
        }
        return retView;
    }

    @RequestMapping(value = "/sharePage", method = RequestMethod.GET)
    public String getFiveCardSharePage() {
        return "card5_share";
    }

    /**
     * 派发五折卡资格
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/issue", method = RequestMethod.GET)
    public String issueFiveCard(HttpServletRequest request, HttpSession session) {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        String retView = "redirect:/fiveCard";
        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        Long referrer = (Long) session.getAttribute("referrer");
        //检测是否是通过分享链接进入
        if (Objects.nonNull(referrer)) {
            session.removeAttribute("referrer");
        }
        //判断用户是否已经拥有五张卡
        if (Objects.nonNull(fiveCardXref)) {
            //A卡返回首页
            if (fiveCardXref.getType() == FiveCard.CARD_TYPE_A) {
                return "redirect:/index";
            } else {
                //B卡返回五折卡页面
                return retView;
            }
        }
        //判断五折卡类型
        int type = 1;//默认五折卡类型为分享获取的
        if (Objects.isNull(referrer)) {
            type = 0;
        }
        FiveCard fiveCard = fiveCardService.readByStatusAndType(false, type);
        //没有可用的五折卡
        if (Objects.isNull(fiveCard)) {
            return "redirect:/unavailable";
        }
        //发放五折卡
        CustomerFiveCardXref cardXref = new CustomerFiveCardXrefImpl();
        cardXref.setCustomer(customer);
        cardXref.setStatus(FiveCard.CARD_STATUS_INACTIVE);
        cardXref.setType(type);
        cardXref.setCreateDate(CommonUtils.currentDate());
        //设置分享人
        if (Objects.nonNull(referrer)) {
            Customer referrerCustomer = customerService.readCustomerById((Long) referrer);
            cardXref.setReferer(referrerCustomer);
        }
        customer.setFiveCardXref(cardXref);
        customerService.saveCustomer(customer);
        //派卡完成后移除session中的推荐人
        session.removeAttribute("referrer");
        //如果为A卡资格则自动去激活
        if (cardXref.getType() == FiveCard.CARD_TYPE_A) {
            return "redirect:/fiveCard/activate";
        }
        return retView;
    }

    @RequestMapping("/unavailable")
    public String fiveCardUnavailable() {
        return "fivecard/fivecard_unavailable";
    }

    /**
     * 激活五折卡
     *
     * @return
     */
    @RequestMapping("/activate")
    public String activateFiveCard() {
        //判断是否已经领取五折卡
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref cardXref = customer.getFiveCardXref();
        //还未领取五折卡,跳转到首页进行领取
        if (Objects.isNull(cardXref)) {
            return "redirect:/index";
        }
        //检测五折卡是否已激活
        if (cardXref.getStatus()) {
            return "redirect:/fiveCard";
        }
        //检查五折卡类型,B卡则需要填写收货地址则可以激活卡
        if (cardXref.getType() == FiveCard.CARD_TYPE_B && (Objects.isNull((customer.getCustomerAddresses())) || customer.getCustomerAddresses().size() == 0)) {
            return "redirect:/account/addresses?activeFiveCard=true";
        } else if (cardXref.getType() == FiveCard.CARD_TYPE_A) {
            CustomerAddress followedAddress = hasFollowShop(customer);
            //2调用接口查看是否有关注门店
            if (Objects.isNull(followedAddress)) {
                Map<String, Object> vipInfo = weixinService.getVipInfo(customer.getUsername());
                //将用户关注的门店写入数据库
                if (Objects.nonNull(vipInfo)) {
                    Shop shop = shopService.readShopByCode((String) vipInfo.get("unit_code"));
                    if (Objects.nonNull(shop)) {
                        CustomerAddress customerAddress = addAddress(shop, ManageCustomerAddressesController.FOLLOWED_ADDRESS_NAME);
                        addAddress(shop, ManageCustomerAddressesController.PICKUP_ADDRESS_NAME);//添加门店地址到收获地址
                        followedAddress = customerAddress;
                    } else {
                        //关注门店不在本次活动范围内
                        return "redirect:/account/addresses/followShop";
                    }
                }
            }
            //未关注门店跳转到关注门店
            if (Objects.isNull(followedAddress)) {
                return "redirect:/account/addresses/followShop";
            }
        }
        //符合激活条件,激活相应类型的五折卡
        bindFiveCard(customer);
        generateFiveCardImage(customer);
        return "redirect:/fiveCard";
    }

    private CustomerAddress addAddress(Shop shop, String addressName) {
        CustomAddressImpl address = new CustomAddressImpl();
        address.setAddressLine1("default");
        address.setPostalCode("default");
        address.setLastName("default");
        address.setCity("default");
        address.setShop(shop);
        Address savedAddress = addressService.saveAddress(address);
        CustomerAddress customerAddress = customerAddressService.create();
        customerAddress.setAddress(savedAddress);
        customerAddress.setAddressName(addressName);
        customerAddress.setCustomer(CustomerState.getCustomer());
        customerAddressService.saveCustomerAddress(customerAddress);
        return customerAddress;
    }

    private void generateFiveCardImage(CustomCustomer customer) {
        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        String cardNo = fiveCardXref.getFiveCard().getNo();
        WaterMarkUtils.mark("d:/card-5-1.jpg", "d:/" + cardNo + ".jpg", Color.black, cardNo);
    }

    private CustomerAddress hasFollowShop(CustomCustomer customer) {
        //检测是否关注门店

        //1检测本地数据库是否有门店记录
        CustomerAddress followedAddress = null;
        List<CustomerAddress> customerAddresses = customer.getCustomerAddresses();
        for (CustomerAddress customerAddress : customerAddresses) {
            if (ManageCustomerAddressesController.FOLLOWED_ADDRESS_NAME.equals(customerAddress.getAddressName())) {
                followedAddress = customerAddress;
            }
        }
        return followedAddress;
    }

    /**
     * 绑定五折卡
     *
     * @param customer
     */
    private void bindFiveCard(CustomCustomer customer) {
        CustomerFiveCardXref cardXref = customer.getFiveCardXref();
        FiveCard fiveCard = fiveCardService.readByStatusAndType(false, cardXref.getType());
        //关联用户与五折卡
        fiveCard.setStatus(FiveCard.CARD_STATUS_ACTIVE);
        cardXref.setFiveCard(fiveCard);
        cardXref.setStatus(FiveCard.CARD_STATUS_ACTIVE);
        cardXref.setActiveDate(CommonUtils.currentDate());
        customerService.saveCustomer(customer);
    }

    /**
     * 分享链接访问地址
     *
     * @param referrer
     * @param request
     * @return
     */
    @RequestMapping(value = "/share", method = RequestMethod.GET)
    public String shareFiveCard(@RequestParam("referrer") Long referrer, HttpServletRequest request) {
        //检测分享人
        if (Objects.nonNull(referrer)) {
            //保持referrer到session中以便后面授权成功后使用
            HttpSession session = request.getSession();
            session.setAttribute("referrer", referrer);
        }
        //跳转到首页，如果用户没有授权则会先进行授权
        return "redirect:/fiveCard/issue";
    }

    /**
     * 用户分享出去的链接被好友点击的统计信息
     *
     * @return
     */
    @RequestMapping(value = "/share/page", method = RequestMethod.GET)
    public String shareFiveCardPage(Model model) {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerWrapper owner = getCustomerWrapper(customer);
        List<CustomerWrapper> followers = getFollowers(customer);
        owner.setFollowers(followers);
        model.addAttribute("owner", owner);
        return "fivecard/card5_share";
    }

    /**
     * 获取分享好友列表
     *
     * @return
     */
    private List<CustomerWrapper> getFollowers(CustomCustomer customer) {

        List<CustomerFiveCardXref> sharedCardXrefs = customer.getFiveCardXref().getSharedCardXrefs();
        return sharedCardXrefs.stream().map(sharedCardXref -> (CustomCustomer) sharedCardXref.getCustomer()).
                map(this::getCustomerWrapper).collect(Collectors.toList());
    }

    private CustomerWrapper getCustomerWrapper(CustomCustomer customCustomer) {
        CustomerWrapper customerWrapper = new CustomerWrapper();
        CustomerAttribute nickname = customCustomer.getCustomerAttributes().get("nickname");
        CustomerAttribute headImageUrl = customCustomer.getCustomerAttributes().get("headimgurl");
        if (Objects.nonNull(nickname)) {
            customerWrapper.setNickname(nickname.getValue());
        }
        if (Objects.nonNull(headImageUrl)) {
            customerWrapper.setHeadImageUrl(headImageUrl.getValue());
        }
        return customerWrapper;
    }

    @RequestMapping("/guide")
    public String getRulePage() {
        return "fivecard/activity-guide";
    }
}
