package com.mycompany.controller.account;

import com.mycompany.controller.wrapper.CardWrapper;
import com.mycompany.sample.core.catalog.domain.CustomCustomer;
import com.mycompany.sample.core.catalog.domain.CustomerCouponXref;
import com.mycompany.sample.core.catalog.domain.CustomerFiveCardXref;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Created by jackie on 4/27/2016.
 */
@Controller
@RequestMapping("/manage/couponAndFiveCard")
public class ManageCouponAndFiveCardController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String view(HttpServletRequest request) {
        List cards = new ArrayList<>();
        CustomCustomer customer = (CustomCustomer) CustomerState.getCustomer();
        CustomerFiveCardXref fiveCardXref = customer.getFiveCardXref();
        //转换五折卡
        if (Objects.nonNull(fiveCardXref)) {
            CardWrapper card = CardWrapper.getInstance();
            card.setStatus(fiveCardXref.getStatus());
            card.setType(CardWrapper.FIVE_CARD_TYPE);
            cards.add(card);
        }
        //转换优惠券
        List<CustomerCouponXref> couponXrefs = customer.getCouponXrefs();
        for (CustomerCouponXref couponXref : couponXrefs) {
            CardWrapper card = CardWrapper.getInstance();
            card.setType(CardWrapper.COUPON_TYPE);
            card.setStatus(couponXref.getStatus());
            card.setValue(couponXref.getCoupon().getValue());
            card.setId(couponXref.getId());
            cards.add(card);
        }
        request.setAttribute("cards", cards);
        return "wodekajuan";
    }
}
