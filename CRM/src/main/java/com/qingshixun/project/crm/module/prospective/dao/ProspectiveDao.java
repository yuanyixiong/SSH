/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.prospective.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ProspectiveModel;

/**
 * 潜在客户处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class ProspectiveDao extends BaseHibernateDao<ProspectiveModel, Long> {
    /**
     * 查询所有潜在客户信息
     * 
     * @param
     * @return
     */
    public PageContainer getProspectivePage(Map<String, String> params) {
        // 创建根据潜在客户分类查询条件
        Criterion prospectiveName = createLikeCriterion("name", "%" + params.get("name") + "%");
        // 查询，并返回查询到的潜在客户结果信息
        return getDataPage(params, prospectiveName);
    }

    /**
     * 根据名称搜索潜在客户
     * 
     * @param
     * @return
     */
    public List<ProspectiveModel> getProspectiveList(String value) {
        // 创建根据潜在客户名称查询条件
        Criterion prospectiveName = createLikeCriterion("name", "%" + value + "%");
        // 查询，并返回查询到的潜在客户结果信息
        return find(prospectiveName);
    }

    /**
     * 根据名称搜索潜在客户
     * 
     * @param
     * @return
     */
    public List<ProspectiveModel> getProspectiveListByResource(String resource) {
        // 创建根据潜在客户名称查询条件
        Criterion resourceName = createLikeCriterion("resource.code", "%" + resource + "%");
        // 查询，并返回查询到的潜在客户结果信息
        return find(resourceName);
    }

}
