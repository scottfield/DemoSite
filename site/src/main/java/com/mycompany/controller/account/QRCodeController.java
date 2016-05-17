package com.mycompany.controller.account;

import com.mycompany.sample.core.catalog.domain.*;
import com.mycompany.sample.service.QRCodeService;
import com.mycompany.sample.util.CommonUtils;
import com.mycompany.sample.util.JsonResponse;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by jackie on 4/21/2016.
 */
@Controller
@RequestMapping("/qr")
public class QRCodeController {
    public static final String issueCouponTokenName = "issueCouponToken";
    @Resource
    private QRCodeService qrCodeService;
    private static final Date start;
    private static final Date end;

    static {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, 2016);
        calendar.set(Calendar.MONTH, Calendar.MAY);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        //扫码开始时间
        calendar.set(Calendar.DAY_OF_MONTH, 13);
        start = calendar.getTime();
        //扫码结束时间
        calendar.set(Calendar.DAY_OF_MONTH, 15);
        end = calendar.getTime();
    }

    @RequestMapping(value = "/verify/{code}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResponse verifyCode(@PathVariable("code") String code) {
        return null;
    }

    /**
     * 核销二维码
     *
     * @param code
     * @return
     */
    @RequestMapping(value = "/exchange/{code}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResponse consumeQRCode(@PathVariable("code") String code, HttpSession session) {
        JsonResponse jsonResponse = JsonResponse.response("二维码兑换成功");
        jsonResponse.setCode(JsonResponse.FAIL_CODE);
        Date now = Calendar.getInstance().getTime();

        if (now.before(start)) {
            jsonResponse.setMessage("扫码活动还未开始");
            return jsonResponse;
        }
        if (now.after(end)) {
            jsonResponse.setMessage("扫码活动已结束");
            return jsonResponse;
        }
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        //检测是否拥有五折卡
        if (Objects.isNull(fiveCardXref)) {
            jsonResponse.setMessage("还没领卡哦!");
            return jsonResponse;
        }
        //只有B卡用户才能兑换二维码
        Integer type = fiveCardXref.getType();
        if (FiveCard.CARD_TYPE_B != type) {
            jsonResponse.setMessage("五折卡\"被分享者\"才能参与线下购物返利活动哟，详见活动规则！");
            return jsonResponse;
        }
        //检测用户是否已经通过扫码领取过线下优惠券
        List<CustomerCouponXref> offlineCouponXrefs = customer.getOfflineCouponXrefs();
        if (Objects.nonNull(offlineCouponXrefs) && offlineCouponXrefs.size() > 0) {
            jsonResponse.setMessage("每个用户只能参与一次扫码获取活动哦!");
            return jsonResponse;
        }
        //验证二维码有效性
        boolean isAvailable = qrCodeService.verifyCode(code);
        if (!isAvailable) {
            jsonResponse.setMessage("该二维码已兑换");
            return jsonResponse;
        }
        //修改二维码状态
        QRCode qrCode = qrCodeService.readByCode(code);
        qrCode.setStatus(1);
        qrCodeService.updateQRCode(qrCode);
        String issueCouponToken = CommonUtils.getRandomStr();
        Map<String, Object> others = new HashMap<>();
        others.put(this.issueCouponTokenName, issueCouponToken);
        jsonResponse.setOthers(others);
        session.setAttribute(this.issueCouponTokenName, issueCouponToken);
        jsonResponse.setCode(JsonResponse.SUCCESS_CODE);
        return jsonResponse;
    }
}
