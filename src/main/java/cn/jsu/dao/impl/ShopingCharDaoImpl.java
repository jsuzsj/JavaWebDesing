package cn.jsu.dao.impl;

import cn.jsu.bean.Shop;
import cn.jsu.bean.ShopingCar;
import cn.jsu.dao.ShopingCharDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShopingCharDaoImpl implements ShopingCharDao {
    Connection con;

    public  void close()
    {
        try {
            con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public ShopingCharDaoImpl() {
    }

    public ShopingCharDaoImpl(Connection con) {
        this.con = con;
    }

    public ShopingCar getById(Integer id) {
        ShopingCar shopingCar = new ShopingCar();
        String sql = "select * from shopingcar where id =?";
        PreparedStatement p;
        try {
            p =  con.prepareStatement(sql) ;
            p.setInt(1,id);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next())
            {
                shopingCar.setId(resultSet.getInt(1));
                shopingCar.setShopid(resultSet.getInt(2));
                shopingCar.setUid(resultSet.getInt(3));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
return shopingCar;

    }

    public ArrayList<Shop> getUserShops(ShopingCar sc) {
        //select * from shop INNER JOIN shopingcar where shopingcar.uid =2 and shop.id=shopingcar.shopid;
        ArrayList<Shop> shopArray  = new ArrayList<Shop>() ;
        String sql = "select shop.id,name,price,discount,shop.desc from shop INNER JOIN shopingcar where shopingcar.uid =? and shop.id=shopingcar.shopid";
        PreparedStatement p ;
        try {
            p = con.prepareStatement(sql);
            p.setInt(1,sc.getUid());
            ResultSet resultSet = p.executeQuery();
            while (resultSet.next())
            {
                Shop s = new Shop();
                s.setId(resultSet.getInt(1));
                s.setName(resultSet.getString(2));
                s.setPrice(resultSet.getDouble(3));
                s.setDiscount(resultSet.getDouble(4));
                s.setDesc(resultSet.getString(5));
                shopArray.add(s);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return shopArray;
    }

    public Integer getCount() {
        String sql = "select count(*) from shopingcar";
        Integer sum = null;
        PreparedStatement p ;
        try {
            p = con.prepareStatement(sql);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next())
            {
                sum = resultSet.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return sum;
    }

    public void Insert(ShopingCar u) {
        String sql = "insert into shopingcar(uid,shopid) values(?,?)";
        PreparedStatement p ;
        try {
            p = con.prepareStatement(sql);
            p.setInt(1,u.getUid());
            p.setInt(2,u.getShopid());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void Delete(ShopingCar u) {
        String sql = "delete from shopingcar where uid = ? and shopid = ?";
        PreparedStatement p ;
        try {
            p = con.prepareStatement(sql);
            p.setInt(1,u.getUid());
            p.setInt(2,u.getShopid());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
