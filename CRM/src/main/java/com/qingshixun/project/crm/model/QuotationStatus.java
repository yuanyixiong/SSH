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
 * 报价单状态
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.QuotationStatus")
public class QuotationStatus extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 已建立
    public static final QuotationStatus builtStatus = new QuotationStatus("QUOTATION_Built");

    // 已审阅
    public static final QuotationStatus reviewedStatus = new QuotationStatus("QUOTATION_Reviewed");

    // 已接受
    public static final QuotationStatus acceptedStatus = new QuotationStatus("QUOTATION_Accepted");

    // 被拒绝
    public static final QuotationStatus deniedStatus = new QuotationStatus("QUOTATION_Denied");

    public QuotationStatus() {
    }

    public QuotationStatus(String code) {
        super.setCode(code);
    }
}
