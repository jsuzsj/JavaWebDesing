package cn.jsu.dao;


import cn.jsu.bean.User;

import java.sql.Connection;
import java.util.ArrayList;

public interface UserDao extends DBDao{
    //根据id获取User
    public User getById(Integer id);

    //根据账号密码查User

    public User getByPassword(String name, String pswd);

    //分页查询User
    public ArrayList<User> getByCutPage(Integer page, Integer cutnum);

    //获取条目数
    public Integer getCount();

    //添加一行数据
    public void Insert(User u);

    //删除一行数据
    public void Delete(Integer id);

    //更新一行数据
    public void Update(User u);

    //根据自定义条件查询
    public ArrayList<User> getByNameKEY(String name,String key);
}
