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
 * 采购订单状态
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.PurchaseOrderStatus")
public class PurchaseOrderStatus extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 已创建
    public static final PurchaseOrderStatus builtStatus = new PurchaseOrderStatus("PURCHASE_Built");

    // 已审核
    public static final PurchaseOrderStatus reviewedStatus = new PurchaseOrderStatus("PURCHASE_Reviewed");

    // 已递送
    public static final PurchaseOrderStatus deliveredStatus = new PurchaseOrderStatus("PURCHASE_Delivered");

    // 已取消
    public static final PurchaseOrderStatus canceledStatus = new PurchaseOrderStatus("PURCHASE_Canceled");

    // 收到发货
    public static final PurchaseOrderStatus receivedStatus = new PurchaseOrderStatus("PURCHASE_Received");

    public PurchaseOrderStatus() {
    }

    public PurchaseOrderStatus(String code) {
        super.setCode(code);
    }
}
