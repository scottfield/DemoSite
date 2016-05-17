package com.cdfamedy.core.domain.impl;

import com.cdfamedy.core.domain.QRCode;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.core.domain.CustomerImpl;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by jackie on 4/21/2016.
 */
@Entity
@Table(name = "QRCODE")
public class QRCodeImpl implements QRCode {
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "usedate")
    private Date usedate;
    @Column(name = "status")
    private Integer status;
    @ManyToOne(targetEntity = CustomerImpl.class)
    @JoinColumn(name = "usedby",referencedColumnName = "CUSTOMER_ID")
    private Customer customer;

    @Column(name = "code")
    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getUsedate() {
        return usedate;
    }

    public void setUsedate(Date usedate) {
        this.usedate = usedate;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer usedby) {
        this.customer = usedby;
    }
}
