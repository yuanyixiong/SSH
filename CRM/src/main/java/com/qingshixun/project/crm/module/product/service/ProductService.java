/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.product.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ProductModel;
import com.qingshixun.project.crm.model.ProductStatus;
import com.qingshixun.project.crm.module.product.dao.ProductDao;
import com.qingshixun.project.crm.util.DateUtils;
import com.qingshixun.project.crm.util.ImageUtils;

/**
 * 产品处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class ProductService extends BaseService {

    // 注入产品处理Dao
    @Autowired
    private ProductDao productDao;

    /**
     * 获取所有产品信息
     * 
     * @return
     */
    public PageContainer getProductPage(Map<String, String> params) {
        return productDao.getProductPage(params);
    }

    /**
     * 根据产品ID，获取产品信息
     * 
     * @param productId
     * @return
     */
    public ProductModel getProduct(Long productId) {
        return productDao.get(productId);
    }

    /**
     * 保存产品
     * 
     * @param customer
     * @throws Exception
     */
    public void saveProduct(ProductModel product, String rootPath, MultipartRequest file) throws Exception {
        if (null != file) {
            MultipartFile imageFile = file.getFile("file");
            if (null != imageFile) {
                Map<String, Object> images = ImageUtils.saveImage(rootPath, imageFile, false);
                product.setPicture(images.get("imageName").toString());
            }
        }

        // 设置最后更新时间
        product.setUpdateTime(DateUtils.timeToString(new Date()));
        if (null == product.getStatus()) {
            product.setStatus(ProductStatus.stopStatus);
        }
        // 设置编号
        if ("".equals(product.getCode())) {
            product.setCode("PRT" + System.currentTimeMillis());
        }
        productDao.save(product);
    }

    /**
     * 修改产品状态
     * 
     * @param productId
     */
    public void changeProductStatus(Long productId) {
        ProductModel product = getProduct(productId);
        // 如果状态是停售的，修改产品状态为在售；如果状态是在售的，修改产品状态为停售
        if (product.getStatus().equals(ProductStatus.stopStatus)) {
            product.setStatus(ProductStatus.saleStatus);
        } else {
            product.setStatus(ProductStatus.stopStatus);
        }
        // 设置最后更新时间
        product.setUpdateTime(DateUtils.timeToString(new Date()));
        productDao.save(product);
    }

    /**
     * 删除产品
     * 
     * @param productId
     */
    public void deleteProduct(Long productId) {
        productDao.delete(productId);
    }

    /**
     * 获取所有可以供订单选择的产品信息
     * 
     * @return
     */
    public PageContainer getSelectProductPage(Map<String, String> params) {
        // 过滤选择过的产品
        String[] productIds = params.get("productIds").toString().split(",");
        List<Long> list = new ArrayList<Long>();
        for (int i = 0; i < productIds.length; i++) {
            if ("".equals(productIds[i])) {
                list.add(0L);
            } else {
                list.add(Long.parseLong(productIds[i]));
            }
        }
        return productDao.getSelectProductPage(params, list);
    }

    /**
     * 获取所有订单选择的产品信息
     * 
     * @return
     */
    public List<ProductModel> getSelectedProducts(Long[] productIds) {
        return productDao.getSelectedProducts(productIds);
    }

    /**
     * 获取所有产品信息
     * 
     * @return
     */
    public List<ProductModel> getAllProducts() {
        return productDao.find();
    }

    /**
     * 保存产品信息
     * 
     * @return
     */
    public void saveProduct(ProductModel product) {
        productDao.save(product);
    }

    /**
     * 获取所有可以供常见问答选择的产品信息
     * 
     * @return
     */
    public PageContainer getProblemProductPage(Map<String, String> params) {
        return productDao.getProblemProductPage(params);
    }

    /**
     * 根据名称搜索产品
     * 
     * @param
     * @return
     */
    public List<ProductModel> getProductList(String value) {
        return productDao.getProductList(value);
    }
}
