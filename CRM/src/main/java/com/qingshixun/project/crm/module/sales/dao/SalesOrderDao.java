/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.sales.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.SalesOrderModel;

/**
 * 销售订单处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class SalesOrderDao extends BaseHibernateDao<SalesOrderModel, Long> {
    /**
     * 查询所有销售订单信息
     * 
     * @param
     * @return
     */
    public PageContainer getSalesOrderPage(Map<String, String> params) {
        // 创建根据销售订单主题查询条件
        Criterion salesOrderName = createLikeCriterion("theme", "%" + params.get("theme") + "%");
        // 查询，并返回查询到的销售订单结果信息
        return getDataPage(params, salesOrderName);
    }

    /**
     * 根据主题搜索销售订单
     * 
     * @param
     * @return
     */
    public List<SalesOrderModel> getSalesOrderList(String value) {
        // 创建根据销售订单主题查询条件
        Criterion salesOrderName = createLikeCriterion("theme", "%" + value + "%");
        // 查询，并返回查询到的销售订单结果信息
        return find(salesOrderName);
    }
}
