/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 用户设置实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_user_setting")
public class UserSettingModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 默认主题
    @Column(length = 100)
    private String defaultTheme;

    // 默认语言
    @Column(length = 100)
    private String defaultLanguage;

    // 固定头部
    @Column(length = 100)
    private Boolean fixedHeader;

    // 是否固定导航
    @Column(length = 100)
    private Boolean fixedNavigation;

    // 用户
    @OneToOne
    @JoinColumn(name = "user_id", insertable = true, unique = true)
    @JsonIgnore
    private UserModel user;

    public String getDefaultTheme() {
        return defaultTheme;
    }

    public void setDefaultTheme(String defaultTheme) {
        this.defaultTheme = defaultTheme;
    }

    public String getDefaultLanguage() {
        return defaultLanguage;
    }

    public void setDefaultLanguage(String defaultLanguage) {
        this.defaultLanguage = defaultLanguage;
    }

    public Boolean getFixedHeader() {
        return fixedHeader;
    }

    public void setFixedHeader(Boolean fixedHeader) {
        this.fixedHeader = fixedHeader;
    }

    public Boolean getFixedNavigation() {
        return fixedNavigation;
    }

    public void setFixedNavigation(Boolean fixedNavigation) {
        this.fixedNavigation = fixedNavigation;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
