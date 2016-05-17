package com.cdfamedy.core.service.impl;

import com.cdfamedy.core.dao.CustomerAttributeDao;
import com.cdfamedy.core.service.CustomerAttributeService;
import org.broadleafcommerce.profile.core.domain.CustomerAttribute;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by jackie on 4/22/2016.
 */
@Service
public class CustomerAttributeServiceImpl implements CustomerAttributeService {
    @Resource
    private CustomerAttributeDao attributeDao;

    @Override
    public CustomerAttribute readCustomerByOpenId(String openId) {
        return attributeDao.getAttributeByValue(openId);
    }
}
