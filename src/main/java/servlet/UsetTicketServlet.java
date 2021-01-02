package servlet;

import cn.jsu.bean.Ticket;
import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UsetTicketServlet")
public class UsetTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String ticketcode = request.getParameter("ticketcode");
        Ticket t = DBUtil.getTicket(ticketcode);
        if(t!=null)
        {
            //是否有优惠券存在
            Object countShop = request.getSession().getAttribute("shopingcar_sum");
            if(countShop != null)
            {
                Integer coun = (Integer)countShop;
                coun-=t.getPrice().intValue();
                DBUtil.deleteTicket(t);
                request.getSession().setAttribute("shopingcar_sum",coun);
            }
            response.getWriter().write("<script >alert('" +"添加成功"+t.getPrice()+"元减免"+"');window.location='cart.jsp'</script>");
        }
        else
        {
            response.getWriter().write("<script >alert('" +"优惠券无效！"+"');window.location='cart.jsp'</script>");
        }
    }
}
