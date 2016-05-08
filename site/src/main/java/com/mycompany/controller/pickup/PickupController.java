package com.mycompany.controller.pickup;

import com.mycompany.controller.form.PickupInfoForm;
import com.mycompany.sample.core.catalog.domain.CustomAddress;
import com.mycompany.sample.core.catalog.domain.CustomOrder;
import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.service.ShopService;
import com.mycompany.sample.util.CommonUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderAttribute;
import org.broadleafcommerce.core.order.domain.OrderAttributeImpl;
import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by jackie on 4/20/2016.
 */
@Controller
@RequestMapping("/pickup")
public class PickupController {
    private static final Log LOG = LogFactory.getLog(PickupController.class);
    @Resource(name = "blOrderService")
    private OrderService orderService;
    @Resource(name = "blEntityConfiguration")
    private EntityConfiguration entityConfiguration;
    @Resource
    private ShopService shopService;
    private static final Date pickupStartDate;
    private static final Date pickupEndDate;

    static {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, 2016);
        calendar.set(Calendar.MONTH, Calendar.MAY);
        calendar.set(Calendar.DAY_OF_MONTH, 20);
        pickupStartDate = calendar.getTime();
        calendar.set(Calendar.DAY_OF_MONTH, 23);
        pickupEndDate = calendar.getTime();

    }

    @RequestMapping(method = RequestMethod.GET)
    public String pickupPage(HttpServletRequest request, @RequestParam Long orderId, Model model) {
        CustomOrder order = (CustomOrder) orderService.findOrderById(orderId);
        CustomAddress orderAddress = order.getAddress();
        model.addAttribute("orderAddress", orderAddress);
        return "pickup/pickup";
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> pickup(PickupInfoForm infoForm) {
        Map<String, Object> result = new HashMap<>();
        Date now = CommonUtils.currentDate();
        if (now.before(pickupStartDate)) {
            result.put("code", -1000);
            result.put("message", "还未到提货时间,最早提货时间" + CommonUtils.formatDate(pickupStartDate));
            return result;
        }
        if (now.after(pickupEndDate)) {
            result.put("code", -1000);
            result.put("message", "提货时间已结束,最晚提货时间" + CommonUtils.formatDate(pickupEndDate));
            return result;
        }
        Order order = orderService.findOrderById(infoForm.getOrderId());
        //检测货物是否已经被提取
        if (order.getStatus().getType().equals("CONSUMED")) {
            result.put("code", 1000);
            result.put("message", "已提取");
            return result;
        }
        //检测提货验证码是否正确
        String verifyCode = infoForm.getVerifyCode();
        if (verifyCode == null || (!verifyCode.startsWith("789"))) {
            result.put("code", -1000);
            result.put("message", "提货验证码错误");
            return result;
        }
        //检测门店编号是否存在
        String shopCode = verifyCode.substring(3);
        Shop shop = shopService.readShopByCode(shopCode);
        if (Objects.isNull(shop)) {
            result.put("code", -1000);
            result.put("message", "提货验证码错误");
            return result;
        }
        //todo 检测订单的收货门店是否与工作人员输入的门店编号相同
        //提取货物
        Map<String, OrderAttribute> orderAttributes = order.getOrderAttributes();
        OrderAttribute receiver = new OrderAttributeImpl();
        receiver.setOrder(order);
        receiver.setName("receiver");
        receiver.setValue(infoForm.getReciever());

        OrderAttribute receiverPhone = new OrderAttributeImpl();
        receiverPhone.setOrder(order);
        receiverPhone.setName("receiverPhone");
        receiverPhone.setValue(infoForm.getRecieverPhone());

        orderAttributes.put("reciever", receiver);
        orderAttributes.put("receiverPhone", receiverPhone);
        order.setStatus(new OrderStatus("CONSUMED", "CONSUMED"));
        result.put("code", -1000);
        result.put("message", "提货失败");
        try {
            orderService.save(order, false);
            result.put("code", 1000);
            result.put("message", "提货成功");
        } catch (PricingException e) {
            LOG.error("更新订单状态失败", e);
        }
        return result;
    }
}
