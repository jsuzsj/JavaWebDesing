package servlet;

import cn.jsu.bean.User;
import cn.jsu.databace.DatabaceConnection;
import cn.jsu.util.DBUtil;

import javax.jws.WebParam;
import javax.jws.WebService;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/LoginServlet")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String pswd = request.getParameter("pswd");
        try {
            User user = new User(name,pswd);
            user =DBUtil.login(user);
            System.out.println("121");
            if(user!=null)
            {
                Integer id = user.getId();
                request.getSession().setAttribute("APPLICAT_RESUME",id);
                request.getSession().setAttribute("IS_LOGIN","1");
                request.getSession().setAttribute("USER_NAME",name);
                if(DBUtil.isAdmin(id))
                    response.sendRedirect("/ZSJ/admin/index_admin.jsp");
                response.sendRedirect("/ZSJ/ShopingCarServlet");
                //  response.getWriter().write("<script >alert('" +"登陆成功"+ "');window.location='/offers/applicant/resume.jsp'</script>");
            }
            else
                response.getWriter().write("<script >alert('" +"密码错误！！！"+ "');window.location='登入.html'</script>");
            //  response.sendRedirect("/offers/showShop_admin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
