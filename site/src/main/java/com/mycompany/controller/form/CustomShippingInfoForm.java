package com.mycompany.controller.form;

import com.mycompany.sample.core.catalog.domain.CustomAddressImpl;
import org.broadleafcommerce.core.web.checkout.model.ShippingInfoForm;

/**
 * Created by jackie on 4/14/2016.
 */
public class CustomShippingInfoForm extends ShippingInfoForm {
    public CustomShippingInfoForm() {
        //override default address
        address = new CustomAddressImpl();
    }
}
