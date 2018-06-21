/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.department.controller;

import java.util.Map;

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
import com.qingshixun.project.crm.model.DepartmentModel;
import com.qingshixun.project.crm.module.department.service.DepartmentService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 部门处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/department")
public class DepartmentController extends BaseController {

    // 注入部门处理 Service
    @Autowired
    private DepartmentService departmentService;

    /**
     * 进入部门列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String departmentPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/department/list.jsp
        return "/department/list";
    }

    /**
     * 获取所有部门信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer departmentList(Model model, @RequestParam Map<String, String> params) {
        PageContainer department = departmentService.getDepartmentPage(params);
        return department;
    }

    /**
     * 进入部门编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{departmentId}", method = RequestMethod.GET)
    public String userForm(Model model, @PathVariable Long departmentId) {
        DepartmentModel departmentModel = new DepartmentModel();
        // 新增操作部门id是0L
        if (!departmentId.equals(0L)) {
            departmentModel = departmentService.getDepartment(departmentId);
        }
        model.addAttribute(departmentModel);
        return "/department/form";
    }

    /**
     * 保存部门信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public ResponseData departmentSave(Model model, @Valid @ModelAttribute("department") DepartmentModel department) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存部门
            departmentService.saveDepartment(department);
        } catch (org.hibernate.exception.ConstraintViolationException e) {
            // 部门名重复捕获重复异常
            logger.error(e.getMessage());
            responseData.setError(e.getMessage());
            responseData.setStatus("2");
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除部门信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{departmentId}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseData departmentDelete(Model model, @PathVariable final Long departmentId) {
        logger.debug("delete department:" + departmentId);
        ResponseData responseData = new ResponseData();
        try {
            departmentService.deleteDepartment(departmentId);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 进入角色列表选择页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/relate/{departmentId}")
    public String relatePage(Model model, @PathVariable final Long departmentId) {
        model.addAttribute("departmentId", departmentId);
        // 转向（forward）前端页面，文件：/WEB-INF/views/department/relateRole.jsp
        return "/department/relateRole";
    }

    /**
     * 保存部门关联角色信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/relateSave/{roleIds}/{departmentId}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseData relateSave(Model model, @PathVariable Long[] roleIds, @PathVariable final Long departmentId) {
        ResponseData responseData = new ResponseData();
        try {
            departmentService.saveRelates(roleIds, departmentId);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 获取部门详情信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/role/{departmentId}")
    @ResponseBody
    public ResponseData list(Model model, @PathVariable Long departmentId) {
        ResponseData responseData = new ResponseData();
        DepartmentModel department = departmentService.getDepartment(departmentId);
        responseData.setData(department.getRoles());
        return responseData;
    }
}
