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
 * 营销活动实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_campaign")
public class CampaignModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 营销活动编码
    @Column
    private String code;

    // 名称
    @Column
    private String name;

    // 负责人
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private UserModel user;

    // 营销活动状态
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CampaignStatus status;

    // 营销活动类型
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CampaignType type;

    // 产品
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private ProductModel product;

    // 结束日期
    @Column
    private String endDate;

    // 发送数量
    @Column
    private String quantity;

    // 说明
    @Column
    private String instruction;

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

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

    public CampaignStatus getStatus() {
        return status;
    }

    public void setStatus(CampaignStatus status) {
        this.status = status;
    }

    public CampaignType getType() {
        return type;
    }

    public void setType(CampaignType type) {
        this.type = type;
    }

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
