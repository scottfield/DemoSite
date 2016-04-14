package com.mycompany.sample.core.catalog.domain;

import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.PopulateToOneFieldsEnum;

import javax.persistence.*;

/**
 * Created by jackie on 4/14/2016.
 */
@Entity
@Table(name = "SHOP")
@AdminPresentationClass(populateToOneFields = PopulateToOneFieldsEnum.TRUE, friendlyName = "门店管理")
public class ShopImpl implements Shop {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @AdminPresentation(friendlyName = "所属大区")
    private String area;
    @AdminPresentation(friendlyName = "门店编码")
    private String code;
    @AdminPresentation(friendlyName = "省份")
    private String province;
    @AdminPresentation(friendlyName = "地级市")
    private String city;
    @AdminPresentation(friendlyName = "门店名称")
    private String name;
    @AdminPresentation(friendlyName = "地址")
    private String address;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }
}
