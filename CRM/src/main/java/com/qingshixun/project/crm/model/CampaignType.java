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
 * 营销活动类型
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.CampaignType")
public class CampaignType extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 销售中
    public static final CampaignType saleStatus = new CampaignType("PROS_Sale");

    // 停止销售
    public static final CampaignType stopStatus = new CampaignType("PROS_Stop");

    public CampaignType() {
    }

    public CampaignType(String code) {
        super.setCode(code);
    }
}
