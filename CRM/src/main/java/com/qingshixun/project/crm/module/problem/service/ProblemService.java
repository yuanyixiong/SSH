/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.problem.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ProblemModel;
import com.qingshixun.project.crm.module.problem.dao.ProblemDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 常见问答处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class ProblemService extends BaseService {

    // 注入常见问答处理Dao
    @Autowired
    private ProblemDao problemDao;

    /**
     * 获取所有常见问答信息
     * 
     * @return
     */
    public PageContainer getProblemPage(Map<String, String> params) {
        return problemDao.getProblemPage(params);
    }

    /**
     * 根据常见问答ID，获取常见问答信息
     * 
     * @param SupplierId
     * @return
     */
    public ProblemModel getProblem(Long problemId) {
        return problemDao.get(problemId);
    }

    /**
     * 删除常见问答
     * 
     * @param problemId
     */
    public void deleteProblem(Long problemId) {
        problemDao.delete(problemId);
    }

    /**
     * 保存常见问答
     * 
     * @param problem
     * @throws Exception
     */
    public void saveProblem(ProblemModel problem) throws Exception {
        // 设置编码
        if ("".equals(problem.getCode())) {
            problem.setCode("PRO" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        problem.setUpdateTime(DateUtils.timeToString(new Date()));
        problemDao.save(problem);
    }

    /**
     * 根据问题搜索常见问答
     * 
     * @param
     * @return
     */
    public List<ProblemModel> getProblemList(String value) {
        return problemDao.getProblemList(value);
    }
}
