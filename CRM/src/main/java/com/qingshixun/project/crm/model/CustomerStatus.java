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
 * 潜在客户状态
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.CustomerStatus")
public class CustomerStatus extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 正常合作客户
    public static final CustomerStatus activeStatus = new CustomerStatus("CUSS_Active");

    // 可以发展的潜在客户
    public static final CustomerStatus potentialStatus = new CustomerStatus("CUSS_Potential");

    // 无效客户
    public static final CustomerStatus invalidStatus = new CustomerStatus("CUSS_Invalid");

    public CustomerStatus() {
    }

    public CustomerStatus(String code) {
        super.setCode(code);
    }
}
