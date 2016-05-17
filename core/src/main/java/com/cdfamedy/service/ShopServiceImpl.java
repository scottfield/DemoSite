package com.cdfamedy.service;

import com.cdfamedy.core.catalog.domain.Shop;
import com.cdfamedy.dao.ShopDao;
import com.cdfamedy.payment.weixin.common.Configure;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
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

    /**
     * 门店初始化完成后，将门店的支付商户信息，写入到Configure中
     */
    @PostConstruct
    public void init() {
        Set<Shop> allShop = this.getAllShop();
        allShop.stream().forEach(shop -> Configure.accountMap.put(shop.getMchid(), shop.getShopAccount()));
    }
}
