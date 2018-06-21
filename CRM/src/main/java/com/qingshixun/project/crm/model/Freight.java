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
 * 承运单位
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.Freight")
public class Freight extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 顺丰物流
    public static final Freight sf = new Freight("FREIGHT_Sf");

    // 申通物流
    public static final Freight sto = new Freight("FREIGHT_Sto");

    // 邮政快递
    public static final Freight postal = new Freight("FREIGHT_Postal");

    public Freight() {
    }

    public Freight(String code) {
        super.setCode(code);
    }
}
