/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.supplier.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.SupplierModel;
import com.qingshixun.project.crm.module.supplier.dao.SupplierDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 供应商处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class SupplierService extends BaseService {

    // 注入供应商处理Dao
    @Autowired
    private SupplierDao supplierDao;

    /**
     * 获取所有供应商信息
     * 
     * @return
     */
    public PageContainer getSupplierPage(Map<String, String> params) {
        return supplierDao.getSupplierPage(params);
    }

    /**
     * 获取所有供选择的供应商信息
     * 
     * @return
     */
    public PageContainer getSelectSupplierPage(Map<String, String> params) {
        return supplierDao.getSelectSupplierPage(params);
    }

    /**
     * 根据供应商ID，获取供应商信息
     * 
     * @param SupplierId
     * @return
     */
    public SupplierModel getSupplier(Long supplierId) {
        return supplierDao.get(supplierId);
    }

    /**
     * 删除供应商
     * 
     * @param SupplierId
     */
    public void deleteSupplier(Long SupplierId) {
        supplierDao.delete(SupplierId);
    }

    /**
     * 保存供应商
     * 
     * @param supplier
     * @throws Exception
     */
    public void saveSupplier(SupplierModel supplier) throws Exception {
        // 设置编码
        if ("".equals(supplier.getCode())) {
            supplier.setCode("SUP" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        supplier.setUpdateTime(DateUtils.timeToString(new Date()));
        supplierDao.save(supplier);
    }

    /**
     * 根据名称搜索供应商
     * 
     * @param
     * @return
     */
    public List<SupplierModel> getSupplierList(String value) {
        return supplierDao.getSupplierList(value);
    }
}
