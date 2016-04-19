package com.mycompany.sample.core.catalog.domain;

import org.broadleafcommerce.profile.core.domain.AddressImpl;

import javax.persistence.*;

/**
 * Created by jackie on 4/14/2016.
 */
@Entity
public class CustomAddressImpl extends AddressImpl implements CustomAddress {

    @ManyToOne(targetEntity = ShopImpl.class)
    @JoinTable(name = "ADDRESS_SHOP",
            joinColumns = {@JoinColumn(name = "ADDRESS_ID", referencedColumnName = "ADDRESS_ID")},
            inverseJoinColumns = {@JoinColumn(name = "SHOP_ID", referencedColumnName = "ID")})
    private Shop shop = new ShopImpl();
    @Override
    public Shop getShop() {
        return shop;
    }

    @Override
    public void setShop(Shop shop) {
        this.shop = shop;
    }
}
