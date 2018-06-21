/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.sales.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.SalesOrderItemModel;

/**
 * 销订单售条目处理 Dao 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Repository
public class SalesOrderItemDao extends BaseHibernateDao<SalesOrderItemModel, Long> {

    /**
     * 根据销订单售条目分类，查询所有销订单售条目信息
     * 
     * @param
     * @return
     */
    public PageContainer getSalesOrderItemPage(Map<String, String> params) {
        // 创建根据销订单售条目分类查询条件
        Criterion orderName = createLikeCriterion("name", "%" + params.get("name") + "%");
        // 查询，并返回查询到的销订单售条目结果信息
        return getDataPage(params, orderName);
    }

    /**
     * 根据销订单售条目分类，查询所有销订单售条目信息
     * 
     * @param quotationId 订单id
     * @return
     */
    public List<SalesOrderItemModel> getSalesOrderItemList(Long salesOrderItemId) {
        // 创建根据销订单售条目分类查询条件
        Criterion salesOrderItem = createCriterion("salesOrder.id", salesOrderItemId);
        // 查询，并返回查询到的销订单售条目结果信息
        return find(salesOrderItem);
    }

}
