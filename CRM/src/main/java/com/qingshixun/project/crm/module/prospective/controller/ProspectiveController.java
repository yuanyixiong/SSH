/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.prospective.controller;

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
import com.qingshixun.project.crm.model.ProspectiveModel;
import com.qingshixun.project.crm.module.prospective.service.ProspectiveService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 潜在客户 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/prospective")
public class ProspectiveController extends BaseController {

    // 注入潜在客户处理 Service
    @Autowired
    private ProspectiveService prospectiveService;

    /**
     * 进入常见问题列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String prospectivePage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/Prospective/list.jsp
        return "/prospective/list";
    }

    /**
     * 进入潜在客户编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{prospectiveId}")
    public String prospectiveForm(Model model, @PathVariable Long prospectiveId) {
        ProspectiveModel prospective = null;
        if (0L == prospectiveId) {
            prospective = new ProspectiveModel();
        } else {
            prospective = prospectiveService.getProspective(prospectiveId);
        }
        model.addAttribute(prospective);

        // 转向（forward）前端页面，文件：/WEB-INF/views/Prospective/form.jsp
        return "/prospective/form";
    }

    /**
     * 获取所有潜在客户信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer prospectiveList(Model model, @RequestParam Map<String, String> params) {
        PageContainer Prospective = prospectiveService.getProspectivePage(params);
        return Prospective;
    }

    /**
     * 保存潜在客户
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData prospectiveSave(Model model, @ModelAttribute("prospective") ProspectiveModel prospective) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存潜在客户
            prospectiveService.saveProspective(prospective);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除潜在客户
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{prospectiveId}")
    @ResponseBody
    public ResponseData prospectiveDelete(Model model, @PathVariable Long prospectiveId) {
        logger.debug("delete prospective:" + prospectiveId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据潜在客户Id，删除潜在客户
            prospectiveService.deleteProspective(prospectiveId);
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

}
