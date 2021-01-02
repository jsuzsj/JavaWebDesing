package cn.jsu.dao.impl;

import cn.jsu.bean.Shop;
import cn.jsu.databace.DatabaceConnection;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class ShopDaoImplTest {

    @Test
    void getById() {
        ShopDaoImpl sd = new ShopDaoImpl(new DatabaceConnection().getConection());
        Shop byId = sd.getById(1);
        System.out.println(byId);
    }

    @Test
    void getByCutPage() {
        ShopDaoImpl sd = new ShopDaoImpl(new DatabaceConnection().getConection());
        ArrayList<Shop> byCutPage = sd.getByCutPage(1, 12);
        System.out.println(byCutPage);
    }

    @Test
    void getCount() {
        ShopDaoImpl sd = new ShopDaoImpl(new DatabaceConnection().getConection());
        Integer count = sd.getCount();
        System.out.println(count);
    }

    @Test
    void insert() {
        ShopDaoImpl sd = new ShopDaoImpl(new DatabaceConnection().getConection());
        Shop s =new Shop("高级羽绒服",123.0,10.0,"好用又好看");
        sd.Insert(s);
    }

    @Test
    void delete() {
        ShopDaoImpl sd = new ShopDaoImpl(new DatabaceConnection().getConection());
        Shop s =new Shop("高级羽绒服",123.0,10.0,"好用又好看");
        sd.Delete(s);
    }
    @Test
    void testDelete() {
        ShopDaoImpl sd = new ShopDaoImpl(new DatabaceConnection().getConection());
        sd.Delete(2);
        sd.close();
    }
    @Test
    void update(){
    ShopDaoImpl sd = new ShopDaoImpl(new DatabaceConnection().getConection());
    Shop s =new Shop("高级羽绒服",155.0,10.0,"好用又好看");
    sd.Update(12,s);
    }

    @Test
    void close() {

    }
}