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
 * 产品实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_product")
public class ProductModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 产品名称（长度：100，不允许为空）
    @Column(length = 100, nullable = false)
    @NotBlank
    private String name;

    // 编号
    @Column
    private String code;

    // 类别
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private CategoryModel category;

    // 描述
    @Column(columnDefinition = "TEXT", nullable = false)
    private String description;

    // 产品图片
    @Column
    private String picture;

    // 产品价格
    @Column
    private Double price;

    // 库存
    @Column
    private Integer inventory;

    // 状态
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private ProductStatus status;

    // 供应商
    @ManyToOne(cascade = { CascadeType.PERSIST })
    private SupplierModel supplier;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CategoryModel getCategory() {
        return category;
    }

    public void setCategory(CategoryModel category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public ProductStatus getStatus() {
        return status;
    }

    public void setStatus(ProductStatus status) {
        this.status = status;
    }

    public SupplierModel getSupplier() {
        return supplier;
    }

    public void setSupplier(SupplierModel supplier) {
        this.supplier = supplier;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
