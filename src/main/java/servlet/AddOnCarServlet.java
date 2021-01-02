package servlet;

import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddOnCarServlet")
public class AddOnCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Integer uid = (Integer) request.getSession().getAttribute("APPLICAT_RESUME");
        Integer shopid = Integer.valueOf(request.getParameter("shopid"));
        Integer falg =DBUtil.addShopToCar(uid,shopid);
        if(falg == -1)
        {
            response.getWriter().println("添加成功");
        }
        else
        {
            response.getWriter().println("已经添加过了");
        }
    }
}
