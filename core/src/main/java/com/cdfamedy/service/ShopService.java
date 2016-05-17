package com.cdfamedy.service;

import com.cdfamedy.core.catalog.domain.Shop;

import java.util.Set;

/**
 * Created by jackie on 4/14/2016.
 */
public interface ShopService {
    Set<Shop> getAllShop();

    Shop readShopByCode(String code);
}
