/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.city.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.model.CityModel;
import com.qingshixun.project.crm.module.city.dao.CityDao;

/**
 * 城市处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class CityService extends BaseService {

    // 城市处理Dao
    @Autowired
    private CityDao cityDao;

    /**
     * 获取所有城市信息
     * 
     * @return
     */
    public List<CityModel> getCityList(Map<String, Object> params) {
        return cityDao.getCityList(params);
    }

}
