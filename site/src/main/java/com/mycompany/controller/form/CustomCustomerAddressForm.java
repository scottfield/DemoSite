package com.mycompany.controller.form;

import com.mycompany.sample.core.catalog.domain.CustomAddressImpl;
import org.broadleafcommerce.core.web.controller.account.CustomerAddressForm;

/**
 * Created by jackie on 4/15/2016.
 */
public class CustomCustomerAddressForm extends CustomerAddressForm {
    public CustomCustomerAddressForm() {
        address = new CustomAddressImpl();
    }
}
