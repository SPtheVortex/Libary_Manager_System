<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    //获取绝对路径路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath %>" />
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="static/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="static/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="static/assets/css/ace.min.css" />
    <link rel="stylesheet" href="static/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="static/assets/css/ace-skins.min.css" />
    <script src="static/assets/js/ace-extra.min.js"></script>
    <script src="static/assets/js/jquery.min.js"></script>
</head>
<body>
<div class="navbar navbar-default" id="navbar">

    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a class="navbar-brand">
                <small>
                    欢迎光临图书馆
                </small>
            </a>
            <a class="navbar-brand"><small>您好，尊敬的用户</small><a class="navbar-brand"><small>${admin.username}</small></a></a>
            <!-- /.brand -->
        </div>
        <!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">

            <ul class="nav ace-nav">
                <li class="red">
                    <a href="<%=request.getContextPath()%>/login.jsp">退出登录</a>
                </li>

            </ul>

        </div>
        <!-- /.navbar-header -->
    </div>
    <!-- /.container -->
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#"> <span
                class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>


            <ul class="nav nav-list">
                <li>
                    <a href="/demo_war_exploded/select.jsp" target="mainframe" class="mainframe">
                        <span class="menu-text"> 图书查询 </span>
                    </a>

                </li>

                <li>
                    <a href="/demo_war_exploded/borrow.jsp" target="mainframe" class="mainframe">
                        <span class="menu-text"> 借阅管理 </span>
                    </a>
                </li>

                <li>
                    <a href="/demo_war_exploded/history.jsp" target="mainframe" class="mainframe">
                        <span class="menu-text"> 借阅历史 </span>
                    </a>
                </li>
            </ul>
            <!-- /.nav-list -->
        </div>


        <div class="main-content" id="mains">
            <iframe id="mainframe" name="mainframe" src="/demo_war_exploded/select.jsp" style="width: 100%;border: 0px;"> </iframe>
        </div>
        <script type="text/javascript">
            var height = jQuery(window).height() - 50;
            jQuery("#mainframe").attr("height", "" + height + "px;");
        </script>
    </div>

</div>

</body>
</html>
