package com.mycompany.controller.coupon;

import com.mycompany.controller.account.QRCodeController;
import com.mycompany.controller.form.CouponExchangeForm;
import com.mycompany.controller.wrapper.CardWrapper;
import com.mycompany.sample.core.catalog.domain.*;
import com.mycompany.sample.service.CouponService;
import com.mycompany.sample.service.CustomerCouponXrefService;
import com.mycompany.sample.service.ShopService;
import com.mycompany.sample.util.CommonUtils;
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
import java.util.*;

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

    private static final Date onlineExchangeStartDate;
    private static final Date onlineExchangeEndDate;
    private static final Date offlineExchangeStartDate;
    private static final Date offlineExchangeEndDate;

    static {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, 2016);
        calendar.set(Calendar.MONTH, Calendar.MAY);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        //线上开始时间
        calendar.set(Calendar.DAY_OF_MONTH, 9);
        onlineExchangeStartDate = calendar.getTime();
        //线上结束时间
        calendar.set(Calendar.DAY_OF_MONTH, 23);
        onlineExchangeEndDate = calendar.getTime();


        //线下开始时间
        calendar.set(Calendar.DAY_OF_MONTH, 13);
        offlineExchangeStartDate = calendar.getTime();
        //线下结束时间
        calendar.set(Calendar.DAY_OF_MONTH, 15);
        offlineExchangeEndDate = calendar.getTime();
    }

    /**
     * 发放线上优惠券
     *
     * @return
     */
    @RequestMapping(value = "/issue/online", method = RequestMethod.GET)
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
        result = issueCoupon(coupon, customer);
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
        //校验token是否正确
        Object tokenInSession = session.getAttribute(QRCodeController.issueCouponTokenName);
        if (!token.equals(tokenInSession)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("验证口令错误");
            LOG.warn("发放优惠券失败,错误口令:" + token + ",正确口令:" + (Objects.isNull(tokenInSession) ? "" : tokenInSession.toString()));
            return result;
        }

        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();

        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        if (Objects.isNull(fiveCardXref)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("还没领取五折卡哦");
            return result;
        }

        //发放B卡用户优惠券
        Coupon offlineTypeB = getAvailableCouponByType(Coupon.OFFLINE_B);
        result = issueCoupon(offlineTypeB, customer);
        //发放A卡用户优惠券
        Coupon offlineTypeA = getAvailableCouponByType(Coupon.OFFLINE_A);
        issueCoupon(offlineTypeA, fiveCardXref.getReferer());
        return result;
    }

    private synchronized Coupon getAvailableCouponByType(Integer type) {
        Coupon coupon = couponService.readByType(type);
        //检查卡券数量
        if (coupon.getAmount() == 0) {
            LOG.info("优惠券类型" + coupon.getType() + "剩余数量==>" + coupon.getAmount());
            return null;
        }
        //修改卡数量
        coupon.setAmount(coupon.getAmount() - 1);
        couponService.saveCoupon(coupon);
        return coupon;
    }

    private JsonResponse issueCoupon(Coupon coupon, Customer customer) {
        JsonResponse result = JsonResponse.response("发放优惠券成功.");
        if (Objects.isNull(coupon)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("优惠券已发完");
            return result;
        }
        if (Objects.isNull(customer)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("用户不存在");
            return result;
        }
        Map<String, Object> others = new HashMap<>();
        others.put("couponValue", coupon.getValue());
        others.put("couponDesc", coupon.getDesc());
        others.put("couponType", coupon.getType());
        result.setOthers(others);
        CustomerCouponXref couponXref = new CustomerCouponXrefImpl();
        couponXref.setCustomer(customer);
        couponXref.setCoupon(coupon);
        couponXref.setStatus(CustomerCouponXref.STATUS_UNUSE);
        couponXref.setCreatedOn(CommonUtils.currentDate());
        couponXref.setUpdatedOn(CommonUtils.currentDate());
        couponXref.setNewCoupon(true);
        couponXrefService.saveCustomerXref(couponXref);
        return result;
    }

    private Coupon getNormalCoupon() {
        //从小到大的面额来发放优惠券,发完为止
        Coupon coupon = null;
        for (int couponType = Coupon.TYPE_A; couponType <= Coupon.TYPE_D; couponType++) {
            coupon = getAvailableCouponByType(couponType);
            if (Objects.nonNull(coupon)) {
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
                card.setCouponType(coupon.getType());
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
        JsonResponse result = JsonResponse.response("兑换优惠券成功.");
        CustomerCouponXref couponXref = couponXrefService.readById(form.getCouponXrefId());

        //检测优惠券是否存在
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
        //检测优惠券是否在兑换时间范围
        Date now = CommonUtils.currentDate();
        Date start;
        Date end;
        if (couponXref.getCoupon().getType() >= Coupon.OFFLINE_B) {
            start = offlineExchangeStartDate;
            end = offlineExchangeEndDate;
        } else {
            start = onlineExchangeStartDate;
            end = onlineExchangeEndDate;
        }

        if (now.before(start)) {
            result.setCode(-1000);
            result.setMessage("还未到优惠券兑换时间,最早兑换时间" + CommonUtils.formatDate(offlineExchangeStartDate));
            return result;
        }
        if (now.after(end)) {
            result.setCode(-1000);
            result.setMessage("优惠券兑换时间已结束,最晚兑换时间" + CommonUtils.formatDate(offlineExchangeEndDate));
            return result;
        }
        //校验提货码(789+门店编号)
        String verifyCode = form.getVerifyCode();
        if (Objects.isNull(verifyCode) || (verifyCode.length() != 6)) {
            result.setCode(-1000);
            result.setMessage("提货验证码错误");
            return result;
        }
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
