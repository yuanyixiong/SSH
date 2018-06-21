/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.user.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.UserModel;

/**
 * 用户处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class UserDao extends BaseHibernateDao<UserModel, Long> {

    /**
     * 用户分页查询
     * 
     * @param
     * @return
     */
    public PageContainer getUserPage(Map<String, String> params) {
        // 创建根据用户名称和电话查询条件
        Criterion userName = createLikeCriterion("name", "%" + params.get("name") + "%");
        Criterion phone = createLikeCriterion("phone", "%" + params.get("phone") + "%");
        // 查询，并返回查询到的用户结果信息
        return getDataPage(params, userName, phone);
    }

    /**
     * 根据条件查询用户信息
     * 
     * @param loginName 登录名称
     * @return
     */
    public UserModel getUser(String loginName) {
        Criterion emailValue = createCriterion("loginName", loginName);
        return findUnique(emailValue);
    }

    /**
     * 根据条件查询用户信息
     * 
     * @param loginName 登录名称
     * @return
     */
    public List<UserModel> getActiveUsers() {
        Criterion emailValue = createCriterion("status.code", "USRS_Active");
        return find(emailValue);
    }
}
