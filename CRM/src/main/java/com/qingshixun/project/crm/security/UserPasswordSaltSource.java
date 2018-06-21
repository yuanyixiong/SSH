/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.security;

import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * 用户登录密码混淆类
 */
public class UserPasswordSaltSource implements SaltSource {

    @Override
    public Object getSalt(UserDetails user) {
        return user.getUsername();
    }
}
