package online.qsx.service.impl;

import online.qsx.dao.Dao;
import online.qsx.model.User;
import online.qsx.service.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("userServerImpl")
public class UserServerImpl extends ServerImpl<User> implements UserServer {
    @Autowired
    @Qualifier("userDaoImpl")
    @Override
    public void setDao(Dao dao) {
        super.dao=dao;
    }
}
