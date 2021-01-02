package cn.jsu.junit;

import cn.jsu.bean.User;
import cn.jsu.dao.impl.UserDaoImpl;
import cn.jsu.databace.DatabaceConnection;
import org.junit.jupiter.api.Test;

public class DaoJunit {
    @Test
    public  void getUserByidTest(){
        UserDaoImpl userDao = new UserDaoImpl(new DatabaceConnection().getConection());
        userDao.getById( 1);
    }
    @Test
    public  void getUserByidPassword(){
        UserDaoImpl userDao = new UserDaoImpl(new DatabaceConnection().getConection());
        userDao.getByPassword("z","pswd");
    }
    @Test
    public void getUserCount(){
        UserDaoImpl userDao = new UserDaoImpl(new DatabaceConnection().getConection());
        userDao.getCount();

    }
    @Test
    public void getCute(){
        UserDaoImpl userDao = new UserDaoImpl(new DatabaceConnection().getConection());
        userDao.getByCutPage(1,1);

    }
    @Test
    public  void TestInsert()
    {
        User u  = new User("123","123");
        UserDaoImpl d = new UserDaoImpl(new DatabaceConnection().getConection());
        d.Insert(u);
    }
    @Test
    public  void TestDelete()
    {
        UserDaoImpl d = new UserDaoImpl(new DatabaceConnection().getConection());
        User byPassword = d.getByPassword("123", "123");
        d.Delete(byPassword.getId());
    }
}
