package online.qsx.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

@Component
public class BaseDao extends HibernateDaoSupport {
    @Autowired
    public final void setSF(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }
}
