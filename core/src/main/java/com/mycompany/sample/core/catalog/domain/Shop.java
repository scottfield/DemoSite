package com.mycompany.sample.core.catalog.domain;

/**
 * Created by jackie on 4/14/2016.
 */
public interface Shop {
    String getAddress();

    void setAddress(String address);

    String getArea();

    void setArea(String area);

    String getCity();

    void setCity(String city);

    String getCode();

    void setCode(String code);

    Integer getId();

    void setId(Integer id);

    String getName();

    void setName(String name);

    String getProvince();

    void setProvince(String province);

    String getAppId();

    void setAppId(String appId);

    String getMchid();

    void setMchid(String mchid);
    ShopAccount getShopAccount();

    void setShopAccount(ShopAccount shopAccount);
}
