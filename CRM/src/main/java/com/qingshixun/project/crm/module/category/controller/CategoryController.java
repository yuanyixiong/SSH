/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/
package com.qingshixun.project.crm.module.category.controller;

import java.util.List;
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
import com.qingshixun.project.crm.model.CategoryModel;
import com.qingshixun.project.crm.module.category.service.CategoryService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 产品类别处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/category")
public class CategoryController extends BaseController {

    // 注入产品类别处理 Service
    @Autowired
    private CategoryService categoryService;

    /**
     * 进入产品类别列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String categoryPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/category/list.jsp
        return "/category/list";
    }

    /**
     * 获取所有产品类别信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public ResponseData list(Model model) {
        ResponseData responseData = new ResponseData();
        List<CategoryModel> region = categoryService.getAllCategoryList();
        responseData.setData(region);
        return responseData;
    }

    /**
     * 获取所有产品类别分页信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/page/data")
    @ResponseBody
    public PageContainer page(Model model, @RequestParam Map<String, String> params) {
        PageContainer category = categoryService.getCategoryPage(params);
        return category;
    }

    /**
     * 进入产品类别编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{categoryId}", method = RequestMethod.GET)
    public String categoryForm(Model model, @PathVariable Long categoryId) {
        CategoryModel category = null;
        // 点击新增操作类别id是0L
        if (categoryId.equals(0L)) {
            category = new CategoryModel();
        } else {
            category = categoryService.getCategory(categoryId);
        }
        model.addAttribute("productCategogyModel", category);
        return "/category/form";
    }

    /**
     * 保存产品类别
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData productCategorySave(Model model, @ModelAttribute("category") CategoryModel category) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存产品类别
            categoryService.saveCategory(category);
        } catch (org.hibernate.exception.ConstraintViolationException e) {
            // 产品类别重复捕获重复异常
            logger.error(e.getMessage());
            responseData.setError(e.getMessage());
            responseData.setStatus("2");
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除产品类别
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{categoryId}")
    @ResponseBody
    public ResponseData categoryDelete(Model model, @PathVariable Long categoryId) {
        logger.debug("delete category:" + categoryId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据产品类别Id，删除产品类别
            categoryService.deleteCategory(categoryId);
        } catch (org.hibernate.exception.ConstraintViolationException e) {
            logger.error(e.getMessage());
            responseData.setError(e.getMessage());
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }
}
