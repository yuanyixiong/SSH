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
 * 销售订单条目实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_sales_order_item")
public class SalesOrderItemModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 数量
    @Column
    private Integer quantity;

    // 销售订单
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private SalesOrderModel salesOrder;

    // 产品
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private ProductModel product;

    // 产品总价
    @Column
    private Double amount;

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public SalesOrderModel getSalesOrder() {
        return salesOrder;
    }

    public void setSalesOrder(SalesOrderModel salesOrder) {
        this.salesOrder = salesOrder;
    }

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
