/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.issue.controller;

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
import com.qingshixun.project.crm.model.IssueModel;
import com.qingshixun.project.crm.module.issue.service.IssueService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 问题单 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/issue")
public class IssueController extends BaseController {

    // 注入问题单处理 Service
    @Autowired
    private IssueService issueService;

    /**
     * 进入问题单列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String issuePage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/issue/list.jsp
        return "/issue/list";
    }

    /**
     * 进入问题单编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{issueId}")
    public String issueForm(Model model, @PathVariable Long issueId) {

        IssueModel issue = null;
        if (0L == issueId) {
            issue = new IssueModel();
        } else {
            issue = issueService.getIssue(issueId);
        }
        model.addAttribute(issue);

        // 转向（forward）前端页面，文件：/WEB-INF/views/Issue/form.jsp
        return "/issue/form";
    }

    /**
     * 获取所有问题单信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer issueList(Model model, @RequestParam Map<String, String> params) {
        PageContainer Issue = issueService.getIssuePage(params);
        return Issue;
    }

    /**
     * 保存问题单
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData issueSave(Model model, @ModelAttribute("issue") IssueModel issue) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存问题单
            issueService.saveIssue(issue);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除问题单
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{issueId}")
    @ResponseBody
    public ResponseData issueDelete(Model model, @PathVariable Long issueId) {
        logger.debug("delete issue:" + issueId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据问题单Id，删除问题单
            issueService.deleteIssue(issueId);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

}
