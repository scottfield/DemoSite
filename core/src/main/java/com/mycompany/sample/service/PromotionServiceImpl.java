package com.mycompany.sample.service;

import com.mycompany.sample.core.catalog.domain.Promotion;
import com.mycompany.sample.core.catalog.domain.PromotionImpl;
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
        calendar.set(Calendar.YEAR, 2016);
        calendar.set(Calendar.MONTH, Calendar.MAY);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        //活动开始时间
        calendar.set(Calendar.DAY_OF_MONTH, 9);
        Date startDate = calendar.getTime();
        //活动结束时间
        calendar.set(Calendar.DAY_OF_MONTH, 19);
        calendar.set(Calendar.HOUR_OF_DAY, 14);
        Date endDate = calendar.getTime();
        promotion.setStartDate(startDate);
        promotion.setEndDate(endDate);
        return promotion;
    }
}
