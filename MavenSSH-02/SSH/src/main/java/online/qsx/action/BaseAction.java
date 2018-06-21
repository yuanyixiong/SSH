package online.qsx.action;

import com.opensymphony.xwork2.ActionSupport;
import online.qsx.service.Server;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 通用的控制器工具
 * @param <T>
 */
public abstract class BaseAction<T> extends ActionSupport {

    /**
     * 模块对象
     */
    protected T object;

    /**
     * 模块对象集合
     */
    protected List<T> objects;

    /**
     * 模块服务
     */
    protected Server<T> server;

    /**
     * 指定注入那个服务
     * @param server
     */
    public abstract void setServer(Server<T> server);

    /**
     * 查看所有
     * @return
     */
    public abstract String list();

    /**
     * 去添加界面
     * @return
     */
    public  String to_save(){
        return "to_save";
    }

    /**
     * 执行添加
     * @return
     */
    public  String do_save(){
        server.save(object);
        return "do_save";
    }

    /**
     * 根据编号查看一个
     * @return
     */
    public abstract String to_edit();

    /**
     * 执行修改
     * @return
     */
    public  String do_edit(){
        server.edit(object);
        return "do_edit";
    }

    /**
     * 执行删除
     * @return
     */
    public  String do_delete(){
        server.delete(object);
        return "do_delete";
    }

    public T getObject() {
        return object;
    }

    public void setObject(T object) {
        this.object = object;
    }

    public List<T> getObjects() {
        return objects;
    }

    public void setObjects(List<T> objects) {
        this.objects = objects;
    }
}
