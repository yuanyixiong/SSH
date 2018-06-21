/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.statistics.controller;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qingshixun.project.crm.model.ProspectiveModel;
import com.qingshixun.project.crm.module.prospective.service.ProspectiveService;
import com.qingshixun.project.crm.util.GarbledUtil;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 统计报表处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/statistics")
public class StatisticsController extends BaseController {

    // 注入潜在客户service
    @Autowired
    private ProspectiveService prospectiveService;

    /**
     * 进入首页
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/prospective", method = RequestMethod.GET)
    public String dashboard(Model model) {
        List<ProspectiveModel> prospectiveList = prospectiveService.getProspectiveList();
        List<Object> lineValues = prospectiveService.getProspectiveListByResource();

        // 返回到页面的数据
        model.addAttribute("lineValues", lineValues);
        model.addAttribute("barValues", lineValues);

        model.addAttribute("prospectiveList", prospectiveList);
        // 转向（forward）前端页面，文件：/WEB-INF/views/dashboard/dashboard.jsp
        return "/statistics/prospective";
    }

    /**
     * 导出所潜在客户到excel
     * 
     * @param fileName 文件名称
     * 
     * @return
     */
    @RequestMapping(value = "/doExport/{fileName}", method = RequestMethod.GET)
    public void doExport(Model model, @PathVariable String fileName, HttpServletResponse response) {
        try {
            String value = "";
            // 如果乱码
            if (GarbledUtil.isMessyCode(fileName)) {
                value = fileName;
            } else {
                value = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
            }
            // 获取所有需要导出的客户信息
            List<ProspectiveModel> prospectiveList = prospectiveService.getProspectiveList();
            // 获取工作文档对象
            Workbook wb = prospectiveService.export(fileName, prospectiveList);
            // 设置发送到客户端的响应的内容类型
            response.setContentType("application/vnd.ms-excel");
            // 设置下载文件名称
            response.setHeader("Content-disposition", "attachment;filename=" + value + ".xlsx");
            // 获取输出流
            OutputStream ouputStream = new BufferedOutputStream(response.getOutputStream());
            // 下载文件(写输出流)
            wb.write(ouputStream);
            // 刷新流
            ouputStream.flush();
            // 关闭流
            ouputStream.close();
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }
}
