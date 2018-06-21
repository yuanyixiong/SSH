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
import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;

import com.qingshixun.project.crm.core.BaseTransactionalJUnit4SpringContextTests;
import com.qingshixun.project.crm.model.UserModel;
import com.qingshixun.project.crm.model.UserStatus;
import com.qingshixun.project.crm.module.user.service.UserService;

/**
 * 用户测试用例 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@ContextConfiguration(locations = { "/applicationContext4Test.xml" })
public class UserServiceTest extends BaseTransactionalJUnit4SpringContextTests {

    // 注入用户service
    @Autowired
    private UserService userService;

    /**
     * 查询所有用户的测试用例
     */
    @Test
    public void testGetAllUsers() throws Exception {
        List<UserModel> users = userService.getAllUsers();
        assertThat(users).hasSize(5);
    }

    /**
     * 添加、修改、删除用户的测试用例
     */
    @Test
    public void testEidtUser() {
        // 添加用户测试
        UserModel user = new UserModel();
        user.setLoginName("test");
        user.setName("测试用户");
        user.setGender("男");
        user.setPhone("13116678909");
        user.setEmail("zhoujielun@qq.com");
        // md5加密密码
        MessageDigestPasswordEncoder passwordEncoder = new ShaPasswordEncoder();
        user.setPassword(passwordEncoder.encodePassword("admin", "test"));
        user.setStatus(UserStatus.activeStatus);
        userService.saveUser(user, new String[0]);
        List<UserModel> users = userService.getAllUsers();
        assertThat(users).hasSize(6);

        // 修改用户测试
        user.setName("修改测试用户");
        userService.saveUser(user, new String[0]);
        assertThat(user.getName()).isEqualTo("修改测试用户");

        // 删除用户测试
        userService.deleteUser(user.getId());
        List<UserModel> users1 = userService.getAllUsers();
        assertThat(users1).hasSize(5);
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
