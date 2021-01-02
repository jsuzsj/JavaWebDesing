package filter;

import cn.jsu.util.DBUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter",initParams = {
        @WebInitParam(name="isDisable",value="Y"),
        @WebInitParam(name="includeList",value=".jsp"),
        @WebInitParam(name="indexhtml",value="index.jsp;index-2.jsp;index-3.jsp")
},urlPatterns = {"/*"})
public class LoginFilter implements Filter {
    FilterConfig config;
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response =(HttpServletResponse) resp;

        //是否启用这个拦截器
        if(!config.getInitParameter("isDisable").equals("Y"))
        {
            chain.doFilter(request, response);
            return;
        }


        //不包含includeList
        String servletcontext = request.getServletPath();
        if(servletcontext.indexOf(config.getInitParameter("includeList"))==-1){
            chain.doFilter(req, resp);
            return;
        }

        String [] indexs = (config.getInitParameter("indexhtml").toString()).split(";");
        for (String str:
                indexs) {
            if(servletcontext.indexOf(str)!=-1){
                chain.doFilter(req, resp);
                return;
            }
        }
        //1.是否登录，否：跳转到登入
        //2.是否是管理员 是：跳转到管理员页面 ，否，不允许访问管理员页面
        //3.管理员
        Object applicat_resume = request.getSession().getAttribute("APPLICAT_RESUME");
        if(applicat_resume ==null)
        {
            String url ="/ZSJ/登入.html" ;
            url=new String(url.getBytes("UTF-8"),"ISO8859_1");
            response.sendRedirect(url);
            return;
        }
        else if(DBUtil.isAdmin((Integer) applicat_resume))
            {
                //管理员身份访问管理员页面
                if(servletcontext.indexOf("admin")==-1)
                {
                    String url = "/ZSJ/admin/index_admin.jsp";
                    url=new String(url.getBytes("UTF-8"),"ISO8859_1");
                    response.sendRedirect(url);
                    return ;
                }
                    chain.doFilter(req, resp);
                    return ;
            }
            else if(servletcontext.indexOf("admin")!=-1){
                String url = "/ZSJ/index.jsp";
                url=new String(url.getBytes("UTF-8"),"ISO8859_1");
                response.sendRedirect(url);
            }
            else
        {
            chain.doFilter(req, resp);
            return;
        }


    }

    public void init(FilterConfig config) throws ServletException {
    this.config = config;
    }

}
