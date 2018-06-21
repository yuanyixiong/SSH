/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.role.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.RoleModel;

/**
 * 角色处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class RoleDao extends BaseHibernateDao<RoleModel, Long> {

    /**
     * 查询所有角色分页信息
     * 
     * @return
     */
    public PageContainer getRolePage(Map<String, String> params) {
        Criterion name = createLikeCriterion("name", "%" + params.get("name") + "%");
        return getDataPage(params, name);
    }

    /**
     * 查询所有角色列表信息
     * 
     * @return
     */
    public List<RoleModel> getRoleList() {
        // 查询，并返回查询到的角色结果信息
        return find();
    }
}
