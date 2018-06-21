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
 * 营销活动状态
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.CampaignStatus")
public class CampaignStatus extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 销售中
    public static final CampaignStatus saleStatus = new CampaignStatus("Plan");

    // 停止销售
    public static final CampaignStatus stopStatus = new CampaignStatus("Active");

    public CampaignStatus() {
    }

    public CampaignStatus(String code) {
        super.setCode(code);
    }
}
