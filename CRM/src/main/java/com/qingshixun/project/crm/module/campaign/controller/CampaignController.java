/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.campaign.controller;

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
import com.qingshixun.project.crm.model.CampaignModel;
import com.qingshixun.project.crm.module.campaign.service.CampaignService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 营销活动 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/campaign")
public class CampaignController extends BaseController {

    // 注入营销活动处理 Service
    @Autowired
    private CampaignService campaignService;

    /**
     * 进入营销活动列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String campaignPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/Campaign/list.jsp
        return "/campaign/list";
    }

    /**
     * 进入营销活动编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{campaignId}")
    public String campaignForm(Model model, @PathVariable Long campaignId) {
        CampaignModel campaign = null;
        if (0L == campaignId) {
            campaign = new CampaignModel();
        } else {
            campaign = campaignService.getCampaign(campaignId);
        }
        model.addAttribute(campaign);

        // 转向（forward）前端页面，文件：/WEB-INF/views/campaign/form.jsp
        return "/campaign/form";
    }

    /**
     * 获取所有营销活动信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer campaignList(Model model, @RequestParam Map<String, String> params) {
        PageContainer campaign = campaignService.getCampaignPage(params);
        return campaign;
    }

    /**
     * 保存营销活动
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData campaignSave(Model model, @ModelAttribute("campaign") CampaignModel campaign) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存营销活动
            campaignService.saveCampaign(campaign);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除营销活动
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{campaignId}")
    @ResponseBody
    public ResponseData campaignDelete(Model model, @PathVariable Long campaignId) {
        logger.debug("delete campaign:" + campaignId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据营销活动Id，删除营销活动
            campaignService.deleteCampaign(campaignId);
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
     * 进入营销活动选择页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/campaign")
    public String campaignSelect(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/campaign/campaign.jsp
        return "/campaign/campaign";
    }

    /**
     * 获取所有订单可以选择的营销活动信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/select")
    @ResponseBody
    public PageContainer select(Model model, @RequestParam Map<String, String> params) {
        PageContainer campaign = campaignService.getSelectCampaignPage(params);
        return campaign;
    }

    /**
     * 获取选择的营销活动信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/getSelectedCampaign/{campaignId}")
    @ResponseBody
    public ResponseData getSelectedCampaign(Model model, @PathVariable Long campaignId) {
        ResponseData responseData = new ResponseData();
        try {
            CampaignModel campaign = campaignService.getCampaign(campaignId);
            responseData.setData(campaign);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

}
