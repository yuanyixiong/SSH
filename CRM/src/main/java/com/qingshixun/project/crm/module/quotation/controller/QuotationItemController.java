/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.quotation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.model.QuotationItemModel;
import com.qingshixun.project.crm.module.quotation.service.QuotationItemService;
import com.qingshixun.project.crm.web.ResponseData;

/**
 * 报价单条目处理 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/quotationitem")
public class QuotationItemController {

    // 注入报价单条目处理 Service
    @Autowired
    private QuotationItemService quotationItemService;

    /**
     * 获取报价单条目信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data/{quotationId}")
    @ResponseBody
    public ResponseData quotationItemList(Model model, @PathVariable Long quotationId) {
        ResponseData responseData = new ResponseData();
        List<QuotationItemModel> quotationItem = quotationItemService.getQuotationItemList(quotationId);
        responseData.setData(quotationItem);
        return responseData;
    }

    /**
     * 删除报价单条目
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{quotationItemId}")
    @ResponseBody
    public ResponseData quotationItemDelete(Model model, @PathVariable Long quotationItemId) {
        ResponseData responseData = new ResponseData();
        try {
            // 根据报价单条目Id，删除报价单条目
            quotationItemService.deleteQuotationItem(quotationItemId);
        } catch (Exception e) {
            // 异常处理
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }
}
