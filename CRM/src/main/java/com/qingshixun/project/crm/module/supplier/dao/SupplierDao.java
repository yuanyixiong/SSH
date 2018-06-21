/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.supplier.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.SupplierModel;

/**
 * 供应商处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class SupplierDao extends BaseHibernateDao<SupplierModel, Long> {
    /**
     * 查询所有供应商信息
     * 
     * @param
     * @return
     */
    public PageContainer getSupplierPage(Map<String, String> params) {
        // 创建根据供应商分类查询条件
        Criterion supplierName = createLikeCriterion("name", "%" + params.get("name") + "%");
        // 查询，并返回查询到的供应商结果信息
        return getDataPage(params, supplierName);
    }

    /**
     * 获取供选择的供应商信息
     * 
     * @param
     * @return
     */
    public PageContainer getSelectSupplierPage(Map<String, String> params) {
        // 查询，并返回查询到的供应商结果信息
        return getDataPage(params);
    }

    /**
     * 根据名称搜索供应商
     * 
     * @param
     * @return
     */
    public List<SupplierModel> getSupplierList(String value) {
        // 创建根据供应商名称查询条件
        Criterion supplierName = createLikeCriterion("name", "%" + value + "%");
        // 查询，并返回查询到的供应商结果信息
        return find(supplierName);
    }

}
