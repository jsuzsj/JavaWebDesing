package servlet;

import cn.jsu.bean.Shop;
import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.ArrayList;

@WebServlet("/admin/ShowShopsServlet")
public class ShowShopsServlet extends HttpServlet {
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
        Integer cutnum = 10;
        Integer countShop = DBUtil.getCountShop();

        Integer allpage = countShop/cutnum;
        if(countShop%cutnum !=0)
            allpage++;

        ArrayList<Shop> shops  = (ArrayList <Shop>)DBUtil.getCutPage("shop",nowPage,cutnum);
        request.getSession().setAttribute("shops",shops);
        request.setAttribute("allpage",allpage);
        //assets/img/s-product/
        request.getRequestDispatcher("/admin/showShop_admin.jsp").forward(request,response);
    }
}
