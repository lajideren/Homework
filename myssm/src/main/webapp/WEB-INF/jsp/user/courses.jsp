<%@ page import="po.User" %>
<%@ page import="po.Course" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<%
    String ctx=request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%--jquery引入要在bootstrap之前  ！！！！非常重要--%>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery.validate.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap.js"></script>

    <script type="application/javascript">
        function httpPost(URL,PARAMS) {
                var temp = document.createElement("form");
                temp.action = URL;
                temp.method = "post";
                temp.style.display = "none";

                for (var x in PARAMS) {
                    var opt = document.createElement("textarea");
                    opt.name = x;
                    opt.value = PARAMS[x];
                    temp.appendChild(opt);
                }

                document.body.appendChild(temp);

                temp.submit();

                return temp;

        }
    </script>




    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">

    <style>
        .table th, .table td {
            text-align: center;
            vertical-align: middle!important;
        }

        h3{
            color: #3fb7b4;
        }

        .part-vertical{
            border-bottom: 1px solid #3fb7b4;
            width: 60%;
            padding-left: 20px;
            padding-bottom: 20px;

            /*border: #3fb7b4;*/
        }

        .part-horizonal{
            border-right: 1px solid #3fb7b4;
            width: 75%;
            padding-right: 20px;
        }

        .price{
            float: right;
            clear: both;
            margin-right: 7%;
            color: #ea645d;
            font-size: 30px;
        }

        .tooltip-inner{
            background-color: #2aabd2;
            color: white;
        }



    </style>
</head>
<body>




<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=ctx%>/WEB-INF/index.jsp">TrainingCollege</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="<%=ctx%>/user/courses">所有课程</a></li>
                <li><a href="<%=ctx%>/user/info">我的信息</a></li>
                <li><a href="<%=ctx%>/user/orders">我的订单</a></li>

            </ul>

            <%
                User user=(User)request.getAttribute("user");
//                String tip="<lable style='display:block;'>等级:   "+user.getCredit()+"</lable>"
//                        +"<lable style='display:block'>积分:   "+user.getCredit()+"</lable>"
//                        +"<button class='btn btn-primary btn-sm btn-block'>积分兑换</button>";
            %>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><%=user.getUsername()%>,欢迎你</a></li>
                <%--<li><a data-toggle="tooltip" data-placement="bottom" data-html="true" title="<%=tip%>"><%=user.getUsername()%>,欢迎你</a></li>--%>
                <li><a href="<%=ctx%>/logoutUser"><span class="glyphicon glyphicon-log-out"></span>退出登录</a></li>
            </ul>

            <%--<script type="application/javascript">--%>
                <%--$("[data-toggle='tooltip']").tooltip();--%>
            <%--</script>--%>

        </div>
    </div>

</nav>

<div class="container" style="margin-top: 80px;width: 60%">
    <ol class="breadcrumb" >
        <li ><a>外语</a></li>
        <li class="active"><a>数学</a></li>
        <li class="active"><a>思政</a></li>
        <li class="active"><a>其他</a></li>
    </ol>
</div>

<div class="container" style="width: 60%">
<form action="http://www.baidu.com/baidu" style="margin-top: 10px">
<!--
将两个元素整合为一体需要下面两步~
1.将div的Class属性改变成form-inline 可以让下面的两个input并排显示-->
<div class="form-inline input-group">
<!--2.利用span标签的 input-group-btn 属性包裹一个input元素-->
<span class="input-group-btn">

<input id="kw" type="text" class="form-control" placeholder="输入关键字搜索课程" style="width:400px;">
<button type="button"  class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>&nbsp;搜索</button>

</span>
</div>
</form>
</div>

<%
List<Course> courses=(List)request.getAttribute("courses");
for(Course course:courses){
//    for(int i=0;i<10;i++){
%>


<div class="container part-vertical">



    <h3><%=course.getName()%></h3>
    <span class="price">￥<%=course.getPrice()%></span>
    <button type="button" class="btn btn-success btn-md" style="clear:both;float: right;margin-right: 7%" onclick="httpPost('<%=ctx%>/user/courseDetail',{cid:<%=course.getCid()%>})">
        <span class="glyphicon glyphicon-list-alt"></span>
        查看详情
    </button>
    <div class="part-horizonal">
    课程类型:&nbsp&nbsp <%=course.getType()%>
    </div>
    <div class="part-horizonal">
    课程简介:&nbsp&nbsp <%=course.getDetail()%>
    </div>
</div>
<%
    }
%>

<div class="modal fade" id="myModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="resetForm" action="<%=ctx%>/user/changePwd" method="post">
                    <div class="form-group">
                        <label>原密码</label>
                        <input type="password" class="form-control" name="oldPwd" placeholder="原密码">
                    </div>
                    <div class="form-group">
                        <label>新密码</label>
                        <input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="新密码">
                    </div>
                    <div class="form-group">
                        <label>确认新密码</label>
                        <input type="password" class="form-control" id="againPwd" name="againPwd" placeholder="再次输入新密码">
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-success" onclick="resetPwd()" value="修改">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
