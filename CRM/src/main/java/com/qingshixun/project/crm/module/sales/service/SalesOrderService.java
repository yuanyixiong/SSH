/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.sales.service;

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
import com.qingshixun.project.crm.model.SalesOrderItemModel;
import com.qingshixun.project.crm.model.SalesOrderModel;
import com.qingshixun.project.crm.module.product.dao.ProductDao;
import com.qingshixun.project.crm.module.sales.dao.SalesOrderDao;
import com.qingshixun.project.crm.module.sales.dao.SalesOrderItemDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 销售订单处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class SalesOrderService extends BaseService {

    // 注入销售订单处理Dao
    @Autowired
    private SalesOrderDao salesOrderDao;

    // 注入产品处理Dao
    @Autowired
    private ProductDao productDao;

    // 注入销售订单条目处理Dao
    @Autowired
    private SalesOrderItemDao salesOrderItemDao;

    /**
     * 获取所有销售订单信息
     * 
     * @return
     */
    public PageContainer getSalesOrderPage(Map<String, String> params) {
        return salesOrderDao.getSalesOrderPage(params);
    }

    /**
     * 根据销售订单ID，获取销售订单信息
     * 
     * @param SupplierId
     * @return
     */
    public SalesOrderModel getSalesOrder(Long salesOrderId) {
        return salesOrderDao.get(salesOrderId);
    }

    /**
     * 删除销售订单
     * 
     * @param SalesOrderId
     */
    public void deleteSalesOrder(Long salesOrderId) {
        salesOrderDao.delete(salesOrderId);
    }

    /**
     * 保存销售订单
     * 
     * @param SalesOrder
     * @throws Exception
     */
    public void saveSalesOrder(SalesOrderModel salesOrder, HttpServletRequest request) throws Exception {
        // 获取订单中产品数量
        String[] quantitys = request.getParameterValues("quantity");
        // 获取订单中产品id
        String[] productIds = request.getParameterValues("productId");
        // 获取订单中产品价格
        String[] prices = request.getParameterValues("price");
        // 获取订单中订单详情id
        String[] salesOrderItemIds = request.getParameterValues("itemId");

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
        salesOrder.setTotalQuantity(totalQuantity);
        salesOrder.setTotalAmount(totalAmount);
        // 设置编码
        if ("".equals(salesOrder.getCode())) {
            salesOrder.setCode("SAO" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        salesOrder.setUpdateTime(DateUtils.timeToString(new Date()));
        salesOrderDao.save(salesOrder);

        // 保存销售订单条目信息
        for (int i = 0; i < salesOrderItemIds.length; i++) {
            SalesOrderItemModel salesOrderItem = new SalesOrderItemModel();
            ProductModel product = productDao.get(Long.parseLong(productIds[i]));
            if (!"null".equals(salesOrderItemIds[i])) {
                salesOrderItem.setId(Long.parseLong(salesOrderItemIds[i]));
            } else {
                // 修改产品的库存信息
                product.setInventory(product.getInventory() - Integer.parseInt(quantitys[i]));
                productDao.save(product);
            }
            // 设置订单详情信息
            salesOrderItem.setUpdateTime(DateUtils.timeToString(new Date()));
            salesOrderItem.setQuantity(Integer.parseInt(quantitys[i]));
            salesOrderItem.setAmount(Double.parseDouble(prices[i]) * Integer.parseInt(quantitys[i]));
            salesOrderItem.setProduct(product);
            salesOrderItem.setSalesOrder(salesOrder);
            salesOrderItemDao.save(salesOrderItem);
        }

    }

    /**
     * 根据主题搜索销售订单
     * 
     * @param
     * @return
     */
    public List<SalesOrderModel> getSalesOrderList(String value) {
        return salesOrderDao.getSalesOrderList(value);
    }
}
