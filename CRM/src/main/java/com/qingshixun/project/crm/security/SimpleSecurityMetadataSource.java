/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.model.Constants;
import com.qingshixun.project.crm.model.ResourceModel;

/**
 * 用户自行实现从数据库或其它地方查询URL-授权关系定义.
 */
@Service
public class SimpleSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    private static Log log = LogFactory.getLog(SimpleUserDetailsService.class);

    @Resource
    private RoleResourceRepository roleResourceRepository;

    //按照 Spring Security 要求定义角色与权限资源的映射关系
    private static Map<String, Collection<ConfigAttribute>> configAttributesMap = new HashMap<String, Collection<ConfigAttribute>>();

    /**
     * 初始化时自动调用() init-method="loadResourceDefine"
     * 
     * @throws Exception
     */
    public void loadResourceDefine() throws Exception {
        if (!configAttributesMap.isEmpty()) {
            return;
        }
        //首先清除原资源映射配置信息
        configAttributesMap.clear();

        //获取所有角色与权限资源映射Map
        Map<String, List<ResourceModel>> roleResources = roleResourceRepository.getRoleResources();
        //对角色所拥有的资源信息进行遍历
        for (Map.Entry<String, List<ResourceModel>> entry : roleResources.entrySet()) {
            for (ResourceModel resource : entry.getValue()) {
                log.debug("Resource config --> " + resource + "/role:" + entry.getKey());
                if (configAttributesMap.containsKey(resource.getUrl())) {
                    configAttributesMap.get(resource.getUrl()).add(new SecurityConfig(entry.getKey()));
                } else {
                    Collection<ConfigAttribute> configAttributes = new ArrayList<ConfigAttribute>();
                    ConfigAttribute configAttribute = new SecurityConfig(entry.getKey());
                    configAttributes.add(configAttribute);
                    configAttributesMap.put(resource.getUrl(), configAttributes);
                }
            }
        }

        // 所有人都拥有的权限
        addResourceDefine("/index", Constants.ROLE_EVERY_ONE);
    }

    private void addResourceDefine(String resource, String roleName) {
        Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
        ConfigAttribute ca = new SecurityConfig(roleName);
        atts.add(ca);
        configAttributesMap.put(resource, atts);
    }

    //    public void updateResourceDefine(Set<String> resources, String roleName) {
    //        for (Map.Entry<String, Collection<ConfigAttribute>> entry : configAttributesMap.entrySet()) {
    //            // 包含角色，但不包含资源，则删除角色
    //            if (entry.getValue().contains(new SecurityConfig(roleName)) && !resources.contains(entry.getKey())) {
    //                entry.getValue().remove(new SecurityConfig(roleName));
    //                // 包含资源，但不包含角色，则添加角色
    //            } else if (!entry.getValue().contains(new SecurityConfig(roleName)) && resources.contains(entry.getKey())) {
    //                entry.getValue().add(new SecurityConfig(roleName));
    //            }
    //        }
    //    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        Set<ConfigAttribute> allAttributes = new HashSet<ConfigAttribute>();
        for (Map.Entry<String, Collection<ConfigAttribute>> entry : configAttributesMap.entrySet()) {
            allAttributes.addAll(entry.getValue());
        }
        return allAttributes;
    }

    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        FilterInvocation filterInvocation = (FilterInvocation) object;
        for (Map.Entry<String, Collection<ConfigAttribute>> entry : configAttributesMap.entrySet()) {
            String resourceUrl = entry.getKey();

            RequestMatcher requestMatcher = new AntPathRequestMatcher(resourceUrl);
            if (requestMatcher.matches(filterInvocation.getHttpRequest())) {
                return configAttributesMap.get(resourceUrl);
            }
        }
        return null;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return FilterInvocation.class.isAssignableFrom(clazz);
    }
}
