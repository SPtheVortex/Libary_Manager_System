package com.sp.servlet;

import com.sp.dao.TypeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteTypeServlet")
public class deleteTypeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public deleteTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
        //删除图书分类信息
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int tid = Integer.parseInt(request.getParameter("tid"));
        TypeDao typedao = new TypeDao();
        typedao.deleteBookType(tid);
        response.sendRedirect("/demo_war_exploded/admin_booktype.jsp");
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
