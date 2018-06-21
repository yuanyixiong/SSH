/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.contact.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.crm.core.BaseService;
import com.qingshixun.project.crm.core.PageContainer;
import com.qingshixun.project.crm.model.ContactModel;
import com.qingshixun.project.crm.module.contact.dao.ContactDao;
import com.qingshixun.project.crm.util.DateUtils;

/**
 * 联系人处理 Service 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Service
@Transactional
public class ContactService extends BaseService {

    // 注入联系人处理Dao
    @Autowired
    private ContactDao contactDao;

    /**
     * 获取所有联系人信息
     * 
     * @return
     */
    public PageContainer getContacts(Map<String, String> params) {
        return contactDao.getContactPage(params);
    }

    /**
     * 根据联系人ID，获取联系人信息
     * 
     * @param customerId
     * @return
     */
    public ContactModel getContact(Long contactId) {
        return contactDao.get(contactId);
    }

    /**
     * 保存联系人
     * 
     * @param contact
     */
    public void saveContact(ContactModel contact) {
        // 设置编码
        if ("".equals(contact.getCode())) {
            contact.setCode("CON" + System.currentTimeMillis());
        }
        // 设置最后更新时间
        contact.setUpdateTime(DateUtils.timeToString(new Date()));
        contactDao.save(contact);
    }

    /**
     * 删除联系人
     * 
     * @param customerId
     */
    public void deleteContact(Long contactId) {
        contactDao.delete(contactId);
    }

    /**
     * 获取所有联系人
     * 
     * @param
     */
    public List<ContactModel> getAllContacts() {
        return contactDao.find();
    }

    /**
     * 获取所有供选择的联系人
     * 
     * @param
     */
    public PageContainer getSelectContacts(Map<String, String> params) {
        return contactDao.getSelectContactPage(params);
    }

    /**
     * 根据名称搜索联系人
     * 
     * @param
     * @return
     */
    public List<ContactModel> getContactList(String value) {
        return contactDao.getContactList(value);
    }
}
