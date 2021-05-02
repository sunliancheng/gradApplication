<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>Login</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="../css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="../css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="../css/component.css"/>
    <script type="text/javascript">
        // 验证输入不为空的脚本代码
        function checkForm(form) {
            if (form.id.value == "") {
                alert("账户名不能为空!");
                form.id.focus();
                return false;
            }
            if (form.userpwd.value == "") {
                alert("密码不能为空!");
                form.userpwd.focus();
                return false;
            }
            return true;
        }
    </script>

</head>

<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h2></h2>
                <form action="/doRegister" method="post" onsubmit="return checkForm(this);">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="name" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="password" class="text"
                               style="color: #FFFFFF !important; position:absolute; z-index:100;" value=""
                               type="password" placeholder="请输入密码">
                    </div>

                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="age" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入年龄">
                    </div>

                    <div class="input_outer" hidden="true">
                        <span class="u_user"></span>
                        <input name="id" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入年龄" value="3">
                    </div>

                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="email" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入邮箱">
                    </div>

                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="phone" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入手机号">
                    </div>
                    <div>
                        <input class="mb2" type="submit" id="register_but" name="" value="注册" >
                    </div>
<%--                    <div>--%>
<%--                        <p class="register"><a href="../view/register.jsp">点我注册！</a></p>--%>
<%--                    </div>--%>
                </form>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script type="text/javascript" src="../js/TweenLite.min.js"></script>
<script type="text/javascript" src="../js/EasePack.min.js"></script>
<script type="text/javascript" src="../js/rAF.js"></script>
<script type="text/javascript" src="../js/demo-1.js"></script>
<script type="text/javascript" src="../js/main.js"></script>


<div style="text-align:center;">
</div>
</body>
</html>