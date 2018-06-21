/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.quotation.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.QuotationModel;

/**
 * 报价单处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class QuotationDao extends BaseHibernateDao<QuotationModel, Long> {

    /**
     * 查询所有报价单信息
     * 
     * @param
     * @return
     */
    public PageContainer getQuotationPage(Map<String, String> params) {
        // 创建根据报价单分类查询条件
        Criterion quotationName = createLikeCriterion("title", "%" + params.get("title") + "%");
        // 查询，并返回查询到的报价单结果信息
        return getDataPage(params, quotationName);
    }

    /**
     * 查询所有报价单信息
     * 
     * @param
     * @return
     */
    public PageContainer getSelectQuotationPage(Map<String, String> params) {
        // 查询，并返回查询到的报价单结果信息
        return getDataPage(params);
    }

    /**
     * 根据名称搜索报价单
     * 
     * @param
     * @return
     */
    public List<QuotationModel> getQuotationList(String value) {
        // 创建根据报价单名称查询条件
        Criterion quotationName = createLikeCriterion("title", "%" + value + "%");
        // 查询，并返回查询到的报价单结果信息
        return find(quotationName);
    }

}
