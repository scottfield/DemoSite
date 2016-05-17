package com.cdfamedy.core.util;

import java.util.Map;

/**
 * Created by jackie on 4/27/2016.
 */
public final class JsonResponse {
    private Integer code;
    private String message;
    private Map<String, Object> others;
    public static final Integer SUCCESS_CODE = 1000;
    public static final Integer FAIL_CODE = -1000;

    public static JsonResponse response() {
        return response("成功");
    }

    public static JsonResponse response(String errorMsg) {
        JsonResponse response = new JsonResponse();
        response.setCode(SUCCESS_CODE);
        response.setMessage(errorMsg);
        return response;
    }

    public JsonResponse() {
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getOthers() {
        return others;
    }

    public void setOthers(Map<String, Object> others) {
        this.others = others;
    }
}
