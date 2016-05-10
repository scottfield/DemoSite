package com.mycompany.worklow.cancelOrder;

import com.mycompany.sample.core.catalog.domain.CustomAddress;
import com.mycompany.sample.core.catalog.domain.CustomOrder;
import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.payment.weixin.common.JsonUtil;
import com.mycompany.sample.payment.weixin.protocol.QueryOrderReqData;
import com.mycompany.sample.payment.weixin.service.WxCallBackData;
import com.mycompany.sample.payment.weixin.service.WxPayApi;
import com.mycompany.sample.util.JsonHelper;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.checkout.service.workflow.CheckoutSeed;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;
import org.broadleafcommerce.core.workflow.WorkflowException;
import org.springframework.stereotype.Component;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;

/**
 * Created by jackie on 4/20/2016.
 * 检测微信账单的支付状态
 */
public class CheckWxOrderStatusActivity extends BaseActivity<ProcessContext<CancelOrderSeed>> {
    public ProcessContext<CancelOrderSeed> execute(ProcessContext<CancelOrderSeed> context) throws Exception {
        CancelOrderSeed seed = context.getSeedData();
        Order order = seed.getOrder();
        String orderNumber = order.getOrderNumber();
        if (!(order instanceof CustomOrder)) {
            throw new WxStatusException("订单类型非自定义订单类型,单号：" + orderNumber);
        }

        CustomOrder customOrder = (CustomOrder) order;
        CustomAddress address = customOrder.getAddress();
        if (Objects.isNull(address)) {
            throw new WxStatusException("订单地址为空,单号：" + orderNumber);
        }

        Shop shop = address.getShop();
        if (Objects.isNull(shop)) {
            throw new WxStatusException("订单门店为空,单号：" + orderNumber);
        }
        QueryOrderReqData reqData = new QueryOrderReqData.QueryOrderReqDataBuilder().setAppid(shop.getAppId()).setMch_id(shop.getMchid()).setOut_trade_no(orderNumber).build();
        Map<String, Object> result = WxPayApi.queryOrder(reqData);
        if (Objects.isNull(result)) {
            return context;
        }
        WxCallBackData callBackData = JsonUtil.fromJson(JsonHelper.toJsonStr(result), WxCallBackData.class);
        if (WxCallBackData.SUCCESS.equals(callBackData.getTrade_state())) {
            throw new WxStatusException("微信订单已支付,交易号:" + callBackData.getTransaction_id());
        }
        return context;
    }
}
