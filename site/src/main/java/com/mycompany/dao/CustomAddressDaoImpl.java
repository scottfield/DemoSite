package com.mycompany.dao;

import org.broadleafcommerce.profile.core.dao.AddressDaoImpl;
import org.broadleafcommerce.profile.core.domain.Address;

import javax.persistence.Query;

/**
 * Created by jackie on 4/19/2016.
 */
public class CustomAddressDaoImpl extends AddressDaoImpl {
    @Override
    public Address readAddressById(Long id) {
        Query query = em.createQuery("select address from com.mycompany.sample.core.catalog.domain.CustomAddressImpl address where address.id=:id");
        query.setParameter("id", id);
        return (Address) query.getSingleResult();
    }
}
