package online.qsx.dao.impl;

import online.qsx.dao.Dao;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.List;

public class DaoImpl<T> implements Dao<T> {

    @Autowired
    private BaseDao baseDao;

    @Override
    public List<T> query(T t, Class className) {
        return (List<T>) baseDao.getHibernateTemplate().find("from " + className.getSimpleName());
    }

    @Override
    public T queryObjectById(Serializable id, Class className) {
        return (T) baseDao.getHibernateTemplate().get(className, id);
    }

    @Override
    public void save(T t) {
        baseDao.getHibernateTemplate().save(t);
    }

    @Override
    public void delete(T t) {
        baseDao.getHibernateTemplate().delete(t);
    }

    @Override
    public void edit(T t) {
        baseDao.getHibernateTemplate().update(t);
    }
}
