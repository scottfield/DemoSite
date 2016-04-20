package com.mycompany.sample.service;

import com.mycompany.sample.core.catalog.domain.Shop;
import com.mycompany.sample.dao.ShopDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;

/**
 * Created by jackie on 4/14/2016.
 */
@Service("shopService")
public class ShopServiceImpl implements ShopService {
    @Resource(name = "shopDao")
    private ShopDao shopDao;

    @Override
    public Set<Shop> getAllShop() {
        return shopDao.readAllShop();
    }

    @Override
    public Shop readShopByCode(String code) {
        return shopDao.readShopByCode(code);
    }
}
