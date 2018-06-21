/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.purchase.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.PurchaseOrderItemModel;

/**
 * 采购订单条目处理 Dao 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Repository
public class PurchaseOrderItemDao extends BaseHibernateDao<PurchaseOrderItemModel, Long> {

    /**
     * 根据采购订单条目分类，查询所有采购订单条目信息
     * 
     * @param
     * @return
     */
    public PageContainer getPurchaseOrderItemPage(Map<String, String> params) {
        // 创建根据采购订单条目分类查询条件
        Criterion customerName = createLikeCriterion("name", "%" + params.get("name") + "%");
        // 查询，并返回查询到的采购订单条目结果信息
        return getDataPage(params, customerName);
    }

    /**
     * 根据采购订单条目分类，查询所有采购订单条目信息
     * 
     * @param quotationId 订单id
     * @return
     */
    public List<PurchaseOrderItemModel> getPurchaseOrderItemList(Long purchaseOrderId) {
        // 创建根据采购订单条目分类查询条件
        Criterion quotation = createCriterion("purchaseOrder.id", purchaseOrderId);
        // 查询，并返回查询到的采购订单条目结果信息
        return find(quotation);
    }

}
