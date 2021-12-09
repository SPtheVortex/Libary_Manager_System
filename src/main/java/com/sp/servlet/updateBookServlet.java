package com.sp.servlet;

import com.sp.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateBookServlet")
public class updateBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public updateBookServlet() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String card = request.getParameter("card");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String autho = request.getParameter("autho");
        String press = request.getParameter("press");
        int num = Integer.parseInt(request.getParameter("num"));
        int bid = Integer.parseInt(request.getParameter("updatebid"));
        BookDao bookdao = new BookDao();
        bookdao.updateBook(bid, card, name, type, autho, press, num);
        response.sendRedirect("/demo_war_exploded/admin_book.jsp");
    }

}
