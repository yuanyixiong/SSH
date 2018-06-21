/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.quotation.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.qingshixun.project.crm.model.QuotationModel;
import com.qingshixun.project.crm.module.quotation.service.QuotationService;
import com.qingshixun.project.crm.util.ImageUtils;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 报价单 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/quotation")
public class QuotationController extends BaseController {

    // 注入报价单处理 Service
    @Autowired
    private QuotationService quotationService;

    /**
     * 进入报价单列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String quotationPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/quotation/list.jsp
        return "/quotation/list";
    }

    /**
     * 进入报价单编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{quotationId}")
    public String quotationForm(Model model, @PathVariable Long quotationId) {

        QuotationModel quotation = null;
        if (0L == quotationId) {
            quotation = new QuotationModel();
        } else {
            quotation = quotationService.getQuotation(quotationId);
        }
        model.addAttribute(quotation);
        // 图片路径
        model.addAttribute("imagePath", ImageUtils.DEFAULT_IMAGE_PATH);
        // 转向（forward）前端页面，文件：/WEB-INF/views/quotation/form.jsp
        return "/quotation/form";
    }

    /**
     * 获取所有报价单信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer quotationList(Model model, @RequestParam Map<String, String> params) {
        PageContainer quotation = quotationService.getQuotationPage(params);
        return quotation;
    }

    /**
     * 保存报价单
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData quotationSave(Model model, @ModelAttribute("quotation") QuotationModel quotation, HttpServletRequest request) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存报价单
            quotationService.saveQuotation(quotation, request);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除报价单
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{quotationId}")
    @ResponseBody
    public ResponseData quotationDelete(Model model, @PathVariable Long quotationId) {
        logger.debug("delete quotation:" + quotationId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据报价单Id，删除报价单
            quotationService.deleteQuotation(quotationId);
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
     * 进入报价单表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/quotation")
    public String quotation(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/quotation/quotation.jsp
        return "/quotation/quotation";
    }

    /**
     * 获取所有订单可以选择的报价单信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/select")
    @ResponseBody
    public PageContainer select(Model model, @RequestParam Map<String, String> params) {
        PageContainer campaign = quotationService.getSelectQuotations(params);
        return campaign;
    }

    /**
     * 获取选择的报价单信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/getSelectedQuotation/{quotationId}")
    @ResponseBody
    public ResponseData getSelectedQuotations(Model model, @PathVariable Long quotationId) {
        ResponseData responseData = new ResponseData();
        try {
            QuotationModel quotation = quotationService.getQuotation(quotationId);
            responseData.setData(quotation);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

}
