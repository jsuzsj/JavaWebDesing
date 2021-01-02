package cn.jsu.dao;

import cn.jsu.bean.Shop;

import java.util.ArrayList;

public interface ShopDao extends DBDao{
    //根据id获取
    public Shop getById(Integer id);

    //分页查询
    public ArrayList<Shop> getByCutPage(Integer page, Integer cutnum);

    //获取条目数
    public Integer getCount();

    //添加一行数据
    public void Insert(Shop u);

    //删除一行数据
    public void Delete(Shop s);

    //更新一行数据
    public void Update(Integer id,Shop u);

}
