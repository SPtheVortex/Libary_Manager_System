<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.sp.bean.HistoryBean,com.sp.dao.AdminDao,com.sp.dao.TypeDao,com.sp.dao.BookDao,com.sp.bean.AdminBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
	<meta charset="UTF-8">
	<title>图书馆管理系统</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	    <link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
        <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
        <script src="static/js/bootstrap.min.js"></script>
        <script src="static/jQuery/jquery-3.1.1.min.js"></script>
            <script src="static/js/bootstrap-dropdown.min.js"></script>
            <script src="static/js/adminUpdateInfo.js"></script>
             <script src="static/js/adminUpdatePwd.js"></script>
       
</head>



<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>


<body class="bootstrap-admin-with-small-navbar">
<%
AdminBean admin = new AdminBean();
String aid = (String)session.getAttribute("aid");
AdminDao admindao = new AdminDao();
admin = admindao.get_AidInfo2(aid);
%>
    <div class="container">
        <div class="row">
            <div class="col-md-10">
              <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default bootstrap-admin-no-table-panel">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">图书归还信息</div>
                            </div>
                           
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>图书号</th>
                                <th>图书名称</th>
                                <th>读者账号</th>
                                <th>读者名称</th>
                                <th>借阅日期</th>
                                <th>还书日期</th>
                            </tr>
                            </thead>
                            <!---在此插入信息-->
                             <%
                             ArrayList<HistoryBean> bookdata = new ArrayList<HistoryBean>();
                             bookdata = (ArrayList<HistoryBean>)request.getAttribute("data");
                           if(bookdata==null){
                        	   BookDao bookdao = new BookDao();
                        	   bookdata = (ArrayList<HistoryBean>)bookdao.get_HistoryListInfo2(0);
                           }
  for (HistoryBean bean : bookdata){
  %>                 
                            	<tbody>
	                         	   	<td><%= bean.getCard() %></td>
	                         	   	<td><%= bean.getBookname() %></td>
	                                <td><%= bean.getAdminname() %></td>
	                                <td><%= bean.getUsername() %></td>
	                                <td><%= bean.getBegintime() %></td>
	                                <td><%= bean.getEndtime() %></td>  
	                                                                            
                          	  </tbody>
                             <%} %> 
                        </table>
                    </div>
                </div>
        </div>
    </div>
</body>
</html>