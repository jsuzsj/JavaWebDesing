package cn.jsu.dao.impl;

import cn.jsu.bean.Ticket;
import cn.jsu.dao.TicketDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketDaoImpl  implements TicketDao {
    Connection con;

    public  void close()
    {
        try {
            con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public TicketDaoImpl(Connection con) {
        this.con = con;
    }

    public void insert(Ticket t) {
        String sql = "insert into ticket(code,price) values(?,?)";
        PreparedStatement p ;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,t.getCode());
            p.setDouble(2,t.getPrice());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void delete(Ticket t) {
        String sql = "delete from ticket where code=?";
        PreparedStatement p;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,t.getCode());
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public Ticket findById(Integer id) {
        Ticket t =null;
        String sql = "select  * from ticket where id=?";
        PreparedStatement p;
        try {
            p=con.prepareStatement(sql);
            p.setInt(1,id);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()) {
                t= new Ticket();
                t.setId(resultSet.getInt(1));
                t.setCode(resultSet.getString(2));
                t.setPrice(resultSet.getDouble(3));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return t;
    }

    public Ticket findByCode(String Code) {
        Ticket t =null;
        String sql = "select  * from ticket where code=?";
        PreparedStatement p;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,Code);
            ResultSet resultSet = p.executeQuery();
            if(resultSet.next()) {
                t= new Ticket();
                t.setId(resultSet.getInt(1));
                t.setCode(resultSet.getString(2));
                t.setPrice(resultSet.getDouble(3));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return t;
    }

    public void update(Integer id, Ticket t) {
        String sql = "update ticket set code = ?,price = ? where id =?";
        PreparedStatement p;
        try {
            p=con.prepareStatement(sql);
            p.setString(1,t.getCode());
            p.setDouble(2,t.getPrice());
            p.setInt(3,id);
            p.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
