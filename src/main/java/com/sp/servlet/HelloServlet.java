package com.sp.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class HelloServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("1.创建 Servlet实例时执⾏");
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("2.service先于doGet⽅法或者doPost⽅法执⾏");
        super.service(request, response);
        System.out.println("4.doGet或者doPost执⾏完后，service⽅法执⾏完毕");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws
            ServletException, IOException {
        System.out.println("3.doGet⽅法开始执⾏");
        PrintWriter out = resp.getWriter();
        out.println("hello world");
        out.close();
    }

    @Override
    public void destroy() {
        super.destroy();
        System.out.println("5.Servlet实例销毁时执⾏destory⽅法");
    }
}