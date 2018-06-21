/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.role.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.MenuModel;
import com.qingshixun.project.crm.model.ResourceModel;
import com.qingshixun.project.crm.model.ResourceTree;
import com.qingshixun.project.crm.model.RoleModel;
import com.qingshixun.project.crm.model.State;
import com.qingshixun.project.crm.module.menu.dao.MenuDao;
import com.qingshixun.project.crm.module.role.dao.RoleDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 角色处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class RoleService extends BaseService {

    // 注入角色处理Dao
    @Autowired
    private RoleDao roleDao;

    // 注入菜单处理Dao
    @Autowired
    private MenuDao menuDao;

    /**
     * 获取所有角色(包含角色所关联的菜单)
     * 
     * @return
     */
    public List<RoleModel> getAllRoles() {
        List<RoleModel> roles = roleDao.getAll();
        // 遍历菜单项所关联的所有资源及子菜单(资源及子菜单设置：FetchType.LAZY，这里提前进行内容加载，防止在使用是出现no session问题)
        for (RoleModel roleModel : roles) {
            for (MenuModel menuModel : roleModel.getMenus()) {
                menuModel.getResources().size();
                menuModel.getChildren().size();
            }
        }
        return roles;
    }

    /**
     * 获取所有角色
     * 
     * @return
     */
    public PageContainer getRolePage(Map<String, String> params) {
        return roleDao.getRolePage(params);
    }

    /**
     * 根据Id获取角色信息
     * 
     * @return
     */
    public RoleModel getRole(Long roleId) {
        return roleDao.get(roleId);
    }

    /**
     * 保存角色信息
     * 
     * @return
     */
    public void saveRole(RoleModel roleModel) {
        // 设置最后更新时间
        roleModel.setUpdateTime(DateUtils.timeToString(new Date()));
        roleDao.save(roleModel);
    }

    /**
     * 删除角色信息
     * 
     * @return
     */
    public void deleteRole(Long roleId) {
        roleDao.delete(roleId);
    }

    /**
     * 根基角色信息Id获取树形菜单json数据
     * 
     * @param roleId 角色信息ID
     * @return json数据
     */
    public String getTreeData(Long roleId) throws JsonProcessingException {
        RoleModel role = roleDao.get(roleId);
        List<MenuModel> menus = menuDao.getMenuList();
        List<ResourceTree> resourceList = new ArrayList<ResourceTree>();
        // 根菜单
        for (MenuModel menu : menus) {
            ResourceTree resource = getTopResource(menu, role);
            resourceList.add(resource);
        }
        // 将list对象转化为json字符串
        ObjectMapper mapper = new ObjectMapper();
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
        String data = mapper.writeValueAsString(resourceList);
        return data;
    }

    /**
     * 一级跟菜单
     * 
     * @param menu 跟菜单实体
     * @param menusIds 角色拥有的菜单ids
     * @param resourceIds 角色拥有的资源ids
     */
    public ResourceTree getTopResource(MenuModel menu, RoleModel role) {
        ResourceTree resource = new ResourceTree();
        resource.setId(String.valueOf(menu.getId()));
        resource.setText(menu.getName());
        // 判断角色是否拥有该菜单权限 如果有则树形的checkbox被勾选上否则不被勾选
        if (role.getMenus().contains(menu)) {
            resource.setState(new State(true));
        }
        // 设置二级菜单状态
        resource.setChildren(getSecondResourceList(menu.getChildren(), role));
        return resource;
    }

    /**
     * 二级菜单
     * 
     * @param set 子菜单实体列表
     * @param menusIds 角色拥有的菜单ids
     * @param resourceIds 角色拥有的资源ids
     */
    public List<ResourceTree> getSecondResourceList(Set<MenuModel> menus, RoleModel role) {
        List<ResourceTree> childResourceList = new ArrayList<ResourceTree>();
        if (menus != null) {
            for (MenuModel menu : menus) {
                ResourceTree childResource = new ResourceTree();
                childResource.setId(String.valueOf(menu.getId()));
                childResource.setText(menu.getName());
                // 判断角色是否拥有该菜单权限 如果有则树形的checkbox被勾选上否则不被勾选
                if (role.getMenus().contains(menu)) {
                    childResource.setState(new State(true));
                }
                childResource.setChildren(getThirdResourceList(menu.getId(), role));
                childResourceList.add(childResource);
            }
        }

        return childResourceList;
    }

    /**
     * 三级资源菜单
     * 
     * @param menuId 资源的父级菜单id
     * @param resources 资源列表
     * @param resourceIds 角色拥有的资源ids
     */
    public List<ResourceTree> getThirdResourceList(Long menuId, RoleModel role) {
        List<ResourceTree> resourceList = new ArrayList<ResourceTree>();
        if (role.getResources() != null) {
            for (ResourceModel resource : role.getResources()) {
                ResourceTree nodeResource = new ResourceTree();
                // 三级资源菜单的ID是由资源的父级菜单ID：资源ID）拼接生成
                nodeResource.setId(String.valueOf(menuId) + ":" + String.valueOf(resource.getId()));
                nodeResource.setText(resource.getName());
                // 判断角色是否拥有该资源权限 如果有则树形的checkbox被勾选上否则不被勾选
                if (role.getResources().contains(resource)) {
                    nodeResource.setState(new State(true));
                }
                resourceList.add(nodeResource);
            }
        }

        return resourceList;
    }

    /**
     * 授权处理
     * 
     */
    public void saveRoleAuthorization(String ids, Long roleId) {
        String[] idArray = ids.split(",");
        RoleModel role = roleDao.get(roleId);
        Set<MenuModel> set = role.getMenus();
        set.clear();
        roleDao.save(role);
        for (String id : idArray) {
            if (null != id) {
                MenuModel menu = menuDao.get(Long.parseLong(id));
                set.add(menu);
            }
        }
        roleDao.save(role);
    }

    /**
     * 获取角色列表
     * 
     * @return
     */
    public List<RoleModel> getRoleList() {
        return roleDao.getRoleList();
    }
}
