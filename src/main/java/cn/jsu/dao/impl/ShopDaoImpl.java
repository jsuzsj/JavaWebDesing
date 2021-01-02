package cn.jsu.dao.impl;

import cn.jsu.bean.Shop;
import cn.jsu.bean.User;
import cn.jsu.dao.ShopDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShopDaoImpl implements ShopDao {
    Connection con;


    public ShopDaoImpl() {
    }

    public ShopDaoImpl(Connection con) {
        this.con = con;
    }

    public Shop getById(Integer id) {
        Shop u =null;
        String sql = "select * from shop where id = ?";
        PreparedStatement p ;

        try {
            p=con.prepareStatement(sql);
            p.setInt(1,id);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()){
                u= new Shop();
                u.setId(resultSet.getInt(1));
                u.setName(resultSet.getString(2));
                u.setPrice(resultSet.getDouble(3));
                u.setDiscount(resultSet.getDouble(4));
                u.setDesc(resultSet.getString(5));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return u;
    }

    public ArrayList<Shop> getByCutPage(Integer page, Integer cutnum) {
        Integer pagenum = getCount();
        Integer allpagenum = pagenum/cutnum;
        Integer startat = (page-1) * cutnum;
        ArrayList<Shop> array = new ArrayList<Shop>() ;
        String sql = "SELECT * from shop ORDER BY id asc LIMIT ?,?";
        PreparedStatement p ;

        try {
            p=con.prepareStatement(sql);
            p.setInt(1,startat);
            p.setInt(2,cutnum);
            ResultSet resultSet = p.executeQuery();
            while(resultSet.next()){
                Shop u= new Shop();
                u.setId(resultSet.getInt(1));
                u.setName(resultSet.getString(2));
                u.setPrice(resultSet.getDouble(3));
                u.setDiscount(resultSet.getDouble(4));
                u.setDesc(resultSet.getString(5));
                array.add(u);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return array;
    }

    public Integer getCount() {
        Integer sumnnum =0;
        String sql = "select count(*) from shop";
        PreparedStatement p;

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

    public void Insert(Shop s) {
        String sql = " insert INTO shop (name,price,discount,shop.desc) VALUES ( ?, ?, ?, ?)";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,s.getName());
            p.setDouble(2,s.getPrice());
            p.setDouble(3,s.getDiscount());
            p.setString(4,s.getDesc());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void Delete(Shop s) {

        String sql = "DELETE from shop where id = ? or name = ?";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setInt(1,s.getId());
            p.setString(2,s.getName());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public void Delete(Integer id) {

        String sql = "DELETE from shop where id = ?";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setInt(1,id);
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void Update(Integer id,Shop s) {
        String sql = "UPDATE shop SET name = ?,price =?,discount=?,shop.desc=? where id = ?";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,s.getName());
            p.setDouble(2,s.getPrice());
            p.setDouble(3,s.getDiscount());
            p.setString(4,s.getDesc());
            p.setInt(5,id);
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
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
