package online.qsx.dao.impl;

import online.qsx.dao.StudentDao;
import online.qsx.model.Student;
import org.springframework.stereotype.Repository;

@Repository("studentDaoImpl")
public class StudentDaoImpl extends DaoImpl<Student> implements StudentDao {
}
