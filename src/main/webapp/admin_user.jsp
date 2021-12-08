<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sp.bean.AdminBean" %>
<%@ page import="com.sp.dao.AdminDao" %>
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

	<script src="static/ajax-lib/ajaxutils.js"></script>
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
	<!-- left, vertical navbar & content -->
	<div class="row">
		<!-- content -->
		<div class="col-md-10">


			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">读者管理</div>
						</div>
						<div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
							<form class="form-horizontal" action="<%=request.getContextPath()%>/selectServlet" method="post">

								<div class="col-lg-3 form-group">

									<button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal">添加读者</button>
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
							<th>账号</th>
							<th>姓名</th>
							<th>邮箱</th>
							<th>手机号</th>
							<%--<th>当前借阅数</th>--%>
							<%--<th>历史借阅数</th>--%>
							<th>可借阅天数</th>
							<th>最大可借数</th>
							<th>操作</th>

						</tr>
						</thead>


						<!---在此插入信息-->
						<%
							ArrayList<AdminBean> data2 = new ArrayList<AdminBean>();
							data2 = (ArrayList<AdminBean>)request.getAttribute("data");
							if(data2==null){

								data2 = (ArrayList<AdminBean>)admindao.get_ListInfo();
							}

							for (AdminBean bean : data2){
						%>
						<tbody>
						<td><%= bean.getUsername() %></td>
						<td><%= bean.getName() %></td>
						<td><%= bean.getEmail() %></td>
						<td><%= bean.getPhone() %></td>
						<%--<td>1</td>  --%>
						<%--<td>1</td>--%>
						<td><%= bean.getLend_num() %></td>
						<td><%= bean.getMax_num() %></td>
						<td><button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal"
									id="btn_update"
						<%--onclick="showInfo2(<%= bean.getAid() %>,<%= bean.getUsername() %>,<%= bean.getName() %>,<%= bean.getEmail() %>--%>
						<%--,<%= bean.getPhone() %>,<%= bean.getPassword() %>,<%= bean.getLend_num() %>,<%= bean.getMax_num() %>)">修改</button>--%>
									onclick="showInfo2(<%= bean.getAid() %>)">修改</button>
							<button type="button" class="btn btn-danger btn-xs" onclick="deletebook(<%= bean.getAid() %>)">删除</button>
						</td>
						</tbody>
						<%} %>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function showInfo2(aid) {
			document.getElementById("updateaid").value = aid;

		}
		// function showInfo2(aid,username,name,email,phone,password,lend_num,max_num) {
		//     document.getElementById("updateaid").value = aid;
		//     document.getElementById("updateusername").value = username;
		//     document.getElementById("updatename").value = name;
		//     document.getElementById("updateemail").value = email;
		//     document.getElementById("updatephone").value = phone;
		//     document.getElementById("updatepassword").value = password;
		//     document.getElementById("updatelend_num").value = lend_num;
		//     document.getElementById("updatemax_num").value = max_num;
		// }
		function deletebook(aid) {
			con=confirm("是否删除?");
			if(con==true){
				location.href = "<%=request.getContextPath()%>/deleteUserServlet?aid="+aid;
			}
		}
	</script>


	<!-- 修改模态框（Modal） -->
	<!-------------------------------------------------------------->

	<!-- 修改模态框（Modal） -->
	<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/updateUserServlet">   <!--保证样式水平不混乱-->
		<div class="modal" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="updateModalLabel">
							修改读者信息
						</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">账号</label>
							<div class="col-sm-7">
								<input type="hidden" id="updateaid" name="aid">
								<input type="text" class="form-control" id="updateusername" name="username"  placeholder="">
								<label class="control-label" for="updateISBN" style="display: none;"></label>
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatename" name="name"  placeholder="">
								<label class="control-label" for="updateBookName" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateemail" name="email" placeholder="">
								<label class="control-label" for="updateAutho" style="display: none;"></label>
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">手机号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatephone" name="phone"  placeholder="">
								<label class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">密码</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatepassword" name="password"  placeholder="">
								<label class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">可借阅天数</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatelend_num" name="lend_num"  placeholder="">
								<label class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">最大借阅数</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatemax_num" name="max_num"  placeholder="">
								<label class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="submit" class="btn btn-primary" >
							修改
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>

	</form>
	<!-------------------------------------------------------------->







	<!--------------------------------------添加的模糊框------------------------>
	<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/AddUserServlet">   <!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							添加新读者
						</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">账号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="username" id="addISBN" required="required" placeholder="请输入账号">
								<label class="control-label" for="addISBN" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="name" id="addBookName" required="required"  placeholder="请输入姓名">
								<label class="control-label" for="addBookName" style="display: none;"></label>
							</div>
						</div>



						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="email" id="addAutho" required="required"  placeholder="请输入邮箱">
								<label class="control-label" for="addAutho" style="display: none;"></label>
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">手机号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="phone" id="addPress" required="required"  placeholder="请输入手机号">
								<label class="control-label" for="addPress" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">密码</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="password" id="addPress" required="required"   placeholder="请输入密码">
								<label class="control-label" for="addPress" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">可借阅天数</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="lend_num" id="updatelend_num" required="required"  placeholder="请输入可借阅天数">
								<label class="control-label" for="addNum" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">最大可借数</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="max_num" id="updatemax_num" required="required" placeholder="请输入最大可借数">
								<label class="control-label" for="addPress" style="display: none;"></label>
							</div>
						</div>


						<!---------------------表单-------------------->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="submit" class="btn btn-primary" >
							添加
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>

	</form>
</body>
</html>