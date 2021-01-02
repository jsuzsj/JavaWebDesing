package cn.jsu.dao.impl;

import cn.jsu.bean.Shop;
import cn.jsu.bean.ShopingCar;
import cn.jsu.databace.DatabaceConnection;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class ShopingCharDaoImplTest {

    @Test
    void getById() {
        ShopingCharDaoImpl shopingCharDao = new ShopingCharDaoImpl(new DatabaceConnection().getConection());
        ShopingCar byId = shopingCharDao.getById(3);
        System.out.println(byId.getUid()+" "+byId.getShopid());
    }

    @Test
    void getUserShops() {
        ShopingCar sc = new ShopingCar(1,2);
        ShopingCharDaoImpl shopingCharDao = new ShopingCharDaoImpl(new DatabaceConnection().getConection());
        ArrayList<Shop> userShops = shopingCharDao.getUserShops(sc);
        System.out.println(userShops.size());
    }

    @Test
    void getCount() {
        ShopingCharDaoImpl shopingCharDao = new ShopingCharDaoImpl(new DatabaceConnection().getConection());
        Integer num = shopingCharDao.getCount();
        System.out.println(num);
    }

    @Test
    void insert() {
        ShopingCar sc = new ShopingCar(14,2);
        ShopingCharDaoImpl shopingCharDao = new ShopingCharDaoImpl(new DatabaceConnection().getConection());
        shopingCharDao.Insert(sc);
    }

    @Test
    void delete() {
        ShopingCar sc = new ShopingCar(14,2);
        ShopingCharDaoImpl shopingCharDao = new ShopingCharDaoImpl(new DatabaceConnection().getConection());
        shopingCharDao.Delete(sc);
    }
}