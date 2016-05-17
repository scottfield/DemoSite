package com.cdfamedy.core.domain.impl;

import com.cdfamedy.core.domain.CustomAddress;
import com.cdfamedy.core.domain.CustomOrder;
import org.broadleafcommerce.core.order.domain.OrderImpl;

import javax.persistence.*;

/**
 * Created by jackie on 5/3/2016.
 */
@Entity
@Table(name = "order_extend")
public class CustomOrderImpl extends OrderImpl implements CustomOrder {
    @OneToOne(targetEntity = CustomAddressImpl.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "ADDRESS_ID", referencedColumnName = "ADDRESS_ID")
    private CustomAddress address;

    public CustomAddress getAddress() {
        return address;
    }

    public void setAddress(CustomAddress address) {
        this.address = address;
    }
}
