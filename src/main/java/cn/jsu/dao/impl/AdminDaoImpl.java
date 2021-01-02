package cn.jsu.dao.impl;

import cn.jsu.bean.Admin;
import cn.jsu.bean.Orderfrom;
import cn.jsu.dao.AdminDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDaoImpl implements AdminDao {
    Connection con;
    public  void close()
    {
        try {
            con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public AdminDaoImpl(Connection con) {
        this.con = con;
    }

    public Admin getById(Integer id) {
        Admin admin = null;
        String sql ="select * from admin where uid = ?";
        PreparedStatement p;
        try {
            p = con.prepareStatement(sql);
            p.setInt(1, id);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next())
            {
                admin = new Admin();
                admin.setId(resultSet.getInt(1));
                admin.setUid(resultSet.getInt(2));
            }
        }
        catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return admin;
    }

    public ArrayList<Admin> getByCutPage(Integer page, Integer cutnum) {
        ArrayList<Admin> array = new ArrayList<Admin>();
        Integer startnum = (page -1 ) *cutnum;
        String sql ="select * from admin order by id asc Limit ?,?";
        PreparedStatement p;
        try {
            p = con.prepareStatement(sql);
            p.setInt(1, startnum);
            p.setInt(2,cutnum);
            ResultSet resultSet = p.executeQuery();
            while (resultSet.next())
            {
               Admin admin = new Admin();
                admin.setId(resultSet.getInt(1));
                admin.setUid(resultSet.getInt(2));
                array.add(admin);
            }
        }
        catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return array;
    }

    public Integer getCount() {
        String sql ="select count(*) from admin";
        Integer num =null;
        PreparedStatement p;
        try {
            p=con.prepareStatement(sql);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next())
            {
                num = resultSet.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return num;
    }

    public void Insert(Admin u) {
        String sql ="insert into admin(uid) values(?)";
        Integer num =null;
        PreparedStatement p;
        try {
            p=con.prepareStatement(sql);
            p.setInt(1,u.getUid());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void Delete(Integer u) {
        String sql ="delete  from admin where id = ?";
        Integer num =null;
        PreparedStatement p;
        try {
            p=con.prepareStatement(sql);
            p.setInt(1,u);
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void Update(Integer id, Admin u) {
        String sql ="update admin set uid=? where id = ?";
        Integer num =null;
        PreparedStatement p;
        try {
            p=con.prepareStatement(sql);
            p.setInt(1,u.getUid());
            p.setInt(2,id);
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
