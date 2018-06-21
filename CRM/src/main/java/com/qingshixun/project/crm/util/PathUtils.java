/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 上传文件到服务器及删除文件工具类
 * @author QingShiXun
 * @version 1.0
 */
public class PathUtils {

    /**
     * @Description 获得项目访问地址
     * @param 参数列表
     */
    public static String getRemotePath() {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ra).getRequest();
        String scheme = request.getScheme();
        String host = request.getServerName();
        int port = request.getServerPort();
        String absPath = scheme + "://" + host + (port != 80 ? ":" + port : "");
        return absPath;
    }

    /**
     * @Description 获得项目访问地址
     * @param 参数列表
     */
    public static String getRemoteProJectPath() {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ra).getRequest();
        String scheme = request.getScheme();
        String host = request.getServerName();
        int port = request.getServerPort();
        String absPath = scheme + "://" + host + (port != 80 ? ":" + port : "") + request.getContextPath() + "/";
        return absPath;
    }

    /**
     * @Description 获得项目名称
     * @param 参数列表
     */
    public static String getProjectName() {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ra).getRequest();
        String context = request.getContextPath().replace("/", "") + "_";
        return context;
    }

    /**
     * @Description 返回用户的IP地址
     * @param 参数列表 HttpServletRequest request request对象;
     */
    public static String toIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * @Description 返回用户的IP地址
     * @param 参数列表
     */
    public static String getAuthenticatedUsername() {
        String username = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }
        return username;
    }
}
