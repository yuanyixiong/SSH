/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.module.problem.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ProblemModel;
import com.qingshixun.project.crm.module.problem.service.ProblemService;
import com.qingshixun.project.crm.web.ResponseData;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 常见问答 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/problem")
public class ProblemController extends BaseController {

    // 注入常见问答处理 Service
    @Autowired
    private ProblemService problemService;

    /**
     * 进入常见问答列表页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String problemPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/problem/list.jsp
        return "/problem/list";
    }

    /**
     * 进入常见问答编辑页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/form/{problemId}")
    public String problemForm(Model model, @PathVariable Long problemId) {
        ProblemModel problem = null;
        if (0L == problemId) {
            problem = new ProblemModel();
        } else {
            problem = problemService.getProblem(problemId);
        }
        model.addAttribute(problem);

        // 转向（forward）前端页面，文件：/WEB-INF/views/problem/form.jsp
        return "/problem/form";
    }

    /**
     * 获取所有常见问答信息列表
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/data")
    @ResponseBody
    public PageContainer problemList(Model model, @RequestParam Map<String, String> params) {
        PageContainer product = problemService.getProblemPage(params);
        return product;
    }

    /**
     * 保存常见问答
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData problemSave(Model model, @ModelAttribute("problem") ProblemModel problem) {
        ResponseData responseData = new ResponseData();
        try {
            // 执行保存常见问答
            problemService.saveProblem(problem);
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 删除常见问答
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete/{problemId}")
    @ResponseBody
    public ResponseData problemDelete(Model model, @PathVariable Long problemId) {
        logger.debug("delete problem:" + problemId);
        ResponseData responseData = new ResponseData();
        try {
            // 根据常见问答Id，删除常见问答
            problemService.deleteProblem(problemId);
        } catch (org.hibernate.exception.ConstraintViolationException e) {
            responseData.setStatus("3");
            logger.error(e.getMessage());
        } catch (Exception e) {
            // 异常处理
            logger.error(e.getMessage(), e);
            responseData.setError(e.getMessage());
        }
        // 返回处理结果（json 格式）
        return responseData;
    }

    /**
     * 进入产品选择页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/product")
    public String productPage(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/problem/product.jsp
        return "/problem/product";
    }
}
