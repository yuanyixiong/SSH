/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.contact.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ContactModel;

/**
 * 联系人处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class ContactDao extends BaseHibernateDao<ContactModel, Long> {
    /**
     * 根据联系人分页信息
     * 
     * @param
     * @return
     */
    public PageContainer getContactPage(Map<String, String> params) {
        // 创建根据联系人名称查询条件
        Criterion name = createLikeCriterion("name", "%" + params.get("name") + "%");

        // 创建根据所属客户Id查询条件
        Criterion customerId = createCriterion("customer.id", Long.parseLong(params.get("customerId").toString()));
        // 查询，并返回查询到的联系人结果信息
        return getDataPage(params, name, customerId);
    }

    /**
     * 根据所有供选择的联系人分页信息
     * 
     * @param
     * @return
     */
    public PageContainer getSelectContactPage(Map<String, String> params) {
        // 查询，并返回查询到的联系人结果信息
        return getDataPage(params);
    }

    /**
     * 根据名称搜索联系人
     * 
     * @param
     * @return
     */
    public List<ContactModel> getContactList(String value) {
        // 创建根据联系人名称查询条件
        Criterion contactName = createLikeCriterion("name", "%" + value + "%");
        // 查询，并返回查询到的联系人结果信息
        return find(contactName);
    }
}
