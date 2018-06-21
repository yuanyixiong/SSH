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
 * 常见问题状态
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@DiscriminatorValue(value = "com.qingshixun.project.crm.model.ProblemStatus")
public class ProblemStatus extends DictionaryModel {

    private static final long serialVersionUID = 1L;

    // 草稿
    public static final ProblemStatus draftStatus = new ProblemStatus("PROB_Draft");

    // 已审阅
    public static final ProblemStatus reviewedStatus = new ProblemStatus("PROB_Reviewed");

    // 已发布
    public static final ProblemStatus publishedStatus = new ProblemStatus("PROB_Published");

    // 过期
    public static final ProblemStatus expiredStatus = new ProblemStatus("PROB_Expired");

    public ProblemStatus() {
    }

    public ProblemStatus(String code) {
        super.setCode(code);
    }
}
