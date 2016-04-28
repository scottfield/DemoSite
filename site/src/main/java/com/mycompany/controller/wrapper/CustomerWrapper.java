package com.mycompany.controller.wrapper;

import java.io.Serializable;
import java.util.List;

/**
 * Created by jackie on 4/28/2016.
 */
public class CustomerWrapper implements Serializable {
    /**
     * 用户ID
     */
    private Long id;
    /**
     * 微信昵称
     */
    private String nickname;
    /**
     * 微信头像
     */
    private String headImageUrl;
    private List<CustomerWrapper> followers;

    public CustomerWrapper() {
    }

    public String getHeadImageUrl() {
        return headImageUrl;
    }

    public void setHeadImageUrl(String headImageUrl) {
        this.headImageUrl = headImageUrl;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * 荣誉称号
     */

    public String getTitle() {
        String title = "穷屌丝";
        int size = followers.size();
        if (size >= 10) {
            title = "人气王";
        } else if (size >= 5) {
            title = "人气有点旺";
        } else if (size >= 3) {
            title = "人气一般";
        }
        return title;
    }

    public List<CustomerWrapper> getFollowers() {
        return followers;
    }

    public void setFollowers(List<CustomerWrapper> followers) {
        this.followers = followers;
    }
}
