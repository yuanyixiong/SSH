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
import com.qingshixun.project.crm.model.ProductModel;
import com.qingshixun.project.crm.module.product.service.ProductService;

/**
 * 产品测试用例 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@ContextConfiguration(locations = { "/applicationContext4Test.xml" })
public class ProductServiceTest extends BaseTransactionalJUnit4SpringContextTests {

    // 注入产品service
    @Autowired
    private ProductService productService;

    /**
     * 查询所有产品的测试用例
     */
    @Test
    public void testGetAllProducts() throws Exception {
        List<ProductModel> products = productService.getAllProducts();
        assertThat(products).hasSize(7);
    }

    /**
     * 添加、修改、删除产品的测试用例
     */
    @Test
    public void testEditProduct() throws Exception {
        // 添加产品测试用例
        ProductModel product = new ProductModel();
        product.setName("测试产品");
        product.setDescription("测试产品");
        productService.saveProduct(product);
        // 断言添加产品后产品总数
        List<ProductModel> products = productService.getAllProducts();
        assertThat(products).hasSize(8);

        // 修改产品测试用例
        product.setName("测试产品修改");
        productService.saveProduct(product);
        assertThat(product.getName()).isEqualTo("测试产品修改");

        // 删除产品测试用例
        productService.deleteProduct(product.getId());
        // 断言删除产品后产品总数
        List<ProductModel> products1 = productService.getAllProducts();
        assertThat(products1).hasSize(7);
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
