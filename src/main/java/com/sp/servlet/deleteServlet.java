package com.sp.servlet;

import com.sp.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteServlet() {
        super();

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int bid = Integer.parseInt(request.getParameter("bid"));
        BookDao bookdao = new BookDao();
        bookdao.deleteBook(bid);
        response.sendRedirect("/demo_war_exploded/admin_book.jsp");
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

}
