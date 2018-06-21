/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.issue.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.IssueModel;

/**
 * 问题单处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class IssueDao extends BaseHibernateDao<IssueModel, Long> {
    /**
     * 查询所有问题单信息
     * 
     * @param
     * @return
     */
    public PageContainer getIssuePage(Map<String, String> params) {
        // 创建根据问题单标题查询条件
        Criterion issueName = createLikeCriterion("title", "%" + params.get("title") + "%");
        // 查询，并返回查询到的问题单结果信息
        return getDataPage(params, issueName);
    }

    /**
     * 根据标题搜索问题单
     * 
     * @param
     * @return
     */
    public List<IssueModel> getIssueList(String value) {
        // 创建根据问题单标题查询条件
        Criterion issueName = createLikeCriterion("title", "%" + value + "%");
        // 查询，并返回查询到的问题单结果信息
        return find(issueName);
    }

}
