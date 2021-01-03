package servlet;

import cn.jsu.bean.Orderfrom;
import cn.jsu.bean.Shop;
import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Orderfrom or = new Orderfrom();
        or.setName(request.getParameter("name"));
        or.setEmail(request.getParameter("email"));
        or.setDesc(request.getParameter("desc"));
        or.setCity(request.getParameter("city"));
        or.setPhone(request.getParameter("phone"));
        Integer applicat_resume = (Integer)request.getSession().getAttribute("APPLICAT_RESUME");
        Integer shopingcar_sum = (Integer)request.getSession().getAttribute("shopingcar_sum");
        or.setTotalprice(Double.valueOf(shopingcar_sum));
        or.setMoreadd(request.getParameter("moreadd"));
        or.setTransportprice(0.0);
        or.setType(1);
        DBUtil.inserOrderForm(or);
        //清空购物车
        ArrayList<Shop> userShopingCar = DBUtil.getUserShopingCar(applicat_resume);
        for (Shop s:
             userShopingCar) {
            DBUtil.deleteShopOnCar(applicat_resume,s.getId());
        }
        response.getWriter().write("<script >alert('" +"订单交替成功等待发货"+ "');window.location='ShopingCarServlet'</script>");
    }
}
