/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotBlank;

/**
 * 产品分类实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_product_category")
public class CategoryModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    // 产品分类名称（长度：100，不允许为空）
    @Column(length = 100, nullable = false)
    @NotBlank
    private String name;

    // 描述
    @Column
    private String description;

    // 基于 JSR303 BeanValidator 的校验规则
    @NotBlank(message = "产品分类名称不允许为空！")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
