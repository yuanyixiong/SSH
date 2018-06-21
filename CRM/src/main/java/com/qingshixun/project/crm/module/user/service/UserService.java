/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.user.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.MenuModel;
import com.qingshixun.project.crm.model.RoleModel;
import com.qingshixun.project.crm.model.UserModel;
import com.qingshixun.project.crm.model.UserStatus;
import com.qingshixun.project.crm.module.role.dao.RoleDao;
import com.qingshixun.project.crm.module.user.dao.UserDao;
import com.qingshixun.project.crm.security.RoleResourceRepository;

/**
 * 用户处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class UserService extends BaseService {

    // 注入角色资源处理类
    @Autowired
    private RoleResourceRepository roleResourceRepository;

    // 注入用户处理Dao
    @Autowired
    private UserDao userDao;

    // 注入角色处理Dao
    @Autowired
    private RoleDao roleDao;

    /**
     * 获取所有用户信息
     * 
     * @return
     */
    public PageContainer getUserPage(Map<String, String> params) {
        return userDao.getUserPage(params);
    }

    /**
     * 获取登录用户信息的角色信息
     * 
     * @return
     */
    public List<MenuModel> getCurrentUserMenus() {
        List<String> userRoles = Lists.newArrayList();
        // 获取登录用户的角色信息
        Set<RoleModel> userRoleModels = super.getCurrentUser().getRoles();
        for (RoleModel roleModel : userRoleModels) {
            userRoles.add(String.valueOf(roleModel.getId()));
        }
        return roleResourceRepository.getRoleMenus(userRoles);
    }

    /**
     * 获取登录用户信息的角色信息
     * 
     * @return
     */
    public UserModel getCurrentUser() {
        return super.getCurrentUser();
    }

    /**
     * 根据用户ID，获取用户信息
     * 
     * @param userId
     * @return
     */
    public UserModel getUser(String loginName) {
        UserModel userModel = userDao.getUser(loginName);
        // 加载用户角色，由于UserModel的roles的 fetch = FetchType.LAZY，这里需要提前获取用户拥有的角色
        // 防止在SimpleUserDetailsService 中调用userModel.getRoles();也现no session问题
        userModel.getRoles().size();
        return userModel;
    }

    /**
     * 根据用户ID，获取用户信息
     * 
     * @param userId
     * @return
     */
    public UserModel getUser(Long userId) {
        return userDao.get(userId);
    }

    /**
     * 删除用户
     * 
     * @param userId
     */
    public void deleteUser(Long userId) {
        userDao.delete(userId);
    }

    /**
     * 保存用户
     * 
     * @param userId
     */
    public void saveUser(UserModel user, String[] selectRoles) {
        // 设置用户初始化状态
        if ("".contains(user.getStatus().getCode())) {
            user.setStatus(UserStatus.activeStatus);
            // md5加密密码
            MessageDigestPasswordEncoder passwordEncoder = new ShaPasswordEncoder();
            user.setPassword(passwordEncoder.encodePassword(user.getPassword(), user.getLoginName()));
        }

        Set<RoleModel> roles = user.getRoles();
        roles.clear();
        // 设置用户角色信息
        for (int i = 0; i < selectRoles.length; i++) {
            RoleModel role = roleDao.get(Long.parseLong(selectRoles[i]));
            roles.add(role);
        }
        user.setRoles(roles);
        userDao.save(user);
    }

    /**
     * 删除用户
     * 
     * @param userId
     * @param plainPassword 明文密码
     */
    public void updateUserPassword(Long userId, String plainPassword) {
        UserModel user = userDao.get(userId);
        // md5加密密码
        MessageDigestPasswordEncoder passwordEncoder = new ShaPasswordEncoder();
        user.setPassword(passwordEncoder.encodePassword(plainPassword, user.getLoginName()));
        userDao.save(user);
    }

    /**
     * 修改用户状态用户
     * 
     * @param user
     */
    public void updateUserStatus(Long userId) {
        UserModel user = userDao.get(userId);
        // 如果状态是禁用的，修改用户状态为启用；如果状态是启用的，修改用户状态为禁用
        if (user.getStatus().equals(UserStatus.disabledStatus)) {
            user.setStatus(UserStatus.activeStatus);
        } else {
            user.setStatus(UserStatus.disabledStatus);
        }
        userDao.save(user);
    }

    /**
     * 获取所有用户
     * 
     * @param
     */
    public List<UserModel> getAllUsers() {
        return userDao.find();
    }

    /**
     * 获取所有启用用户
     * 
     * @param
     */
    public List<UserModel> getActiveUsers() {
        return userDao.getActiveUsers();
    }
}
