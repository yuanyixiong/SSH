/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.purchase.controller;

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
import com.qingshixun.project.crm.model.PurchaseOrderModel;
import com.qingshixun.project.crm.module.purchase.service.PurchaseOrderService;
import com.qingshixun.project.crm.util.ImageUtils;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 采购订单 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/purchaseorder")
public class PurchaseOrderController extends BaseController {

    // 注入采购订单处理 Service
    @Autowired
    private PurchaseOrderService purchaseOrderService;

    /**
     * 进入营销活动列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String purchaseOrderPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/purchaseorder/list.jsp
        return "/purchaseorder/list";
    }

    /**
     * 进入采购订单编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{purchaseOrderId}")
    public String purchaseOrderForm(Model model, @PathVariable Long purchaseOrderId) {

        PurchaseOrderModel purchaseOrder = null;
        if (0L == purchaseOrderId) {
            purchaseOrder = new PurchaseOrderModel();
        } else {
            purchaseOrder = purchaseOrderService.getPurchaseOrder(purchaseOrderId);
        }
        model.addAttribute(purchaseOrder);

        // 图片路径
        model.addAttribute("imagePath", ImageUtils.DEFAULT_IMAGE_PATH);
        // 转向（forward）前端页面，文件：/WEB-INF/views/purchaseorder/form.jsp
        return "/purchaseorder/form";
    }

    /**
     * 获取所有采购订单信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer purchaseOrderList(Model model, @RequestParam Map<String, String> params) {
        PageContainer purchaseOrder = purchaseOrderService.getPurchaseOrderPage(params);
        return purchaseOrder;
    }

    /**
     * 保存采购订单
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData purchaseOrderSave(Model model, @ModelAttribute("purchaseOrder") PurchaseOrderModel purchaseOrder, HttpServletRequest request) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存采购订单
            purchaseOrderService.savePurchaseOrder(purchaseOrder, request);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除采购订单
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{purchaseOrderId}")
    @ResponseBody
    public ResponseData purchaseOrderDelete(Model model, @PathVariable Long purchaseOrderId) {
        logger.debug("delete purchaseOrder:" + purchaseOrderId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据采购订单Id，删除采购订单
            purchaseOrderService.deletePurchaseOrder(purchaseOrderId);
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
