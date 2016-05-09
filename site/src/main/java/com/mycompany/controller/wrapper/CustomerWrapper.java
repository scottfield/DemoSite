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
        String title = "帅到没朋友";
        int size = followers.size();
        if (size >= 5) {
            title = "老司机的小船妥妥的";
        } else if (size >= 3) {
            title = "五湖四海皆兄弟";
        } else if (size >= 1) {
            title = "都是真朋友";
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
