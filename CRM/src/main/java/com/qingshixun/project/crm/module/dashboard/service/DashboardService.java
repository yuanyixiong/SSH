/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.dashboard.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.module.dashboard.dao.DashboardDao;

/**
 * 首页处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class DashboardService extends BaseService {

    // 注入首页处理Dao
    @Autowired
    private DashboardDao dashboardDao;

    /**
     * 获取折线图和柱状图数据
     * 
     * @return
     */
    public List<Object[]> getLineDatas() {
        return dashboardDao.getLineDatas();
    }

    /**
     * 获取饼图数据
     * 
     * @return
     */
    public List<Object[]> getPieDatas() {
        return dashboardDao.getPieDatas();
    }

    /**
     * 获取地图数据
     * 
     * @return
     */
    public String getChinaMapData() {
        List<Object[]> list = dashboardDao.getChinaMapData();
        StringBuffer sb = new StringBuffer("");
        // 拼接字符串
        for (Object[] map : list) {
            sb.append("{'hc-key':'").append(map[1]).append("','value':").append(map[0]).append("},").append("\n");
        }
        // 去除最后的逗号
        String data = sb.deleteCharAt(sb.length() - 1) + "";
        return data;
    }

    /**
     * 获取本月销售数据
     * 
     * @return
     */
    public List<Object[]> getOrderDatas() {
        return dashboardDao.getOrderDatas();
    }

    /**
     * 获取当天销售数据
     * 
     * @return
     */
    public List<Object[]> getCustomersOfDay() {
        return dashboardDao.getCustomersOfDay();
    }

    /**
     * 获取本月销售数据
     * 
     * @return
     */
    public List<Object[]> getCustomersOfMonth() {
        return dashboardDao.getCustomersOfMonth();
    }
}
