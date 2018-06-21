/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.customer.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.CustomerModel;
import com.qingshixun.project.crm.model.UserStatus;
import com.qingshixun.project.crm.module.customer.dao.CustomerDao;
import com.qingshixun.project.crm.util.DateUtils;
import com.qingshixun.project.crm.util.Poi4Excel;

/**
 * 客户处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class CustomerService extends BaseService {

    // 注入客户处理Dao
    @Autowired
    private CustomerDao customerDao;

    /**
     * 获取所有客户信息
     * 
     * @return
     */
    public PageContainer getCustomerPage(Map<String, String> params) {
        return customerDao.getCustomerPage(params);
    }

    /**
     * 根据客户ID，获取客户信息
     * 
     * @param customerId
     * @return
     */
    public CustomerModel getCustomer(Long customerId) {
        return customerDao.get(customerId);
    }

    /**
     * 保存客户
     * 
     * @param customer
     */
    public void saveCustomer(CustomerModel customer) {
        // 如果状态是禁用的，修改客户状态为启用；如果状态是启用的，修改客户状态为禁用
        if (customer.getStatus().equals(UserStatus.disabledStatus)) {
            customer.setStatus(UserStatus.activeStatus);
        } else {
            customer.setStatus(UserStatus.disabledStatus);
        }
        // 设置编码
        if ("".equals(customer.getAccount()) || null == customer.getAccount()) {
            customer.setAccount("CUS" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        customer.setUpdateTime(DateUtils.timeToString(new Date()));
        customerDao.save(customer);
    }

    /**
     * 删除客户
     * 
     * @param customerId
     */
    public void deleteCustomer(Long customerId) {
        customerDao.delete(customerId);
    }

    /**
     * 查询所有客户（excel导出）
     * 
     * @return
     */
    public List<CustomerModel> getAllCustomers() {
        return customerDao.find();
    }

    /**
     * excel导出客户信息
     * 
     * @return Workbook 工作文档对象
     */
    public Workbook export(String fileName, List<CustomerModel> customer) throws IOException {
        // excel格式是.xlsx
        String fileType = "xlsx";
        // 导出excel需要的数据格式
        ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
        // 导出excel第一行标题数据
        ArrayList<String> listTitle = new ArrayList<String>();
        // 存放标题顺序
        listTitle.add("客户名");
        listTitle.add("所在区域");
        listTitle.add("省份");
        listTitle.add("城市");
        listTitle.add("地址");
        listTitle.add("创建时间");
        listTitle.add("最后更新时间");
        // 将标题数据放在excel数据
        list.add(listTitle);
        for (int i = 0; i < customer.size(); i++) {
            // 存放excel内容数据
            ArrayList<String> listBody = new ArrayList<String>();
            // 存放数据顺序和存放标题顺序对应
            listBody.add(customer.get(i).getName());
            listBody.add(customer.get(i).getRegion().getName());
            listBody.add(customer.get(i).getProvince().getName());
            listBody.add(customer.get(i).getCity().getName());
            listBody.add(customer.get(i).getAddress());
            listBody.add(customer.get(i).getCreateTime());
            listBody.add(customer.get(i).getUpdateTime());
            list.add(listBody);
        }
        // 调用公共类的导出方法
        return Poi4Excel.writer(fileName, fileType, list);
    }

    /**
     * 获取所有客户信息
     * 
     * @return
     */
    public PageContainer getSelectCustomerPage(Map<String, String> params) {
        return customerDao.getSelectCustomerPage(params);
    }

    /**
     * 获取可以选择的客户信息（订单模块）
     * 
     * @return
     */
    public CustomerModel getSelectedCustomer(Long customerId) {
        return customerDao.get(customerId);
    }

    /**
     * 根据名称搜索客户
     * 
     * @param
     * @return
     */
    public List<CustomerModel> getCustomerList(String value) {
        return customerDao.getCustomerList(value);
    }
}
