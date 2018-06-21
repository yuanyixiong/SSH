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
 * 问题单优先级
 * 
 * @author QingShiXun
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.IssuePriority")
public class IssuePriority extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 低
    public static final IssuePriority lowStatus = new IssuePriority("ISSUE_Low");

    // 一般
    public static final IssuePriority commonStatus = new IssuePriority("ISSUE_Common");

    // 高
    public static final IssuePriority hignStatus = new IssuePriority("ISSUE_Hign");

    // 紧急
    public static final IssuePriority urgentStatus = new IssuePriority("ISSUE_Urgent");

    public IssuePriority() {
    }

    public IssuePriority(String code) {
        super.setCode(code);
    }
}
