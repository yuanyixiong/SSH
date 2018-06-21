package online.qsx.action;

import online.qsx.model.User;
import online.qsx.service.Server;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

//http://localhost:80/userAction!list
//http://localhost:80/userAction!do_delete
@Controller("userAction")
public class UserAction extends BaseAction<User> {
    @Override
    public String list() {
        super.objects = super.server.query(super.object, User.class);
        return "list";
    }

    @Override
    public String to_edit() {
        super.object = super.server.queryObjectById(object.getId(), User.class);
        return "to_edit";
    }

    @Autowired
    @Qualifier("userServerImpl")
    @Override
    public void setServer(Server<User> server) {
        super.server = server;
    }
}
