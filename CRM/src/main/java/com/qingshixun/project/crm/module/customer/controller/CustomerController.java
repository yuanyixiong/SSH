/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.customer.controller;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.poi.ss.usermodel.Workbook;
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
import com.qingshixun.project.crm.model.CustomerModel;
import com.qingshixun.project.crm.module.customer.service.CustomerService;
import com.qingshixun.project.crm.util.GarbledUtil;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 客户处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/customer")
public class CustomerController extends BaseController {

    // 注入客户处理 Service
    @Autowired
    private CustomerService customerService;

    /**
     * 进入客户列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String customerPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/customer/list.jsp
        return "/customer/list";
    }

    /**
     * 获取所有客户信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer customerList(Model model, @RequestParam Map<String, String> params) {
        PageContainer customer = customerService.getCustomerPage(params);
        return customer;
    }

    /**
     * 进入客户编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{customerId}")
    public String customerForm(Model model, @PathVariable Long customerId) {
        CustomerModel customer = null;
        // 新增操作客户id是0L
        if (customerId.equals(0L)) {
            customer = new CustomerModel();
        } else {
            customer = customerService.getCustomer(customerId);
        }
        // 转向（forward）前端页面，文件：/WEB-INF/views/customer/form.jsp
        model.addAttribute(customer);
        return "/customer/form";
    }

    /**
     * 保存客户
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public ResponseData customerSave(Model model, @Valid @ModelAttribute("customer") CustomerModel customer) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存客户
            customerService.saveCustomer(customer);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除客户
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{customerId}")
    @ResponseBody
    public ResponseData customerDelete(Model model, @PathVariable Long customerId) {
        logger.debug("delete customer:" + customerId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据客户Id，删除客户
            customerService.deleteCustomer(customerId);
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
     * 修改客户状态
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/change/{customerId}")
    @ResponseBody
    public ResponseData customerChange(Model model, @PathVariable Long customerId) {
        logger.debug("change customer:" + customerId);
        ResponseData responseData = new ResponseData();
        try {
            CustomerModel customer = customerService.getCustomer(customerId);
            customerService.saveCustomer(customer);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 获取所有订单可以选择的客户信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/select")
    @ResponseBody
    public PageContainer customerSelect(Model model, @RequestParam Map<String, String> params) {
        PageContainer product = customerService.getSelectCustomerPage(params);
        return product;
    }

    /**
     * 获取选择的客户信息（订单模块）
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/getSelectedCustomer/{customerId}")
    @ResponseBody
    public ResponseData getSelectedProducts(Model model, @PathVariable Long customerId) {
        ResponseData responseData = new ResponseData();
        try {
            CustomerModel customer = customerService.getSelectedCustomer(customerId);
            responseData.setData(customer);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 导出所客户到excel
     * 
     * @param fileName 文件名称
     * 
     * @return
     */
    @RequestMapping(value = "/doExport/{fileName}", method = RequestMethod.GET)
    public void doExport(Model model, @PathVariable String fileName, HttpServletResponse response) {
        try {
            String value = "";
            // 如果乱码
            if (GarbledUtil.isMessyCode(fileName)) {
                value = fileName;
            } else {
                value = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
            }
            // 获取所有需要导出的客户信息
            List<CustomerModel> contacts = customerService.getAllCustomers();
            // 获取工作文档对象
            Workbook wb = customerService.export(value, contacts);
            // 设置发送到客户端的响应的内容类型
            response.setContentType("application/vnd.ms-excel");
            // 设置下载文件名称
            response.setHeader("Content-disposition", "attachment;filename=" + value + ".xlsx");
            // 获取输出流
            OutputStream ouputStream = new BufferedOutputStream(response.getOutputStream());
            // 下载文件(写输出流)
            wb.write(ouputStream);
            // 刷新流
            ouputStream.flush();
            // 关闭流
            ouputStream.close();
        } catch (IOException e) {
            logger.error(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    /**
     * 进入客户选择列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/customer")
    public String customerSelectPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/customer/list.jsp
        return "/customer/customer";
    }
}
