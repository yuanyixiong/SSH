/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com 
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.province.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.model.ProvinceModel;
import com.qingshixun.project.crm.module.province.service.ProvinceService;
import com.qingshixun.project.crm.web.ResponseData;

/**
 * 省份处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/province")
public class ProvinceController {

    // 注入省份处理 Service
    @Autowired
    private ProvinceService provinceService;

    /**
     * 获取省份信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public ResponseData list(Model model) {
        ResponseData responseData = new ResponseData();
        List<ProvinceModel> province = provinceService.getProvinceList();
        responseData.setData(province);
        return responseData;
    }
}
