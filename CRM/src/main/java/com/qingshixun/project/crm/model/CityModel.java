/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 城市实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_city")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class CityModel implements Serializable {

    private static final long serialVersionUID = 1L;

    // 城市编码
    @Id
    @Column
    private String code;

    // 城市名称
    @Column
    private String name;

    // 所属省份
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "province_code")
    @JsonIgnore
    private ProvinceModel province;

    public CityModel() {
    }

    public CityModel(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ProvinceModel getProvince() {
        return province;
    }

    public void setProvince(ProvinceModel province) {
        this.province = province;
    }

    @Override
    public String toString() {
        return "[\"" + code + "\",\"" + name + "\"]";
    }

}
