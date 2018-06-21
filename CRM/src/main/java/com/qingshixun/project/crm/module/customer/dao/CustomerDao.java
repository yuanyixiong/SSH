/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.customer.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.CustomerModel;

/**
 * 客户处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class CustomerDao extends BaseHibernateDao<CustomerModel, Long> {

    /**
     * 查询所有客户分页信息
     * 
     * @param
     * @return
     */
    public PageContainer getCustomerPage(Map<String, String> params) {
        // 创建根据客户名称查询条件
        Criterion customerName = createLikeCriterion("name", "%" + params.get("name") + "%");
        // 查询，并返回查询到的客户结果信息
        return getDataPage(params, customerName);
    }

    /**
     * 获取所有订单可以选择的客户信息列表(订单模块)
     * 
     * @param
     * @return
     */
    public PageContainer getSelectCustomerPage(Map<String, String> params) {
        // 创建根据客户分类查询条件
        Criterion status = createCriterion("status.code", "USRS_Active");
        // 查询，并返回查询到的客户结果信息
        return getDataPage(params, status);
    }

    /**
     * 根据名称搜索客户
     * 
     * @param
     * @return
     */
    public List<CustomerModel> getCustomerList(String value) {
        // 创建根据客户名称查询条件
        Criterion customerName = createLikeCriterion("name", "%" + value + "%");
        // 查询，并返回查询到的客户结果信息
        return find(customerName);
    }
}
