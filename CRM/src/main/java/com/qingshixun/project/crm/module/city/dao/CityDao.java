/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.city.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.model.CityModel;

/**
 * 城市处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class CityDao extends BaseHibernateDao<CityModel, Long> {

    /**
     * 查询所有城市信息
     * 
     * @param params
     * @return
     */
    public List<CityModel> getCityList(Map<String, Object> params) {
        // 创建根据省份编码模糊查询条件
        Criterion proCode = createCriterion("province.code", params.get("proCode"));
        return find(proCode);
    }
}
