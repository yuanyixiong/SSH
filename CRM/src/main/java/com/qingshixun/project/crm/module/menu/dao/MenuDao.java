/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.menu.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.model.MenuModel;

/**
 * 菜单处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class MenuDao extends BaseHibernateDao<MenuModel, Long> {

    /**
     * 查询所有菜单列表
     * 
     * @param
     * @return
     */
    public List<MenuModel> getMenuList() {
        // 初始查询条件是父级id是null
        Criterion parentId = createCriterion("parent.id", null);

        // 初始查询条件是根据indexNo升序
        Criteria criteria = createCriteria(parentId).addOrder(Order.asc("indexNo"));
        return findList(criteria);
    }

    /**
     * 查询菜单信息
     * 
     * @param menuId 菜单id
     * @return
     */
    public MenuModel getMenu(Long menuId) {
        // 创建根据id查询条件
        Criterion id = createCriterion("id", menuId);
        return findUnique(id);
    }
}
