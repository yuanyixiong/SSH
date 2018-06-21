/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com 
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.module.resource.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.model.ResourceModel;
import com.qingshixun.project.crm.module.resource.dao.ResourceDao;

/**
 * 资源处理 Service 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Service
@Transactional
public class ResourceService extends BaseService {

    // 注入资源处理Dao
    @Autowired
    private ResourceDao resourceDao;

    /**
     * 保存资源
     * 
     * @return
     */
    public void saveResource(ResourceModel resource) {
        resourceDao.save(resource);
    }

    /**
     * 根据id获取资源
     * 
     * @return
     */
    public ResourceModel getResource(Long resourceId) {
        return resourceDao.get(resourceId);
    }

    /**
     * 删除资源
     * 
     * @return
     */
    public void reosurceDelete(Long resourceId) {
        resourceDao.delete(resourceId);
    }
}
