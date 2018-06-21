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
import com.qingshixun.project.crm.model.CustomerModel;
import com.qingshixun.project.crm.model.UserStatus;
import com.qingshixun.project.crm.module.customer.service.CustomerService;

/**
 * 客户测试用例 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@ContextConfiguration(locations = { "/applicationContext4Test.xml" })
public class CustomerServiceTest extends BaseTransactionalJUnit4SpringContextTests {

    /**
     * 注入客户service
     */
    @Autowired
    private CustomerService customerService;

    /**
     * 查询所有客户的测试用例
     */
    @Test
    public void testGetAllCustomers() throws Exception {
        List<CustomerModel> customers = customerService.getAllCustomers();
        assertThat(customers).hasSize(13);
    }

    /**
     * 添加、修改、删除客户的测试用例
     */
    @Test
    public void testEditCustomer() throws Exception {
        // 添加客户测试用例
        CustomerModel customer = new CustomerModel();
        customer.setName("测试客户");
        customer.setIsVIP(false);
        customer.setAddress("测试地址");
        customer.setCompany("测试公司");
        customer.setStatus(UserStatus.disabledStatus);
        // 保存客户
        customerService.saveCustomer(customer);
        // 断言添加客户后客户总数
        List<CustomerModel> customers = customerService.getAllCustomers();
        assertThat(customers).hasSize(14);

        // 修改客户测试用例
        customer.setName("辛田在修改");
        customerService.saveCustomer(customer);
        assertThat(customer.getName()).isEqualTo("辛田在修改");

        // 删除客户测试用例
        customerService.deleteCustomer(customer.getId());
        // 断言删除客户后客户总数
        List<CustomerModel> customers1 = customerService.getAllCustomers();
        assertThat(customers1).hasSize(13);
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
