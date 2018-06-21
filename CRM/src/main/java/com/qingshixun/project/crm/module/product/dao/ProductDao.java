/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.product.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ProductModel;

/**
 * 产品处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class ProductDao extends BaseHibernateDao<ProductModel, Long> {
    /**
     * 查询所有产品信息
     * 
     * @param
     * @return
     */
    public PageContainer getProductPage(Map<String, String> params) {
        // 创建根据产品分类查询条件
        Criterion productName = createLikeCriterion("name", "%" + params.get("name") + "%");
        // 查询，并返回查询到的产品结果信息
        return getDataPage(params, productName);
    }

    /**
     * 根据产品分类，查询所有产品信息
     * 
     * @param contactCategoryId
     * @return
     */
    public List<ProductModel> getContacts(Long contactCategoryId) {
        // 创建根据产品分类查询条件
        Criterion category = createCriterion("category.id", contactCategoryId);

        // 查询，并返回查询到的产品结果信息
        return find(category);
    }

    /**
     * 查询所有订单可以选择产品信息
     * 
     * @param
     * @return
     */
    public PageContainer getSelectProductPage(Map<String, String> params, List<Long> list) {
        // 创建查询条件(产品状态是在售)
        Criterion productName = createCriterion("status.code", "PROS_Sale");
        Criterion gtValue = createGtCriterion("inventory", 0);
        Criterion notInIds = createNotInCriterion("id", list);
        // 查询，并返回查询到的产品结果信息
        return getDataPage(params, productName, notInIds, gtValue);
    }

    /**
     * 查询所有订单选择的产品信息
     * 
     * @param
     * @return
     */
    public List<ProductModel> getSelectedProducts(Long[] productIds) {
        Criterion ids = createInCriterion("id", productIds);
        return find(ids);
    }

    /**
     * 查询所有常见问答可以选择产品信息
     * 
     * @param
     * @return
     */
    public PageContainer getProblemProductPage(Map<String, String> params) {
        // 创建查询条件(产品状态是在售)
        Criterion productName = createCriterion("status.code", "PROS_Sale");
        // 查询，并返回查询到的产品结果信息
        return getDataPage(params, productName);
    }

    /**
     * 根据名称搜索产品
     * 
     * @param
     * @return
     */
    public List<ProductModel> getProductList(String value) {
        // 创建根据产品名称查询条件
        Criterion productName = createLikeCriterion("name", "%" + value + "%");
        // 查询，并返回查询到的产品结果信息
        return find(productName);
    }
}
