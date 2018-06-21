/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.category.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.CategoryModel;

/**
 * 产品类别处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class CategoryDao extends BaseHibernateDao<CategoryModel, Long> {

    /**
     * 查询所有产品类别信息
     * 
     * @param contactCategoryId
     * @return
     */
    public List<CategoryModel> getAllCategorys() {
        // 查询，并返回查询到的产品类别结果信息
        return find();
    }

    /**
     * 查询所有产品类别信息
     * 
     * @param contactCategoryId
     * @return
     */
    public PageContainer getCategorys(Map<String, String> params) {
        // 创建根据产品类别名称模糊查询条件
        Criterion name = createLikeCriterion("name", "%" + params.get("name") + "%");
        // 查询，并返回查询到的分类结果信息
        return getDataPage(params, name);
    }
}
