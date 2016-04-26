package com.mycompany.sample.service;

import com.mycompany.sample.core.catalog.domain.Promotion;
import com.mycompany.sample.core.catalog.domain.PromotionImpl;
import org.springframework.stereotype.Service;

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
        Date startDate = new Date(System.currentTimeMillis() - 60*60*1000);
        Date endDate = new Date(System.currentTimeMillis() + 10*60 * 60 * 1000);
        promotion.setStartDate(startDate);
        promotion.setEndDate(endDate);
        return promotion;
    }
}
