package com.mycompany.controller.wxpay;

import com.mycompany.sample.core.catalog.domain.CustomAddress;
import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.core.catalog.domain.ShopAccount;
import com.mycompany.sample.payment.weixin.common.Configure;
import com.mycompany.sample.payment.weixin.common.JsonUtil;
import com.mycompany.sample.payment.weixin.common.Signature;
import com.mycompany.sample.payment.weixin.protocol.UnifiedOrderReqData;
import com.mycompany.sample.payment.weixin.service.WxPayApi;
import com.mycompany.sample.util.CommonUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.profile.core.domain.CustomerAddress;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xml.sax.SAXException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by jackie on 4/26/2016.
 */
@Controller
@RequestMapping("/wechatpay/index")
public class WeiXinPayController {
    private static final Log LOG = LogFactory.getLog(WeiXinPayController.class);
    @Resource
    private OrderService orderService;

    @RequestMapping("/pay")
    public String unifyOrder(HttpServletRequest request, Long orderId) {
        String retView = "wxpay/wxpay";
        Order order = orderService.findOrderById(orderId);
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        List<CustomerAddress> customerAddresses = customer.getCustomerAddresses();
        Shop shop = null;
        for (CustomerAddress customerAddress : customerAddresses) {
            if (customerAddress.getAddressName().equals("收货地址")) {
                CustomAddress address = (CustomAddress) customerAddress.getAddress();
                shop = address.getShop();
                break;
            }
        }
        String requestURI = request.getRequestURI();
        StringBuffer requestURL = request.getRequestURL();
        //如果没有收货地址就填写收货地址
        if (Objects.isNull(shop)) {
            throw new RuntimeException("收货地址门店未填写");
        }
        ShopAccount shopAccount = shop.getShopAccount();
        String appid = shopAccount.getAppid();
        String mch_id = shopAccount.getMchid();
        String body = "测试支付";
        String out_trade_no = order.getOrderNumber();
        String spbill_create_ip = request.getRemoteAddr();
        String notify_url = requestURL.toString()+"/notify";
        LOG.info("notify url==>"+notify_url);
//        String notify_url = "http://discount.lzzyad.com";
        String trade_type = "JSAPI";
        String openId = customer.getUsername();
        Integer total_fee = 1;
        UnifiedOrderReqData reqData = new UnifiedOrderReqData.UnifiedOrderReqDataBuilder(appid, mch_id,
                body, out_trade_no, total_fee, spbill_create_ip, notify_url, trade_type).setOpenid(openId).build();
        try {
            Map<String, Object> result = WxPayApi.UnifiedOrder(reqData);

            request.setAttribute("result", result);
            if (!result.get("return_code").equals("SUCCESS")) {
                return retView;
            }
            Map<String, Object> param = new HashMap<>();
            long timeStamp = CommonUtils.currentTimeStamp();
            String nonce = CommonUtils.getRandomStr();
            param.put("appId", result.get("appid"));
            param.put("timeStamp", timeStamp);
            param.put("nonceStr", nonce);
            String packageStr = "prepay_id=" + result.get("prepay_id");
            param.put("package", packageStr);
            param.put("signType", "MD5");
            String sortedStr = CommonUtils.getSortedStr(param);
            String paySign = CommonUtils.md5Sign(sortedStr, Configure.getKey(mch_id), "key").toUpperCase();
            param.put("paySign", paySign);
            String jsApiParam = JsonUtil.toJson(param);
            LOG.info("-----------------------------------------------------------------------------------");
            LOG.info(jsApiParam);
            LOG.info("-----------------------------------------------------------------------------------");
            request.setAttribute("paySign", param.get("paySign"));
            request.setAttribute("appId", param.get("appId"));
            request.setAttribute("timeStamp", param.get("timeStamp"));
            request.setAttribute("nonceStr", param.get("nonceStr"));
            request.setAttribute("package", param.get("package"));
            request.setAttribute("signType", param.get("signType"));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        return retView;
    }

    @RequestMapping("/pay/notify")
    public void notifyHandler(HttpServletRequest request) {
        LOG.info("---------------start to handle wechatpay callback------------------");
        Map parameterMap = request.getParameterMap();
        try {
            LOG.info(JsonUtil.toJson(parameterMap));
        } catch (IOException e) {
            e.printStackTrace();
        }
        LOG.info("---------------end to handle wechatpay callback------------------");
        //change order state
    }
}
