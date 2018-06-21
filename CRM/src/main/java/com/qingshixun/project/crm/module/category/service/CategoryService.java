/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.category.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.CategoryModel;
import com.qingshixun.project.crm.module.category.dao.CategoryDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 产品类别处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class CategoryService extends BaseService {

    // 产品类别处理Dao
    @Autowired
    private CategoryDao categoryDao;

    /**
     * 获取所有产品类别信息
     * 
     * @return
     */
    public List<CategoryModel> getAllCategoryList() {
        return categoryDao.getAllCategorys();
    }

    /**
     * 获取所有产品类别信息分页信息
     * 
     * @return
     */
    public PageContainer getCategoryPage(Map<String, String> params) {
        return categoryDao.getCategorys(params);
    }

    /**
     * 根据id获取产品类别信息
     * 
     * @return
     */
    public CategoryModel getCategory(Long categoryId) {
        return categoryDao.get(categoryId);
    }

    /**
     * 保存产品类别信息
     * 
     * @return
     */
    public void saveCategory(CategoryModel category) {
        //设置最后更新时间
        category.setUpdateTime(DateUtils.timeToString(new Date()));
        categoryDao.save(category);
    }

    /**
     * 删除产品类别信息
     * 
     * @return
     */
    public void deleteCategory(Long categoryId) {
        categoryDao.delete(categoryId);
    }
}
