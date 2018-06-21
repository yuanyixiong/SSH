package online.qsx.service.impl;

import online.qsx.dao.Dao;
import online.qsx.model.Student;
import online.qsx.model.User;
import online.qsx.service.StudentServer;
import online.qsx.service.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("studentServerImpl")
public class StudentServerImpl extends ServerImpl<Student> implements StudentServer {

    @Autowired
    @Qualifier("studentDaoImpl")
    @Override
    public void setDao(Dao dao) {
        super.dao=dao;
    }
}
