<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.sp.bean.TypeBean,com.sp.dao.AdminDao,com.sp.dao.TypeDao,com.sp.bean.TypeBean,com.sp.dao.BookDao,com.sp.bean.AdminBean" %>
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
		<div class="col-md-10">


			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">图书分类管理</div>
						</div>
						<div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
							<form class="form-horizontal" action="<%=request.getContextPath()%>/selectServlet" method="post">

								<div class="col-lg-3 form-group">

									<button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal">添加分类</button>
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
							<th>图书分类名称</th>
							<th>操作</th>

						</tr>
						</thead>


						<!---在此插入信息-->
						<%
							ArrayList<TypeBean> bookdata = new ArrayList<TypeBean>();
							bookdata = (ArrayList<TypeBean>)request.getAttribute("data");
							if(bookdata==null){
								TypeDao bookdao = new TypeDao();
								bookdata = (ArrayList<TypeBean>)bookdao.get_ListInfo();
							}

							for (TypeBean bean : bookdata){
						%>
						<tbody>

						<td><%= bean.getName() %></td>

						<td><button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal"
									id="btn_update" onclick="showInfo2(<%= bean.getTid() %>)">修改</button>
							<button type="button" class="btn btn-danger btn-xs" onclick="deletebook(<%= bean.getTid() %>)">删除</button>
						</td>
						</tbody>
						<%} %>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function showInfo2(tid) {
			document.getElementById("updatetid").value = tid;
			// document.getElementById("updatename").value = name;
		}
		function deletebook(tid) {
			con=confirm("是否删除?");
			if(con==true){
				location.href = "<%=request.getContextPath()%>/deleteTypeServlet?tid="+tid;
			}
		}
	</script>


	<!-- 修改模态框（Modal） -->
	<!-------------------------------------------------------------->

	<!-- 修改模态框（Modal） -->
	<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/updateBookTypeServlet">   <!--保证样式水平不混乱-->
		<div class="modal" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="updateModalLabel">
							修改图书分类
						</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">图书名称</label>
							<div class="col-sm-7">
								<input type="hidden" name="tid" id="updatetid">
								<input type="text" class="form-control" id="updatename" name="name"  placeholder="请输入图书分类名称">
								<label class="control-label" for="updateBookName" style="display: none;"></label>
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
	<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/AddBookTypeServlet">   <!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							添加新图书分类
						</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">分类名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addBookName" required="required" name="name"  placeholder="请输入图书分类名称">
								<label class="control-label" for="addBookName" style="display: none;"></label>
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