/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.security;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.qingshixun.project.crm.model.Constants;
import com.qingshixun.project.crm.model.RoleModel;
import com.qingshixun.project.crm.model.UserModel;
import com.qingshixun.project.crm.module.user.service.UserService;

/**
 * 根据用户登录名获取用户及用户授权信息
 */
public class SimpleUserDetailsService implements UserDetailsService {

    private static Log log = LogFactory.getLog(SimpleUserDetailsService.class);

    // 注入用户service
    @Autowired
    private UserService userService;

    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        log.debug("loadUserByUsername --> LoginName:" + userName);
        // 用户名转换成小写进行比较
        String loginName = userName.toLowerCase().trim();

        UserModel userModel = userService.getUser(loginName);

        // 用户不存在
        if (userModel == null) {
            throw new BadCredentialsException("errors.user.not.exist");
        }

        // 用户被禁用
        if (userModel.isDisabled()) {
            log.warn("User status is disabled --> " + loginName);
            throw new BadCredentialsException("errors.user.is.disabled");
        }

        // 用户没有任何授权，不允许使用系统
        if (userModel.getRoles() == null) {
            log.warn("User has not any role --> " + loginName);
            throw new BadCredentialsException("errors.user.hasnot.anyrole");
        }

        // 用户拥有的角色信息
        Set<RoleModel> userRoles = userModel.getRoles();

        List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
        if (userRoles != null) {
            for (RoleModel role : userRoles) {
                grantedAuthorities.add(new SimpleGrantedAuthority(role.getName().trim()));
            }
        }

        // 所有用户共有的角色
        grantedAuthorities.add(new SimpleGrantedAuthority(Constants.ROLE_EVERY_ONE));

        userModel.setGrantedAuthority(grantedAuthorities.toArray(new GrantedAuthority[grantedAuthorities.size()]));
        return userModel;
    }

}
