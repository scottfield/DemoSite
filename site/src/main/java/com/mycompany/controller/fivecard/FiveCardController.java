package com.mycompany.controller.fivecard;

import com.mycompany.controller.account.ManageCustomerAddressesController;
import com.mycompany.controller.wrapper.CustomerWrapper;
import com.mycompany.sample.core.catalog.domain.*;
import com.mycompany.sample.service.FiveCardService;
import com.mycompany.sample.service.ShopService;
import com.mycompany.sample.service.WeixinService;
import com.mycompany.sample.util.CommonUtils;
import com.mycompany.sample.util.NewImageUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.profile.core.domain.*;
import org.broadleafcommerce.profile.core.service.AddressService;
import org.broadleafcommerce.profile.core.service.CountryService;
import org.broadleafcommerce.profile.core.service.CustomerAddressService;
import org.broadleafcommerce.profile.core.service.CustomerService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.ServletContextResource;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
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
    @Resource
    private CountryService countryService;

    private static final Log LOG = LogFactory.getLog(FiveCardController.class);

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String getFiveCardPage(HttpServletRequest request, String shopOutOfRange) {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref cardXref = customer.getFiveCardXref();
        //检测是否有五折卡,没有五折卡则跳转到发卡页面
        if (Objects.isNull(cardXref)) {
            return "redirect:/fiveCard/issue";
        }
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
            //B卡并且是通过分享链接进入
            if (fiveCardXref.getType() == FiveCard.CARD_TYPE_B && Objects.nonNull(referrer)) {
                retView = retView + "?referrerPage=true";
            }
            return retView;
        }
        //判断五折卡类型
        int type = 1;//默认五折卡类型为分享获取的
        if (Objects.isNull(referrer)) {
            type = 0;
        }
        FiveCard fiveCard = fiveCardService.readByStatusAndType(false, type);
        //没有可用的五折卡
        if (Objects.isNull(fiveCard)) {
            return "redirect:/index";
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
            retView = retView + "?referrerPage=true";
        }
        customer.setFiveCardXref(cardXref);
        customerService.saveCustomer(customer);
        //如果为A卡资格则自动去激活
        if (cardXref.getType() == FiveCard.CARD_TYPE_A) {
            return "redirect:/fiveCard/activate?autoActive=true";
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
    public String activateFiveCard(HttpServletRequest request, Boolean autoActive) {
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
            //通过分享链接访问时,添加分享链接标示参数,方便前端显示对应的提示信息
            if (Objects.nonNull(request.getParameter("referrerPage"))) {
                return "redirect:/account/addresses?activeFiveCard=true&referrerPage=true";
            }
            return "redirect:/account/addresses?activeFiveCard=true";
        } else if (cardXref.getType() == FiveCard.CARD_TYPE_A) {
            //获取用户关注门店
            Map<String, Object> vipInfo = weixinService.getVipInfo(customer.getUsername());
            Shop shop = null;
            CustomerAddress customerAddress = null;
            //检查门店是否在活动范围内
            if (Objects.nonNull(vipInfo)) {
                shop = shopService.readShopByCode((String) vipInfo.get("unit_code"));
            }
            //保存关注门店的地址
            if (Objects.nonNull(shop)) {
                customerAddress = addAddress(shop, ManageCustomerAddressesController.FOLLOWED_ADDRESS_NAME);
            }
            //未关注门店跳转到关注门店
            if (Objects.isNull(customerAddress)) {
                //如果是开卡自动激活则跳转到五折卡页面
                if (Boolean.TRUE.equals(autoActive)) {
                    return "redirect:/fiveCard";
                }
                return "redirect:/account/addresses/followShop";
            }
        }
        //符合激活条件,激活相应类型的五折卡
        bindFiveCard(customer);
        generateFiveCardImage(customer, request);
        //B卡激活后添加提示参数，方便前端显示对话框
        if (FiveCard.CARD_TYPE_B.equals(cardXref.getType())) {
            return "redirect:/fiveCard?showFiveCardActivatedWindow=true";
        }
        return "redirect:/fiveCard";
    }

    private CustomerAddress addAddress(Shop shop, String addressName) {
        CustomAddressImpl address = new CustomAddressImpl();
        address.setAddressLine1("default");
        address.setPostalCode("default");
        address.setLastName("default");
        address.setCity("default");
        address.setShop(shop);
        Country country = countryService.findCountryByAbbreviation("CA");
        address.setCountry(country);
        Address savedAddress = addressService.saveAddress(address);
        CustomerAddress customerAddress = customerAddressService.create();
        customerAddress.setAddress(savedAddress);
        customerAddress.setAddressName(addressName);
        customerAddress.setCustomer(CustomerState.getCustomer());
        customerAddressService.saveCustomerAddress(customerAddress);
        return customerAddress;
    }

    private void generateFiveCardImage(CustomCustomer customer, HttpServletRequest request) {
        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        String cardNo = fiveCardXref.getFiveCard().getNo();
        org.springframework.core.io.Resource resourceFile = new FileSystemResource("D:\\fivecard/fivecard/fivecard_backgroud.png");
        org.springframework.core.io.Resource waterFile = new FileSystemResource("D:\\fivecard/fivecard/" + cardNo + ".png");
        try {
            File resource = resourceFile.getFile();
            if (!resource.exists()) {
                LOG.warn("resource not exist" + resource.getAbsolutePath());
                return;
            }
            File waterResource = resourceFile.getFile();
            if (!waterResource.exists()) {
                LOG.warn("bar code resource not exist" + waterResource.getAbsolutePath());
                return;
            }


        } catch (IOException e) {
            LOG.error("cannot find file", e);
        }

        NewImageUtils newImageUtils = new NewImageUtils();
        try {
            String parentDirectory = resourceFile.getFile().getParent();
            String saveFilePath = parentDirectory + File.separator + cardNo + "_card.png";
            // 对图像加水印
            BufferedImage buffImg = NewImageUtils.watermark(resourceFile.getFile(), waterFile.getFile(), 70, 270, 1f);
            // 输出水印图片
            newImageUtils.generateWaterFile(buffImg, saveFilePath);
        } catch (IOException e) {
            e.printStackTrace();
        }
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
