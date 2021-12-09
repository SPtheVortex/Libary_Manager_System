package com.sp.servlet;

import com.sp.bean.AdminBean;
import com.sp.dao.AdminDao;
import com.sp.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/borrowServlet")
public class borrowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public borrowServlet() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        BookDao bookdao = new BookDao();

        int tip = Integer.parseInt(request.getParameter("tip"));
        if (tip == 1) {

            int bid = Integer.parseInt(request.getParameter("bid"));
            HttpSession session = request.getSession();
            AdminBean admin = new AdminBean();

            String aid = (String) session.getAttribute("aid");
            AdminDao admindao = new AdminDao();

            admin = admindao.get_AidInfo2(aid);

            bookdao.borrowBook(bid, admin);
            response.sendRedirect("/demo_war_exploded/select.jsp");
        } else {

            int hid = Integer.parseInt(request.getParameter("hid"));
            
            int show = Integer.parseInt(request.getParameter("show"));

            bookdao.borrowBook2(hid);
            if (show == 1) {
                response.sendRedirect("/demo_war_exploded/borrow.jsp");
            } else {
                response.sendRedirect("/demo_war_exploded/admin_borrow.jsp");
            }

        }


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

}
