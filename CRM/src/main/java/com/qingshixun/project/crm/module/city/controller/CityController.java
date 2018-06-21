package com.qingshixun.project.crm.module.city.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.qingshixun.project.crm.model.CityModel;
import com.qingshixun.project.crm.module.city.service.CityService;
import com.qingshixun.project.crm.web.ResponseData;

/**
 * 城市处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/city")
public class CityController {
	// 注入城市处理 Service
	@Autowired
	private CityService cityService;
	
	/**
	 * 获取城市信息列表
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list/data")
	@ResponseBody
	public ResponseData list(Model model,@RequestParam Map<String, Object> params) {
		ResponseData responseData = new ResponseData();
		List<CityModel> city = cityService.getCityList(params);
		responseData.setData(city);
		return responseData;
	}
}
