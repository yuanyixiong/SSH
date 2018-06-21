/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.dashboard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qingshixun.project.crm.model.RegionModel;
import com.qingshixun.project.crm.module.dashboard.service.DashboardService;
import com.qingshixun.project.crm.module.region.service.RegionService;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 首页处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/dashboard")
public class DashboardController extends BaseController {

    // 首页处理service
    @Autowired
    private DashboardService dashboardService;

    // 区域处理service
    @Autowired
    private RegionService regionService;

    /**
     * 进入首页
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String dashboard(Model model) {
        List<Object[]> list = dashboardService.getLineDatas();

        // 折线图数据(统计今年每个月的销售总额)
        List<Object> lineValues = new ArrayList<Object>();
        //柱状图数据(统计今天每个月产品销售数量)
        List<Object> barValues = new ArrayList<Object>();

        // 遍历出所有数据放折线图map
        Map<Object, Object> lineMap = new HashMap<Object, Object>();
        for (int j = 0; j < list.size(); j++) {
            lineMap.put(list.get(j)[2], list.get(j)[0]);
        }

        // 遍历出所有数据放柱状图map
        Map<Object, Object> barMap = new HashMap<Object, Object>();
        for (int k = 0; k < list.size(); k++) {
            barMap.put(list.get(k)[2], list.get(k)[1]);
        }

        // 遍历十二个月的数据
        for (int i = 1; i <= 12; i++) {
            // 如果数据库中此月份有数据则用数据库数据，否则数据为0
            if (null != lineMap.get(i)) {
                lineValues.add(lineMap.get(i));
                barValues.add(barMap.get(i));
            } else {
                lineValues.add(0);
                barValues.add(0);
            }
        }

        //饼状图数据
        List<Object[]> pieList = dashboardService.getPieDatas();
        // 饼图数据(统计各个区域客户数量)
        List<Object> pieNames = new ArrayList<Object>();
        List<Object> pieValues = new ArrayList<Object>();

        // 遍历出所有数据放饼状图map
        Map<String, Object> pieMap = new HashMap<String, Object>();
        for (int i = 0; i < pieList.size(); i++) {
            pieMap.put(pieList.get(i)[1].toString(), pieList.get(i)[0]);
        }

        // 获取区域信息列表
        List<RegionModel> regionList = regionService.getRegns();
        for (int i = 0; i < regionList.size(); i++) {
            if (null != pieMap.get(regionList.get(i).getId().toString())) {
                pieNames.add("'" + regionList.get(i).getName() + "'");
                pieValues.add(pieMap.get(regionList.get(i).getId().toString()));
            } else {
                pieNames.add("'" + regionList.get(i).getName() + "'");
                pieValues.add(0);
            }
        }

        // 地图数据
        String data = dashboardService.getChinaMapData();

        // 本月销售数据
        List<Object[]> orderList = dashboardService.getOrderDatas();

        // 今天新增客户数量
        List<Object[]> customerList = dashboardService.getCustomersOfDay();

        // 本月新增客户数量
        List<Object[]> customersList = dashboardService.getCustomersOfMonth();

        // 返回到页面的数据
        model.addAttribute("lineValues", lineValues);
        model.addAttribute("barValues", barValues);
        model.addAttribute("pieNames", pieNames);
        model.addAttribute("pieValues", pieValues);
        model.addAttribute("data", data);
        model.addAttribute("amount", orderList.get(0)[0]);
        model.addAttribute("quantity", orderList.get(0)[1]);
        model.addAttribute("customer", customerList.get(0)[0]);
        model.addAttribute("customers", customersList.get(0)[0]);
        // 转向（forward）前端页面，文件：/WEB-INF/views/dashboard/dashboard.jsp
        return "/dashboard/dashboard";
    }

}
