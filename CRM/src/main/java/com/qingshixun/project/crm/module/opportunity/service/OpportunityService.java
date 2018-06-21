/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.opportunity.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.OpportunityModel;
import com.qingshixun.project.crm.module.opportunity.dao.OpportunityDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 销售机会处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class OpportunityService extends BaseService {

    // 注入销售机会处理Dao
    @Autowired
    private OpportunityDao opportunityDao;

    /**
     * 获取所有销售机会信息
     * 
     * @return
     */
    public PageContainer getOpportunityPage(Map<String, String> params) {
        return opportunityDao.getOpportunityPage(params);
    }

    /**
     * 根据销售机会ID，获取销售机会信息
     * 
     * @param SupplierId
     * @return
     */
    public OpportunityModel getOpportunity(Long opportunityId) {
        return opportunityDao.get(opportunityId);
    }

    /**
     * 删除销售机会
     * 
     * @param OpportunityId
     */
    public void deleteOpportunity(Long opportunityId) {
        opportunityDao.delete(opportunityId);
    }

    /**
     * 保存销售机会
     * 
     * @param Opportunity
     * @throws Exception
     */
    public void saveOpportunity(OpportunityModel opportunity) throws Exception {
        // 设置编码
        if ("".equals(opportunity.getCode())) {
            opportunity.setCode("OPP" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        opportunity.setUpdateTime(DateUtils.timeToString(new Date()));
        opportunityDao.save(opportunity);
    }

    /**
     * 获取所有可供选择的销售机会信息
     * 
     * @return
     */
    public PageContainer getSelectOpportunityPage(Map<String, String> params) {
        return opportunityDao.getSelectOpportunityPage(params);
    }

    /**
     * 根据名称搜索销售机会
     * 
     * @param
     * @return
     */
    public List<OpportunityModel> getOpportunityList(String value) {
        return opportunityDao.getOpportunityList(value);
    }
}
