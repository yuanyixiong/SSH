/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.quotation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.model.ProductModel;
import com.qingshixun.project.crm.model.QuotationItemModel;
import com.qingshixun.project.crm.module.product.dao.ProductDao;
import com.qingshixun.project.crm.module.quotation.dao.QuotationItemDao;

/**
 * 订单详情处理 Service 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Service
@Transactional
public class QuotationItemService extends BaseService {

    // 注入订单详情处理Dao
    @Autowired
    private QuotationItemDao quotationItemDao;

    // 注入产品处理dao
    @Autowired
    private ProductDao productDao;

    /**
     * 获取所有报价单条目信息
     * 
     * @return
     */
    public List<QuotationItemModel> getQuotationItemList(Long QuotationId) {
        return quotationItemDao.getQuotationItemList(QuotationId);
    }

    /**
     * 删除报价单条目
     * 
     * @param productId
     */
    public void deleteQuotationItem(Long quotationItemId) {
        if (0L != quotationItemId) {
            QuotationItemModel quotationItem = quotationItemDao.get(quotationItemId);
            ProductModel product = productDao.get(quotationItem.getProduct().getId());
            // 设置产品库存信息
            product.setInventory(product.getInventory() + quotationItem.getQuantity());
            productDao.save(product);
        }
        quotationItemDao.delete(quotationItemId);
    }
}
