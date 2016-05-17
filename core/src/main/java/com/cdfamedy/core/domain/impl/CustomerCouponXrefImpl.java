package com.cdfamedy.core.domain.impl;

import com.cdfamedy.core.domain.Coupon;
import com.cdfamedy.core.domain.CustomerCouponXref;
import com.cdfamedy.core.domain.Shop;
import org.broadleafcommerce.profile.core.domain.Customer;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by jackie on 4/27/2016.
 */
@Entity
@Table(name = "CUSTOMER_COUPON_XREF")
public class CustomerCouponXrefImpl implements CustomerCouponXref {
    @Id
    @Column(name = "CUSTOMER_COUPON_XREF_ID")
    @GeneratedValue
    private Long id;
    @ManyToOne(targetEntity = CouponImpl.class)
    @JoinColumn(name = "COUPON_ID", referencedColumnName = "COUPON_ID")
    private Coupon coupon;
    @ManyToOne(targetEntity = CustomCustomerImpl.class)
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    private Customer customer;
    @Column(name = "coupon_status")
    private Boolean status;

    @Column(name = "updatedOn")
    private Date updatedOn;

    @Column(name = "createdOn")
    private Date createdOn;
    @ManyToOne(targetEntity = ShopImpl.class)
    @JoinColumn(name = "shop_id",referencedColumnName = "id")
    private Shop exchangeShop;
    @Column(name = "is_new_coupon")
    private boolean isNewCoupon;

    public CustomerCouponXrefImpl() {
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public void setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
    }

    public Shop getExchangeShop() {
        return exchangeShop;
    }

    public void setExchangeShop(Shop exchangeShop) {
        this.exchangeShop = exchangeShop;
    }

    public boolean isNewCoupon() {
        return isNewCoupon;
    }

    public void setNewCoupon(boolean newCoupon) {
        isNewCoupon = newCoupon;
    }
}
