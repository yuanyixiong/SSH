/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.campaign.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.CampaignModel;
import com.qingshixun.project.crm.module.campaign.dao.CampaignDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 营销活动处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class CampaignService extends BaseService {

    // 注入营销活动处理Dao
    @Autowired
    private CampaignDao campaignDao;

    /**
     * 获取所有营销活动信息
     * 
     * @return
     */
    public PageContainer getCampaignPage(Map<String, String> params) {
        return campaignDao.getCampaignPage(params);
    }

    /**
     * 根据营销活动ID，获取营销活动信息
     * 
     * @param SupplierId
     * @return
     */
    public CampaignModel getCampaign(Long campaignId) {
        return campaignDao.get(campaignId);
    }

    /**
     * 删除营销活动
     * 
     * @param CampaignId
     */
    public void deleteCampaign(Long campaignId) {
        campaignDao.delete(campaignId);
    }

    /**
     * 保存营销活动
     * 
     * @param Campaign
     * @throws Exception
     */
    public void saveCampaign(CampaignModel campaign) throws Exception {
        // 设置编码
        if ("".equals(campaign.getCode())) {
            campaign.setCode("CAM" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        campaign.setUpdateTime(DateUtils.timeToString(new Date()));
        campaignDao.save(campaign);
    }

    /**
     * 获取可以选择的营销活动信息
     * 
     * @return
     */
    public PageContainer getSelectCampaignPage(Map<String, String> params) {
        return campaignDao.getSelectCampaignPage(params);
    }

    /**
     * 根据名称搜索营销活动
     * 
     * @param
     * @return
     */
    public List<CampaignModel> getCampaignList(String value) {
        return campaignDao.getCampaignList(value);
    }
}
