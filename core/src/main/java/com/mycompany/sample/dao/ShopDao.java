package com.mycompany.sample.dao;

import com.mycompany.sample.core.catalog.domain.Shop;

import java.util.Set;

/**
 * Created by jackie on 4/14/2016.
 */
public interface ShopDao {
    Set<Shop> readAllShop();

    Shop readShopByCode(String code);
}
