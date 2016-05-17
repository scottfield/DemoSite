package com.cdfamedy.service;

import com.cdfamedy.core.catalog.domain.Promotion;
import com.cdfamedy.core.catalog.domain.PromotionImpl;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by jackie on 4/25/2016.
 */
@Service
public class PromotionServiceImpl implements PromotionService {
    @Override
    public Promotion getPromotionById(Long id) {
        //todo 完成从数据库获取活动时间
        Promotion promotion = new PromotionImpl();
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR,2016);
        calendar.set(Calendar.MONTH,Calendar.MAY);
        calendar.set(Calendar.DAY_OF_MONTH, 9);
        Date startDate = calendar.getTime();
        calendar.set(Calendar.DAY_OF_MONTH, 19);
        calendar.set(Calendar.HOUR_OF_DAY, 14);
        Date endDate = calendar.getTime();
        promotion.setStartDate(startDate);
        promotion.setEndDate(endDate);
        return promotion;
    }
}
