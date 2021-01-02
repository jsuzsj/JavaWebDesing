package cn.jsu.dao.impl;

import cn.jsu.bean.Admin;
import cn.jsu.databace.DatabaceConnection;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class AdminDaoImplTest {

    @Test
    void getById() {
        Admin admin ;
        AdminDaoImpl adminDao = new AdminDaoImpl(new DatabaceConnection().getConection());
        admin = adminDao.getById(1);
        System.out.println(admin.getUid());
    }

    @Test
    void getByCutPage() {

        AdminDaoImpl adminDao = new AdminDaoImpl(new DatabaceConnection().getConection());
        ArrayList<Admin> byCutPage = adminDao.getByCutPage(1, 1);
        for (Admin a:
             byCutPage) {
            System.out.println(a.getUid());
        }
    }

    @Test
    void getCount() {

        AdminDaoImpl adminDao = new AdminDaoImpl(new DatabaceConnection().getConection());
        System.out.println(adminDao.getCount());
    }

    @Test
    void insert() {
        AdminDaoImpl adminDao = new AdminDaoImpl(new DatabaceConnection().getConection());
        Admin admin = new Admin();
        admin.setUid(3);
        adminDao.Insert(admin);
    }

    @Test
    void delete() {

        AdminDaoImpl adminDao = new AdminDaoImpl(new DatabaceConnection().getConection());
        adminDao.Delete(2);
    }

    @Test
    void update() {
        AdminDaoImpl adminDao = new AdminDaoImpl(new DatabaceConnection().getConection());
        adminDao.Update(1,new Admin(3));
    }
}