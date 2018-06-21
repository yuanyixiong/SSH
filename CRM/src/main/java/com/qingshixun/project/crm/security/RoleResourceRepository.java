/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.security;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.qingshixun.project.crm.model.MenuModel;
import com.qingshixun.project.crm.model.ResourceModel;
import com.qingshixun.project.crm.model.RoleModel;
import com.qingshixun.project.crm.module.role.service.RoleService;

/**
 * 角色资源仓库 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Service
@Transactional
public class RoleResourceRepository implements InitializingBean {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    // 所有角色与菜单的 Map 映射
    private Map<String, Set<MenuModel>> roleMenuMap = Maps.newConcurrentMap();

    // 所有角色与资源权限的Map 映射
    private Map<String, List<ResourceModel>> roleResourceMap = Maps.newConcurrentMap();

    // 注入角色service
    @Autowired
    private RoleService roleService;

    private String filterChainDefinitions;

    /**
     * 获取角色的所有资源（菜单）
     * 
     * @param
     * @return
     */
    public List<MenuModel> getRoleMenus(List<String> roleIds) {
        // 菜单列表
        List<MenuModel> roleMenus = Lists.newArrayList();

        // 获取指定角色的所拥有的所有菜单项
        for (String roleId : roleIds) {
            Set<MenuModel> oneRoleMenus = roleService.getRole(Long.parseLong(roleId)).getMenus();
            for (MenuModel MenuModel : oneRoleMenus) {
                if (!roleMenus.contains(MenuModel)) {
                    //如果是顶层菜单
                    if (MenuModel.getParent() == null) {
                        roleMenus.add(MenuModel);
                    } else {
                        int parentIndex = roleMenus.indexOf(MenuModel.getParent());
                        if (-1 != parentIndex) {
                            MenuModel parentMenu = roleMenus.get(parentIndex);
                            parentMenu.addChildren(MenuModel);
                        }
                    }
                }
            }
        }

        // 菜单排序
        Collections.sort(roleMenus);
        return roleMenus;
    }

    public Map<String, List<ResourceModel>> getRoleResources() {
        return roleResourceMap;
    }

    /**
     * 加载指定角色拥有的功能菜单
     * @param roles
     */
    public void loadRoleMenuMap(List<RoleModel> roles) {
        //加载角色对应菜单前，首先清除所有内容
        roleMenuMap.clear();

        // 将登录用户的角色ID，角色对应的菜单列表以key ，value的形式put到roleMenuMap中
        for (RoleModel role : roles) {
            roleMenuMap.put(String.valueOf(role.getId()), role.getMenus());
        }
    }

    /**
     * 加载指定角色拥有的资源权限（如：产品查询、产品新增、产品删除等）
     * @param roles
     */
    public void loadRoleResourceMap(List<RoleModel> roles) {
        roleResourceMap.clear();
        // 将登录用户的角色ID，角色对应的资源列表以key ，value的形式put到roleMenuMap中
        for (RoleModel role : roles) {
            Set<MenuModel> roleMenus = role.getMenus();
            List<ResourceModel> roleResources = Lists.newArrayList();
            for (MenuModel menu : roleMenus) {
                roleResources.addAll(menu.getResources());
            }
            roleResourceMap.put(String.valueOf(role.getId()), roleResources);
        }
    }

    public String getFilterChainDefinitions() {
        return filterChainDefinitions;
    }

    public void setFilterChainDefinitions(String filterChainDefinitions) {
        this.filterChainDefinitions = filterChainDefinitions;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        // 获取系统中所有角色数据
        List<RoleModel> roles = roleService.getAllRoles();

        // 加载角色与菜单映射
        loadRoleMenuMap(roles);

        // 加载角色与资源权限映射
        loadRoleResourceMap(roles);
    }
}
