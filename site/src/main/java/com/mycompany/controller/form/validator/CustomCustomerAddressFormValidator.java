package com.mycompany.controller.form.validator;

import com.mycompany.controller.form.CustomCustomerAddressForm;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by jackie on 5/1/2016.
 */
public class CustomCustomerAddressFormValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return CustomCustomerAddressForm.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.firstName","addressFirstName", "姓名必填");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.phonePrimary.phoneNumber","addressPhonePrimary", "电话号码必填");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.shop.id", "addressShopId","门店必选");
    }
}
