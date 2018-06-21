/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 *****************************************************************************/
package com.qingshixun.project.crm.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import com.qingshixun.project.crm.core.BaseTransactionalJUnit4SpringContextTests;
import com.qingshixun.project.crm.model.ContactModel;
import com.qingshixun.project.crm.module.contact.service.ContactService;

/**
 * 联系人测试用例 Controller 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
@ContextConfiguration(locations = { "/applicationContext4Test.xml" })
public class ContactServiceTest extends BaseTransactionalJUnit4SpringContextTests {

    // 注入联系人service
    @Autowired
    private ContactService contactService;

    /**
     * 查询所有联系人的测试用例
     */
    @Test
    public void testGetAllContacts() throws Exception {
        List<ContactModel> contacts = contactService.getAllContacts();
        assertThat(contacts).hasSize(2);
    }

    /**
     * 添加、修改、删除联系人的测试用例
     */
    @Test
    public void testEditContact() throws Exception {
        // 添加联系人测试用例
        ContactModel contact = new ContactModel();
        contact.setName("测试联系人");
        contact.setPhone("13118890909");
        contact.setAddress("武汉洪山区");
        contact.setBirthday("2016-03-15 14:00:00");
        contact.setPosition("CEO");
        contact.setGender("男");
        contactService.saveContact(contact);
        // 断言添加联系人后联系人总数
        List<ContactModel> contacts = contactService.getAllContacts();
        assertThat(contacts).hasSize(3);

        // 修改联系人测试用例
        contact.setName("测试联系人修改");
        contactService.saveContact(contact);
        assertThat(contact.getName()).isEqualTo("测试联系人修改");

        // 删除联系人测试用例
        contactService.deleteContact(contact.getId());
        // 断言删除联系人后联系人总数
        List<ContactModel> contacts1 = contactService.getAllContacts();
        assertThat(contacts1).hasSize(2);
    }

    @Before
    public void setUp() throws Exception {
        logger.debug("Before Test...");
    }

    @After
    public void tearDown() throws Exception {
        logger.debug("After Test...");
    }
}
