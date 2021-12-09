package com.sp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;


import com.sp.bean.AdminBean;
import com.sp.dao.AdminDao;
import com.sp.utils.JdbcKit;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<Map<String, Object>> maps = JdbcKit.executeQuery("select * from admin where username=? and password=?", username, password);
        setCookie(response, "author", "lsp", 60);
        AdminDao userdao = new AdminDao();
        boolean result = userdao.Login_verify(username, password);
        HttpSession session = request.getSession();

        if (result) {
            AdminBean adminbean = new AdminBean();
            AdminDao admindao = new AdminDao();

            adminbean = admindao.getAdminInfo(username, password);

            session.setAttribute("aid", "" + adminbean.getAid());

            session.setMaxInactiveInterval(6000000);

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
