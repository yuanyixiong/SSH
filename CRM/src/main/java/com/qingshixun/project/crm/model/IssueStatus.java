/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * 问题单状态
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.IssueStatus")
public class IssueStatus extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 销售中
    public static final IssueStatus opendedStatus = new IssueStatus("ISSUE_Opended");

    // 停止销售
    public static final IssueStatus processingStatus = new IssueStatus("ISSUE_Processing");

    // 停止销售
    public static final IssueStatus responseStatus = new IssueStatus("ISSUE_Response");

    // 停止销售
    public static final IssueStatus closedStatus = new IssueStatus("ISSUE_Closed");

    public IssueStatus() {
    }

    public IssueStatus(String code) {
        super.setCode(code);
    }
}
