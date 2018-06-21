package online.qsx.action;

import online.qsx.model.Student;
import online.qsx.model.User;
import online.qsx.service.Server;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

//http://localhost:80/studentAction!list
//http://localhost:80/studentAction!do_delete
@Controller("studentAction")
public class StudentAction extends  BaseAction<Student> {
    @Override
    public String list() {
        super.objects=super.server.query(super.object,Student.class);
        return "list";
    }

    @Override
    public String to_edit() {
        super.object=super.server.queryObjectById(object.getId(),Student.class);
        return "to_edit";
    }

    @Autowired
    @Qualifier("studentServerImpl")
    @Override
    public void setServer(Server<Student> server) {
        super.server=server;
    }
}
