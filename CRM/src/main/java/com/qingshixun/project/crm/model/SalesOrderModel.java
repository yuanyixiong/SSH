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

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Sets;

/**
 * 销售订单实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_sales_order")
public class SalesOrderModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 销售订单编码
    @Column
    private String code;

    // 主题
    @Column
    private String theme;

    // 销售机会
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private OpportunityModel opportunity;

    // 报价单
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private QuotationModel quotation;

    // 承运单位
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private Freight freight;

    // 客户
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CustomerModel customer;

    // 联系人
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private ContactModel contact;

    // 负责人
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private UserModel user;

    // 付款地址
    @Column
    private String payAddress;

    // 送货地址
    @Column
    private String receiveAddress;

    // 说明
    @Column(columnDefinition = "TEXT", nullable = false)
    private String instruction;

    // 产品总价
    @Column(length = 100, nullable = false)
    private Double totalAmount;

    // 产品总数
    @Column(length = 100, nullable = false)
    private Integer totalQuantity;

    // 负责人
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private SalesOrderStatus status;

    // 销售订单条目
    @OneToMany(mappedBy = "salesOrder", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<SalesOrderItemModel> salesOrderItems = Sets.newHashSet();

    public String getCode() {
        return code;
    }

    public Set<SalesOrderItemModel> getSalesOrderItems() {
        return salesOrderItems;
    }

    public void setSalesOrderItems(Set<SalesOrderItemModel> salesOrderItems) {
        this.salesOrderItems = salesOrderItems;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public Freight getFreight() {
        return freight;
    }

    public void setFreight(Freight freight) {
        this.freight = freight;
    }

    public CustomerModel getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerModel customer) {
        this.customer = customer;
    }

    public ContactModel getContact() {
        return contact;
    }

    public void setContact(ContactModel contact) {
        this.contact = contact;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

    public String getPayAddress() {
        return payAddress;
    }

    public void setPayAddress(String payAddress) {
        this.payAddress = payAddress;
    }

    public OpportunityModel getOpportunity() {
        return opportunity;
    }

    public void setOpportunity(OpportunityModel opportunity) {
        this.opportunity = opportunity;
    }

    public QuotationModel getQuotation() {
        return quotation;
    }

    public void setQuotation(QuotationModel quotation) {
        this.quotation = quotation;
    }

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Integer getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(Integer totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public SalesOrderStatus getStatus() {
        return status;
    }

    public void setStatus(SalesOrderStatus status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
