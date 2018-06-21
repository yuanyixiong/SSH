/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.model;

import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 销售机会实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_opportunity")
public class OpportunityModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 销售机会编码
    @Column
    private String code;

    // 名称
    @Column
    private String name;

    // 客户
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CustomerModel customer;

    // 合计
    @Column
    private BigDecimal total;

    // 可能性
    @Column
    private Integer probability;

    // 预定结束日期
    @Column
    private String endDate;

    // 描述
    @Column(columnDefinition = "TEXT", nullable = false)
    private String description;

    // 销售阶段
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private OpportunityStatus status;

    // 潜在客户来源
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CustomerResource resource;

    // 来自营销活动
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CampaignModel campaign;

    // 潜在客户来源
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private UserModel user;

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

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

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public CustomerModel getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerModel customer) {
        this.customer = customer;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Integer getProbability() {
        return probability;
    }

    public void setProbability(Integer probability) {
        this.probability = probability;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public OpportunityStatus getStatus() {
        return status;
    }

    public void setStatus(OpportunityStatus status) {
        this.status = status;
    }

    public CustomerResource getResource() {
        return resource;
    }

    public void setResource(CustomerResource resource) {
        this.resource = resource;
    }

    public CampaignModel getCampaign() {
        return campaign;
    }

    public void setCampaign(CampaignModel campaign) {
        this.campaign = campaign;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
