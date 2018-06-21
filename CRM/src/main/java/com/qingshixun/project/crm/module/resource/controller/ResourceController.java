/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com 
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.resource.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.model.ResourceModel;
import com.qingshixun.project.crm.module.resource.service.ResourceService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 资源处理 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/resource")
public class ResourceController extends BaseController {

    // 注入资源处理 Service
    @Autowired
    private ResourceService resourceService;

    /**
     * 进入资源列表页面
     * 
     * @param model
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
     * 保存资源
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/resource/save")
    @ResponseBody
    public ResponseData resourceSave(Model model, @Valid @ModelAttribute("resource") ResourceModel resource) {
        ResponseData responseData = new ResponseData();
        try {
            resourceService.saveResource(resource);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }
}
