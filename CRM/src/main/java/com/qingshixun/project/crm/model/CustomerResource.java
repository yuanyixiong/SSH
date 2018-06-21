/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * 客户来源
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.CustomerResource")
public class CustomerResource extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 电话营销
    public static final CustomerResource telemarketing = new CustomerResource("CUSTOMER_Telemarketing");

    // 既有客户
    public static final CustomerResource existing = new CustomerResource("CUSTOMER_Existing");

    // 邮箱营销
    public static final CustomerResource emaimarketing = new CustomerResource("CUSTOMER_Emaimarketing");

    // 其他
    public static final CustomerResource other = new CustomerResource("CUSTOMER_Other");

    public CustomerResource() {}

    public CustomerResource(String code) {
        super.setCode(code);
    }
}
