<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin后台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
<%--    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    --%>
    <link href="../css/bootstrap.min.css" rel="stylesheet">


    <style>
        body {
            padding-top: 50px;
            padding-bottom: 20px;
        }
        .body-content {
            margin-top:20px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

    <link rel='stylesheet' href='../css/calender.css' />
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 20px;
        }
        .body-content {
            margin-top:20px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>


    <style>
    body {
        padding-top: 50px;
        padding-bottom: 20px;
    }
    .body-content {
        margin-top:20px;
        padding-left: 15px;
        padding-right: 15px;
    }
</style>

    <style type="text/css">
        .container {
            padding: 20px;
        }

        .search {
            padding-bottom: 20px;
            border-bottom: 1.5px solid #ddd;
        }

        #add {
            margin-right: 5em;
        }

        #search {
            margin-left: 0.5em;
        }

        .pagination {
            display: flex;
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }

        .pagination>li:last-child>a, .pagination>li:last-child>span {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
        }

        .pagination>li:first-child>a, .pagination>li:first-child>span {
            margin-left: 0;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
        }

        .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
            z-index: 3;
            color: #fff;
            cursor: default;
            background-color: #337ab7;
            border-color: #337ab7;
        }

        .pagination>li>a, .pagination>li>span {
            position: relative;
            float: left;
            padding: 6px 12px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
            cursor: pointer;
        }
    </style>

</head>
<body>
<style type="text/css">
    .top{
        /* 设置宽度高度背景颜色 */
        height: auto; /*高度改为自动高度*/
        width:100%;
        margin-left: 0;
        background:rgb(189, 181, 181);
        position: fixed; /*固定在顶部*/
        top: 0;/*离顶部的距离为0*/
        margin-bottom: 5px;
    }
    .top ul{
        /* 清除ul标签的默认样式 */
        width: auto;/*宽度也改为自动*/
        list-style-type: none;
        white-space:nowrap;
        overflow: hidden;
        margin-left: 5%;
        /* margin-top: 0;          */
        padding: 0;

    }
    .top li {
        float:left; /* 使li内容横向浮动，即横向排列  */
        margin-right:2%;  /* 两个li之间的距离*/
        position: relative;
        overflow: hidden;
    }

    .top li a{
        /* 设置链接内容显示的格式*/
        display: block; /* 把链接显示为块元素可使整个链接区域可点击 */
        color:white;
        text-align: center;
        padding: 3px;
        overflow: hidden;
        text-decoration: none; /* 去除下划线 */

    }
    .top li a:hover{
        /* 鼠标选中时背景变为黑色 */
        background-color: #111;
    }
    .top ul li ul{
        /* 设置二级菜单 */
        margin-left: -0.2px;
        background:rgb(189, 181, 181);
        position: relative;
        display: none; /* 默认隐藏二级菜单的内容 */

    }
    .top ul li ul li{
        /* 二级菜单li内容的显示 */

        float:none;
        text-align: center;
    }
    .top ul li:hover ul{
        /* 鼠标选中二级菜单内容时 */
        display: block;
    }
    body{
        background:#eff3f5;
    }

</style>
<%
    String isHidden = "visible", isVisible = "hidden";
    if (session == null) return;
    String token = (String) session.getAttribute("token");
    if (token != null && !token.equals("")) {
        isHidden = "hidden";
        isVisible = "visible";
    } else {
        isHidden = "visible";
        isVisible = "hidden";
    }
%>
<%-- 顶部导航栏 --%>
<div class="top">
    <center>
        <ul>
            <li><a href="/transaction">个人事务</a></li>
            <li><a href="/article">每日复盘</a></li>
            <li><a href="/contact">我的联系人</a></li>
            <li><a href="/main"><b>日历</b></a></li>
            <li style="visibility: <%=isVisible%>"><a href="/unLogin">登出</a></li>
        </ul>
    </center>
</div>

<style type="text/css">
    .top{
        /* 设置宽度高度背景颜色 */
        height: auto; /*高度改为自动高度*/
        width:100%;
        margin-left: 0;
        background:rgb(189, 181, 181);
        position: fixed; /*固定在顶部*/
        top: 0;/*离顶部的距离为0*/
        margin-bottom: 5px;
    }
    .top ul{
        /* 清除ul标签的默认样式 */
        width: auto;/*宽度也改为自动*/
        list-style-type: none;
        white-space:nowrap;
        overflow: hidden;
        margin-left: 5%;
        /* margin-top: 0;          */
        padding: 0;

    }
    .top li {
        float:left; /* 使li内容横向浮动，即横向排列  */
        margin-right:2%;  /* 两个li之间的距离*/
        position: relative;
        overflow: hidden;
    }

    .top li a{
        /* 设置链接内容显示的格式*/
        display: block; /* 把链接显示为块元素可使整个链接区域可点击 */
        color:white;
        text-align: center;
        padding: 3px;
        overflow: hidden;
        text-decoration: none; /* 去除下划线 */

    }
    .top li a:hover{
        /* 鼠标选中时背景变为黑色 */
        background-color: #111;
    }
    .top ul li ul{
        /* 设置二级菜单 */
        margin-left: -0.2px;
        background:rgb(189, 181, 181);
        position: relative;
        display: none; /* 默认隐藏二级菜单的内容 */

    }
    .top ul li ul li{
        /* 二级菜单li内容的显示 */

        float:none;
        text-align: center;
    }
    .top ul li:hover ul{
        /* 鼠标选中二级菜单内容时 */
        display: block;
    }
    body{
        background:#eff3f5;
    }

</style>

<div align="center">
    <div class='calendar' id='calendar'></div>
</div>

<div id="last" style="bottom: 150px">

    <div style="visibility: <%=isHidden%>" align="center">你还没登陆：<a href="/login" > 登陆 </a> <a href="/register"> 注册 </a></div>
</div>

<script type='text/javascript' src='../js/calender.js'></script>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>