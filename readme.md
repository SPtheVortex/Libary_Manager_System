# 1. servlet hello world实现

*  src/main/resources   主要用于存放配置文件
*  src/main/java        主要用于编写java代码
*  src/main/webapp      主要是用于存放静态文件（内容一般不会发生改变的文件   html、css、javascript、图片）
*  pom.xml              主要是用于导入jar包
*  Maven Dependecies    项目已经导入了的jar包



1. pom.xml中导入servlet jar包

```xml
<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>javax.servlet-api</artifactId>
			<version>3.1.0</version>
			<scope>provided</scope>
</dependency>
```

2. 编写如下类

```java
package com.sp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("hello everybody");
    }

}
```

3. 配置web.xml

``` xml
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
  <display-name>Archetype Created Web Application</display-name>
  <servlet>
        <servlet-name>hello</servlet-name>
        <servlet-class>com.sp.servlet.HelloServlet</servlet-class>
    </servlet>

	<!-- http://localhost:8080/demo/helloeveryone -->
    <servlet-mapping>
        <servlet-name>hello</servlet-name>
        <url-pattern>/helloeveryone</url-pattern>
    </servlet-mapping>
    
</web-app>
```

4. 访问地址

http://localhost:8080/demo/helloeveryone



**快捷键** 

> 代码提示: alt+/
> 重写方法: alt + shift +s
>
> 快速获取变量返回值: ctrl + 1
