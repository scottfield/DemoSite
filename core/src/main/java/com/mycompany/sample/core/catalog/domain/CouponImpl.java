package com.mycompany.sample.core.catalog.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by jackie on 4/27/2016.
 */
@Entity
@Table(name = "coupon")
public class CouponImpl implements Coupon{
    @Id
    @Column(name = "coupon_id")
    @GeneratedValue
    private Long id;
    @Column(name = "coupon_type")
    private Integer type;
    @Column(name = "coupon_value")
    private Integer value;
    @Column(name = "coupon_amount")
    private Integer amount;

    @Column(name = "updatedOn")
    private Date updatedOn;

    @Column(name = "createdOn")
    private Date createdOn;

    public CouponImpl() {
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public void setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }
}
