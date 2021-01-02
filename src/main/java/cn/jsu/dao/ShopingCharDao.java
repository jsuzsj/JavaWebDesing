package cn.jsu.dao;

import cn.jsu.bean.Shop;
import cn.jsu.bean.ShopingCar;
import cn.jsu.util.DBUtil;

import java.util.ArrayList;

public interface ShopingCharDao extends DBDao {
    //根据id获取
    public ShopingCar getById(Integer id);
    //分页查询
    public ArrayList<Shop> getUserShops(ShopingCar sc);

    //获取条目数
    public Integer getCount();

    //添加一行数据
    public void Insert(ShopingCar u);

    //删除一行数据
    public void Delete(ShopingCar u);


}
