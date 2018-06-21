/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.sales.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.model.SalesOrderItemModel;
import com.qingshixun.project.crm.module.sales.service.SalesOrderItemService;
import com.qingshixun.project.crm.web.ResponseData;

/**
 * 销售订单条目处理 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/salesorderitem")
public class SalesOrderItemController {

    // 注入销售订单条目处理 Service
    @Autowired
    private SalesOrderItemService salesOrderItemService;

    /**
     * 获取销售订单条目信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data/{salesOrderItemId}")
    @ResponseBody
    public ResponseData salesOrderList(Model model, @PathVariable Long salesOrderItemId) {
        ResponseData responseData = new ResponseData();
        List<SalesOrderItemModel> salesOrderItem = salesOrderItemService.getSalesOrderItemList(salesOrderItemId);
        responseData.setData(salesOrderItem);
        return responseData;
    }

    /**
     * 删除销售订单条目
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{salesOrderItemId}")
    @ResponseBody
    public ResponseData salesOrderDelete(Model model, @PathVariable Long salesOrderItemId) {
        ResponseData responseData = new ResponseData();
        try {
            // 根据采购订单条目Id，删除采购订单条目
            salesOrderItemService.deleteSalesOrderItem(salesOrderItemId);
        } catch (Exception e) {
            // 异常处理
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }
}
