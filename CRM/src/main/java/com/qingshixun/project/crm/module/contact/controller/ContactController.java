/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.contact.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ContactModel;
import com.qingshixun.project.crm.model.CustomerModel;
import com.qingshixun.project.crm.module.contact.service.ContactService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 联系人处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/contact")
public class ContactController extends BaseController {

    // 注入联系人处理 Service
    @Autowired
    private ContactService contactService;

    /**
     * 获取所有联系人信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/{customerId}")
    public String listPage(ModelMap model, @PathVariable Long customerId) {
        model.put("customerId", customerId);
        // 转向（forward）前端页面，文件：/WEB-INF/views/contact/list.jsp
        return "/contact/list";
    }

    /**
     * 获取所有联系人信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer list(Model model, @RequestParam Map<String, String> params) {
        PageContainer contact = contactService.getContacts(params);
        return contact;
    }

    /**
     * 进入联系人编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{customerId}/{contactId}")
    public String form(Model model, @PathVariable Long customerId, @PathVariable Long contactId) {
        ContactModel contact = new ContactModel();
        // 设置联系人所属客户信息
        CustomerModel customer = new CustomerModel();
        customer.setId(customerId);
        contact.setCustomer(customer);
        if (!contactId.equals(0L)) {
            contact = contactService.getContact(contactId);
        }
        model.addAttribute(contact);
        // 转向（forward）前端页面，文件：/WEB-INF/views/contact/form.jsp
        return "/contact/form";
    }

    /**
     * 保存联系人
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public ResponseData contactSave(Model model, @Valid @ModelAttribute("contact") ContactModel contact) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存联系人
            contactService.saveContact(contact);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除联系人列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{contactId}")
    @ResponseBody
    public ResponseData contactDelete(Model model, @PathVariable Long contactId) {
        logger.debug("delete contact:" + contactId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据联系人Id，删除联系人
            contactService.deleteContact(contactId);
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
     * 获取所有联系人信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/contact")
    public String contactPage(ModelMap model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/contact/contact.jsp
        return "/contact/contact";
    }

    /**
     * 获取所有联系人信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/select")
    @ResponseBody
    public PageContainer select(Model model, @RequestParam Map<String, String> params) {
        PageContainer contact = contactService.getSelectContacts(params);
        return contact;
    }

    /**
     * 查询选择联系人信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/getSelectedContact/{contactId}")
    @ResponseBody
    public ResponseData getSelectedContact(Model model, @PathVariable Long contactId) {
        ResponseData responseData = new ResponseData();
        try {
            ContactModel contact = contactService.getContact(contactId);
            responseData.setData(contact);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }
}
