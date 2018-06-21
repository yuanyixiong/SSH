/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.campaign.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.CampaignModel;

/**
 * 营销活动处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class CampaignDao extends BaseHibernateDao<CampaignModel, Long> {
    /**
     * 查询所有营销活动信息
     * 
     * @param
     * @return
     */
    public PageContainer getCampaignPage(Map<String, String> params) {
        // 创建根据营销活动名称查询条件
        Criterion campaignName = createLikeCriterion("name", "%" + params.get("name") + "%");
        // 查询，并返回查询到的营销活动结果信息
        return getDataPage(params, campaignName);
    }

    /**
     * 查询所有可供选择的营销活动信息
     * 
     * @param
     * @return
     */
    public PageContainer getSelectCampaignPage(Map<String, String> params) {
        // 查询，并返回查询到的营销活动结果信息
        return getDataPage(params);
    }

    /**
     * 根据名称搜索营销活动
     * 
     * @param
     * @return
     */
    public List<CampaignModel> getCampaignList(String value) {
        // 创建根据营销活动名称查询条件
        Criterion campaignName = createLikeCriterion("name", "%" + value + "%");
        // 查询，并返回查询到的营销活动结果信息
        return find(campaignName);
    }

}
