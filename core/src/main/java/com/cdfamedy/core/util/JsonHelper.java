package com.cdfamedy.core.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.Objects;

/**
 * Created by jackie on 2016/3/16.
 */
public class JsonHelper {
    private final static Logger logger = Logger.getLogger(JsonHelper.class);

    private static ObjectMapper createMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS);
        return mapper;
    }

    public static String toJsonStr(Object source) {
        ObjectMapper mapper = createMapper();
        String value = null;
        try {
            value = mapper.writeValueAsString(source);
        } catch (JsonProcessingException e) {
            logger.error("failed to tranfer object to json", e);
        }
        return value;
    }

    public static <R> R toObject(String source, Class<R> clazz) {
        ObjectMapper mapper = createMapper();
        R result = null;
        if (Objects.isNull(source)) {
            return null;
        }
        try {
            result = mapper.readValue(source, clazz);
        } catch (IOException e) {
            logger.error("tranfer json string to object of type " + clazz.getName() + " failed", e);
        }
        return result;
    }
}
