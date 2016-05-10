package com.mycompany.controller.wxpay;

import com.mycompany.controller.account.OrderHistoryController;
import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomOrder;
import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.core.catalog.domain.ShopAccount;
import com.mycompany.sample.payment.weixin.common.Configure;
import com.mycompany.sample.payment.weixin.common.JsonUtil;
import com.mycompany.sample.payment.weixin.common.XMLParser;
import com.mycompany.sample.payment.weixin.protocol.QueryOrderReqData;
import com.mycompany.sample.payment.weixin.protocol.UnifiedOrderReqData;
import com.mycompany.sample.payment.weixin.service.WxCallBackData;
import com.mycompany.sample.payment.weixin.service.WxPayApi;
import com.mycompany.sample.util.CommonUtils;
import com.mycompany.sample.util.JsonHelper;
import com.mycompany.sample.util.JsonResponse;
import com.mycompany.service.CustomOrderService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderAttribute;
import org.broadleafcommerce.core.order.domain.OrderAttributeImpl;
import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.expression.spel.ast.OpOr;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;
import sun.util.resources.cldr.ebu.CurrencyNames_ebu;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

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
        Customer orderOwner = order.getCustomer();
        Customer currentLoginCustomer = CustomerState.getCustomer();
        //检测下单用户与当前的登录用户是否是统一个人
        if (!currentLoginCustomer.getId().equals(orderOwner.getId())) {
            LOG.warn("下单账号与当前登录账号不一致,下单账号信息:(ID：" + orderOwner.getId() + ",openId:" + orderOwner.getUsername() + "),当前登录用户信息:(ID：" + currentLoginCustomer.getId() + ",openId:" + currentLoginCustomer.getUsername() + ")");
            request.setAttribute("unifyOrderFailed", true);
            return retView;
        }

        Shop shop = order.getAddress().getShop();

        StringBuffer requestURL = request.getRequestURL();
        //如果没有收货地址就填写收货地址
        if (Objects.isNull(shop)) {
            throw new RuntimeException("收货地址门店未填写");
        }
        LOG.info("------------------开始处理支付订单--------------------");
        ShopAccount shopAccount = shop.getShopAccount();
        String appid = shopAccount.getAppid();
        LOG.info("appid==>" + appid);
        String mch_id = shopAccount.getMchid();
        LOG.info("商户号==>" + appid);
        String body = order.getOrderNumber();
        String out_trade_no = order.getOrderNumber();
        LOG.info("订单号==>" + appid);
        String spbill_create_ip = request.getRemoteAddr();
        String requestUrl = requestURL.toString();
        String notify_url = requestUrl.replaceAll("/pay", "") + "/notify";
//        LOG.info("回调地址==>" + notify_url);
        String trade_type = "JSAPI";
        String openId = orderOwner.getUsername();
        BigDecimal value = order.getTotal().getAmount().multiply(new BigDecimal("100"));
        Integer total_fee = value.intValue();
        LOG.info("订单总额==>" + total_fee);
//        Integer total_fee = 1;
        UnifiedOrderReqData reqData = new UnifiedOrderReqData.UnifiedOrderReqDataBuilder(appid, mch_id,
                body, out_trade_no, total_fee, spbill_create_ip, notify_url, trade_type).setOpenid(openId).build();
        try {
            LOG.info("----开始统一下单----");
            Map<String, Object> result = WxPayApi.UnifiedOrder(reqData);
            LOG.info("统一下单结果==>" + result.get("return_code"));
            request.setAttribute("result", result);
            if (!result.get("return_code").equals("SUCCESS")) {
                return retView;
            }
            //更改订单的支付状态为正在支付中
            order.setStatus(OrderStatus.getInstance("PAYING"));
            orderService.save(order, false);
            LOG.info("更改订单状态为支付中,订单当前状态:" + order.getStatus().getType());

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
            /*LOG.info("-----------------------------------------------------------------------------------");
            LOG.info(jsApiParam);
            LOG.info("-----------------------------------------------------------------------------------");*/
            request.setAttribute("paySign", param.get("paySign"));
            request.setAttribute("appId", param.get("appId"));
            request.setAttribute("timeStamp", param.get("timeStamp"));
            request.setAttribute("nonceStr", param.get("nonceStr"));
            request.setAttribute("package", param.get("package"));
            request.setAttribute("signType", param.get("signType"));
            request.setAttribute("orderId", orderId);
        } catch (IOException e) {
            LOG.error("io错误", e);
        } catch (SAXException e) {
            LOG.error("解析xml错误", e);
        } catch (ParserConfigurationException e) {
            LOG.error("解析配置错误", e);
        } catch (PricingException e) {
            LOG.error("保存订单错误", e);
        }
        LOG.info("调用jsapi进行支付");
        return retView;
    }

    @RequestMapping("/notify")
    public ModelAndView notifyHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
//            LOG.info(notityXml);
            //判断支付结果
            WxCallBackData result = XMLParser.getObjectFromXML(notityXml, WxCallBackData.class);
            LOG.info("----------微信支付回调更新订单状态开始------------");
            LOG.info("支付结果:" + result.getResult_code());
            if (Objects.nonNull(result) && "SUCCESS".equals(result.getResult_code())) {
                String orderNumber = result.getOut_trade_no();
//                String orderNumber = "201605082158449793601";
                Order order = orderService.findOrderByOrderNumber(orderNumber);
                LOG.info("开始更新订单,当前订单状态：" + order.getStatus().getType() + ",订单编号:" + order.getOrderNumber());
                if (Objects.nonNull(order) && OrderHistoryController.PAYING.equals(order.getStatus())) {
                    order.setStatus(OrderHistoryController.PAID);
                    LOG.info("-----保存微信支付信息------");

                    OrderAttribute wxTransactionId = new OrderAttributeImpl();
                    wxTransactionId.setName("transaction_id");
                    wxTransactionId.setValue(result.getTransaction_id());
                    wxTransactionId.setOrder(order);

                    OrderAttribute openid = new OrderAttributeImpl();
                    openid.setName("openid");
                    openid.setValue(result.getOpenid());

                    OrderAttribute mch_id = new OrderAttributeImpl();
                    mch_id.setName("mch_id");
                    mch_id.setValue(result.getMch_id());

                    OrderAttribute out_trade_no = new OrderAttributeImpl();
                    out_trade_no.setName("out_trade_no");
                    out_trade_no.setValue(result.getOut_trade_no());

                    OrderAttribute total_fee = new OrderAttributeImpl();
                    total_fee.setName("total_fee");
                    total_fee.setValue(result.getTotal_fee());

                    OrderAttribute result_code = new OrderAttributeImpl();
                    result_code.setName("result_code");
                    result_code.setValue(result.getResult_code());

                    OrderAttribute return_code = new OrderAttributeImpl();
                    return_code.setName("return_code");
                    return_code.setValue(result.getReturn_code());

                    OrderAttribute wxTimeEnd = new OrderAttributeImpl();
                    wxTimeEnd.setName("time_end");
                    wxTimeEnd.setValue(result.getTime_end());


                    wxTransactionId.setOrder(order);
                    openid.setOrder(order);
                    mch_id.setOrder(order);
                    out_trade_no.setOrder(order);
                    total_fee.setOrder(order);
                    result_code.setOrder(order);
                    return_code.setOrder(order);
                    wxTimeEnd.setOrder(order);

                    Map<String, OrderAttribute> orderAttributes = order.getOrderAttributes();
                    orderAttributes.put("transaction_id", wxTransactionId);
                    orderAttributes.put("openid", openid);
                    orderAttributes.put("mch_id", mch_id);
                    orderAttributes.put("out_trade_no", out_trade_no);

                    orderAttributes.put("total_fee", total_fee);
                    orderAttributes.put("result_code", result_code);
                    orderAttributes.put("return_code", return_code);
                    orderAttributes.put("time_end", wxTimeEnd);
                    order.setOrderAttributes(orderAttributes);

                    orderService.save(order, false);
                    LOG.info("更新订单状态完成,当前订单状态:" + order.getStatus().getType() + ",订单号：" + order.getOrderNumber());
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
        LOG.info("----------微信支付回调更新订单状态结束------------");
        return null;
    }

    /**
     * 恢复支付中状态的订单到未付款状态
     *
     * @param orderId
     * @return
     */
    @RequestMapping("/unlock")
    public String unlockOrder(@RequestParam Long orderId) {
        Order order = orderService.findOrderById(orderId);
        String retView = "redirect:/account/orders";
        if (!OrderHistoryController.PAYING.equals(order.getStatus())) {
            return retView;
        }
        order.setStatus(OrderHistoryController.UNPAID);
        try {
            orderService.save(order, false);
        } catch (PricingException e) {
            LOG.error("支付失败,还原订单状态出错", e);
        }
        return retView;
    }

    @RequestMapping("/bill")
    @ResponseBody
    public Object getWxPayBack(@RequestParam String orderNumber) {
        Order order = orderService.findOrderByOrderNumber(orderNumber);
        if (Objects.isNull(order) && !(order instanceof CustomOrder)) {
            return JsonResponse.response("订单(" + orderNumber + ")异常");
        }
        CustomOrder customOrder = (CustomOrder) order;
        Shop shop = customOrder.getAddress().getShop();
        String appid = shop.getAppId();
        String mch_id = shop.getMchid();
        QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(appid).setMch_id(mch_id).setOut_trade_no(orderNumber).build();
        Map<String, Object> result = null;
        try {
            result = WxPayApi.queryOrder(reqData);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping("/errorOrders")
    @ResponseBody
    public Object findErrorOrders() {
        CustomOrderService customOrderService = (CustomOrderService) orderService;
        List<Order> cancelledOrders = customOrderService.findOrderByStatus(OrderStatus.CANCELLED);
        if (Objects.isNull(cancelledOrders) || cancelledOrders.isEmpty()) {
            return JsonResponse.response("没有取消的订单");
        }
        List<Order> errorOrderList = cancelledOrders.parallelStream().filter(order -> {
            Map<String, OrderAttribute> orderAttributes = order.getOrderAttributes();
            if (Objects.nonNull(orderAttributes) && orderAttributes.containsKey("transaction_id")) {
                return true;
            }
            String orderNumber = order.getOrderNumber();
            CustomOrder customOrder = (CustomOrder) order;
            Shop shop = customOrder.getAddress().getShop();
            QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(shop.getAppId()).setMch_id(shop.getMchid()).setOut_trade_no(orderNumber).build();
            try {
                Map<String, Object> result = WxPayApi.queryOrder(reqData);
                WxCallBackData callBackData = JsonUtil.fromJson(JsonHelper.toJsonStr(result), WxCallBackData.class);
                if ("SUCCESS".equals(callBackData.getTrade_state())) {
                    return true;
                }
            } catch (IOException e) {
                e.printStackTrace();
            } catch (SAXException e) {
                e.printStackTrace();
            } catch (ParserConfigurationException e) {
                e.printStackTrace();
            }
            return false;
        }).collect(Collectors.toList());
        return errorOrderList;
    }
}
