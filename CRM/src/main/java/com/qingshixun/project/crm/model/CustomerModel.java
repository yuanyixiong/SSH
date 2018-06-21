/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Sets;

/**
 * 客户信息实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_customer")
public class CustomerModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 客户名称（长度：100，不允许为空）
    @Column(length = 100, nullable = false)
    private String name;

    // 是否为VIP客户
    @Column(length = 11, nullable = false)
    private Boolean isVIP;

    // 地址
    @Column(length = 11, nullable = false)
    private String address;

    // 客户公司名称（长度：200，不允许为空）
    @Column(length = 200, nullable = false)
    private String company;

    // 客户账号
    @Column
    private String account;

    // 客户电话
    @Column
    private String mobile;

    // 客户邮箱
    @Column
    private String email;

    // 描述
    @Column
    private String description;

    // 付款地址
    @Column
    private String payAddress;

    // 收货地址
    @Column
    private String receiveAddress;

    // 区域
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private RegionModel region;

    // 省份
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private ProvinceModel province;

    // 城市
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CityModel city;

    // 负责人
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private UserModel owner;

    // 状态
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private UserStatus status;

    // 联系人
    @OneToMany(mappedBy = "customer", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<ContactModel> contacts = Sets.newHashSet();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public ProvinceModel getProvince() {
        return province;
    }

    public void setProvince(ProvinceModel province) {
        this.province = province;
    }

    public CityModel getCity() {
        return city;
    }

    public void setCity(CityModel city) {
        this.city = city;
    }

    public UserStatus getStatus() {
        return status;
    }

    public void setStatus(UserStatus status) {
        this.status = status;
    }

    public Boolean getIsVIP() {
        return isVIP;
    }

    public void setIsVIP(Boolean isVIP) {
        this.isVIP = isVIP;
    }

    public RegionModel getRegion() {
        return region;
    }

    public void setRegion(RegionModel region) {
        this.region = region;
    }

    public UserModel getOwner() {
        return owner;
    }

    public void setOwner(UserModel owner) {
        this.owner = owner;
    }

    public Set<ContactModel> getContacts() {
        return contacts;
    }

    public void setContacts(Set<ContactModel> contacts) {
        this.contacts = contacts;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPayAddress() {
        return payAddress;
    }

    public void setPayAddress(String payAddress) {
        this.payAddress = payAddress;
    }

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress;
    }

    // @Override
    // public String toString() {
    // return ToStringBuilder.reflectionToString(this);
    // }
}
