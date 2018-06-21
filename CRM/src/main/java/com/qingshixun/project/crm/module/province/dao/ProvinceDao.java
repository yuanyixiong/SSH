/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.province.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;
import com.qingshixun.project.crm.model.ProvinceModel;

/**
 * 省份处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class ProvinceDao extends BaseHibernateDao<ProvinceModel, Long> {
    /**
     * 查询所有省份信息
     * 
     * @param
     * @return
     */
    public List<ProvinceModel> getProvinceList() {
        return find();
    }
}
