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
import com.qingshixun.project.crm.model.DepartmentModel;
import com.qingshixun.project.crm.module.department.service.DepartmentService;

/**
 * 部门测试用例 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@ContextConfiguration(locations = { "/applicationContext4Test.xml" })
public class DepartmentServiceTest extends BaseTransactionalJUnit4SpringContextTests {

    // 注入部门service
    @Autowired
    private DepartmentService departmentService;

    /**
     * 查询所有部门的测试用例
     */
    @Test
    public void testGetAllDepartments() throws Exception {
        List<DepartmentModel> departments = departmentService.getAllDepartments();
        assertThat(departments).hasSize(4);
    }

    /**
     * 添加、修改、删除部门的测试用例
     */
    @Test
    public void testEditDepartment() throws Exception {
        // 添加部门测试用例
        DepartmentModel department = new DepartmentModel();
        department.setName("测试部门");
        departmentService.saveDepartment(department);
        // 断言添加部门后部门总数
        List<DepartmentModel> departments = departmentService.getAllDepartments();
        assertThat(departments).hasSize(5);

        // 修改部门测试用例
        department.setName("测试部门修改");
        departmentService.saveDepartment(department);
        assertThat(department.getName()).isEqualTo("测试部门修改");

        // 删除部门测试用例
        departmentService.deleteDepartment(department.getId());
        // 断言删除部门后部门总数
        List<DepartmentModel> departments1 = departmentService.getAllDepartments();
        assertThat(departments1).hasSize(4);
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
