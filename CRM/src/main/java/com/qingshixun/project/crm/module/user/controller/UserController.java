/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
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
import com.qingshixun.project.crm.model.UserModel;
import com.qingshixun.project.crm.module.user.service.UserService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 用户处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

    // 注入用户处理 Service
    @Autowired
    private UserService userService;

    /**
     * 获取所有用户信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String userPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/user/list.jsp
        return "/user/list";
    }

    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer userList(Model model, @RequestParam Map<String, String> params) {
        PageContainer user = userService.getUserPage(params);
        return user;
    }

    /**
     * 进入用户编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{userId}", method = RequestMethod.GET)
    public String userForm(Model model, @PathVariable Long userId) {
        UserModel user = null;
        //userId=0 表示新增用户
        if (userId.equals(0L)) {
            user = new UserModel();
        } else {
            user = userService.getUser(userId);
        }
        // 转向（forward）前端页面，文件：/WEB-INF/views/user/form.jsp
        model.addAttribute(user);
        return "/user/form";
    }

    /**
     * 保存用户
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData userSave(Model model, @Valid @ModelAttribute("user") UserModel user, HttpServletRequest request) {
        ResponseData responseData = new ResponseData();
        try {
            // 获取选择的角色（一个用户可以拥有多个角色）
            String[] selectRoles = request.getParameterValues("selectRole");

            // 执行保存用户
            userService.saveUser(user, selectRoles);
        } catch (org.hibernate.exception.ConstraintViolationException e) {
            // 登录名重复捕获重复异常
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
     * 进入用户修改密码页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/password/{userId}", method = RequestMethod.GET)
    public String passwordForm(Model model, @PathVariable Long userId) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/user/password.jsp
        model.addAttribute(userId);
        return "/user/password";
    }

    /**
     * 修改用户密码
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/password/update")
    @ResponseBody
    public ResponseData userUpdatePassword(Model model, HttpServletRequest request) {
        ResponseData responseData = new ResponseData();
        try {
            String userId = request.getParameter("userId");
            String newPassword = request.getParameter("password");
            String newPasswordAgain = request.getParameter("passwordAgain");
            if (StringUtils.isEmpty(userId) || StringUtils.isEmpty(newPassword) || StringUtils.isEmpty(newPasswordAgain)) {
                responseData.setError("输入数据有误，请重新输入！");
                return responseData;
            }
            if (!newPassword.equalsIgnoreCase(newPasswordAgain)) {
                responseData.setError("两次输入密码不一致，请重新输入！");
                return responseData;
            }
            // 执行密码修改
            userService.updateUserPassword(Long.valueOf(userId), newPassword);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除用户
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{userId}")
    @ResponseBody
    public ResponseData userDelete(Model model, @PathVariable Long userId) {
        logger.debug("delete user:" + userId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据userId，删除用户
            userService.deleteUser(userId);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 修改用户状态
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/change/{userId}")
    @ResponseBody
    public ResponseData userChange(Model model, @PathVariable Long userId) {
        logger.debug("change userId:" + userId);
        ResponseData responseData = new ResponseData();
        try {
            userService.updateUserStatus(userId);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 分配用户
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/assign")
    @ResponseBody
    public ResponseData assign(Model model) {
        ResponseData responseData = new ResponseData();
        try {
            List<UserModel> user = userService.getActiveUsers();
            responseData.setData(user);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }
}
