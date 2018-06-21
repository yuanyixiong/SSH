/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.role.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.RoleModel;
import com.qingshixun.project.crm.module.role.service.RoleService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 角色处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController extends BaseController {

    // 注入角色处理 Service
    @Autowired
    private RoleService roleService;

    /**
     * 进入角色列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String rolePage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/role/list.jsp
        return "/role/list";
    }

    /**
     * 查询角色分页信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer roleList(Model model, @RequestParam Map<String, String> params) {
        PageContainer role = roleService.getRolePage(params);
        return role;
    }

    /**
     * 进入角色编辑信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{roleId}", method = RequestMethod.GET)
    public String roleForm(Model model, @PathVariable Long roleId) {
        RoleModel roleModel = new RoleModel();
        // 角色id是0L表示新增操作
        if (!roleId.equals(0L)) {
            roleModel = roleService.getRole(roleId);
        }
        model.addAttribute(roleModel);
        return "/role/form";
    }

    /**
     * 保存角色信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public ResponseData roleSave(Model model, @Valid @ModelAttribute("role") RoleModel role) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存角色
            roleService.saveRole(role);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除角色信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{roleId}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseData roleDelete(Model model, @PathVariable final Long roleId) {
        logger.debug("delete role:" + roleId);
        ResponseData responseData = new ResponseData();
        try {
            roleService.deleteRole(roleId);
        } catch (org.hibernate.exception.ConstraintViolationException e) {
            logger.error(e.getMessage());
            responseData.setError(e.getMessage());
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 进入角色授权页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/authorization")
    public String authorizationPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/role/authorization.jsp
        return "/role/authorization";
    }

    /**
     * 加载菜单树
     * 
     * @param model
     * @param roleId 角色ID
     * @return 跳转页面的相对路径
     */
    @RequestMapping(value = "/resourceTree/{roleId}", method = RequestMethod.GET)
    public String menuResourceTreeList(Model model, @PathVariable Long roleId) throws Exception {
        String data = roleService.getTreeData(roleId);
        model.addAttribute("data", data);
        model.addAttribute("roleId", roleId);
        return "/role/resourceTree";
    }

    /**
     * 授权处理
     * 
     * @param model
     * @param request
     * @param roleId 勾选的菜单拼接的id
     * @return json数据
     */
    @RequestMapping(value = "/saveResource/{roleId}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData saveRoleAuthorization(Model model, HttpServletRequest request, @PathVariable Long roleId) {
        ResponseData responseData = new ResponseData();
        String ids = request.getParameter("ids");
        roleService.saveRoleAuthorization(ids, roleId);
        // 授权处理
        return responseData;
    }

    /**
     * 获取角色列表(新增用户选择角色)
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/rolelist")
    @ResponseBody
    public ResponseData selectRoleList(Model model) {
        ResponseData responseData = new ResponseData();
        List<RoleModel> roles = roleService.getRoleList();
        responseData.setData(roles);
        return responseData;
    }
}
