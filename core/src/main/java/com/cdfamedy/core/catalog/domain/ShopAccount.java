package com.cdfamedy.core.catalog.domain;

/**
 * Created by jackie on 4/23/2016.
 */
public interface ShopAccount {
    Integer getId();

    void setId(Integer id);

    String getAppid();

    void setAppid(String appid);

    String getName();

    void setName(String name);

    String getMchid();

    void setMchid(String mchid);

    String getKey();

    void setKey(String key);

    String getAppsecret();

    void setAppsecret(String appsecret);
    String getShopCode();

    void setShopCode(String shopCode);
}
