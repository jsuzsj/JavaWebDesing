package servlet;

import cn.jsu.bean.Shop;
import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ShopsServlet")
public class ShopsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String pagel = request.getParameter("pagel");
        if (pagel==null)
            pagel ="1";
        Integer nowPage = Integer.valueOf(pagel);
        Integer cutnum = 6;
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Integer countShop = DBUtil.getCountShop();
        ArrayList<Shop> shops  = (ArrayList <Shop>)DBUtil.getCutPage("shop",nowPage,cutnum);
        request.getSession().setAttribute("shops",shops);
        request.getSession().setAttribute("shops_count",countShop);
        request.getRequestDispatcher("shop.jsp").forward(request,response);
    }
}
