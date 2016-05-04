package com.mycompany.controller.form;

import com.mycompany.sample.core.catalog.domain.CustomAddressImpl;
import org.broadleafcommerce.core.web.controller.account.CustomerAddressForm;
import org.broadleafcommerce.profile.core.domain.Phone;
import org.broadleafcommerce.profile.core.domain.PhoneImpl;

/**
 * Created by jackie on 4/15/2016.
 */
public class CustomCustomerAddressForm extends CustomerAddressForm {
    public CustomCustomerAddressForm() {
        address = new CustomAddressImpl();
        Phone primaryPhone = new PhoneImpl();
        address.setPhonePrimary(primaryPhone);
    }
}
