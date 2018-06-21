/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.opportunity.controller;

import java.util.Map;

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
import com.qingshixun.project.crm.model.OpportunityModel;
import com.qingshixun.project.crm.module.opportunity.service.OpportunityService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 销售机会 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/opportunity")
public class OpportunityController extends BaseController {

    // 注入销售机会处理 Service
    @Autowired
    private OpportunityService opportunityService;

    /**
     * 进入销售机会列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String opportunityPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/Opportunity/list.jsp
        return "/opportunity/list";
    }

    /**
     * 进入销售机会编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{opportunityId}")
    public String opportunityForm(Model model, @PathVariable Long opportunityId) {

        OpportunityModel Opportunity = null;
        if (0L == opportunityId) {
            Opportunity = new OpportunityModel();
        } else {
            Opportunity = opportunityService.getOpportunity(opportunityId);
        }
        model.addAttribute(Opportunity);

        // 转向（forward）前端页面，文件：/WEB-INF/views/opportunity/form.jsp
        return "/opportunity/form";
    }

    /**
     * 获取所有销售机会信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer opportunityList(Model model, @RequestParam Map<String, String> params) {
        PageContainer opportunity = opportunityService.getOpportunityPage(params);
        return opportunity;
    }

    /**
     * 保存销售机会
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData opportunitySave(Model model, @ModelAttribute("opportunity") OpportunityModel opportunity) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存销售机会
            opportunityService.saveOpportunity(opportunity);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除销售机会
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{opportunityId}")
    @ResponseBody
    public ResponseData opportunityDelete(Model model, @PathVariable Long opportunityId) {
        logger.debug("delete opportunity:" + opportunityId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据销售机会Id，删除销售机会
            opportunityService.deleteOpportunity(opportunityId);
        } catch (org.hibernate.exception.ConstraintViolationException e) {
            responseData.setStatus("3");
            logger.error(e.getMessage());
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 进入报价单列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/opportunity")
    public String opportunitySelectPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/Opportunity/Opportunity.jsp
        return "/opportunity/opportunity";
    }

    /**
     * 获取销售机会列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/select")
    @ResponseBody
    public PageContainer opportunitySelect(Model model, @RequestParam Map<String, String> params) {
        PageContainer opportunity = opportunityService.getSelectOpportunityPage(params);
        return opportunity;
    }

    /**
     * 查询选择销售机会信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/getSelectedOpportunity/{opportunityId}")
    @ResponseBody
    public ResponseData getSelectedContact(Model model, @PathVariable Long opportunityId) {
        ResponseData responseData = new ResponseData();
        try {
            OpportunityModel opportunity = opportunityService.getOpportunity(opportunityId);
            responseData.setData(opportunity);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }
}
