package com.cdfamedy.core.domain.impl;

import com.cdfamedy.core.domain.CustomerFiveCardXref;
import com.cdfamedy.core.domain.FiveCard;
import org.broadleafcommerce.profile.core.domain.Customer;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * Created by jackie on 4/23/2016.
 */
@Entity
@Table(name = "customer_fivecard_xref")
public class CustomerFiveCardXrefImpl implements CustomerFiveCardXref,Serializable{
    @Id
    @GeneratedValue
    private Integer id;
    @OneToOne(targetEntity = CustomCustomerImpl.class)
    @JoinColumn(name = "customer_id", referencedColumnName = "customer_id")
    private Customer customer;
    @OneToOne(targetEntity = FiveCardImpl.class, cascade = CascadeType.MERGE)
    @JoinColumn(name = "fivecard_id", referencedColumnName = "card_id")
    private FiveCard fiveCard;
    private Boolean status;
    private Integer type;
    @ManyToOne(targetEntity = CustomCustomerImpl.class)
    @JoinColumn(name = "referer", referencedColumnName = "customer_id")
    private Customer referer;
    @Column(name = "create_date")
    private Date createDate;
    @Column(name = "active_date")
    private Date activeDate;
    @OneToMany(targetEntity = CustomerFiveCardXrefImpl.class)
    @JoinColumn(name = "referer", referencedColumnName = "customer_id")
    private List<CustomerFiveCardXref> sharedCardXrefs = new ArrayList<>();
    @Column(name = "is_show_dialog")
    private Boolean isShowDialog;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public FiveCard getFiveCard() {
        return fiveCard;
    }

    public void setFiveCard(FiveCard fiveCard) {
        this.fiveCard = fiveCard;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Customer getReferer() {
        return referer;
    }

    public void setReferer(Customer referer) {
        this.referer = referer;
    }

    public Integer getType() {

        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getActiveDate() {
        return activeDate;
    }

    public void setActiveDate(Date activeDate) {
        this.activeDate = activeDate;
    }

    public List<CustomerFiveCardXref> getSharedCardXrefs() {
        return sharedCardXrefs;
    }

    public void setSharedCardXrefs(List<CustomerFiveCardXref> sharedCardXrefs) {
        this.sharedCardXrefs = sharedCardXrefs;
    }

    public Boolean getShowDialog() {
        return isShowDialog;
    }

    public void setShowDialog(Boolean showDialog) {
        isShowDialog = showDialog;
    }
}
