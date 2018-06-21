/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.problem.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ProblemModel;

/**
 * 常见问答处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class ProblemDao extends BaseHibernateDao<ProblemModel, Long> {
    /**
     * 查询所有常见问答信息
     * 
     * @param
     * @return
     */
    public PageContainer getProblemPage(Map<String, String> params) {
        // 创建根据常见问答查询条件
        Criterion problemName = createLikeCriterion("problem", "%" + params.get("problem") + "%");
        // 查询，并返回查询到的常见问答结果信息
        return getDataPage(params, problemName);
    }

    /**
     * 根据问题搜索常见问答
     * 
     * @param
     * @return
     */
    public List<ProblemModel> getProblemList(String value) {
        // 创建根据常见问答问题查询条件
        Criterion problemName = createLikeCriterion("problem", "%" + value + "%");
        // 查询，并返回查询到的常见问答结果信息
        return find(problemName);
    }
}
