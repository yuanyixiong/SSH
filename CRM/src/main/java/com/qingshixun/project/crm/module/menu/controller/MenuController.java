/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.menu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.model.MenuModel;
import com.qingshixun.project.crm.model.ResourceModel;
import com.qingshixun.project.crm.module.menu.service.MenuService;
import com.qingshixun.project.crm.module.resource.service.ResourceService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 菜单处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/menu")
public class MenuController extends BaseController {

    // 注入菜单处理 Service
    @Autowired
    private MenuService menuService;

    // 注入资源处理 Service
    @Autowired
    private ResourceService resourceService;

    /**
     * 获取所有菜单信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String menuList(Model model) {
        List<MenuModel> menuTreeData = menuService.getMenuList();
        logger.debug("MenuTreeData ---> " + ToStringBuilder.reflectionToString(menuTreeData));
        model.addAttribute("menuTreeData", menuTreeData);
        // 转向（forward）前端页面，文件：/WEB-INF/views/menu/main.jsp
        return "/menu/main";
    }

    /**
     * 进入菜单编辑页面
     * 
     * @param model
     * @param menuId 菜单id
     * @param buttonType 按钮类型
     * @return
     */
    @RequestMapping(value = "/form/{menuId}/{buttonType}", method = RequestMethod.GET)
    public String menuForm(Model model, @PathVariable Long menuId, @PathVariable String buttonType) {
        MenuModel menu = null;
        // 如果菜单id是0L
        if (!menuId.equals(0L)) {
            // 如果点击新增按钮
            if ("add".equals(buttonType)) {
                model.addAttribute("menuId", menuId);
            } else {
                // 点击编辑按钮
                menu = menuService.getMenu(menuId);
                if (menu.getParent() == null) {
                    model.addAttribute("menuId", null);
                } else {
                    model.addAttribute("menuId", menu.getParent().getId());
                }
            }
        } else {
            menu = new MenuModel();
        }
        model.addAttribute("menu", menu);
        // 转向（forward）前端页面，文件：/WEB-INF/views/menu/form.jsp
        return "/menu/form";
    }

    /**
     * 保存菜单
     * 
     * @param model
     * @param menu 菜单实体
     * @return json数据
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public ResponseData menuSave(Model model, @Valid @ModelAttribute("menu") MenuModel menu) {
        ResponseData responseData = new ResponseData();
        try {
            menuService.saveMenu(menu);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 菜单删除
     * 
     * @param model
     * @param menuId 菜单id
     * @return json数据
     */
    @RequestMapping(value = "/delete/{menuId}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseData menuDelete(Model model, @PathVariable final Long menuId) {
        logger.debug("delete menu:" + menuId);
        ResponseData responseData = new ResponseData();
        try {
            menuService.deleteMenu(menuId);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 进入图标选择页面
     * 
     * @return
     */
    @RequestMapping(value = "/selectMenuIcon", method = RequestMethod.GET)
    public String menuIconList(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/menu/iconList.jsp
        return "/menu/iconList";
    }

    /**
     * 进入资源新增页面
     * 
     * @param model
     * @param menuId 菜单id
     * @return
     */
    @RequestMapping(value = "/resource/{menuId}", method = RequestMethod.GET)
    public String resource(Model model, @PathVariable Long menuId) {
        ResourceModel resource = new ResourceModel();
        resource.setMenuId(menuId);
        model.addAttribute(resource);
        // 转向（forward）前端页面，文件：/WEB-INF/views/menu/menuResource.jsp
        return "/menu/menuResource";
    }

    /**
     * 进入资源编辑页面
     * 
     * @param model
     * @param resourceId 资源id
     * @param menuId 菜单id
     * @return
     */
    @RequestMapping(value = "/resource/form/{resourceId}/{menuId}", method = RequestMethod.GET)
    public String resourceForm(Model model, @PathVariable Long resourceId, @PathVariable Long menuId) {
        ResourceModel resource = resourceService.getResource(resourceId);
        resource.setMenuId(menuId);
        model.addAttribute(resource);
        // 转向（forward）前端页面，文件：/WEB-INF/views/menu/menuResource.jsp
        return "/menu/menuResource";
    }

    /**
     * 获取资源列表
     * 
     * @param model
     * @param menuId 菜单id
     * @return
     */
    @RequestMapping(value = "/resource/list/{menuId}", method = RequestMethod.GET)
    public String resourceList(Model model, @PathVariable Long menuId) {
        MenuModel menu = menuService.getMenu(menuId);
        model.addAttribute("resources", menu.getResources());
        model.addAttribute("menuId", menuId);
        // 转向（forward）前端页面，文件：/WEB-INF/views/menu/menuResourceList.jsp
        return "/menu/menuResourceList";
    }

    /**
     * 保存资源
     * 
     * @param model
     * @param resource 资源实体
     * @return json数据
     */
    @RequestMapping(value = "/resource/save")
    @ResponseBody
    public ResponseData resourceSave(Model model, @Valid @ModelAttribute("resource") ResourceModel resource) {
        ResponseData responseData = new ResponseData();
        try {
            menuService.saveResource(resource);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除菜单的资源
     * 
     * @param model
     * @param resourceId 资源id
     * @param menuId 菜单id
     * @return json数据
     */
    @RequestMapping(value = "/resource/delete/{resourceId}/{menuId}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseData resourceDelete(Model model, @PathVariable final Long resourceId, @PathVariable Long menuId) {
        logger.debug("delete resource:" + resourceId);
        ResponseData responseData = new ResponseData();
        try {
            menuService.deleteResource(resourceId, menuId);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 菜单排序
     * 
     * @param model
     * @param request
     * @return json数据
     */
    @RequestMapping(value = "/sort", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData menuSort(Model model, HttpServletRequest request) {
        ResponseData responseData = new ResponseData();
        String sectionSortResult = request.getParameter("sectionSortResult");
        // 非空判断
        if (!StringUtils.isEmpty(sectionSortResult)) {
            // 保存菜单排序
            menuService.sort(sectionSortResult);
        }
        return responseData;
    }
}
