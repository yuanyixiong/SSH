/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.model;

import java.util.Set;
import java.util.TreeSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Sets;

/**
 * 菜单实体类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Entity
@Table(name = "qsx_menu")
public class MenuModel extends BaseModel implements Comparable {

    private static final long serialVersionUID = 1L;

    // 名称
    @Column(length = 100, nullable = false)
    private String name;

    // 图标
    @Column(length = 100, nullable = false)
    private String icon;

    // url路径
    @Column(length = 100, nullable = false)
    private String url;

    // 父级菜单
    @ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.ALL })
    @JoinColumn(name = "parent_id")
    private MenuModel parent;

    // 排序号
    @Column(length = 100, nullable = true)
    private Integer indexNo;

    // 资源
    @ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
    @JoinTable(name = "qsx_menu_resource", joinColumns = @JoinColumn(name = "menuId", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "resourceId", referencedColumnName = "id"))
    @JsonIgnore
    private Set<ResourceModel> resources = Sets.newHashSet();

    // 子菜单
    @OneToMany(mappedBy = "parent", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
    @OrderBy("indexNo asc")
    @JsonIgnore
    private Set<MenuModel> children = new TreeSet<MenuModel>();

    public MenuModel(Long id) {
        this.id = id;
    }

    public MenuModel() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public MenuModel getParent() {
        return parent;
    }

    public void setParent(MenuModel parent) {
        this.parent = parent;
    }

    public Integer getIndexNo() {
        return indexNo;
    }

    public void setIndexNo(Integer indexNo) {
        this.indexNo = indexNo;
    }

    public Set<ResourceModel> getResources() {
        return resources;
    }

    public void setResources(Set<ResourceModel> resources) {
        this.resources = resources;
    }

    public Set<MenuModel> getChildren() {
        return children;
    }

    public void setChildren(Set<MenuModel> children) {
        this.children = children;
    }

    public void addChildren(MenuModel child) {
        this.children.add(child);
    }

    public int compareTo(Object o) {
        MenuModel obj = (MenuModel) o;
        if (this.getIndexNo().intValue() == obj.getIndexNo().intValue()) { // ==时，根据name排序
            return this.getName().compareTo(obj.getName());
        } else {
            return this.getIndexNo() - obj.getIndexNo();
        }
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        MenuModel other = (MenuModel) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
