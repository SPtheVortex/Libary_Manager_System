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
		System.out.println("1.创建 Servlet实例时执⾏"); //创建Servlet实例相当于 newHelloServlet()
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("2.service先于doGet⽅法或者doPost⽅法执⾏");
		super.service(request, response);//这⼀段尽量别删除,这⾥会决定调⽤doGet还是doPost⽅法
		System.out.println("4.doGet或者doPost执⾏完后，service⽅法执⾏完毕");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws
			ServletException, IOException {
		System.out.println("3.doGet⽅法开始执⾏");
		PrintWriter out = resp.getWriter();
		out.println("hello world"); //向浏览器输出hello world
		out.close(); //关闭out对象，不然⼀直会消耗计算机资源
	}
	@Override
	public void destroy() {
		super.destroy();
		System.out.println("5.Servlet实例销毁时执⾏destory⽅法"); //serlvet实例销毁: 1.jdk释放Servlet实例; 2.tomcat正常关闭
	}
}