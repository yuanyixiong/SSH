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
import org.hibernate.validator.constraints.NotBlank;

/**
 * 联系人信息实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_contact")
public class ContactModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 联系人编码
    @Column
    private String code;

    // 联系人名称（长度：100，不允许为空）
    @Column(length = 100, nullable = false)
    private String name;

    // 客户电话（长度：11，不允许为空）
    @Column(length = 11, nullable = false)
    private String phone;

    // 性别
    @Column(length = 11, nullable = false)
    private String gender;

    // 生日
    @Column(length = 11, nullable = false)
    private String birthday;

    // 地址
    @Column(length = 11, nullable = false)
    private String address;

    // 职位
    @Column(length = 11, nullable = false)
    private String position;

    // 邮箱
    @Column
    private String email;

    // 联系人所属客户
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CustomerModel customer;

    // 负责人
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private UserModel user;

    // 描述
    @Column
    private String description;

    // 客户来源
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CustomerResource resource;

    // 基于 JSR303 BeanValidator 的校验规则
    @NotBlank(message = "客户名称不允许为空！")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public CustomerModel getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerModel customer) {
        this.customer = customer;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
