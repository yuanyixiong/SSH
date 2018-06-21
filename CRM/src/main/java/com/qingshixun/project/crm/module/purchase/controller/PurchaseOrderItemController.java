/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.purchase.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.model.PurchaseOrderItemModel;
import com.qingshixun.project.crm.module.purchase.service.PurchaseOrderItemService;
import com.qingshixun.project.crm.web.ResponseData;

/**
 * 采购订单条目处理 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/purchaseorderitem")
public class PurchaseOrderItemController {

    // 注入采购订单条目处理 Service
    @Autowired
    private PurchaseOrderItemService purchaseOrderItemService;

    /**
     * 获取采购订单条目信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data/{purchaseItemId}")
    @ResponseBody
    public ResponseData purchaseOrderItemList(Model model, @PathVariable Long purchaseItemId) {
        ResponseData responseData = new ResponseData();
        List<PurchaseOrderItemModel> purchaseItem = purchaseOrderItemService.getPurchaseItemList(purchaseItemId);
        responseData.setData(purchaseItem);
        return responseData;
    }

    /**
     * 删除采购订单条目
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{purchaseItemId}")
    @ResponseBody
    public ResponseData purchaseOrderItemDelete(Model model, @PathVariable Long purchaseItemId) {
        ResponseData responseData = new ResponseData();
        try {
            // 根据采购订单条目Id，删除采购订单条目
            purchaseOrderItemService.deletePurchaseOrderItem(purchaseItemId);
        } catch (Exception e) {
            // 异常处理
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }
}
