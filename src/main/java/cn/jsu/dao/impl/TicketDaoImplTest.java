package cn.jsu.dao.impl;

import cn.jsu.bean.Ticket;
import cn.jsu.databace.DatabaceConnection;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class TicketDaoImplTest {

    @Test
    void insert() {
        Ticket t=new Ticket("12344",12.0);
        TicketDaoImpl ticketDao = new TicketDaoImpl(new DatabaceConnection().getConection());
        ticketDao.insert(t);
    }

    @Test
    void delete() {
        Ticket t=new Ticket("12344",12.0);
        TicketDaoImpl ticketDao = new TicketDaoImpl(new DatabaceConnection().getConection());
        ticketDao.delete(t);
    }

    @Test
    void findById() {
        Ticket t;
        TicketDaoImpl ticketDao = new TicketDaoImpl(new DatabaceConnection().getConection());
        t=ticketDao.findById(1);
        System.out.println(t.getCode());
    }

    @Test
    void findByCode() {Ticket t;
        TicketDaoImpl ticketDao = new TicketDaoImpl(new DatabaceConnection().getConection());
        t=ticketDao.findByCode("312312");
        System.out.println(t.getCode());
    }

    @Test
    void update() {
        Ticket t=new Ticket("dsafsf",123.0);
        TicketDaoImpl ticketDao = new TicketDaoImpl(new DatabaceConnection().getConection());
        ticketDao.update(1,t);
        System.out.println(t.getCode());
    }
}