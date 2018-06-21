/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.issue.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.IssueModel;
import com.qingshixun.project.crm.module.issue.dao.IssueDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 问题单处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class IssueService extends BaseService {

    // 注入问题单处理Dao
    @Autowired
    private IssueDao issueDao;

    /**
     * 获取所有问题单信息
     * 
     * @return
     */
    public PageContainer getIssuePage(Map<String, String> params) {
        return issueDao.getIssuePage(params);
    }

    /**
     * 根据问题单ID，获取问题单信息
     * 
     * @param SupplierId
     * @return
     */
    public IssueModel getIssue(Long issueId) {
        return issueDao.get(issueId);
    }

    /**
     * 删除问题单
     * 
     * @param IssueId
     */
    public void deleteIssue(Long issueId) {
        issueDao.delete(issueId);
    }

    /**
     * 保存问题单
     * 
     * @param Issue
     * @throws Exception
     */
    public void saveIssue(IssueModel issue) throws Exception {
        // 设置编码
        if ("".equals(issue.getCode())) {
            issue.setCode("ISS" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        issue.setUpdateTime(DateUtils.timeToString(new Date()));
        issueDao.save(issue);
    }

    /**
     * 根据标题搜索问题单
     * 
     * @param
     * @return
     */
    public List<IssueModel> getIssueList(String value) {
        return issueDao.getIssueList(value);
    }

}
