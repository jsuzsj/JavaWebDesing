package cn.jsu.dao.impl;

import cn.jsu.bean.User;
import cn.jsu.dao.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDaoImpl implements UserDao {
    Connection con ;


    public UserDaoImpl() {
    }

    public UserDaoImpl(Connection con) {
        this.con = con;
    }

    public User getById(Integer id) {
        User u =null;
        String sql = "select * from user where id = ?";
        PreparedStatement p ;

        try {
            p=con.prepareStatement(sql);
            p.setInt(1,id);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()){
                u= new User();
                u.setId(resultSet.getInt(1));
                u.setName(resultSet.getString(2));
                u.setPswd(resultSet.getString(3));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return u;
    }

    public User getByPassword(String name, String pswd) {
        User u =null;
        String sql = "select * from user where name = ? and pswd = ?";
        PreparedStatement p ;

        try {
            p=con.prepareStatement(sql);
            p.setString(1,name);
            p.setString(2,pswd);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()){
                u= new User();
                u.setId(resultSet.getInt(1));
                u.setName(resultSet.getString(2));
                u.setPswd(resultSet.getString(3));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return u;
    }

    public Integer getCount() {
        Integer sumnnum =0;
        String sql = "select count(*) from user";
        PreparedStatement p ;

        try {
            p=con.prepareStatement(sql);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()){
                sumnnum = resultSet.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return sumnnum;
    }

    public void Insert(User u) {
        String sql = " insert INTO user (name, pswd ) VALUES ( ?, ?)";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,u.getName());
            p.setString(2,u.getPswd());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void Delete(Integer id) {

        String sql = "DELETE from user where id = ?";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setInt(1,id);
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void Update(User u) {
        String sql = "UPDATE user SET name = ?,pswd =? where id = ?";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,u.getName());
            p.setString(2,u.getPswd());
            p.setInt(3,u.getId());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public ArrayList<User> getByNameKEY(String name, String key) {
        String sql = "select * from user where "+name+" =?";
        ArrayList<User> array = new ArrayList<User>() ;
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,key);
            ResultSet resultSet = p.executeQuery();
            while(resultSet.next())
            {
                User u = new User();
                u.setId(resultSet.getInt(1));
                u.setName(resultSet.getString(2));
                u.setPswd(resultSet.getString(3));
                array.add(u);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  array;
    }

    public ArrayList<User> getByCutPage(Integer page, Integer cutnum) {
        Integer pagenum = getCount();
        Integer allpagenum = pagenum/cutnum;
        Integer startat = (page-1) * cutnum;
        ArrayList<User> array = new ArrayList<User>() ;
        String sql = "SELECT * from user ORDER BY id asc LIMIT ?,?";
        PreparedStatement p ;

        try {
            p=con.prepareStatement(sql);
            p.setInt(1,startat);
            p.setInt(2,cutnum);
            ResultSet resultSet = p.executeQuery();
            while(resultSet.next()){
                User u= new User();
                u.setId(resultSet.getInt(1));
                u.setName(resultSet.getString(2));
                u.setPswd(resultSet.getString(3));
                array.add(u);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return array;
    }

    public void close()
    {
        try {
            con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
