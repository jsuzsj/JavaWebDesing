package servlet;

import cn.jsu.bean.Shop;
import cn.jsu.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@MultipartConfig
@WebServlet("/AddShopServlet")
public class AddShopServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Double price = request.getParameter("price")!=null?Double.valueOf(request.getParameter("price")):null;
        Double discount = request.getParameter("discount")!=null?Double.valueOf(request.getParameter("discount")):null;
        String desc = null;
        Part file = request.getPart("desc");
        desc = file.getSubmittedFileName();
        Shop shop = new Shop(name,price,discount,desc);
        BufferedInputStream bi = new BufferedInputStream(file.getInputStream());
        //获取保存的文件的为止
        String filePath = this.getServletContext().getRealPath("/assets/img/product/");
        File mirke = new File (filePath);
        if (!mirke.exists())
            mirke.mkdir();
        File file2 = new File(filePath,desc);
        File file3 = new File(this.getServletContext().getRealPath("/assets/img/s-product/"),desc);
        //cope inStream to file

        BufferedOutputStream bo = new BufferedOutputStream(new FileOutputStream(file2));
        BufferedOutputStream bo1 = new BufferedOutputStream(new FileOutputStream(file3));
        byte[] bytes=new byte[1024];
        int length=0;
        while((length=bi.read(bytes))!=-1)
        {
            bo.write(bytes,0,length);
            bo1.write(bytes,0,length);
        }
        bi.close();
        bo.close();
        bo1.close();
        DBUtil.addShops(shop);
        //assets/img/s-product/
        response.sendRedirect("/ZSJ/admin/addShop_admin.jsp");
    }
}
