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
 * 报价单实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_quotation")
public class QuotationModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 报价单编码
    @Column
    private String code;

    // 标题
    @Column
    private String title;

    // 销售机会
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private OpportunityModel opportunity;

    // 联系人
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private ContactModel contact;

    // 客户
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CustomerModel customer;

    // 负责人
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private UserModel user;

    // 发票地址
    @Column
    private String invoiceAddress;

    // 收货地址
    @Column
    private String receiverAddress;

    // 报价单状态
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private QuotationStatus status;

    // 承运单位
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private Freight freight;

    // 说明
    @Column
    private String description;

    // 产品总价
    @Column(length = 100, nullable = false)
    private Double totalAmount;

    // 产品总数
    @Column(length = 100, nullable = false)
    private Integer totalQuantity;

    // 采购订单条目
    @OneToMany(mappedBy = "quotation", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<QuotationItemModel> quotationItems = Sets.newHashSet();

    public Set<QuotationItemModel> getQuotationItems() {
        return quotationItems;
    }

    public void setQuotationItems(Set<QuotationItemModel> quotationItems) {
        this.quotationItems = quotationItems;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public ContactModel getContact() {
        return contact;
    }

    public void setContact(ContactModel contact) {
        this.contact = contact;
    }

    public CustomerModel getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerModel customer) {
        this.customer = customer;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

    public String getInvoiceAddress() {
        return invoiceAddress;
    }

    public void setInvoiceAddress(String invoiceAddress) {
        this.invoiceAddress = invoiceAddress;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public QuotationStatus getStatus() {
        return status;
    }

    public void setStatus(QuotationStatus status) {
        this.status = status;
    }

    public Freight getFreight() {
        return freight;
    }

    public void setFreight(Freight freight) {
        this.freight = freight;
    }

    public OpportunityModel getOpportunity() {
        return opportunity;
    }

    public void setOpportunity(OpportunityModel opportunity) {
        this.opportunity = opportunity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}
