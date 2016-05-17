package com.cdfamedy.worklow.order;

/**
 * Created by jackie on 5/10/2016.
 */
public class WxStatusException extends Exception {
    private String errorMsg;

    public WxStatusException(String errorMsg) {
        super();
        this.errorMsg = errorMsg;
    }
}
