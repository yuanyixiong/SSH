/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.quotation.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.model.QuotationItemModel;

/**
 * 报价单条目处理 Dao 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Repository
public class QuotationItemDao extends BaseHibernateDao<QuotationItemModel, Long> {

    /**
     * 根据报价单条目分类，查询所有报价单条目信息
     * 
     * @param quotationId 订单id
     * @return
     */
    public List<QuotationItemModel> getQuotationItemList(Long quotationId) {
        // 创建根据报价单条目分类查询条件
        Criterion quotation = createCriterion("quotation.id", quotationId);
        // 查询，并返回查询到的报价单条目结果信息
        return find(quotation);
    }

}
