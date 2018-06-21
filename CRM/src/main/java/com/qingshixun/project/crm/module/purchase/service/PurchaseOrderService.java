/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.purchase.service;

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
import com.qingshixun.project.crm.model.PurchaseOrderItemModel;
import com.qingshixun.project.crm.model.PurchaseOrderModel;
import com.qingshixun.project.crm.module.product.dao.ProductDao;
import com.qingshixun.project.crm.module.purchase.dao.PurchaseOrderDao;
import com.qingshixun.project.crm.module.purchase.dao.PurchaseOrderItemDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 采购订单处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class PurchaseOrderService extends BaseService {

    // 注入采购订单处理Dao
    @Autowired
    private PurchaseOrderDao purchaseOrderDao;

    // 注入产品处理Dao
    @Autowired
    private ProductDao productDao;

    // 注入采购订单条目处理Dao
    @Autowired
    private PurchaseOrderItemDao purchaseOrderItemDao;

    /**
     * 获取所有采购订单信息
     * 
     * @return
     */
    public PageContainer getPurchaseOrderPage(Map<String, String> params) {
        return purchaseOrderDao.getPurchaseOrderPage(params);
    }

    /**
     * 根据采购订单ID，获取采购订单信息
     * 
     * @param SupplierId
     * @return
     */
    public PurchaseOrderModel getPurchaseOrder(Long PurchaseOrderId) {
        return purchaseOrderDao.get(PurchaseOrderId);
    }

    /**
     * 删除采购订单
     * 
     * @param PurchaseId
     */
    public void deletePurchaseOrder(Long PurchaseOrderId) {
        purchaseOrderDao.delete(PurchaseOrderId);
    }

    /**
     * 保存采购订单
     * 
     * @param Purchase
     * @throws Exception
     */
    public void savePurchaseOrder(PurchaseOrderModel purchaseOrder, HttpServletRequest request) throws Exception {
        // 获取订单中产品数量
        String[] quantitys = request.getParameterValues("quantity");
        // 获取订单中产品id
        String[] productIds = request.getParameterValues("productId");
        // 获取订单中产品价格
        String[] prices = request.getParameterValues("price");
        // 获取订单中订单详情id
        String[] purchaseItemIds = request.getParameterValues("itemId");

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
        purchaseOrder.setTotalQuantity(totalQuantity);
        purchaseOrder.setTotalAmount(totalAmount);

        // 设置编码
        if ("".equals(purchaseOrder.getCode())) {
            purchaseOrder.setCode("PUR" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        purchaseOrder.setUpdateTime(DateUtils.timeToString(new Date()));
        purchaseOrderDao.save(purchaseOrder);

        // 保存采购订单条目信息
        for (int i = 0; i < purchaseItemIds.length; i++) {
            PurchaseOrderItemModel purchaseItem = new PurchaseOrderItemModel();
            ProductModel product = productDao.get(Long.parseLong(productIds[i]));
            if (!"null".equals(purchaseItemIds[i])) {
                purchaseItem.setId(Long.parseLong(purchaseItemIds[i]));
            } else {
                // 修改产品的库存信息(增加库存)
                product.setInventory(product.getInventory() + Integer.parseInt(quantitys[i]));
                productDao.save(product);
            }
            // 设置订单详情信息
            purchaseItem.setUpdateTime(DateUtils.timeToString(new Date()));
            purchaseItem.setQuantity(Integer.parseInt(quantitys[i]));
            purchaseItem.setAmount(Double.parseDouble(prices[i]) * Integer.parseInt(quantitys[i]));
            purchaseItem.setProduct(product);
            purchaseItem.setPurchaseOrder(purchaseOrder);
            purchaseOrderItemDao.save(purchaseItem);
        }

    }

    /**
     * 根据名称搜索采购订单
     * 
     * @param
     * @return
     */
    public List<PurchaseOrderModel> getPurchaseOrderList(String value) {
        return purchaseOrderDao.getPurchaseOrderList(value);
    }

}
