/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com 
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.region.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.model.RegionModel;
import com.qingshixun.project.crm.module.region.service.RegionService;
import com.qingshixun.project.crm.web.ResponseData;

/**
 * 区域处理 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/region")
public class RegionController {

    // 注入地区处理 Service
    @Autowired
    private RegionService regionService;

    /**
     * 获取区域信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public ResponseData list(Model model) {
        ResponseData responseData = new ResponseData();
        List<RegionModel> region = regionService.getRegns();
        responseData.setData(region);
        return responseData;
    }
}
