package com.cdfamedy.controller.wxpay;

import com.cdfamedy.controller.account.OrderHistoryController;
import com.cdfamedy.core.dao.payment.weixin.common.Configure;
import com.cdfamedy.core.dao.payment.weixin.common.XMLParser;
import com.cdfamedy.core.dao.payment.weixin.protocol.QueryOrderReqData;
import com.cdfamedy.core.dao.payment.weixin.protocol.UnifiedOrderReqData;
import com.cdfamedy.core.dao.payment.weixin.service.WxCallBackData;
import com.cdfamedy.core.dao.payment.weixin.service.WxPayApi;
import com.cdfamedy.core.domain.CustomOrder;
import com.cdfamedy.core.domain.Shop;
import com.cdfamedy.core.domain.ShopAccount;
import com.cdfamedy.core.service.CustomOrderService;
import com.cdfamedy.core.util.CommonUtils;
import com.cdfamedy.core.util.JsonResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
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
    private CustomOrderService orderService;

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
        LOG.warn("开始处理支付订单,单号:" + order.getOrderNumber() + ",当前订单状态:" + order.getStatus().getType() + "");
        ShopAccount shopAccount = shop.getShopAccount();
        String appid = shopAccount.getAppid();
        String mch_id = shopAccount.getMchid();
        String body = order.getOrderNumber();
        String out_trade_no = order.getOrderNumber();
        String spbill_create_ip = request.getRemoteAddr();
        String requestUrl = requestURL.toString();
        String notify_url = requestUrl.replaceAll("/pay", "") + "/notify";
//        LOG.info("回调地址==>" + notify_url);
        String trade_type = "JSAPI";
        String openId = orderOwner.getUsername();
        BigDecimal value = order.getTotal().getAmount().multiply(new BigDecimal("100"));
        Integer total_fee = value.intValue();
        LOG.warn("订单号:" + order.getOrderNumber() + ",订单总额:" + total_fee);
//        Integer total_fee = 1;
        UnifiedOrderReqData reqData = new UnifiedOrderReqData.UnifiedOrderReqDataBuilder(appid, mch_id,
                body, out_trade_no, total_fee, spbill_create_ip, notify_url, trade_type).setOpenid(openId).build();
        try {
            LOG.warn("开始统一下单");
            Map<String, Object> result = WxPayApi.UnifiedOrder(reqData);
            LOG.warn("统一下单结果:" + result.get("return_code"));
            request.setAttribute("result", result);
            if (!result.get("return_code").equals("SUCCESS")) {
                return retView;
            }
            //更改订单的支付状态为正在支付中
            order.setStatus(OrderStatus.getInstance("PAYING"));
            orderService.save(order, false);
            LOG.warn("更改订单状态为支付中,订单编号:" + order.getOrderNumber() + ",订单当前状态:" + order.getStatus().getType());

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
//            String jsApiParam = JsonUtil.toJson(param);
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
        LOG.warn("调用jsapi进行支付");
        return retView;
    }

    @RequestMapping("/notify")
    public ModelAndView notifyHandler(HttpServletRequest request, HttpServletResponse response) {
        String inputLine;
//        String notifyXml = "<xml><appid><![CDATA[wx937fba8914a5d9a9]]></appid><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[1]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1326016401]]></mch_id><nonce_str><![CDATA[5qg7pmgbrai2v30g8n0t8xr6ggtw2ri8]]></nonce_str><openid><![CDATA[o1Py0tx91UJXWdtT_gD9xMdI5Rdo]]></openid><out_trade_no><![CDATA[20160508212400943851]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[8F3173CFE9E3495B55E2AACC40C0F26F]]></sign><time_end><![CDATA[20160508212409]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[4006002001201605085647871490]]></transaction_id></xml>";
        String notifyXml = "";
        String emptyContentXml = "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[报文为空]]></return_msg></xml>";
        String communicationFailXml = "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[通讯失败]]></return_msg></xml>";
        String successXml = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
        PrintWriter writer = null;
        BufferedReader reader = null;
        LOG.warn("----------微信异步通知更新订单状态开始------------");
        try {
            writer = response.getWriter();
            reader = request.getReader();
            while ((inputLine = reader.readLine()) != null) {
                notifyXml += inputLine;
            }
            //检测通知内容是否存在
            if (notifyXml.length() == 0) {
                LOG.warn("微信支付回调报文为空");
                writer.write(emptyContentXml);
                return null;
            }
            //解析xml
            WxCallBackData result = XMLParser.getObjectFromXML(notifyXml, WxCallBackData.class);
            //验证签名 todo
            //检测支付结果
            //检测通信标示
            if (!WxCallBackData.SUCCESS.equals(result.getReturn_code())) {
                LOG.warn("微信支付回调通讯失败");
                writer.write(communicationFailXml);
                return null;
            }
            LOG.warn("订单号:" + result.getOut_trade_no() + ",支付结果:" + result.getResult_code());
            if (WxCallBackData.SUCCESS.equals(result.getResult_code())) {
                Order order = orderService.findOrderByOrderNumber(result.getOut_trade_no());
                LOG.warn("当前订单状态:" + order.getStatus().getType() + ",订单号:" + order.getOrderNumber());
                order.setStatus(OrderHistoryController.PAID);
                orderService.save(order, false);
                LOG.warn("更新订单状态,订单号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
            }
            writer.write(successXml);
        } catch (Exception e) {
            LOG.error("微信异步通知处理订单状态失败", e);
        } finally {
            if (Objects.nonNull(reader)) {
                try {
                    reader.close();
                } catch (IOException e) {
                    LOG.error("关闭数据流失败", e);
                }
            }
            if (Objects.nonNull(writer)) {
                writer.close();
            }
        }
        LOG.warn("----------微信异步通知更新订单状态结束------------");
        return null;
    }

    /**
     * 支付成功后确认订单
     *
     * @param orderId
     * @return
     */
    @RequestMapping("/confirm")
    @ResponseBody
    public Object confirmOrder(@RequestParam Long orderId) {
        JsonResponse result = JsonResponse.response();
        result.setMessage("订单支付失败");
        result.setCode(JsonResponse.FAIL_CODE);
        Order order = orderService.findOrderById(orderId);
        if (Objects.isNull(order)) {
            LOG.warn("订单ID：" + orderId + "不存在.");
            result.setMessage("更新订单失败，订单ID:" + orderId + " 不存在");
            return result;
        }
        try {
            if (!(order instanceof CustomOrder)) {
                LOG.warn("订单类型异常,订单ID：" + orderId + "不存在.");
                result.setMessage("异常订单，订单ID:" + orderId);
                return result;
            }
            LOG.warn("调用微信账单接口检测订单状态开始,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
            CustomOrder customOrder = (CustomOrder) order;
            Shop shop = customOrder.getAddress().getShop();
            QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(shop.getAppId()).setMch_id(shop.getMchid()).setOut_trade_no(order.getOrderNumber()).build();
            Map<String, Object> wxOrderInfo = WxPayApi.queryOrder(reqData);
            if (!WxCallBackData.SUCCESS.equals(wxOrderInfo.get("return_code"))) {
                result.setMessage(Objects.isNull(wxOrderInfo.get("return_msg")) ? "通讯错误" : wxOrderInfo.get("return_msg").toString());
                return result;
            }
            if (!WxCallBackData.SUCCESS.equals(wxOrderInfo.get("result_code"))) {
                result.setMessage(Objects.isNull(wxOrderInfo.get("err_code_des")) ? "业务错误" : wxOrderInfo.get("err_code_des").toString());
                return result;
            }
            LOG.warn("订单号," + order.getOrderNumber() + ",查询结果:out_trade_no=" + wxOrderInfo.get("out_trade_no") + ",trade_state=" + wxOrderInfo.get("trade_state"));
            if (WxCallBackData.SUCCESS.equals(wxOrderInfo.get("trade_state"))) {
                order.setStatus(OrderHistoryController.PAID);
                result.setMessage("订单支付成功.");
                result.setCode(JsonResponse.SUCCESS_CODE);
            } else {
                order.setStatus(OrderHistoryController.UNPAID);
            }
            orderService.save(order, false);
            LOG.warn("更新订单状态完成,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
            //todo 微信账单信息写入数据库
        } catch (IOException e) {
            LOG.error("io错误", e);
        } catch (SAXException e) {
            LOG.error("xml解析错误", e);
        } catch (ParserConfigurationException e) {
            LOG.error("xml配置错误", e);
        } catch (PricingException e) {
            LOG.error("修改订单价格错误", e);
        }
        LOG.warn("检测订单状态结束,订单编号:" + order.getOrderNumber() + ",订单状态:" + order.getStatus().getType());
        return result;
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
    /*    CustomOrderService customOrderService = (CustomOrderService) orderService;
        List cancelledOrders = customOrderService.findOrderByStatus(OrderStatus.CANCELLED);
        List errorOrderList = new ArrayList<>();
        for (Object cancelledOrder : cancelledOrders) {
            Object[] arr = (Object[]) cancelledOrder;
            String orderNumber = arr[1].toString();
            Shop shop = (Shop) arr[2];
            String status = (String) arr[3];
            QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(shop.getAppId()).setMch_id(shop.getMchid()).setOut_trade_no(orderNumber).build();
            try {
                Map<String, Object> result = WxPayApi.queryOrder(reqData);
                if ("SUCCESS".equals(result.get("trade_state")) && !status.equals("PAID")) {
                    errorOrderList.add(result);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } catch (SAXException e) {
                e.printStackTrace();
            } catch (ParserConfigurationException e) {
                e.printStackTrace();
            }
        }
        return errorOrderList;*/
        return null;
    }
}
