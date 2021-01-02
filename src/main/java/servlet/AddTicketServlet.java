package servlet;

import cn.jsu.bean.Shop;
import cn.jsu.bean.Ticket;
import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@WebServlet("/AddTicketServlet")
public class AddTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        Double price = request.getParameter("price")!=null?Double.valueOf(request.getParameter("price")):null;
        Ticket t = new Ticket(code,price);
        DBUtil.insertTicket(t);
        response.sendRedirect("/ZSJ/admin/addTicket_admin.jsp");
    }
}
