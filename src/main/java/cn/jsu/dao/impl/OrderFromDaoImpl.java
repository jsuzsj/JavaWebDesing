package cn.jsu.dao.impl;

import cn.jsu.bean.Orderfrom;
import cn.jsu.bean.Shop;
import cn.jsu.dao.OrderFromDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderFromDaoImpl implements OrderFromDao {
    Connection con;

    public  void close()
    {
        try {
            con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public OrderFromDaoImpl(Connection con) {
        this.con = con;
    }

    public Orderfrom getById(Integer id) {
        Orderfrom or =null;
        String sql = "select * from orderfrom where id = ?";
        PreparedStatement p ;
        try {
            p = con.prepareStatement(sql);

            p.setInt(1, id);
            ResultSet resultSet = p.executeQuery();
            if (resultSet.next()) {
                or = new Orderfrom();
                or.setId(resultSet.getInt(1));
                or.setName(resultSet.getString(2));
                or.setPhone(resultSet.getString(3));
               or.setCity(resultSet.getString(4));
                or.setMoreadd(resultSet.getString(5));
                or.setEmail(resultSet.getString(6));
                or.setDesc(resultSet.getString(7));
                or.setTotalprice(resultSet.getDouble(8));
                or.setTransportprice(resultSet.getDouble(9));
                or.setType(resultSet.getInt(10));
            }
        }catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        return or;
    }

    public ArrayList<Orderfrom> getByCutPage(Integer page, Integer cutnum) {
        ArrayList<Orderfrom> array = null;
        Orderfrom or =null;
        Integer pagenum = getCount();
        Integer startPage = (page-1)*cutnum;
        String sql = "SELECT * from orderfrom ORDER BY id asc LIMIT ?,?;";
        PreparedStatement p ;
        try {
            p = con.prepareStatement(sql);
            p.setInt(1, startPage);
            p.setInt(2, cutnum);
            ResultSet resultSet = p.executeQuery();
            while (resultSet.next()) {
                if(array==null) {
                    array=new ArrayList<Orderfrom>();
                }
                or = new Orderfrom();
                or.setId(resultSet.getInt(1));
                or.setName(resultSet.getString(2));
                or.setPhone(resultSet.getString(3));
                or.setCity(resultSet.getString(4));
                or.setMoreadd(resultSet.getString(5));
                or.setEmail(resultSet.getString(6));
                or.setDesc(resultSet.getString(7));
                or.setTotalprice(resultSet.getDouble(8));
                or.setTransportprice(resultSet.getDouble(9));
                or.setType(resultSet.getInt(10));
                array.add(or);
            }
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return array;
    }

    public Integer getCount() {
        Integer sumnnum =0;
        String sql = "select count(*) from orderfrom";
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

    public void Insert(Orderfrom u) {
        String sql = "insert INTO orderfrom(name,orderfrom.phone,city,moreadd,email,orderfrom.desc,totalprice,transportprice,type) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,u.getName());
            p.setString(2,u.getPhone());
            p.setString(3,u.getCity());
            p.setString(4,u.getMoreadd());
            p.setString(5,u.getEmail());
            p.setString(6,u.getDesc());
            p.setDouble(7,u.getTotalprice());
            p.setDouble(8,u.getTransportprice());
            p.setInt(9,u.getType());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void Delete(Orderfrom s) {
        String sql = "delete from orderfrom where id = ?";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setInt(1,s.getId());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void Update(Integer id, Orderfrom u) {
        String sql = "update orderfrom set name=?,phone=?,city=?,moreadd=?,email=?,orderfrom.desc=?,totalprice=?,transportprice=?,type=? where id =?";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,u.getName());
            p.setString(2,u.getPhone());
            p.setString(3,u.getCity());
            p.setString(4,u.getMoreadd());
            p.setString(5,u.getEmail());
            p.setString(6,u.getDesc());
            p.setDouble(7,u.getTotalprice());
            p.setDouble(8,u.getTransportprice());
            p.setInt(9,u.getType());
            p.setInt(10,id);
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
