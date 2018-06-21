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
import com.qingshixun.project.crm.model.MenuModel;
import com.qingshixun.project.crm.module.menu.service.MenuService;

/**
 * 菜单测试用例 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@ContextConfiguration(locations = { "/applicationContext4Test.xml" })
public class MenuServiceTest extends BaseTransactionalJUnit4SpringContextTests {

    // 注入菜单service
    @Autowired
    private MenuService menuService;

    /**
     * 查询所有菜单的测试用例
     */
    @Test
    public void testGetAllMenus() throws Exception {
        List<MenuModel> menus = menuService.getAllMenus();
        assertThat(menus).hasSize(16);
    }

    /**
     * 添加、修改、删除菜单的测试用例
     */
    @Test
    public void testEditMenu() throws Exception {
        // 添加菜单测试用例
        MenuModel menu = new MenuModel();
        menu.setName("测试菜单");
        menu.setIcon("fa icon-hospital");
        menu.setUrl("test/list");
        MenuModel menuParent = new MenuModel();
        menuParent.setId(0L);
        menu.setParent(menuParent);
        menuService.saveMenu(menu);
        // 断言添加菜单后菜单总数
        List<MenuModel> menus = menuService.getAllMenus();
        assertThat(menus).hasSize(17);

        // 修改菜单测试用例
        menu.setName("测试菜单修改");
        menuService.saveMenu(menu);
        assertThat(menu.getName()).isEqualTo("测试菜单修改");

        // 删除菜单测试用例
        menuService.deleteMenu(menu.getId());
        // 断言删除菜单后菜单总数
        List<MenuModel> menus1 = menuService.getAllMenus();
        assertThat(menus1).hasSize(16);
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
