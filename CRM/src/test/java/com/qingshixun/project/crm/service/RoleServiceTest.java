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
import com.qingshixun.project.crm.model.RoleModel;
import com.qingshixun.project.crm.module.role.service.RoleService;

/**
 * 测单测试用例 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@ContextConfiguration(locations = { "/applicationContext4Test.xml" })
public class RoleServiceTest extends BaseTransactionalJUnit4SpringContextTests {

    // 注入角色service
    @Autowired
    private RoleService roleService;

    /**
     * 查询所有角色的测试用例
     */
    @Test
    public void testGetAllRoles() throws Exception {
        List<RoleModel> roles = roleService.getAllRoles();
        assertThat(roles).hasSize(3);
    }

    /**
     * 添加、修改、删除角色的测试用例
     */
    @Test
    public void testEditRole() throws Exception {
        // 添加角色测试用例
        RoleModel role = new RoleModel();
        role.setName("测试角色");
        roleService.saveRole(role);
        // 断言添加角色后角色总数
        List<RoleModel> roles = roleService.getAllRoles();
        assertThat(roles).hasSize(4);

        // 修改角色测试用例
        role.setName("测试角色修改");
        roleService.saveRole(role);
        assertThat(role.getName()).isEqualTo("测试角色修改");

        // 删除角色测试用例
        roleService.deleteRole(role.getId());
        // 断言删除角色后角色总数
        List<RoleModel> roles1 = roleService.getAllRoles();
        assertThat(roles1).hasSize(3);
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
