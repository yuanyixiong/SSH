/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 *
 * All rights reserved
 *
 *****************************************************************************/

package com.qingshixun.project.crm.module.province.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.model.ProvinceModel;
import com.qingshixun.project.crm.module.province.dao.ProvinceDao;

/**
 * 省份处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class ProvinceService extends BaseService {

	// 省份处理Dao
	@Autowired
	private ProvinceDao provinceDao;

	/**
	 * 获取所有省份信息
	 * 
	 * @return
	 */
	public List<ProvinceModel> getProvinceList() {
		return provinceDao.getProvinceList();
	}

}
