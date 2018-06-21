/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.supplier.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.SupplierModel;
import com.qingshixun.project.crm.module.supplier.service.SupplierService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 供应商处理 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/supplier")
public class SupplierController extends BaseController {

    // 注入供应商处理 Service
    @Autowired
    private SupplierService supplierService;

    /**
     * 进入供应商列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String supplierPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/supplier/list.jsp
        return "/supplier/list";
    }

    /**
     * 进入供应商编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{supplierId}")
    public String supplierForm(Model model, @PathVariable Long supplierId) {

        SupplierModel supplier = null;
        if (0L == supplierId) {
            supplier = new SupplierModel();
        } else {
            supplier = supplierService.getSupplier(supplierId);
        }
        model.addAttribute(supplier);

        // 转向（forward）前端页面，文件：/WEB-INF/views/supplier/form.jsp
        return "/supplier/form";
    }

    /**
     * 获取所有供应商信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer supplierList(Model model, @RequestParam Map<String, String> params) {
        PageContainer supplier = supplierService.getSupplierPage(params);
        return supplier;
    }

    /**
     * 保存供应商
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public ResponseData supplierSave(Model model, @Valid @ModelAttribute("supplier") SupplierModel supplier) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存供应商
            supplierService.saveSupplier(supplier);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 进入供应商选择列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/supplier")
    public String supplierSelectPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/supplier/supplier.jsp
        return "/supplier/supplier";
    }

    /**
     * 获取所有供应商信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/select")
    @ResponseBody
    public PageContainer select(Model model, @RequestParam Map<String, String> params) {
        PageContainer supplier = supplierService.getSelectSupplierPage(params);
        return supplier;
    }

    /**
     * 获取选择的客户信息（订单模块）
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/getSelectedSupplier/{supplierId}")
    @ResponseBody
    public ResponseData getSelectedProducts(Model model, @PathVariable Long supplierId) {
        ResponseData responseData = new ResponseData();
        try {
            SupplierModel supplier = supplierService.getSupplier(supplierId);
            responseData.setData(supplier);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除供应商
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{supplierId}")
    @ResponseBody
    public ResponseData supplierDelete(Model model, @PathVariable Long supplierId) {
        logger.debug("delete supplier:" + supplierId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据供应商Id，删除供应商
            supplierService.deleteSupplier(supplierId);
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
