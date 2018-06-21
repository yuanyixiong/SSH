/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.sales.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.model.ProductModel;
import com.qingshixun.project.crm.model.SalesOrderItemModel;
import com.qingshixun.project.crm.module.product.dao.ProductDao;
import com.qingshixun.project.crm.module.sales.dao.SalesOrderItemDao;

/**
 * 销售订单详情处理 Service 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Service
@Transactional
public class SalesOrderItemService extends BaseService {

    // 注入销售订单详情处理Dao
    @Autowired
    private SalesOrderItemDao salesOrderItemDao;

    // 注入产品处理dao
    @Autowired
    private ProductDao productDao;

    /**
     * 根据id获取销售订单条目信息
     * 
     * @return
     */
    public List<SalesOrderItemModel> getSalesOrderItemList(Long salesOrderItemId) {
        return salesOrderItemDao.getSalesOrderItemList(salesOrderItemId);
    }

    /**
     * 删除销售订单详情
     * 
     * @param productId
     */
    public void deleteSalesOrderItem(Long salesOrderItemId) {
        if (0L != salesOrderItemId) {
            SalesOrderItemModel salesOrderItem = salesOrderItemDao.get(salesOrderItemId);
            ProductModel product = productDao.get(salesOrderItem.getProduct().getId());
            // 设置产品库存信息
            product.setInventory(product.getInventory() + salesOrderItem.getQuantity());
            productDao.save(product);
        }
        salesOrderItemDao.delete(salesOrderItemId);
    }
}
