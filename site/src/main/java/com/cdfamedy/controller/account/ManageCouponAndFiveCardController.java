package com.cdfamedy.controller.account;

import com.cdfamedy.controller.wrapper.CardWrapper;
import com.cdfamedy.core.domain.CustomCustomer;
import com.cdfamedy.core.domain.CustomerCouponXref;
import com.cdfamedy.core.domain.CustomerFiveCardXref;
import com.cdfamedy.core.domain.FiveCard;
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
            FiveCard fiveCard = fiveCardXref.getFiveCard();
            card.setCardNo(Objects.isNull(fiveCard) ? null : fiveCard.getNo());
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
            card.setCouponType(couponXref.getCoupon().getType());
            cards.add(card);
        }
        request.setAttribute("cards", cards);
        return "wodekajuan";
    }
}
