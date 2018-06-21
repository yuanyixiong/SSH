package online.qsx.dao.impl;

import online.qsx.dao.UserDao;
import online.qsx.model.User;
import org.springframework.stereotype.Repository;

@Repository("userDaoImpl")
public class UserDaoImpl extends DaoImpl<User> implements UserDao {
}
