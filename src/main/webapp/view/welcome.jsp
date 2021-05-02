<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>My JSP 'welcome.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
</head>

<body class="welcome">  <!--这个是css, 别看-->
<h1 >登陆成功，欢迎学号为<%=request.getAttribute("id")%>的用户</h1> <br>
<h2 align="center" style="color: #0096e6">最终的用户界面,虽然不知道要干嘛</h2>
<a href="ShowAllServlet">查看所有用户</a>
</body>
</html>