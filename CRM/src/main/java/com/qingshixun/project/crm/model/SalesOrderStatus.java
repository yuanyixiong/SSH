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
 * 销售订单状态
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.SalesOrderStatus")
public class SalesOrderStatus extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 已提交
    public static final SalesOrderStatus commitStatus = new SalesOrderStatus("SALESORDER_Commit");

    // 已审阅
    public static final SalesOrderStatus reviewedtatus = new SalesOrderStatus("SALESORDER_Reviewed");

    // 已取消
    public static final SalesOrderStatus canceledStatus = new SalesOrderStatus("SALESORDER_Canceled");

    public SalesOrderStatus() {
    }

    public SalesOrderStatus(String code) {
        super.setCode(code);
    }
}
