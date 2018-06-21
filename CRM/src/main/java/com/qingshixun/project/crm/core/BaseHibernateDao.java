/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.core;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

/**
 * HiberanteDao基类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
public class BaseHibernateDao<T, PK extends Serializable> {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    protected SessionFactory sessionFactory;

    protected Class<T> entityClass;

    @SuppressWarnings("unchecked")
    public BaseHibernateDao() {
        this.entityClass = getSuperClassGenricType(getClass());
    }

    /**
     * 获取当前Hibernate SessionFactory
     * 
     * @return
     */
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    /**
     * 获取当前Hibernate Session
     * 
     * @return
     */
    public Session getSession() {
        Session session = sessionFactory.getCurrentSession();
        return session;
    }

    public List<Object[]> queryBySql(String sql) {
        @SuppressWarnings("unchecked")
        List<Object[]> list = getSession().createSQLQuery(sql).list();
        return list;
    }

    /**
     * 保存新增或修改实体对象.
     */
    public void save(final T entity) {
        Assert.notNull(entity, "Entity不允许为空");
        getSession().saveOrUpdate(entity);
        getSession().flush();
        logger.debug("save entity success: ", entity);
    }

    /**
     * 删除实体对象.
     */
    public void delete(final T entity) {
        Assert.notNull(entity, "Entity不允许为空！");
        getSession().delete(entity);
        getSession().flush();
        logger.debug("delete entity success: ", entity);
    }

    /**
     * 根据实体id删除对象.
     */
    public void delete(final PK id) {
        Assert.notNull(id, "id不允许为空！");
        delete(get(id));
        logger.debug("delete entity success,id is :", entityClass.getSimpleName(), id);
    }

    /**
     * 根据实体id获取对象.
     */
    public T get(final PK id) {
        Assert.notNull(id, "id不允许为空！");
        logger.debug("get entity by id: ", id);
        return (T) getSession().get(entityClass, id);
    }

    /**
     * 获取全部对象.
     */
    public List<T> getAll() {
        Criteria criteria = getSession().createCriteria(entityClass);
        logger.debug("get all entity!");
        return criteria.list();
    }

    public List<T> find(final Criterion... criterions) {
        return createCriteria(criterions).list();
    }

    public List<T> findList(final Criteria criteria) {
        return criteria.list();
    }

    /**
     * 根据Criteria查询唯一对象.
     * 
     * @param criterions 数量可变的Criterion.
     */
    public T findUnique(final Criterion... criterions) {
        return (T) createCriteria(criterions).uniqueResult();
    }

    /**
     * 根据指定实体属性，查询数据
     * 
     * @param propertyName
     * @param value
     * @return
     */
    public Criterion createCriterion(final String propertyName, final Object value) {
        if (value == null) {
            return Restrictions.isNull(propertyName);
        } else {
            return Restrictions.eq(propertyName, value);
        }
    }

    /**
     * 根据指定实体属性，查询数据
     * 
     * @param propertyName
     * @param value
     * @return
     */
    public Criterion createGtCriterion(final String propertyName, final Object value) {
        if (value == null) {
            return Restrictions.isNull(propertyName);
        } else {
            return Restrictions.gt(propertyName, value);
        }
    }

    /**
     * 根据指定实体属性，查询数据
     * 
     * @param propertyName
     * @param value
     * @return
     */
    public Criterion createNotInCriterion(final String propertyName, final Collection<Long> values) {
        if (values == null) {
            return Restrictions.isNull(propertyName);
        } else {
            return Restrictions.not(Restrictions.in(propertyName, values));
        }
    }

    /**
     * 根据指定实体属性，查询数据
     * 
     * @param propertyName
     * @param value
     * @return
     */
    public Criterion createInCriterion(final String propertyName, final Object[] values) {
        if (values == null) {
            return Restrictions.isNull(propertyName);
        } else {
            return Restrictions.in(propertyName, values);
        }
    }

    /**
     * 根据指定实体属性，查询数据
     * 
     * @param propertyName
     * @param value
     * @return
     */
    public Criterion createLikeCriterion(final String propertyName, final Object value) {
        if (value == null) {
            return Restrictions.isNull(propertyName);
        } else {
            return Restrictions.ilike(propertyName, value);
        }
    }

    /**
     * 根据指定条件（Criterion），查询数据
     * 
     * @param criterions
     * @return
     */
    public Criteria createCriteria(final Criterion... criterions) {
        Criteria criteria = getSession().createCriteria(entityClass);
        for (Criterion c : criterions) {
            criteria.add(c);
        }
        return criteria;
    }

    /**
     * 通过反射, 获得定义Class时声明的父类的泛型参数的类型. 如无法找到, 返回Object.class.
     */
    public Class getSuperClassGenricType(final Class clazz) {
        Type genType = clazz.getGenericSuperclass();
        if (!(genType instanceof ParameterizedType)) {
            logger.warn(clazz.getSimpleName() + "'s superclass not ParameterizedType");
            return Object.class;
        }

        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        return (Class) params[0];
    }

    /**
     * 通用数据分页处理
     * 
     * @return page 分页对象
     */
    public PageContainer getDataPage(Map<String, String> params, final Criterion... criterions) {
        Criteria criteria = createCriteria(criterions);
        // 返回map需包含dataTable需要的参数
        PageContainer page = new PageContainer();
        // 数据记录总数
        int totalSize = criteria.list().size();
        page.setiTotalRecords(totalSize);
        page.setiTotalDisplayRecords(totalSize);
        // 分页处理,获取数据的游标（ cursor ）开始位置
        criteria.setFirstResult(Integer.parseInt(params.get("start").toString()));
        // 获取数据长度，即：记录数量
        criteria.setMaxResults(Integer.parseInt(params.get("length").toString()));

        Map<String, String> orderMap = parseColumnOrder(params);
        // 排序处理
        for (Map.Entry<String, String> entry : orderMap.entrySet()) {
            String orderColumn = entry.getKey();
            // 解决Hibernate中对象级联的排序问题，如ContactModel中的category.name
            int index = orderColumn.indexOf(".");
            if (index > 0) {
                String parentPropertyName = orderColumn.substring(0, index);
                criteria.createAlias(parentPropertyName, parentPropertyName, JoinType.LEFT_OUTER_JOIN);
            }

            // DESC 表示按倒序排序(即：从大到小排序)
            // ACS 表示按正序排序(即：从小到大排序)
            if (entry.getValue().equals("asc")) {
                criteria.addOrder(Order.asc(orderColumn));
            } else {
                criteria.addOrder(Order.desc(orderColumn));
            }
        }
        // 获取到的查询数据对象列表
        page.setData(criteria.list());
        return page;
    }

    /**
     * 解析排序字段信息
     * @param params
     * @return
     */
    private Map<String, String> parseColumnOrder(Map<String, String> params) {
        int columnNumber = Integer.parseInt(params.get("columnNumber"));
        // 1.定义返回排序信息map
        Map<String, String> columnOrderMap = new HashMap<String, String>();
        // 2.获取实体字段（按照实体字段顺序返回显示）
        for (int i = 0; i < columnNumber; i++) {
            // 3.如果某个字段是排序字段
            if (null != params.get("order[" + i + "][column]")) {
                String orderMethod = params.get("order[" + i + "][dir]").toString();
                // 4.map中放排序字段名称和排序方式
                columnOrderMap.put(params.get("columns[" + params.get("order[" + i + "][column]") + "][data]").toString(), orderMethod);
            }
        }
        return columnOrderMap;
    }
}
