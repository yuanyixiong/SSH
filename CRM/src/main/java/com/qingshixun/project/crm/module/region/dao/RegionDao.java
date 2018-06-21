/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.region.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.model.RegionModel;

/**
 * 地区处理 Dao 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Repository
public class RegionDao extends BaseHibernateDao<RegionModel, Long> {

    /**
     * 查询所有区域信息
     * 
     * @param contactCategoryId
     * @return
     */
    public List<RegionModel> getRegionList() {
        // 查询，并返回查询到的区域结果信息
        return find();
    }
}
