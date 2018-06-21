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
 * 采购订单实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_purchase_order")
public class PurchaseOrderModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 采购订单编码
    @Column
    private String code;

    // 主题
    @Column
    private String theme;

    // 供应商
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private SupplierModel supplier;

    // 承运单位
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private Freight freight;

    // 联系人姓名
    @Column
    private String contactName;

    // 联系人电话
    @Column
    private String contactPhone;

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

    // 状态
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private PurchaseOrderStatus status;

    // 产品总价
    @Column(length = 100, nullable = false)
    private Double totalAmount;

    // 产品总数
    @Column(length = 100, nullable = false)
    private Integer totalQuantity;

    // 采购订单条目
    @OneToMany(mappedBy = "purchaseOrder", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<PurchaseOrderItemModel> purchaseOrderItems = Sets.newHashSet();

    public String getCode() {
        return code;
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

    public SupplierModel getSupplier() {
        return supplier;
    }

    public void setSupplier(SupplierModel supplier) {
        this.supplier = supplier;
    }

    public Set<PurchaseOrderItemModel> getPurchaseOrderItems() {
        return purchaseOrderItems;
    }

    public void setPurchaseOrderItems(Set<PurchaseOrderItemModel> purchaseOrderItems) {
        this.purchaseOrderItems = purchaseOrderItems;
    }

    public Freight getFreight() {
        return freight;
    }

    public void setFreight(Freight freight) {
        this.freight = freight;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
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

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public PurchaseOrderStatus getStatus() {
        return status;
    }

    public void setStatus(PurchaseOrderStatus status) {
        this.status = status;
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
