package cn.jsu.dao;

import cn.jsu.bean.Orderfrom;

import java.util.ArrayList;

public interface OrderFromDao extends DBDao{
    //根据id获取
    public Orderfrom getById(Integer id);

    //分页查询
    public ArrayList<Orderfrom> getByCutPage(Integer page, Integer cutnum);

    //获取条目数
    public Integer getCount();

    //添加一行数据
    public void Insert(Orderfrom u);

    //删除一行数据
    public void Delete(Orderfrom s);

    //更新一行数据
    public void Update(Integer id,Orderfrom u);
}
