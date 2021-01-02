package cn.jsu.dao;

import cn.jsu.bean.Ticket;

public interface TicketDao extends DBDao{
    //添加新券
    public void insert(Ticket t);
    //删除券
    public void delete(Ticket t);
    //查找券通过id
    public Ticket findById(Integer id);
    //查找券通过code
    public Ticket findByCode(String Code);
    //更新券通过id
    public void update(Integer id,Ticket t);
}
