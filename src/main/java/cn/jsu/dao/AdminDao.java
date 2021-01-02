package cn.jsu.dao;

import cn.jsu.bean.Admin;

import java.util.ArrayList;

public interface AdminDao extends DBDao{
    //根据id获取
    public Admin getById(Integer id);
    //分页查询
    public ArrayList<Admin> getByCutPage(Integer page, Integer cutnum);

    //获取条目数
    public Integer getCount();

    //添加一行数据
    public void Insert(Admin u);

    //删除一行数据
    public void Delete(Integer id);

    //更新一行数据
    public void Update(Integer id,Admin u);
}
