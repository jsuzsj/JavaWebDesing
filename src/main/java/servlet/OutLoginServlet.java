package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/OutLoginServlet")
public class OutLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getSession().removeAttribute("APPLICAT_RESUME");
        request.getSession().removeAttribute("IS_LOGIN");
        request.getSession().removeAttribute("USER_NAME");
        response.getWriter().write("<script >alert('" +"退出成功！！！"+ "');window.location='showShop_admin.jsp'</script>");
        //
    }
}
