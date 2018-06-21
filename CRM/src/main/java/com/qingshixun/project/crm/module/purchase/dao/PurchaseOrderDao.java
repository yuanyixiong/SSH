/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.purchase.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.PurchaseOrderModel;

/**
 * 采购订单处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class PurchaseOrderDao extends BaseHibernateDao<PurchaseOrderModel, Long> {
    /**
     * 查询所有采购订单信息
     * 
     * @param
     * @return
     */
    public PageContainer getPurchaseOrderPage(Map<String, String> params) {
        // 创建根据采购订单主题查询条件
        Criterion theme = createLikeCriterion("theme", "%" + params.get("theme") + "%");
        // 查询，并返回查询到的采购订单结果信息
        return getDataPage(params, theme);
    }

    /**
     * 根据名称搜索采购订单
     * 
     * @param
     * @return
     */
    public List<PurchaseOrderModel> getPurchaseOrderList(String value) {
        // 创建根据采购订单主题查询条件
        Criterion purchaseOrderName = createLikeCriterion("theme", "%" + value + "%");
        // 查询，并返回查询到的采购订单结果信息
        return find(purchaseOrderName);
    }
}
