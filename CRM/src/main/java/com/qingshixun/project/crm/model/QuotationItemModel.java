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
 * 报价单条目实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_quotation_item")
public class QuotationItemModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 报价单
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private QuotationModel quotation;

    // 产品
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private ProductModel product;

    // 数量
    @Column
    private Integer quantity;

    // 产品总价
    @Column
    private Double amount;

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public QuotationModel getQuotation() {
        return quotation;
    }

    public void setQuotation(QuotationModel quotation) {
        this.quotation = quotation;
    }

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}
