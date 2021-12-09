package com.sp.servlet;

import com.sp.dao.TypeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateBookTypeServlet")
public class updateBookTypeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public updateBookTypeServlet() {
        super();

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        int tid = Integer.parseInt(request.getParameter("tid"));
        TypeDao typedao = new TypeDao();
        typedao.updateTypeBook(tid, name);
        response.sendRedirect("/demo_war_exploded/admin_booktype.jsp");
    }

}
