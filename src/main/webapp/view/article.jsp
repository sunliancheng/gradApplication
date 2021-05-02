<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>每日复盘</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
<%--    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>
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

<%--    <link href="../css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- 所需js/css文件 -->
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">--%>
<%--    <script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/js/bootstrap-switch.min.js"></script>--%>

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

<%-- 顶部导航栏 --%>
<div class="top">
    <center>
        <ul>
            <li><a href="/transaction">个人事务</a></li>
            <li><a href="/article">每日复盘</a></li>
            <li><a href="/contact">我的联系人</a></li>
            <li><a href="/main"><b>日历</b></a></li>
            <li><a href="/unLogin">登出</a></li>
        </ul>
    </center>
</div>


<div class="container">



    <div style="height: 30px" ></div>
<%--    <div><input type="checkbox" checked id="checkbox"/></div>--%>

    <input type="text" id="ctx" hidden="hidden" th:value="${#request.getContextPath()}">
    <div class="search">
        <div class="input-group col-md-8">
            <button class="btn btn-success" type="button" id="add">添加</button>
            <input class="form-control" type="text" id="username" placeholder="请输入账号，按回车键">
            <span class="input-group-btn">
					<button class="btn btn-primary" type="button" id="search">查询</button>
			</span>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="portlet">
                <div class="category-list">
                    <table class="table table-striped table-hover" id="dataTable">
                        <thead>
                        <tr>
                            <th width="150">标题</th>
                            <th width="450">日记内容</th>
                            <th>日记日期</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8" align="center" style="position: fixed; bottom: 10%;">
            <!-- 分页控件，标签必须是<ul> -->
            <ul id="pageButton" class="pagination-centered"></ul>
        </div>
    </div>
</div>

<!--新增框-->
<div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新增日记</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="exit()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="text" id="m_id" hidden="hidden">
                <div class="form-group">
                    <label class="control-label" for="m_title">标题：</label>
                    <input type="text" class="form-control" id="m_title" placeholder="请输入标题......">
                </div>
                <div class="form-group">
                    <label class="control-label" for="m_content">日记正文：</label>
                    <input style="height: 180px" type="text" class="form-control" id="m_content" placeholder="请输入备注内容......">
                </div>
<%--                <div class="form-group">--%>
<%--                    <label class="control-label" for="m_truename">姓名：</label>--%>
<%--                    <input type="text" class="form-control" id="m_truename" placeholder="">--%>
<%--                </div>--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="exit()">关闭</button>
                <button type="button" class="btn btn-primary" onclick="add(3)">新增</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

<!--编辑框-->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">修改日记</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="exit2()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="text" id="m_id2" hidden="hidden">
                <div class="form-group">
                    <label class="control-label" for="m_title2">标题：</label>
                    <input type="text" class="form-control" id="m_title2" placeholder="请输入标题......">
                </div>
                <div class="form-group">
                    <label class="control-label" for="m_content2">日记正文：</label>
                    <input style="height: 180px" type="text" class="form-control" id="m_content2" placeholder="请输入日记内容......">
                </div>
                <%--                <div class="form-group">--%>
                <%--                    <label class="control-label" for="m_truename">姓名：</label>--%>
                <%--                    <input type="text" class="form-control" id="m_truename" placeholder="">--%>
                <%--                </div>--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="exit2()">关闭</button>
                <button type="button" class="btn btn-primary" onclick="modify()">修改</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-paginator.js"></script>
<script src="../js/util.js"></script>

<script type="text/javascript">
    var ctx = '';
    $(function () {
        // 查询第一页数据
        getPage(1);
        // 新增
        $("#add").click(function () {
            reset();
            $('#modify').modal('show');
        });

        // 搜索
        $("#search").click(function () {
            getPage(1);
        });

        // 回车触发查询
        $("#username").keyup(function (event) {
            if (event.keyCode == 13) {
                $("#search").trigger("click");
            }
        });
    });

    // 获取指定页码的数据
    function getPage(pageNo) {
        //window.alert(ctx)
        var dataRow = "";
        $.ajax({
                url: ctx + "/list",
                type: "post",
                data: {
                    "userid": $("#username").val(),
                    "pageNo": pageNo
                },
                dataType: "json",
                success: function (response) {
                    dataRow = "";
                    if (response.data.records.length > 0) {
                        //console.log(111)
                        $.each(response.data.records, function (i, r) {
                            dataRow += '<tr>'
                                + '<td>'
                                + r.title
                                + '</td>'
                                + '<td>'
                                + r.content
                                + '</td>'
                                //+ '<td><div class="bootstrap-switch bootstrap-switch-wrapper bootstrap-switch-normal bootstrap-switch-id-checkbox bootstrap-switch-animate bootstrap-switch-off" style="width: 102px;"><div class="bootstrap-switch-container" style="width: 150px; margin-left: -50px;"><span class="bootstrap-switch-handle-on bootstrap-switch-success" style="width: 50px;">ON</span><span class="bootstrap-switch-label" style="width: 50px;">&nbsp;</span><span class="bootstrap-switch-handle-off bootstrap-switch-info" style="width: 50px;">OFF</span><input type="checkbox" checked="" id="checkbox""></div></div></td>'
                            ;

                            dataRow += '<td>' + new Date(r.createdate).Format("yyyy-MM-dd hh:mm") + '</td><td><a href="javascript:remove(' + r.id + ')" style="color: #CA0C16;">删除' +
                                '</a>&nbsp;&nbsp;<a href="javascript:edit(' + r.id + ')">编辑</a></td></tr>';
                        });
                    }

                    // console.log(dataRow);
                    $("#dataTable tbody").empty();
                    $("#dataTable tbody").append(dataRow);
                    // 分页按钮
                    var element = $('#pageButton');
                    var options = {
                        bootstrapMajorVersion: 4,
                        currentPage: pageNo, // 当前页数
                        numberOfPages: 5, // 显示按钮的数量
                        totalPages: response.data.pages, // 总页数
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first":
                                    return "首页";
                                case "prev":
                                    return "上一页";
                                case "next":
                                    return "下一页";
                                case "last":
                                    return "末页";
                                case "page":
                                    return page;
                            }
                        },
                        // 点击事件，用于通过Ajax来刷新整个list列表
                        onPageClicked: function (event, originalEvent, type, page) {
                            getPage(page);
                        }
                    };

                    element.bootstrapPaginator(options);
                }
            }
        )
    }

    //删除
    function remove(id) {
        //window.alert(id)
        if (confirm("确定删除数据？")) {
            $.ajax({
                type: "POST",
                url: ctx + "/deleteArticle",
                traditional: true,
                data: {
                    id: id
                },
                success: function (data) {
                    getPage(1);
                },
                error: function (e) {
                    //alert("ERROR: ", e);
                    console.log("ERROR: ", e);
                }
            });
        }
    }

    function edit(id) {
        $.ajax({
            url: ctx + "/getArticle?id=" + id,
            type: "GET",
            success: function (result) {
                //console.log(result.title)
                //向模态框中传值
                $('#m_id2').val(id);
                $('#m_title2').val(result.title);
                $('#m_content2').val(result.content);
            }
        });

        $('#edit').modal('show');

    }

    function add(userid) {
        $.ajax({
            url: ctx + "/addArticle",
            type: "POST",

            data: {id:3, title:$('#m_title').val(), content:$('#m_content').val(), userid: userid},
            success: function (result) {
                getPage(1)
            }
        });
        exit()
    }

    function exit() {
        $('#modify').modal('hide');
    }

    function exit2() {
        $('#edit').modal('hide');
    }

    //提交修改
    function modify() {
        //获取模态框数据
        var id = $("#m_id2").val();
        var title = $("#m_title2").val();
        var content = $("#m_content2").val();

        $.ajax({
            url: ctx + "/updateArticle",
            type: "POST",
            //contentType: "application/json",
            data: {id: id, title: title, content: content},
            success: function (data) {
                exit2()
                getPage()
            }
        });
    }

    function reset() {
        $("#m_id").val("");
        $("#m_username").val("");
        $("#m_email").val("");
        $("#m_truename").val("");
    }
</script>

<script type="text/javascript">
    $(function(){
        /* 初始化控件 */
        $("#checkbox").bootstrapSwitch({
            onText : "ON",      // 设置ON文本
            offText : "OFF",    // 设置OFF文本
            onColor : "success",// 设置ON文本颜色     (info/success/warning/danger/primary)
            offColor : "info",  // 设置OFF文本颜色        (info/success/warning/danger/primary)
            size : "normal",    // 设置控件大小,从小到大  (mini/small/normal/large)
            // 当开关状态改变时触发
            onSwitchChange : function(event, state) {
                if (state == true) {
                    alert("ON");
                } else {
                    alert("OFF");
                }
            }
        });
    });
</script>
</body>
</html>

