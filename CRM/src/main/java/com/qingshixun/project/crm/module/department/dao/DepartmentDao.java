/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.department.dao;

import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.DepartmentModel;

/**
 * 部门处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
public class DepartmentDao extends BaseHibernateDao<DepartmentModel, Long> {

    /**
     * 获取部门分页信息
     * 
     * @return
     */
    public PageContainer getDepartmentPage(Map<String, String> params) {
        // 创建根据部门名称模糊查询条件
        Criterion name = createLikeCriterion("name", "%" + params.get("name") + "%");
        return getDataPage(params, name);
    }
}
