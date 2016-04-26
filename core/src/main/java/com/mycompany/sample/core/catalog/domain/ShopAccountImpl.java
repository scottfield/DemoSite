package com.mycompany.sample.core.catalog.domain;

import javax.persistence.*;

/**
 * Created by jackie on 4/23/2016.
 */
@Entity
@Table(name = "SHOP_ACCOUNT")
public class ShopAccountImpl implements ShopAccount {
    @Id
    @GeneratedValue
    private Integer id;
    private String appid;
    private String name;
    private String mchid;
    private String key;
    private String appsecret;
    @Column(name = "shop_code")
    private String shopCode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMchid() {
        return mchid;
    }

    public void setMchid(String mchid) {
        this.mchid = mchid;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getAppsecret() {
        return appsecret;
    }

    public void setAppsecret(String appsecret) {
        this.appsecret = appsecret;
    }

    public String getShopCode() {
        return shopCode;
    }

    public void setShopCode(String shopCode) {
        this.shopCode = shopCode;
    }
}
