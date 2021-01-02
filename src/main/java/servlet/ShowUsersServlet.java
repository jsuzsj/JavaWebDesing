package servlet;

import cn.jsu.bean.Shop;
import cn.jsu.bean.User;
import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin/ShowUserServlet")
public class ShowUsersServlet extends HttpServlet {
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
        Integer countShop = DBUtil.getcount("user");
        Integer allpage = countShop/cutnum;
        if(countShop%cutnum !=0)
            allpage++;

        ArrayList<User> users  = (ArrayList <User>)DBUtil.getCutPage("user",nowPage,cutnum);
        request.getSession().setAttribute("users",users);
        request.setAttribute("allpage",allpage);
        Boolean admins[] =  new Boolean[users.size()];
        int i=0;
        for (User u:
                users) {
            admins[i++] = DBUtil.isAdmin(u.getId());
        }
        request.setAttribute("admins",admins);
        //assets/img/s-product/
        request.getRequestDispatcher("/admin/showUser_admin.jsp").forward(request,response);
    }
}
