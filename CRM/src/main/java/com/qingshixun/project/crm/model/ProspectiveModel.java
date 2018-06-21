/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 潜在客户实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_prospective")
public class ProspectiveModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 潜在客户编码
    @Column
    private String code;

    // 名称
    @Column
    private String name;

    // 名称
    @Column
    private String mobile;

    // 名称
    @Column
    private String company;

    // 名称
    @Column
    private String position;

    // 名称
    @Column
    private String email;

    // 负责人
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private UserModel user;

    // 描述
    @Column(columnDefinition = "TEXT", nullable = false)
    private String description;

    // 潜在客户来源
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CustomerResource resource;

    // 潜在客户状态
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CustomerStatus status;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public CustomerResource getResource() {
        return resource;
    }

    public void setResource(CustomerResource resource) {
        this.resource = resource;
    }

    public CustomerStatus getStatus() {
        return status;
    }

    public void setStatus(CustomerStatus status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
