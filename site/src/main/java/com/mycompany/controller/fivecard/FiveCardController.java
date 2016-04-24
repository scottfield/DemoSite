package com.mycompany.controller.fivecard;

import com.mycompany.controller.account.ManageCustomerAddressesController;
import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomerFiveCardXref;
import com.mycompany.sample.core.catalog.domain.CustomerFiveCardXrefImpl;
import com.mycompany.sample.core.catalog.domain.FiveCard;
import com.mycompany.sample.service.FiveCardService;
import com.mycompany.sample.service.WeixinService;
import com.mycompany.sample.util.CommonUtils;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.core.domain.CustomerAddress;
import org.broadleafcommerce.profile.core.service.CustomerService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by jackie on 4/23/2016.
 */
@Controller
@RequestMapping("/fiveCard")
public class FiveCardController {
    @Resource
    private FiveCardService fiveCardService;
    @Resource(name = "blCustomerService")
    private CustomerService customerService;
    @Resource
    private WeixinService weixinService;

    @RequestMapping("/{type}")
    public String getFiveCardPage(@PathVariable("type") Integer type) {
        return "fivecard/inactive_fivecard_" + type;
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
        String retView = "redirect:/fiveCard/";
        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        //判断用户是否已经拥有五张卡
        if (Objects.nonNull(fiveCardXref)) {
            Integer type = fiveCardXref.getType();
            return retView + type;
        }
        //判断五折卡类型
        Object referrer = session.getAttribute("referrer");
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
        return retView + type;
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
    public String activateFiveCard(HttpSession session) {
        String prefix = "fivecard/active_fivecard_";
        //判断是否已经领取五折卡
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref cardXref = customer.getFiveCardXref();
        //还未领取五折卡,跳转到首页进行领取
        if (Objects.isNull(cardXref)) {
            return "redirect:/index";
        }
        //检测五折卡是否已激活
        if (cardXref.getStatus()) {
            return prefix + cardXref.getType();
        }
        //检查五折卡类型,B卡则需要填写收货地址则可以激活卡
        if (cardXref.getType() == FiveCard.CARD_TYPE_B && (Objects.isNull((customer.getCustomerAddresses())) || customer.getCustomerAddresses().size() == 0)) {
            return "redirect:/account/addresses?activeFiveCard=true";
        } else if(cardXref.getType()==FiveCard.CARD_TYPE_A){
            //检测是否关注门店

            //1检测本地数据库是否有门店记录
            CustomerAddress followedAddress = null;
            List<CustomerAddress> customerAddresses = customer.getCustomerAddresses();
            for (CustomerAddress customerAddress : customerAddresses) {
                if (ManageCustomerAddressesController.followedAddressName.equals(customerAddress.getAddressName())) {
                    followedAddress = customerAddress;
                }
            }
            //2调用接口查看是否有关注门店
            if (Objects.isNull(followedAddress)) {
                Map<String, Object> vipInfo = weixinService.getVipInfo(customer.getUsername());
                if (Objects.nonNull(vipInfo)) {
                    return "redirect:/account/addresses/followShop/callBack?openid="+customer.getUsername();
                }
            }
            //未关注门店跳转到关注门店
            if (Objects.isNull(followedAddress)) {
                return "redirect:/account/addresses/followShop";
            }
        }
        //符合激活条件,激活相应类型的五折卡
        Integer type = cardXref.getType();
        FiveCard fiveCard = fiveCardService.readByStatusAndType(false, type);
        //关联用户与五折卡
        fiveCard.setStatus(FiveCard.CARD_STATUS_ACTIVE);
        cardXref.setFiveCard(fiveCard);
        cardXref.setStatus(FiveCard.CARD_STATUS_ACTIVE);
        cardXref.setActiveDate(CommonUtils.currentDate());
        customerService.saveCustomer(customer);
        return prefix + type;
    }

    @RequestMapping(value = "/share", method = RequestMethod.GET)
    public String shareFiveCard(@RequestParam("referrer") Long referrer, HttpServletRequest request) {
        //检测分享人
        if (Objects.nonNull(referrer)) {
            //保持referrer到session中以便后面授权成功后使用
            HttpSession session = request.getSession();
            session.setAttribute("referrer", referrer);
        }
        //跳转到首页，如果用户没有授权则会先进行授权
        return "redirect:/";
    }
}
