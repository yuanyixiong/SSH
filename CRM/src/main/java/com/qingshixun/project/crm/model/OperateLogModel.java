/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 操作日志实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */

@Entity
@Table(name = "qsx_operate_log")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class OperateLogModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    public enum OperateLogResult {
        Success, Fail
    }

    /**
     * 操作员
     */
    @Column(length = 60, nullable = false)
    private String userCode;

    /**
     * 操作地点（目前为主机IP）
     */
    @Column
    private String host;

    /**
     * 操作名称
     */
    @Column
    private String name;

    /**
     * 操作行为
     */
    @Column
    private String action;

    /**
     * 操作目标
     */
    @Column
    private String target;

    /**
     * 操作结果
     * 
     */
    @Column(length = 10, nullable = false)
    private String result = OperateLogResult.Success.name();

    /**
     * 操作Context
     */
    @Column
    private String context;

    /**
     * 操作耗时
     */
    @Column
    private long timeConsume;

    /**
     * 备注
     */
    @Column(length = 2000)
    private String memo;

    @Transient
    private String resultView;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public long getTimeConsume() {
        return timeConsume;
    }

    public void setTimeConsume(long timeConsume) {
        this.timeConsume = timeConsume;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getResultView() {
        if (this.result.equalsIgnoreCase(OperateLogResult.Success.name())) {
            return "<span class='label label-success'>" + this.result + "</span>";
        } else {
            return "<span class='label label-danger'>" + this.result + "</span>";
        }
    }

    public void setResultView(String resultView) {
        this.resultView = resultView;
    }

}
