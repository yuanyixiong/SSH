/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.sales.controller;

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
import com.qingshixun.project.crm.model.SalesOrderModel;
import com.qingshixun.project.crm.module.sales.service.SalesOrderService;
import com.qingshixun.project.crm.util.ImageUtils;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 销售订单 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/salesorder")
public class SalesOrderController extends BaseController {

    // 注入销售订单处理 Service
    @Autowired
    private SalesOrderService salesOrderService;

    /**
     * 进入营销活动列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String salesOrderPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/salesOrder/list.jsp
        return "/salesorder/list";
    }

    /**
     * 进入销售订单编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{salesOrderId}")
    public String salesOrderForm(Model model, @PathVariable Long salesOrderId) {
        SalesOrderModel salesOrder = null;
        if (0L == salesOrderId) {
            salesOrder = new SalesOrderModel();
        } else {
            salesOrder = salesOrderService.getSalesOrder(salesOrderId);
        }
        model.addAttribute(salesOrder);
        // 图片路径
        model.addAttribute("imagePath", ImageUtils.DEFAULT_IMAGE_PATH);
        // 转向（forward）前端页面，文件：/WEB-INF/views/salesOrder/form.jsp
        return "/salesorder/form";
    }

    /**
     * 获取所有销售订单信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer salesOrderList(Model model, @RequestParam Map<String, String> params) {
        PageContainer salesOrder = salesOrderService.getSalesOrderPage(params);
        return salesOrder;
    }

    /**
     * 保存销售订单
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData salesOrderSave(Model model, @ModelAttribute("salesOrder") SalesOrderModel salesOrder, HttpServletRequest request) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存销售订单
            salesOrderService.saveSalesOrder(salesOrder, request);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除销售订单
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{salesOrderId}")
    @ResponseBody
    public ResponseData salesOrderDelete(Model model, @PathVariable Long salesOrderId) {
        logger.debug("delete salesOrder:" + salesOrderId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据销售订单Id，删除销售订单
            salesOrderService.deleteSalesOrder(salesOrderId);
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
