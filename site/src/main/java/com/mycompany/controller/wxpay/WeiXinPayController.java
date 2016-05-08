package com.mycompany.controller.wxpay;

import com.mycompany.controller.account.OrderHistoryController;
import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomOrder;
import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.core.catalog.domain.ShopAccount;
import com.mycompany.sample.payment.weixin.common.Configure;
import com.mycompany.sample.payment.weixin.common.JsonUtil;
import com.mycompany.sample.payment.weixin.common.XMLParser;
import com.mycompany.sample.payment.weixin.protocol.UnifiedOrderReqData;
import com.mycompany.sample.payment.weixin.service.WxCallBackData;
import com.mycompany.sample.payment.weixin.service.WxPayApi;
import com.mycompany.sample.util.CommonUtils;
import com.mycompany.sample.util.JsonHelper;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderAttribute;
import org.broadleafcommerce.core.order.domain.OrderAttributeImpl;
import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
        CustomOrder order = (CustomOrder) orderService.findOrderById(orderId);
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        Shop shop = order.getAddress().getShop();

        String requestURI = request.getRequestURI();
        StringBuffer requestURL = request.getRequestURL();
        //如果没有收货地址就填写收货地址
        if (Objects.isNull(shop)) {
            throw new RuntimeException("收货地址门店未填写");
        }
        ShopAccount shopAccount = shop.getShopAccount();
        String appid = shopAccount.getAppid();
        String mch_id = shopAccount.getMchid();
        String body = order.getOrderNumber();
        String out_trade_no = order.getOrderNumber();
        String spbill_create_ip = request.getRemoteAddr();
        String requestUrl = requestURL.toString();
        String notify_url = requestUrl.replaceAll("/pay", "") + "/notify";
        LOG.info("notify url==>" + notify_url);
        String trade_type = "JSAPI";
        String openId = customer.getUsername();
//        Integer total_fee = order.getTotal().getAmount().intValue() * 100;
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
            request.setAttribute("orderId", orderId);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        return retView;
    }

    @RequestMapping("/notify")
    public ModelAndView notifyHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
        LOG.info("---------------start to handle wechatpay callback------------------");
        String inputLine;
//        String notityXml = "<xml><appid><![CDATA[wx937fba8914a5d9a9]]></appid><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[1]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1326016401]]></mch_id><nonce_str><![CDATA[5qg7pmgbrai2v30g8n0t8xr6ggtw2ri8]]></nonce_str><openid><![CDATA[o1Py0tx91UJXWdtT_gD9xMdI5Rdo]]></openid><out_trade_no><![CDATA[20160508212400943851]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[8F3173CFE9E3495B55E2AACC40C0F26F]]></sign><time_end><![CDATA[20160508212409]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[4006002001201605085647871490]]></transaction_id></xml>";
        String notityXml = "";
        String retXml = "";
        PrintWriter writer = response.getWriter();
        BufferedReader reader = request.getReader();
        try {
            while ((inputLine = reader.readLine()) != null) {
                notityXml += inputLine;
            }
            LOG.info(notityXml);
            //判断支付结果
            WxCallBackData result = XMLParser.getObjectFromXML(notityXml, WxCallBackData.class);
            if (Objects.nonNull(result) && "SUCCESS".equals(result.getResult_code())) {
                String orderNumber = result.getOut_trade_no();
//                String orderNumber = "201605082158449793601";
                Order order = orderService.findOrderByOrderNumber(orderNumber);
                if (Objects.nonNull(order) && OrderHistoryController.UNPAID.equals(order.getStatus())) {
                    order.setStatus(OrderHistoryController.PAID);
                    LOG.info("-----保存微信支付信息------");

                    OrderAttribute wxTransactionId = new OrderAttributeImpl();
                    wxTransactionId.setName("transaction_id");
                    wxTransactionId.setValue(result.getTransaction_id());
                    wxTransactionId.setOrder(order);

                    OrderAttribute wxTimeEnd = new OrderAttributeImpl();
                    wxTimeEnd.setName("time_end");
                    wxTimeEnd.setValue(result.getTime_end());
                    wxTimeEnd.setOrder(order);

                    wxTransactionId.setOrder(order);
                    Map<String, OrderAttribute> orderAttributes = order.getOrderAttributes();
                    orderAttributes.put("transaction_id", wxTransactionId);
                    orderAttributes.put("time_end", wxTimeEnd);
                    order.setOrderAttributes(orderAttributes);
                    orderService.save(order, false);
                }
                retXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                        + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
            } else {
                retXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
            }
            writer.write(retXml);
        } catch (Exception e) {
            LOG.error("处理微信支付回调失败", e);
        } finally {
            if (Objects.nonNull(reader)) {
                reader.close();
            }
            if (Objects.nonNull(writer)) {
                writer.close();
            }
        }
        LOG.info("---------------end to handle wechatpay callback------------------");
        return null;
    }
}
