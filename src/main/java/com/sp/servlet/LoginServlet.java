package com.sp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;
//import javax.websocket.Session;

import com.sp.bean.AdminBean;
import com.sp.dao.AdminDao;
import com.sp.utils.JdbcKit;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//		doGet(request, response);
        //登录的判断
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取账号和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<Map<String, Object>> maps = JdbcKit.executeQuery("select * from admin where username=? and password=?", username, password);
        setCookie(response, "author", "lsp", 60);
        AdminDao userdao = new AdminDao();
        //对账号和密码进行判断
        boolean result = userdao.Login_verify(username, password);
        HttpSession session = request.getSession();
        //判断输入正确
        if (result) {
            AdminBean adminbean = new AdminBean();
            AdminDao admindao = new AdminDao();
            //更加账号和密码查找出读者的信息
            adminbean = admindao.getAdminInfo(username, password);
            //将aid存入session中
            session.setAttribute("aid", "" + adminbean.getAid());
            //设置session的失效时间
            session.setMaxInactiveInterval(6000000);
            //根据status的值来判断是管理员，还是读者，status=1为读者
            if (adminbean.getStatus() == 1) {
                HttpSession session1 = request.getSession();
                session1.setAttribute("admin", maps.get(0));
                response.sendRedirect("/demo_war_exploded/admin.jsp");
            } else {
                HttpSession session1 = request.getSession();
                session1.setAttribute("admin", maps.get(0));
                response.sendRedirect("/demo_war_exploded/Adindex.jsp");
            }
        } else {
            response.sendRedirect("/demo_war_exploded/login.jsp");
        }

    }

    public void setCookie(HttpServletResponse response, String key, String value, int
            maxAgeInSeconds) {
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(maxAgeInSeconds);
        response.addCookie(cookie);
    }

}
