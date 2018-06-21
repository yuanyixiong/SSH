/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.purchase.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ProductModel;
import com.qingshixun.project.crm.model.PurchaseOrderItemModel;
import com.qingshixun.project.crm.module.product.dao.ProductDao;
import com.qingshixun.project.crm.module.purchase.dao.PurchaseOrderItemDao;

/**
 * 采购订单详情处理 Service 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Service
@Transactional
public class PurchaseOrderItemService extends BaseService {

    // 注入采购订单详情处理Dao
    @Autowired
    private PurchaseOrderItemDao purchaseOrderItemDao;

    // 注入产品处理dao
    @Autowired
    private ProductDao productDao;

    /**
     * 获取所有采购订单详情信息
     * 
     * @return
     */
    public PageContainer getPurchaseOrderItemPage(Map<String, String> params) {
        return purchaseOrderItemDao.getPurchaseOrderItemPage(params);
    }

    /**
     * 获取采购单详细信息
     * 
     * @return
     */
    public List<PurchaseOrderItemModel> getPurchaseItemList(Long purchaseOrderItemId) {
        return purchaseOrderItemDao.getPurchaseOrderItemList(purchaseOrderItemId);
    }

    /**
     * 根据采购订单详情ID，获取采购订单详情信息
     * 
     * @param productId
     * @return
     */
    public PurchaseOrderItemModel getPurchaseOrderItem(Long purchaseOrderItemId) {
        return purchaseOrderItemDao.get(purchaseOrderItemId);
    }

    /**
     * 保存采购订单详情
     * 
     * @param customer
     */
    public void saveProduct(PurchaseOrderItemModel purchaseOrderItem) {
        purchaseOrderItemDao.save(purchaseOrderItem);
    }

    /**
     * 删除采购订单详情
     * 
     * @param productId
     */
    public void deletePurchaseOrderItem(Long purchaseOrderItemId) {
        if (0L != purchaseOrderItemId) {
            PurchaseOrderItemModel purchaseOrderItem = purchaseOrderItemDao.get(purchaseOrderItemId);
            ProductModel product = productDao.get(purchaseOrderItem.getProduct().getId());
            // 设置产品库存信息
            product.setInventory(product.getInventory() + purchaseOrderItem.getQuantity());
            productDao.save(product);
        }
        purchaseOrderItemDao.delete(purchaseOrderItemId);
    }
}
