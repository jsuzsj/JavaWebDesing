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

@WebServlet("/ShopingCarServlet")
public class ShopingCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //shopingcar
        Integer id =null;
        Object applicat_resume = request.getSession().getAttribute("APPLICAT_RESUME");
        if (applicat_resume!=null) {
            id = (Integer) applicat_resume;
            ArrayList<Shop> userShopingCar = DBUtil.getUserShopingCar(id);
            double sum = 0;
            for (Shop s:
                 userShopingCar) {
                sum += s.getPrice();
            }
            request.getSession().setAttribute("shopingcar_sum",(int)sum);
            request.getSession().setAttribute("shopingcar", userShopingCar);
            request.getSession().setAttribute("shopingcar_size", userShopingCar.size());
        }
        request.getRequestDispatcher("ForwardShopsServlet").forward(request,response);
    }
}
