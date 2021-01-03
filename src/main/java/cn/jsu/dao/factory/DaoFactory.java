package cn.jsu.dao.factory;

import cn.jsu.dao.DBDao;
import cn.jsu.dao.impl.*;
import cn.jsu.databace.DatabaceConnection;

import java.sql.Connection;

public class DaoFactory {

    public UserDaoImpl getUserOpration() {
        return new UserDaoImpl(new DatabaceConnection().getConection());
    }

    public AdminDaoImpl getAdminOperation(){return new AdminDaoImpl(new DatabaceConnection().getConection());}

    public OrderFromDaoImpl getOrderFromOperation(){return new OrderFromDaoImpl(new DatabaceConnection().getConection());}

    public ShopDaoImpl getShopOperation(){return new ShopDaoImpl(new DatabaceConnection().getConection());}

    public TicketDaoImpl getTicketOperation(){return new TicketDaoImpl(new DatabaceConnection().getConection());}

    public ShopingCharDaoImpl getShopingCarOperation(){return new ShopingCharDaoImpl(new DatabaceConnection().getConection());}
}
