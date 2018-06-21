/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.prospective.service;

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
import com.qingshixun.project.crm.model.CustomerResource;
import com.qingshixun.project.crm.model.ProspectiveModel;
import com.qingshixun.project.crm.module.prospective.dao.ProspectiveDao;
import com.qingshixun.project.crm.util.DateUtils;
import com.qingshixun.project.crm.util.Poi4Excel;

/**
 * 潜在客户处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class ProspectiveService extends BaseService {

    // 注入潜在客户处理Dao
    @Autowired
    private ProspectiveDao prospectiveDao;

    /**
     * 获取所有潜在客户信息
     * 
     * @return
     */
    public PageContainer getProspectivePage(Map<String, String> params) {
        return prospectiveDao.getProspectivePage(params);
    }

    /**
     * 根据潜在客户ID，获取潜在客户信息
     * 
     * @param SupplierId
     * @return
     */
    public ProspectiveModel getProspective(Long prospectiveId) {
        return prospectiveDao.get(prospectiveId);
    }

    /**
     * 删除潜在客户
     * 
     * @param ProspectiveId
     */
    public void deleteProspective(Long prospectiveId) {
        prospectiveDao.delete(prospectiveId);
    }

    /**
     * 保存潜在客户
     * 
     * @param Prospective
     * @throws Exception
     */
    public void saveProspective(ProspectiveModel prospective) throws Exception {
        // 设置编码
        if ("".equals(prospective.getCode())) {
            prospective.setCode("PRS" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        prospective.setUpdateTime(DateUtils.timeToString(new Date()));
        prospectiveDao.save(prospective);
    }

    /**
     * 根据名称搜索潜在客户
     * 
     * @param
     * @return
     */
    public List<ProspectiveModel> getProspectiveList(String value) {
        return prospectiveDao.getProspectiveList(value);
    }

    /**
     * 根据名称搜索潜在客户
     * 
     * @param
     * @return
     */
    public List<Object> getProspectiveListByResource() {
        // 电话营销
        List<ProspectiveModel> list1 = prospectiveDao.getProspectiveListByResource(CustomerResource.telemarketing.getCode());

        // 既有客户
        List<ProspectiveModel> list2 = prospectiveDao.getProspectiveListByResource(CustomerResource.existing.getCode());

        // 邮件营销
        List<ProspectiveModel> list3 = prospectiveDao.getProspectiveListByResource(CustomerResource.emaimarketing.getCode());

        // 邮件营销
        List<ProspectiveModel> list4 = prospectiveDao.getProspectiveListByResource(CustomerResource.other.getCode());

        List<Object> list = new ArrayList<Object>();
        list.add(list1.size());
        list.add(list2.size());
        list.add(list3.size());
        list.add(list4.size());
        return list;
    }

    /**
     * 获取所有潜在客户
     * 
     * @param
     * @return
     */
    public List<ProspectiveModel> getProspectiveList() {
        return prospectiveDao.find();
    }

    /**
     * excel导出潜在客户
     * 
     * @return Workbook 工作文档对象
     */
    public Workbook export(String fileName, List<ProspectiveModel> prospectiveList) throws IOException {
        // excel格式是.xlsx
        String fileType = "xlsx";
        // 导出excel需要的数据格式
        ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
        // 导出excel第一行标题数据
        ArrayList<String> listTitle = new ArrayList<String>();
        // 存放标题顺序
        listTitle.add("潜在客户编号");
        listTitle.add("姓名");
        listTitle.add("手机");
        listTitle.add("来源");
        listTitle.add("状态");
        // 将标题数据放在excel数据
        list.add(listTitle);
        for (int i = 0; i < prospectiveList.size(); i++) {
            // 存放excel内容数据
            ArrayList<String> listBody = new ArrayList<String>();
            // 存放数据顺序和存放标题顺序对应
            listBody.add(prospectiveList.get(i).getCode());
            listBody.add(prospectiveList.get(i).getName());
            listBody.add(prospectiveList.get(i).getMobile());
            listBody.add(prospectiveList.get(i).getResource().getName());
            listBody.add(prospectiveList.get(i).getStatus().getName());
            list.add(listBody);
        }
        // 调用公共类的导出方法
        return Poi4Excel.writer(fileName, fileType, list);
    }
}
