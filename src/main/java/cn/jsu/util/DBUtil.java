package cn.jsu.util;

import cn.jsu.bean.*;
import cn.jsu.dao.DBDao;
import cn.jsu.dao.factory.DaoFactory;
import cn.jsu.dao.impl.*;
import org.junit.jupiter.api.Order;

import java.util.ArrayList;


public class DBUtil {
    public static  void deleteAdmin(Integer id)
    {
        AdminDaoImpl adminOperation = new DaoFactory().getAdminOperation();
        adminOperation.Delete(id);
        adminOperation.close();
    }
    public static  void addAdmin(Integer id)
    {
        AdminDaoImpl adminOperation = new DaoFactory().getAdminOperation();
        adminOperation.Insert(new Admin(id));
        adminOperation.close();
    }
    public static  Integer getcount (String name)
    {
        Integer count = 0;
        if(name.equals("user"))
        {
            UserDaoImpl userOpration = new DaoFactory().getUserOpration();
            count = userOpration.getCount();
            userOpration.close();
        }

        return  count;
    }
    public static void insertTicket(Ticket t)
    {
        TicketDaoImpl ticketOperation = new DaoFactory().getTicketOperation();
        ticketOperation.insert(t);
        ticketOperation.close();
    }
    public static User login(User user)
    {
        UserDaoImpl connection = new DaoFactory().getUserOpration();
        User u=connection.getByPassword(user.getName(), user.getPswd());
        connection.close();
        return u;
    }
    public static boolean register(User user)
    {
        boolean flag = false;
        UserDaoImpl operation = new DaoFactory().getUserOpration();
        //注册前检查是否已经注册
        ArrayList<User> name = operation.getByNameKEY("name", user.getName());
        if(name.size()==0)
        {
            operation.Insert(user);
            flag = true;
            operation.close();
        }
        else
            System.out.println("已经被注册了");
         return flag;
    }
    public static  boolean isRegister(String name)
    {
        boolean flag = false;
        UserDaoImpl operation = new DaoFactory().getUserOpration();
        //注册前检查是否已经注册
        ArrayList<User> names = operation.getByNameKEY("name", name);
        if(names.size()==0)
        {
            flag = true;
        }
        operation.close();
        return flag;
    }
    public static ArrayList<?> getCutPage(String name,int page,int num)
    {
        ArrayList<?> arrayList = null;
        if(name.equals("shop"))
        {
            ShopDaoImpl shopOperation = new DaoFactory().getShopOperation();
            arrayList = shopOperation.getByCutPage(page,num);
            shopOperation.close();
        }
        else if(name.equals("user"))
        {
            UserDaoImpl userOpration = new DaoFactory().getUserOpration();
            arrayList = userOpration.getByCutPage(page,num);
            userOpration.close();
        }

        return  arrayList;
    }
    public static Integer getCountShop ()
    {

        ShopDaoImpl shopOperation = new DaoFactory().getShopOperation();
        Integer count = shopOperation.getCount();
        shopOperation.close();
        return count;
    }
    public static Integer addShopToCar(Integer uid,Integer shopid)
    {
        int flag = -1;
        ShopingCar sc  = new ShopingCar(shopid,uid);
        ShopingCharDaoImpl caroperation = new DaoFactory().getShopingCarOperation();
        ArrayList<Shop> userShops = caroperation.getUserShops(sc);
        for (Shop s:
                userShops) {
            if(s.getId().equals(shopid)) {
                flag = 1;
                break;
            }
        }
        if(flag == -1)
        caroperation.Insert(sc);
        caroperation.close();
        return flag;
    }
    public static  ArrayList<Shop> getUserShopingCar(Integer uid){
        ShopingCharDaoImpl caroperation = new DaoFactory().getShopingCarOperation();
        ShopingCar sc = new ShopingCar();
        sc.setUid(uid);
        ArrayList<Shop> userShops = caroperation.getUserShops(sc);
        caroperation.close();
        return userShops;
    }
    public static  void deleteShopOnCar(Integer uid,Integer shopid)
    {
        ShopingCharDaoImpl shopingCarOperation = new DaoFactory().getShopingCarOperation();
        shopingCarOperation.Delete(new ShopingCar(shopid,uid));
        shopingCarOperation.close();
        }
    public static  void inserOrderForm(Orderfrom of)
    {
        OrderFromDaoImpl orderFromOperation = new DaoFactory().getOrderFromOperation();
        orderFromOperation.Insert(of);
        orderFromOperation.close();
    }
    public static  boolean isAdmin(Integer uid)
    {
        AdminDaoImpl adminOperation = new DaoFactory().getAdminOperation();
        Admin byId = adminOperation.getById(uid);
        adminOperation.close();
        return byId!=null;
    }
    public static  Ticket getTicket(String code){
        TicketDaoImpl ticketOperation = new DaoFactory().getTicketOperation();
        Ticket byCode = ticketOperation.findByCode(code);
        ticketOperation.close();
        return  byCode;
    }
    public  static  void deleteTicket(Ticket t)
    {
        TicketDaoImpl ticketOperation = new DaoFactory().getTicketOperation();
            ticketOperation.delete(t);
            ticketOperation.close();
    }
    public static  void addShops(Shop s)
    {
        ShopDaoImpl shopOperation = new DaoFactory().getShopOperation();
        shopOperation.Insert(s);
        shopOperation.close();
    }
}
