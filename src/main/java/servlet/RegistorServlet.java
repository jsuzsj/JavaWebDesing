package servlet;

import cn.jsu.bean.User;
import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/RegistorServlet")
public class RegistorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String pswd = request.getParameter("pswd");
        try {
            User user = new User(name,pswd);
            if(DBUtil.register(user))
                response.getWriter().write("<script >alert('" +"注册成功！！！"+ "');window.location='登入.html'</script>");
            else
                response.getWriter().write("<script >alert('" +"注册失败，已经被注册！！！"+ "');window.location='登入.html'</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
