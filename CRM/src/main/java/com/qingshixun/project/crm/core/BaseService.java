/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.qingshixun.project.crm.model.UserModel;
import com.qingshixun.project.crm.security.SecurityHelper;

/**
 * Service 基类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
public abstract class BaseService {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 获取当前登录用户信息
	 * 
	 * @return
	 */
	protected UserModel getCurrentUser() {
		return SecurityHelper.getCurrentUser();
	}
}
