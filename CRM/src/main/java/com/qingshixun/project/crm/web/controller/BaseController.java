/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.qingshixun.project.crm.util.ImageUtils;

/**
 * Controller 基类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
public abstract class BaseController {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    // 注入request
    @Autowired
    protected HttpServletRequest request;

    /**
     * 返回项目位置目录
     * @return
     */
    protected String getRealPath() {
        return request.getServletContext().getRealPath("/");
    }

    /**
     * 返回项目上下文路径
     * @return
     */
    protected String getContextPath() {
        return request.getServletContext().getContextPath();
    }

    /**
     * 返回默认的图片上传&保存路径
     * @return
     */
    protected String getImageUploadPath() {
        return getRealPath() + ImageUtils.DEFAULT_IMAGE_PATH;
    }
}
