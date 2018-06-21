/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/

package com.qingshixun.project.crm.model;

import java.util.List;

/**
 * 菜单树 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
public class ResourceTree {
    // id
    private String id;
    // 内容
    private String text;
    // 子树
    private List<ResourceTree> children;
    // 状态
    private State state;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<ResourceTree> getChildren() {
        return children;
    }

    public void setChildren(List<ResourceTree> children) {
        this.children = children;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

}
