<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.sp.bean.AdminBean,com.sp.dao.AdminDao,com.sp.bean.BookBean,com.sp.dao.BookDao" %>
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
        <script src="static/js/reader.js"></script>
        <script src="static/js/readerUpdateInfo.js"></script>
        <script src="static/js/readerUpdatePwd.js"></script>

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
                                <div class="text-muted bootstrap-admin-box-title">查询</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <form class="form-horizontal" action="/demo_war_exploded/selectServlet" method="post">
                                <input type="hidden" name="tip" value="2">
                                    <div class="col-lg-8 form-group">
                                        <label class="col-lg-4 control-label">图书名称</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" id="bookName" name="name" type="text" value="">
                                            <label class="control-label" style="display: none;"></label>
                                        </div>
                                    </div>
                                    
                                  
                                    <div class="col-lg-4 form-group">

                                        <button type="submit" class="btn btn-primary" id="btn_query" >查询</button>
                                    </div>
                                </form>
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
                                <th>图书类型</th>
                                <th>图书名称</th>
                                <th>作者名称</th>
                                 <th>出版社</th>
                                <th>操作</th>
                                
                            </tr>
                            </thead>
                             <%
                             ArrayList<BookBean> bookdata = new ArrayList<BookBean>();
                             bookdata = (ArrayList<BookBean>)request.getAttribute("data");
                           if(bookdata==null){
                        	   BookDao bookdao = new BookDao();
                        	   bookdata = (ArrayList<BookBean>)bookdao.get_ListInfo();
                           }
	
  for (BookBean bean : bookdata){
  %>                 
								<tbody>
	                         	   	<td><%= bean.getCard() %></td>
	                                <td><%= bean.getType() %></td>
	                                <td><%= bean.getName() %></td>
	                                <td><%= bean.getAutho() %></td>
	                                <td><%= bean.getPress() %></td>
<td><button type="button" class="btn btn-info btn-xs" data-toggle="modal" onclick="borrowbook(<%= bean.getBid() %>)" >借阅</button> </td>
                          	  </tbody>
                       <%} %>
                        </table>
                    </div>
                </div>
         
         <script type="text/javascript">
    function borrowbook(bid) {
    	con=confirm("是否借阅?"); 
    	if(con==true){
    		location.href = "/demo_war_exploded/borrowServlet?tip=1&bid="+bid;
    	}
    }
    </script>
        </div>
    </div>
</div>

</body>
</html>