package com.mycompany.sample.service;

import java.util.Map;

/**
 * Created by jackie on 4/23/2016.
 */
public interface WeixinService {
    /**
     * 获取粉丝信息
     * @param openId 用户的openid，每个公众号唯一
     * @return
     */
    Map<String, Object> getUserInfo(String openId);

    /**
     * 获取会员信息
     * @param openId
     * @return
     */
    Map<String, Object> getVipInfo(String openId);

    /**
     * 获取js_api_ticket
     * @return
     */
    Map<String, Object> getTicket();
}
