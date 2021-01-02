package servlet;

import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet( "/DeletCarShopServlet")
public class DeletCarShopServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Integer shopid =Integer.valueOf(request.getParameter("shopid"));
        Integer userid = (Integer)request.getSession().getAttribute("APPLICAT_RESUME");
        DBUtil.deleteShopOnCar(userid , shopid);
    }
}
