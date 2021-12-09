package com.sp.servlet;

import com.sp.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public AddUserServlet() {
        super();

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int lend_num = Integer.parseInt(request.getParameter("lend_num"));
        int max_num = Integer.parseInt(request.getParameter("max_num"));

        AdminDao userdao = new AdminDao();

        userdao.Register(username, password, name, email, phone, lend_num, max_num);
        response.sendRedirect("/demo_war_exploded/admin_user.jsp");
    }

}
