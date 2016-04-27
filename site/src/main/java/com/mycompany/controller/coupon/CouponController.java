package com.mycompany.controller.coupon;

import com.mycompany.sample.core.catalog.domain.Coupon;
import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomerCouponXref;
import com.mycompany.sample.core.catalog.domain.CustomerCouponXrefImpl;
import com.mycompany.sample.service.CouponService;
import com.mycompany.sample.service.CustomerCouponXrefService;
import com.mycompany.sample.util.CommonUtils;
import com.mycompany.sample.util.JsonHelper;
import com.mycompany.sample.util.JsonResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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

    /**
     * 发放优惠券
     *
     * @return
     */
    @RequestMapping(value = "/issue", method = RequestMethod.POST)
    @ResponseBody
    public Object issueCoupon() {
        JsonResponse result = JsonResponse.response("发放优惠券成功.");
        //检测用户拥有优惠券的数量是否超过限制(最多三张)
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        List<CustomerCouponXref> couponXrefList = customer.getCouponXrefs();
        if (Objects.nonNull(couponXrefList) && couponXrefList.size() >= 3) {
            result.setCode(JsonResponse.FAIL_CODE);
            String message = "优惠券数量已超出最大限制(每人最多3张),当前用户:" + customer.getId() + ",已拥有的优惠券" + couponXrefList.size() + "张";
            result.setMessage(message);
            LOG.info(message);
            return result;
        }
        //从小到大的面额来发放优惠券,发完为止
        Coupon coupon = null;
        for (int couponType = Coupon.TYPE_A; couponType <= Coupon.TYPE_D; couponType++) {
            coupon = couponService.readByType(couponType);
            if (Objects.nonNull(coupon) && coupon.getAmount() > 0) {
                break;
            }
        }
        if (Objects.isNull(coupon)) {
            result.setCode(JsonResponse.FAIL_CODE);
            result.setMessage("优惠券已发完.");
            LOG.info("发放优惠券信息:" + JsonHelper.toJsonStr(coupon));
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
        couponXrefService.saveCustomerXref(couponXref);
        LOG.info("优惠券剩余数量==>" + coupon.getAmount());
        Map<String, Object> others = new HashMap<>();
        others.put("couponValue", coupon.getValue());
        result.setOthers(others);
        return result;
    }

    /**
     * 兑换优惠券
     *
     * @param couponXrefId
     * @return
     */
    @RequestMapping(value = "/exchange", method = RequestMethod.POST)
    @ResponseBody
    public Object exchangeCoupon(@RequestParam(value = "couponXrefId") Long couponXrefId) {
        //检测优惠券是否存在
        //检查优惠券是否兑换
        //校验提货码(789+门店编号)
        //记录兑换门店
        //保存优惠券
        Map<String, Object> result = CommonUtils.response("兑换优惠券成功.");
        CustomerCouponXref customerCouponXref = couponXrefService.readById(couponXrefId);
        customerCouponXref.setStatus(CustomerCouponXref.STATUS_USED);
        couponXrefService.saveCustomerXref(customerCouponXref);
        return result;
    }
}
