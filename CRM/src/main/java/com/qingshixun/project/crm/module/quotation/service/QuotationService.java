/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.quotation.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ProductModel;
import com.qingshixun.project.crm.model.QuotationItemModel;
import com.qingshixun.project.crm.model.QuotationModel;
import com.qingshixun.project.crm.module.product.dao.ProductDao;
import com.qingshixun.project.crm.module.quotation.dao.QuotationDao;
import com.qingshixun.project.crm.module.quotation.dao.QuotationItemDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 报价单处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class QuotationService extends BaseService {

    // 注入报价单处理Dao
    @Autowired
    private QuotationDao quotationDao;

    // 注入产品处理Dao
    @Autowired
    private ProductDao productDao;

    // 注入报价单条目处理Dao
    @Autowired
    private QuotationItemDao quotationItemDao;

    /**
     * 获取所有报价单信息
     * 
     * @return
     */
    public PageContainer getQuotationPage(Map<String, String> params) {
        return quotationDao.getQuotationPage(params);
    }

    /**
     * 根据报价单ID，获取报价单信息
     * 
     * @param SupplierId
     * @return
     */
    public QuotationModel getQuotation(Long quotationId) {
        return quotationDao.get(quotationId);
    }

    /**
     * 删除报价单
     * 
     * @param QuotationId
     */
    public void deleteQuotation(Long quotationId) {
        quotationDao.delete(quotationId);
    }

    /**
     * 保存报价单
     * 
     * @param Quotation
     * @throws Exception
     */
    public void saveQuotation(QuotationModel quotation, HttpServletRequest request) throws Exception {
        // 获取订单中产品数量
        String[] quantitys = request.getParameterValues("quantity");
        // 获取订单中产品id
        String[] productIds = request.getParameterValues("productId");
        // 获取订单中产品价格
        String[] prices = request.getParameterValues("price");
        // 获取订单中订单详情id
        String[] quotationItemIds = request.getParameterValues("itemId");

        // 订单的产品总数
        int totalQuantity = 0;
        // 订单的总价
        Double totalAmount = 0.0;
        for (int i = 0; i < quantitys.length; i++) {
            // 订单总数是所有产品的数量相加
            totalQuantity += Integer.parseInt(quantitys[i]);
            // 订单总价是所有的产品的单价和数量相乘的总和
            totalAmount += Double.parseDouble(prices[i]) * Integer.parseInt(quantitys[i]);
        }
        // 设置订单的产品总价
        quotation.setTotalQuantity(totalQuantity);
        quotation.setTotalAmount(totalAmount);

        // 设置编码
        if ("".equals(quotation.getCode())) {
            quotation.setCode("QUO" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        quotation.setUpdateTime(DateUtils.timeToString(new Date()));
        quotationDao.save(quotation);

        // 保存报价单条目信息
        for (int i = 0; i < quotationItemIds.length; i++) {
            QuotationItemModel quotationItem = new QuotationItemModel();
            ProductModel product = productDao.get(Long.parseLong(productIds[i]));
            if (!"null".equals(quotationItemIds[i])) {
                quotationItem.setId(Long.parseLong(quotationItemIds[i]));
            }
            // 设置订单详情信息
            quotationItem.setUpdateTime(DateUtils.timeToString(new Date()));
            quotationItem.setQuantity(Integer.parseInt(quantitys[i]));
            quotationItem.setAmount(Double.parseDouble(prices[i]) * Integer.parseInt(quantitys[i]));
            quotationItem.setProduct(product);
            quotationItem.setQuotation(quotation);
            quotationItemDao.save(quotationItem);
        }

    }

    /**
     * 获取所有报价单信息
     * 
     * @return
     */
    public PageContainer getSelectQuotations(Map<String, String> params) {
        return quotationDao.getSelectQuotationPage(params);
    }

    /**
     * 根据名称搜索报价单
     * 
     * @param
     * @return
     */
    public List<QuotationModel> getQuotationList(String value) {
        return quotationDao.getQuotationList(value);
    }
}
