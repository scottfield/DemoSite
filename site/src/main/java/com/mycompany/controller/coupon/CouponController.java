package com.mycompany.controller.coupon;

import com.mycompany.controller.account.QRCodeController;
import com.mycompany.controller.form.CouponExchangeForm;
import com.mycompany.controller.wrapper.CardWrapper;
import com.mycompany.sample.core.catalog.domain.*;
import com.mycompany.sample.service.CouponService;
import com.mycompany.sample.service.CustomerCouponXrefService;
import com.mycompany.sample.service.ShopService;
import com.mycompany.sample.util.CommonUtils;
import com.mycompany.sample.util.JsonHelper;
import com.mycompany.sample.util.JsonResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.core.domain.Phone;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by jackie on 4/27/2016.
 */
@Controller
@RequestMapping("/coupon")
public class CouponController {
    private static final Log LOG = LogFactory.getLog(CouponController.class);
    @Resource
    private CustomerCouponXrefService couponXrefService;
    @Resource
    private CouponService couponService;
    @Resource
    private ShopService shopService;

    /**
     * 发放线上优惠券
     *
     * @return
     */
    @RequestMapping(value = "/issue/online", method = RequestMethod.POST)
    @ResponseBody
    public Object issueOnlineCoupon() {
        JsonResponse result = JsonResponse.response("发放优惠券成功.");
        //检测用户拥有优惠券的数量是否超过限制(最多三张)
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        List<CustomerCouponXref> couponXrefList = customer.getOnlineCouponXrefs();
        if (Objects.nonNull(couponXrefList) && couponXrefList.size() >= 3) {
            result.setCode(JsonResponse.FAIL_CODE);
            String message = "优惠券数量已超出最大限制(每人最多3张),当前用户:" + customer.getId() + ",已拥有的优惠券" + couponXrefList.size() + "张";
            result.setMessage(message);
            LOG.info(message);
            return result;
        }

        Coupon coupon = getNormalCoupon();

        if (Objects.isNull(coupon)) {
            result.setMessage("优惠券已发完.");
            result.setCode(JsonResponse.FAIL_CODE);
            LOG.info("发放优惠券信息:" + JsonHelper.toJsonStr(coupon));
            return result;
        }

        //修改优惠券数量
        issueCoupon(coupon, customer);
        LOG.info("优惠券剩余数量==>" + coupon.getAmount());
        Map<String, Object> others = new HashMap<>();
        others.put("couponValue", coupon.getValue());
        others.put("couponDesc", coupon.getDesc());
        result.setOthers(others);
        return result;
    }

    /**
     * 发放线上优惠券
     *
     * @return
     */
    @RequestMapping(value = "/issue/offline", method = RequestMethod.GET)
    @ResponseBody
    public Object issueOfflineCoupon(@RequestParam String token, HttpSession session) {
        JsonResponse result = JsonResponse.response("发放优惠券成功.");
        Map<String, Object> others = new HashMap<>();
        //校验token是否正确
        Object tokenInSession = session.getAttribute(QRCodeController.issueCouponTokenName);
        if (!token.equals(tokenInSession)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("验证口令错误");
            LOG.warn("发放优惠券失败,错误口令:" + token + ",正确口令:" + (Objects.isNull(tokenInSession) ? "" : tokenInSession.toString()));
            return result;
        }

        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();


        Coupon couponE = couponService.readByType(Coupon.OFFLINE_B);//B卡用户优惠券
        Coupon couponF = couponService.readByType(Coupon.OFFLINE_A);//A卡用户优惠券
        //发放B卡用户优惠券
        JsonResponse responseA = issueCoupon(couponE, customer);
        if (responseA.getCode() != JsonResponse.SUCCESS_CODE) {
            result.setCode(JsonResponse.FAIL_CODE);
            others.put("errorA", responseA.getMessage());
        }
        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        if (Objects.isNull(fiveCardXref)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("还没领取五折卡哦");
            return result;
        }
        //发放A卡用户优惠券
        JsonResponse responseB = issueCoupon(couponF, fiveCardXref.getReferer());
        if (responseB.getCode() != JsonResponse.SUCCESS_CODE) {
            result.setCode(JsonResponse.FAIL_CODE);
            others.put("errorB", responseB.getMessage());
        }
        result.setOthers(others);
        return result;
    }

    private JsonResponse issueCoupon(Coupon coupon, Customer customer) {
        JsonResponse result = JsonResponse.response("发放优惠券成功.");
        if (Objects.isNull(customer)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("用户不存在");
            return result;
        }
        //检查卡券数量
        if (coupon.getAmount() == 0) {
            LOG.info("优惠券类型" + coupon.getType() + "剩余数量==>" + coupon.getAmount());
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("优惠券已派完");
            return result;
        }
        //修改优惠券数量
        coupon.setAmount(coupon.getAmount() - 1);
        //发放优惠券
        CustomerCouponXref couponXref = new CustomerCouponXrefImpl();
        couponXref.setCustomer(customer);
        couponXref.setCoupon(coupon);
        couponXref.setStatus(CustomerCouponXref.STATUS_UNUSE);
        couponXref.setCreatedOn(CommonUtils.currentDate());
        couponXref.setUpdatedOn(CommonUtils.currentDate());
        couponXref.setNewCoupon(true);
        couponXrefService.saveCustomerXref(couponXref);
        LOG.info("优惠券剩余数量==>" + coupon.getAmount());
        return result;
    }

    private Coupon getNormalCoupon() {
        //从小到大的面额来发放优惠券,发完为止
        Coupon coupon = null;
        for (int couponType = Coupon.TYPE_A; couponType <= Coupon.TYPE_D; couponType++) {
            coupon = couponService.readByType(couponType);
            if (Objects.nonNull(coupon) && coupon.getAmount() > 0) {
                break;
            }
        }
        return coupon;
    }

    /**
     * 兑换页面
     *
     * @param couponXrefId
     * @param model
     * @return
     */
    @RequestMapping(value = "/exchange/view", method = RequestMethod.GET)
    public String exchangeCouponPage(@RequestParam(value = "couponXrefId") Long couponXrefId, Model model) {
        CustomerCouponXref couponXref = couponXrefService.readById(couponXrefId);
        if (Objects.nonNull(couponXref)) {
            CardWrapper card = CardWrapper.getInstance();
            card.setType(CardWrapper.COUPON_TYPE);
            card.setStatus(couponXref.getStatus());
            Coupon coupon = couponXref.getCoupon();
            if (Objects.nonNull(coupon)) {
                card.setValue(coupon.getValue());
                card.setDescription(coupon.getDesc());
            }
            card.setId(couponXref.getId());
            model.addAttribute("card", card);
        }
        return "duihuan";
    }

    /**
     * 兑换优惠券
     *
     * @param form
     * @return
     */
    @RequestMapping(value = "/exchange/confirm", method = RequestMethod.POST)
    @ResponseBody
    public Object exchangeCoupon(CouponExchangeForm form) {
        //检测优惠券是否存在
        CustomerCouponXref couponXref = couponXrefService.readById(form.getCouponXrefId());
        JsonResponse result = JsonResponse.response("兑换优惠券成功.");
        if (Objects.isNull(couponXref)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("优惠券不存在");
            return result;
        }
        //检查优惠券是否兑换
        if (couponXref.getStatus()) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("优惠券已兑换");
            return result;
        }
        //校验提货码(789+门店编号)
        String verifyCode = form.getVerifyCode();
        //检测门店编号是否存在
        String shopCode = verifyCode.substring(3);
        Shop shop = shopService.readShopByCode(shopCode);
        if (Objects.isNull(shop)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("提货验证码错误");
            return result;
        }
        //记录兑换门店
        couponXref.setExchangeShop(shop);
        //保存优惠券
        couponXref.setStatus(CustomerCouponXref.STATUS_USED);
        couponXref.setUpdatedOn(CommonUtils.currentDate());
        couponXrefService.saveCustomerXref(couponXref);
        return result;
    }

    @RequestMapping(value = "/exchange", method = RequestMethod.GET)
    public String exchangeCouponForm(@RequestParam(value = "couponXrefId") Long couponXrefId, CouponExchangeForm form) {
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomAddress pickupAddress = customer.getPickupAddress();
        if (Objects.nonNull(pickupAddress)) {
            form.setReciever(pickupAddress.getFirstName());
            Phone phone = pickupAddress.getPhonePrimary();
            form.setRecieverPhone(Objects.isNull(phone) ? null : phone.getPhoneNumber());
        }
        return "coupon/coupon_exchange_form";
    }
}
