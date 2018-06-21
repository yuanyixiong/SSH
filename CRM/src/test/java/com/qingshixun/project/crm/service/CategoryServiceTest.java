/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import com.qingshixun.project.crm.core.BaseTransactionalJUnit4SpringContextTests;
import com.qingshixun.project.crm.model.CategoryModel;
import com.qingshixun.project.crm.module.category.service.CategoryService;

/**
 * 产品类别测试用例 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@ContextConfiguration(locations = { "/applicationContext4Test.xml" })
public class CategoryServiceTest extends BaseTransactionalJUnit4SpringContextTests {

    // 注入产品类别service
    @Autowired
    private CategoryService categoryService;

    /**
     * 查询所有产品类别的测试用例
     */
    @Test
    public void testGetAllCategorys() throws Exception {
        List<CategoryModel> categorys = categoryService.getAllCategoryList();
        assertThat(categorys).hasSize(4);
    }

    /**
     * 添加、修改、删除产品类别的测试用例
     */
    @Test
    public void testEditCategory() throws Exception {
        // 添加产品类别测试用例
        CategoryModel category = new CategoryModel();
        category.setName("测试产品类别");
        categoryService.saveCategory(category);
        // 断言添加产品类别后产品类别总数
        List<CategoryModel> categorys = categoryService.getAllCategoryList();
        assertThat(categorys).hasSize(5);

        // 修改产品类别测试用例
        category.setName("测试产品类别修改");
        categoryService.saveCategory(category);
        assertThat(category.getName()).isEqualTo("测试产品类别修改");

        // 删除产品类别测试用例
        categoryService.deleteCategory(category.getId());
        // 断言删除产品类别后产品类别总数
        List<CategoryModel> categorys1 = categoryService.getAllCategoryList();
        assertThat(categorys1).hasSize(4);
    }

    @Before
    public void setUp() throws Exception {
        logger.debug("Before Test...");
    }

    @After
    public void tearDown() throws Exception {
        logger.debug("After Test...");
    }
}
