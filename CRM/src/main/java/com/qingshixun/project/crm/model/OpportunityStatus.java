/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

// 销售机会状态
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.OpportunityStatus")
public class OpportunityStatus extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 有意向
    public static final OpportunityStatus interested = new OpportunityStatus("OPPOR_Interested ");

    // 价格比较
    public static final OpportunityStatus price = new OpportunityStatus("OPPOR_Price");

    // 签单
    public static final OpportunityStatus signed = new OpportunityStatus("OPPOR_Signed");

    // 丢单
    public static final OpportunityStatus lost = new OpportunityStatus("OPPOR_Lost");

    public OpportunityStatus() {
    }

    public OpportunityStatus(String code) {
        super.setCode(code);
    }
}
