/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com 
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.region.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.model.RegionModel;
import com.qingshixun.project.crm.module.region.dao.RegionDao;

/**
 * 区域处理 Service 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Service
@Transactional
public class RegionService extends BaseService {

    // 区域处理Dao
    @Autowired
    private RegionDao regionDao;

    /**
     * 获取所有区域信息
     * 
     * @return
     */
    public List<RegionModel> getRegns() {
        return regionDao.getRegionList();
    }

}
