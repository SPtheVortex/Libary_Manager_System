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
    <title>用户登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="static/resource/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="static/resource/css/font-awesome.min.css" />
    <link rel="stylesheet" href="static/resource/css/ace.min.css" />
    <link rel="stylesheet" href="static/resource/css/ace-rtl.min.css" />
</head>
<body class="login-layout">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <span class="white">图书馆管理系统</span>
                        </h1>
                        <h4 class="blue"></h4>
                    </div>
                    <div class="space-6"></div>
                    <div class="position-relative">
                        <div id="login-box"
                             class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="icon-coffee green"></i> 请输入您的账号和密码
                                    </h4>

                                    <div class="space-6"></div>
                                    <form action="/demo_war_exploded/login" method="post">
                                        <fieldset>
                                            <label class="block clearfix"> <span
                                                    class="block input-icon input-icon-right"> <input id="userId"
                                                                                                      input type="text" name="username" class="form-control"
                                                                                                      placeholder="请输入您的账号" /> <i class="icon-user"></i>
												</span>
                                            </label> <label class="block clearfix"> <span
                                                class="block input-icon input-icon-right"> <input id="userPw"
                                                                                                  input type="password" name="password" class="form-control"
                                                                                                  placeholder="请输入您的密码" /> <i class="icon-lock"></i>
												</span>
                                        </label>

                                            <div class="clearfix">
                                                <button input type="submit" value="submit"
                                                        class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i></i> 登陆
                                                </button>

                                            </div>
                                            <label class="control-label">没有账号请<a href="/demo_war_exploded/register.jsp" style="color:blue;">注册</a></label>

                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>

                                </div>

                            </div>

                        </div>


                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
