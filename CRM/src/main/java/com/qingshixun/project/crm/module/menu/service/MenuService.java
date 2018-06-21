/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.menu.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.model.MenuJSON;
import com.qingshixun.project.crm.model.MenuModel;
import com.qingshixun.project.crm.model.ResourceModel;
import com.qingshixun.project.crm.module.menu.dao.MenuDao;
import com.qingshixun.project.crm.module.resource.dao.ResourceDao;

/**
 * 菜单处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class MenuService extends BaseService {

    // 注入菜单处理Dao
    @Autowired
    private MenuDao menuDao;

    // 注入资源处理Dao
    @Autowired
    private ResourceDao resourceDao;

    /**
     * 获取所有菜单信息
     * 
     * @return
     */
    public List<MenuModel> getMenuList() {
        return menuDao.getMenuList();
    }

    /**
     * 根绝菜单Id获取菜单信息
     * 
     * @return
     */
    public MenuModel getMenu(Long menuId) {
        return menuDao.getMenu(menuId);
    }

    /**
     * 保存菜单信息
     * 
     * @return
     */
    public void saveMenu(MenuModel menu) {
        // 新增一级菜单，新增二级菜单
        if (null == menu.getId()) {
            // 设置默认排序
            menu.setIndexNo(0);
            menu.setParent(getMenu(menu.getParent().getId()));
            menuDao.save(menu);
        } else {
            // 修改一级菜单，修改二级菜单
            MenuModel menuModel = getMenu(menu.getId());
            menuModel.setName(menu.getName());
            menuModel.setUrl(menu.getUrl());
            menuDao.save(menuModel);
        }
    }

    /**
     * 根据菜单Id删除菜单信息
     * 
     * @return
     */
    public void deleteMenu(Long menuId) {
        MenuModel menu = menuDao.get(menuId);
        // 如果是子菜单，先设置父级为空，以免连父级一起被删除掉了
        if (null != menu.getParent()) {
            menu.setParent(null);
            menuDao.delete(menu);
        } else {
            menuDao.delete(menuId);
        }
    }

    /**
     * 保存资源信息
     * 
     * @return
     */
    public void saveResource(ResourceModel resource) {
        // 如果资源Id是null，表示新增资源
        if (null == resource.getId()) {
            MenuModel menu = menuDao.get(resource.getMenuId());
            menu.getResources().add(resource);
            menuDao.save(menu);
        } else {
            // 如果资源不是null，表示是修改资源
            resourceDao.save(resource);
        }
    }

    /**
     * 删除资源信息
     * 
     * @return
     */
    public void deleteResource(Long resourceId, Long menuId) {
        MenuModel menu = menuDao.get(menuId);
        // 因为有外键，删除外键需去掉菜单中的这个资源
        menu.getResources().remove(resourceDao.get(resourceId));
        menuDao.save(menu);
    }

    /**
     * 菜单排序
     * 
     * @return
     */
    public void sort(String sectionSortResult) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
        // 将json数据转化为list对象
        try {
            List<MenuJSON> menus = mapper.readValue(sectionSortResult, mapper.getTypeFactory().constructParametricType(ArrayList.class, MenuJSON.class));
            int parentIndex = 10;
            // 设置排序号排序号为四位数 前两位代表父级菜单的排序 后两位代表子菜单的排序
            for (MenuJSON menuJson : menus) {
                MenuModel menu = menuDao.get(Long.valueOf(menuJson.getId()));
                menu.setParent(null);
                int index = Integer.valueOf(String.valueOf(++parentIndex) + "00");
                menu.setIndexNo(index);
                int childIndex = 10;
                if (menuJson.getChildren() != null) {
                    for (MenuJSON child : menuJson.getChildren()) {
                        Integer indexNo = Integer.valueOf(String.valueOf(parentIndex) + String.valueOf(childIndex++));
                        MenuModel cikdmenu = getMenu(Long.valueOf(child.getId()));
                        cikdmenu.setIndexNo(indexNo);
                        cikdmenu.setParent(menuDao.getMenu(Long.valueOf(menuJson.getId())));
                        saveMenu(cikdmenu);
                    }

                }
                // 保存菜单
                saveMenu(menu);
            }

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
    }

    /**
     * 查询所有菜单信息
     * 
     * @return
     */
    public List<MenuModel> getAllMenus() {
        return menuDao.find();
    }
}
