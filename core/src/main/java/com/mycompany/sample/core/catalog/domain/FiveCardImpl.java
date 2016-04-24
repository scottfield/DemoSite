package com.mycompany.sample.core.catalog.domain;

import javax.persistence.*;

/**
 * Created by jackie on 4/23/2016.
 */
@Entity
@Table(name = "FIVECARD")
public class FiveCardImpl implements FiveCard {
    @Id
    @GeneratedValue
    @Column(name = "card_id")
    private Integer id;
    @Column(name = "card_name")
    private String name;
    @Column(name = "card_desc")
    private String desc;
    @Column(name = "card_type")
    private Integer type;
    @Column(name = "card_no")
    private String no;
    @Column(name = "card_status")
    private Boolean status;
    @OneToOne(mappedBy = "fiveCard",targetEntity = CustomerFiveCardXrefImpl.class)
    private CustomerFiveCardXref fiveCardXrefs;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public CustomerFiveCardXref getFiveCardXrefs() {
        return fiveCardXrefs;
    }

    public void setFiveCardXrefs(CustomerFiveCardXref fiveCardXrefs) {
        this.fiveCardXrefs = fiveCardXrefs;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }
}
