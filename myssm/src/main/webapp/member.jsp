<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<%
    String ctx=request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

    <%--jquery引入要在bootstrap之前  ！！！！非常重要--%>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/js/bootstrap.min.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/bootstrap.min.css">
</head>
<body>




<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">TrainingCollege</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="<%=ctx%>/index.jsp">主页</a></li>
                <li><a href="#">所有课程</a></li>
                <li><a href="#">我的课程</a></li>
                <li><a href="#">管理员登录</a></li>
            </ul>
            <%
                String username=(String)session.getAttribute("username");
                if(username==null){
            %>
            <form class="navbar-form navbar-right" action="<%=ctx%>/login" method="post">
                <div class="form-group">
                    <input type="text" placeholder="账号" class="form-control" name="username" required>
                </div>
                <div class="form-group">
                    <input type="password" placeholder="密码" class="form-control" name="password" required>
                </div>
                <button type="submit" class="btn btn-success">登录</button>
            </form>
            <%
            }else {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li><a><%=username%>,欢迎你</a></li>
                <li><a id="change" href="#" data-toggle="modal"
                       data-target="#myModal">修改密码</a></li>
                <li><a href="#">退出登录</a></li>
            </ul>
            <%
                }
            %>

        </div>


    </div>
</nav>

<div class="container">
    <div class="alert alert-danger" style="margin-top: 80px">
        哈哈哈哈
    </div>
    <div class="jumbotron" style="height: 350px; color: #f0efee;background:url(${pageContext.request.contextPath }/resources/img/login/bg1.jpg)">
        <h1>欢迎登陆学生社团管理系统!</h1>
        <p>welcome to students' club manage system!</p>
    </div>
</div>
<div class="container">
    <ol class="breadcrumb" style="margin-top: 10px">
        <li class="active">热门课程</li>
    </ol>
    <div class="row">
        <div class="col-sm-4">
            One of three columns
        </div>
        <div class="col-sm-4">
            One of three columns
        </div>
        <div class="col-sm-4">
            One of three columns
        </div>
    </div>

    <%--<div class="btn-group btn-group-justified">--%>
    <%--&lt;%&ndash;<div class="btn-group" role="group">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<button type="button" class="btn btn-default">Left</button>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
    <%--<div class="btn-group">--%>
    <%--<button class="btn btn-default btn-lg">Middle</button>--%>
    <%--</div>--%>
    <%--&lt;%&ndash;<div class="btn-group" role="group">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<button type="button" class="btn btn-default">Right</button>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
    <%--</div>--%>

    <div class="btn-group btn-group-justified">
        <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
            开始演示模态框
        </button>
    </div>
    <div class="dropdown">
        <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">主题
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">Java</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">数据挖掘</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">数据通信/网络</a>
            </li>
            <li role="presentation" class="divider"></li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">分离的链接</a>
            </li>
        </ul>
    </div>
</div>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改密码
                </h4>
            </div>
            <div class="modal-body">
                <form action="/changePwd" method="post">
                    <div class="form-group">
                        <label for="old">旧密码</label>
                        <input type="password" class="form-control" id="old" name="old" placeholder="旧密码" required>
                    </div>
                    <div class="form-group">
                        <label for="newpwd">新密码</label>
                        <input type="password" class="form-control" id="newpwd" name="newpwd" placeholder="新密码" required>
                    </div>
                    <div class="form-group">
                        <label for="newagain">确认新密码</label>
                        <input type="password" class="form-control" id="newagain" name="newagain" placeholder="再次输入新密码" required>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" value="提交">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
