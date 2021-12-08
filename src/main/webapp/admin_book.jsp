<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sp.bean.AdminBean" %>
<%@ page import="com.sp.dao.AdminDao" %>
<%@ page import="com.sp.bean.BookBean" %>
<%@ page import="com.sp.dao.BookDao" %>
<%@ page import="com.sp.dao.TypeDao" %>
<%@ page import="com.sp.bean.TypeBean" %>
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
							<div class="text-muted bootstrap-admin-box-title">查询</div>
						</div>
						<div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
							<form class="form-horizontal" action="<%=request.getContextPath()%>/selectServlet" method="post">
								<input type="hidden" name="tip" value="1">
								<div class="col-lg-7 form-group">
									<label class="col-lg-4 control-label" for="query_bname">图书名称</label>
									<div class="col-lg-8">
										<input class="form-control" id="bookName" name="name" type="text" value="">
										<label class="control-label" for="query_bname" style="display: none;"></label>
									</div>
								</div>
								<div class="col-lg-3 form-group">

									<button type="submit" class="btn btn-primary" id="btn_query" onclick="">查询</button>
								</div>
								<div class="col-lg-3 form-group">

									<button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal">添加图书</button>
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


						<!---在此插入信息-->
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
						<%--<td><%= bean.getNum() %></td>--%>
						<td><button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal"
									id="btn_update" onclick="showInfo2(<%= bean.getBid() %>)">修改</button>
							<%--id="btn_update" onclick="showInfo2(<%= bean.getBid() %>,<%= bean.getCard() %>,<%= bean.getType() %>,<%= bean.getName() %>--%>
							<%--,<%= bean.getAutho() %>,<%= bean.getPress() %>,<%= bean.getNum() %>)">修改</button>--%>
							<button type="button" class="btn btn-danger btn-xs" onclick="deletebook(<%= bean.getBid() %>)">删除</button>
						</td>
						</tbody>
						<%} %>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function showInfo2(bid) {
			// document.getElementById("updateISBN").value = card;
			// document.getElementById("updateBookName").value = name;
			// document.getElementById("updateAutho").value = autho;
			// document.getElementById("updatePress").value = press;
			// document.getElementById("updateBookType").value = type;
			// document.getElementById("updateNum").value = num;
			document.getElementById("updateBookId").value = bid;
		}
		function deletebook(bid) {
			con=confirm("是否删除?");
			if(con==true){
				location.href = "<%=request.getContextPath()%>/deleteServlet?bid="+bid;
			}
		}
	</script>


	<!-- 修改模态框（Modal） -->
	<!-------------------------------------------------------------->

	<!-- 修改模态框（Modal） -->
	<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/updateBookServlet">   <!--保证样式水平不混乱-->
		<div class="modal" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="updateModalLabel">
							修改图书信息
						</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">图书号</label>
							<div class="col-sm-7">
								<input type="hidden" id="updateBookId" name="updatebid">
								<input type="text" class="form-control" id="updateISBN" name="card"  placeholder="请输入书号">
								<label class="control-label" for="updateISBN" style="display: none;"></label>
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">图书名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateBookName" name="name"  placeholder="请输入图书名称">
								<label class="control-label" for="updateBookName" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">图书类型</label>
							<div class="col-sm-7">
								<select class="form-control" id="updateBookType" name="type" onPropertyChange="showValue(this.value)">
									<option value="-1">请选择</option>
									<%
										TypeDao typedao = new TypeDao();
										ArrayList<TypeBean> data = (ArrayList<TypeBean>)typedao.get_ListInfo();
										data = (ArrayList<TypeBean>)typedao.get_ListInfo();
										for (TypeBean bean : data){
									%>                 <option value="<%= bean.getName() %>"><%= bean.getName() %></option>                        <%} %>
								</select>
								<label class="control-label" for="updateBookType" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">作者名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateAutho" name="autho" placeholder="请输入作者名称">
								<label class="control-label" for="updateAutho" style="display: none;"></label>
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">出版社</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatePress" name="press"  placeholder="请输入出版社">
								<label class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">总数量</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateNum" name="num"  placeholder="请输入总数量">
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
	<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/AddBookServlet">   <!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							添加新图书
						</h4>
					</div>
					<div class="modal-body">

						<!---------------------表单-------------------->

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">图书号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addISBN" required="required" name="card" placeholder="请输入书号">
								<label class="control-label" for="addISBN" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">图书名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addBookName" required="required" name="name"  placeholder="请输入图书名称">
								<label class="control-label" for="addBookName" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">图书类型</label>
							<div class="col-sm-7">
								<select class="form-control" id="addBookType" name="type">
									<option value="无分类">请选择</option>
									<%

										data = (ArrayList<TypeBean>)typedao.get_ListInfo();
										for (TypeBean bean : data){
									%>                 <option value="<%= bean.getName() %>"><%= bean.getName() %></option>                        <%} %>
								</select>
								<label class="control-label" for="addBookType" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">作者名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addAutho" required="required" name="autho"  placeholder="请输入作者名称">
								<label class="control-label" for="addAutho" style="display: none;"></label>
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">出版社</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addPress" required="required" name="press"  placeholder="请输入出版社">
								<label class="control-label" for="addPress" style="display: none;"></label>
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">总数量</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addNum" required="required" name="num" placeholder="请输入图书总数量">
								<label class="control-label" for="addNum" style="display: none;"></label>
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