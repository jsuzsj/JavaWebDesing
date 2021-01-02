package cn.jsu.dao.impl;

import cn.jsu.bean.Orderfrom;
import cn.jsu.databace.DatabaceConnection;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class OrderFromDaoImplTest {

    @Test
    void getById() {
        OrderFromDaoImpl orderFromDao = new OrderFromDaoImpl(new DatabaceConnection().getConection());
            orderFromDao.getById(1);

    }

    @Test
    void getByCutPage() {
        OrderFromDaoImpl orderFromDao = new OrderFromDaoImpl(new DatabaceConnection().getConection());
        ArrayList<Orderfrom> byCutPage = orderFromDao.getByCutPage(1, 5);
        for (Orderfrom o:
                byCutPage) {
            System.out.println(o.getId());
        }
    }

    @Test
    void getCount() {
        OrderFromDaoImpl orderFromDao = new OrderFromDaoImpl(new DatabaceConnection().getConection());
        Integer count = orderFromDao.getCount();
        System.out.println(count);
    }

    @Test
    void insert() {
        Orderfrom or = new Orderfrom();
        or.setName("张三");
        or.setPhone("123");
        or.setCity("123");
        or.setMoreadd("3123");
        or.setEmail("123123");
        or.setDesc("123312");
        or.setTotalprice(1234.0);
        or.setTransportprice(12321.0);
        or.setType(1);
        OrderFromDaoImpl orderFromDao = new OrderFromDaoImpl(new DatabaceConnection().getConection());
        orderFromDao.Insert(or);
    }

    @Test
    void delete() {
        Orderfrom or = new Orderfrom();
        or.setName("张三");
        or.setPhone("123");
        or.setCity("123");
        or.setMoreadd("3123");
        or.setEmail("123123");
        or.setDesc("123312");
        or.setTotalprice(1234.0);
        or.setTransportprice(12321.0);
        or.setType(1);
        or.setId(1);
        OrderFromDaoImpl orderFromDao = new OrderFromDaoImpl(new DatabaceConnection().getConection());
        orderFromDao.Delete(or);
    }

    @Test
    void update() {
        Orderfrom or = new Orderfrom();
        or.setName("张四");
        or.setPhone("123");
        or.setCity("123");
        or.setMoreadd("3123");
        or.setEmail("123123");
        or.setDesc("123312");
        or.setTotalprice(1234.0);
        or.setTransportprice(12321.0);
        or.setType(1);
        OrderFromDaoImpl orderFromDao = new OrderFromDaoImpl(new DatabaceConnection().getConection());
        orderFromDao.Update(3,or);
    }
}