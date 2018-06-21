/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.opportunity.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.OpportunityModel;

/**
 * 销售机会处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class OpportunityDao extends BaseHibernateDao<OpportunityModel, Long> {
    /**
     * 查询所有销售机会信息
     * 
     * @param
     * @return
     */
    public PageContainer getOpportunityPage(Map<String, String> params) {
        // 创建根据销售机会分类查询条件
        Criterion opportunityName = createLikeCriterion("name", "%" + params.get("name") + "%");
        // 查询，并返回查询到的销售机会结果信息
        return getDataPage(params, opportunityName);
    }

    /**
     * 查询所有可供选择的销售机会信息
     * 
     * @param
     * @return
     */
    public PageContainer getSelectOpportunityPage(Map<String, String> params) {
        // 查询，并返回查询到的销售机会结果信息
        return getDataPage(params);
    }

    /**
     * 根据名称搜索销售机会
     * 
     * @param
     * @return
     */
    public List<OpportunityModel> getOpportunityList(String value) {
        // 创建根据销售机会名称查询条件
        Criterion opportunityName = createLikeCriterion("name", "%" + value + "%");
        // 查询，并返回查询到的销售机会结果信息
        return find(opportunityName);
    }

}
