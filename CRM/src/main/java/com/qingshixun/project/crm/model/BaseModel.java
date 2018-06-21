/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.qingshixun.project.crm.util.DateUtils;

/**
 * 实体类基类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@MappedSuperclass
public abstract class BaseModel implements Serializable {

    private static final long serialVersionUID = 1L;

    // 实体主键（自增长）
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    // 创建时间
    @Column(nullable = true, length = 19)
    protected String createTime = DateUtils.timeToString(new Date());

    // 最后更新时间
    @Column(nullable = true, length = 19)
    protected String updateTime = DateUtils.timeToString(new Date());

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCreateTime() {
        // 如果创建时间为空直接返回创建时间，否则截取截取前19位
        if (null == createTime) {
            return createTime;
        } else {
            return createTime.substring(0, 19);
        }
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        // 如果最后更新时间为空直接返回最后更新时间时间，否则截取截取前19位
        if (null == updateTime) {
            return updateTime;
        } else {
            return updateTime.substring(0, 19);
        }
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
