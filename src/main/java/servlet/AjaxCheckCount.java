package servlet;

import cn.jsu.bean.User;
import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet( "/AjaxCheckCount")
public class AjaxCheckCount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("email");
        boolean flag = false;
        try {
            flag = DBUtil.isRegister(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(flag != false) {
            response.getWriter().println("邮箱可用");
        }
        else
        {
            response.getWriter().println("邮箱不可用");
        }
    }
}
