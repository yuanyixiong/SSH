/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/
package com.qingshixun.project.crm.security;

import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;

import com.qingshixun.project.crm.model.UserModel;

/**
 * 安全助手类
 */
public class SecurityHelper {

    // 密码加密类（Spring Security框架提供）
    private static MessageDigestPasswordEncoder passwordEncoder = new ShaPasswordEncoder();

    // 对用户登录密码进行加密
    public static String encodePassword(String password, String salt) {
        return passwordEncoder.encodePassword(password, salt);
    }

    // 获取当前登录用户信息
    public static UserModel getCurrentUser() {
        return (UserModel) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

    public static void main(String[] args) {
        // 生成用户密码（测试用）
        System.out.println(encodePassword("admin", "admin"));
    }
}
