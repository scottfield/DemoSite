package com.mycompany.controller.wxpay;

import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.core.catalog.domain.ShopAccount;
import com.mycompany.sample.payment.weixin.common.Configure;
import com.mycompany.sample.payment.weixin.protocol.UnifiedOrderReqData;
import com.mycompany.sample.payment.weixin.service.WxPayApi;
import com.mycompany.sample.service.ShopService;
import com.mycompany.sample.util.CommonUtils;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xml.sax.SAXException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jackie on 5/23/2016.
 */
@Controller
@RequestMapping("/rebate")
public class RebateController {
    @Resource
    private ShopService shopService;

    @RequestMapping(value = "")
    public String rebatePage() {
        return "rebate/rebateForm";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String generateBill(HttpServletRequest request) {
        String shopCode = request.getParameter("shopCode");
        String amount = request.getParameter("amount");
        Shop shop = shopService.readShopByCode(shopCode);

        System.out.println(shopCode);
        System.out.println(amount);
        ShopAccount shopAccount = shop.getShopAccount();
        String appid = shopAccount.getAppid();
        String mch_id = shopAccount.getMchid();
        String body = "退款";
        String out_trade_no = CommonUtils.getRandomStr();
        String spbill_create_ip = request.getRemoteAddr();
        String trade_type = "JSAPI";
        String openId = CustomerState.getCustomer().getUsername();
        BigDecimal value = new BigDecimal(amount).multiply(new BigDecimal("100"));
        Integer total_fee = value.intValue();
        UnifiedOrderReqData reqData = new UnifiedOrderReqData.UnifiedOrderReqDataBuilder(appid, mch_id,
                body, out_trade_no, total_fee, spbill_create_ip, "http://discount.lzzyad.com", trade_type).setOpenid(openId).build();
        try {
            Map<String, Object> result = WxPayApi.UnifiedOrder(reqData);
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
            request.setAttribute("paySign", param.get("paySign"));
            request.setAttribute("appId", param.get("appId"));
            request.setAttribute("timeStamp", param.get("timeStamp"));
            request.setAttribute("nonceStr", param.get("nonceStr"));
            request.setAttribute("package", param.get("package"));
            request.setAttribute("signType", param.get("signType"));
            request.setAttribute("orderId", out_trade_no);
        } catch (IOException e) {
        } catch (SAXException e) {
        } catch (ParserConfigurationException e) {
        }
        return "wxpay/wxpay";
    }
}
