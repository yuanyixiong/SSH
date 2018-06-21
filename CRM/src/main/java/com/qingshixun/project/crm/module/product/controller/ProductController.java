/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.product.controller;

import java.util.List;
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
import org.springframework.web.multipart.MultipartRequest;

import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ProductModel;
import com.qingshixun.project.crm.module.product.service.ProductService;
import com.qingshixun.project.crm.util.ImageUtils;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 产品处理 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController extends BaseController {

    // 注入产品处理 Service
    @Autowired
    private ProductService productService;

    /**
     * 进入产品列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String productPage(Model model) {
        model.addAttribute("imagePath", ImageUtils.DEFAULT_IMAGE_PATH);
        // 转向（forward）前端页面，文件：/WEB-INF/views/product/list.jsp
        return "/product/list";
    }

    /**
     * 进入产品编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{productId}")
    public String productForm(Model model, @PathVariable Long productId) {
        ProductModel product = null;
        if (0L == productId) {
            product = new ProductModel();
        } else {
            product = productService.getProduct(productId);
        }
        model.addAttribute(product);
        model.addAttribute("imagePath", ImageUtils.DEFAULT_IMAGE_PATH);
        // 转向（forward）前端页面，文件：/WEB-INF/views/product/form.jsp
        return "/product/form";
    }

    /**
     * 获取所有产品信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer productList(Model model, @RequestParam Map<String, String> params) {
        PageContainer product = productService.getProductPage(params);
        return product;
    }

    /**
     * 保存产品
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData productSave(Model model, @ModelAttribute("product") ProductModel product, HttpServletRequest request, MultipartRequest file) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存产品
            productService.saveProduct(product, getRealPath(), file);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除产品
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{prodcuId}")
    @ResponseBody
    public ResponseData productDelete(Model model, @PathVariable Long prodcuId) {
        logger.debug("delete product:" + prodcuId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据产品Id，删除产品
            productService.deleteProduct(prodcuId);
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
     * 修改产品状态
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/change/{productId}")
    @ResponseBody
    public ResponseData productChangeStatus(Model model, @PathVariable Long productId) {
        logger.debug("change product:" + productId);
        ResponseData responseData = new ResponseData();
        try {
            productService.changeProductStatus(productId);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 获取所有产品信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/select")
    @ResponseBody
    public PageContainer productSelect(Model model, @RequestParam Map<String, String> params) {
        PageContainer product = productService.getSelectProductPage(params);
        return product;
    }

    /**
     * 获取选择的产品信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/getSelectedProducts/{productIds}")
    @ResponseBody
    public ResponseData getSelectedProducts(Model model, @PathVariable Long[] productIds) {
        ResponseData responseData = new ResponseData();
        try {
            List<ProductModel> products = productService.getSelectedProducts(productIds);
            responseData.setData(products);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 获取所有供常见问答选择的产品信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/problem")
    @ResponseBody
    public PageContainer problem(Model model, @RequestParam Map<String, String> params) {
        PageContainer product = productService.getProblemProductPage(params);
        return product;
    }

    /**
     * 获取常见问答选择的产品信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/getSelectedProduct/{productId}")
    @ResponseBody
    public ResponseData getSelectedProduct(Model model, @PathVariable Long productId) {
        ResponseData responseData = new ResponseData();
        try {
            ProductModel product = productService.getProduct(productId);
            responseData.setData(product);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 进入产品选择页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/product")
    public String productSelectPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/problem/product.jsp
        return "/product/product";
    }

    /**
     * 进入订单选择产品页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/products")
    public String products(Model model) {
        model.addAttribute("imagePath", ImageUtils.DEFAULT_IMAGE_PATH);
        // 转向（forward）前端页面，文件：/WEB-INF/views/order/product.jsp
        return "/product/products";
    }
}
