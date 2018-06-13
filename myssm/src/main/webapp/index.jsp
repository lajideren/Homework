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


    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">

    <style>
        .btn-detail{
            background-color: transparent;
            border: #2b669a;border-style:solid; border-width:1px;
            color: #2b669a;
            display: block;
            width: 70%;
            height: 40px;
            margin: 0 auto 0 auto;
        }
        .btn-detail:hover{
            background-color: #2b669a;
            border: #2b669a;border-style:solid; border-width:1px;
            color: white;
        }
    </style>


    <script type="application/javascript">
        $(document).ready(function(){

            $.validator.addMethod("checkName",function(value,element,params){
                var checkName = /^\w{2,10}$/g;
                return this.optional(element)||(checkName.test(value));
            },"*只允许2-10位英文字母、数字或者下画线！");

            $.validator.addMethod("checkPwd",function(value,element,params){
                var checkPwd = /^\w{2,10}$/g;
                return this.optional(element)||(checkPwd.test(value));
            },"*只允许2-10位英文字母、数字或者下画线！");
            $.validator.addMethod("checkEml",function(value,element,params){
                var checkEmail = /^[a-z0-9]+@([a-z0-9]+\.)+[a-z]{2,4}$/i;
                return this.optional(element)||(checkEmail.test(value));
            },"*请输入正确的邮箱！");
        })
    </script>
    <script type="application/javascript">
        function loginUser() {
            var form1 = $('#loginUserForm');
            form1.validate({
                rules: {
                    username: {
                        required: true,
                        checkName: true
                    },
                    password: {
                        required: true,
                        checkPwd: true
                    }
                },
                messages: {
                    username: {
                        required: "*名字必填"
                    },
                    password: {
                        required: "*密码必填"
                    }
                }
            });
            if (form1.valid()) {
                form1.attr("action", "<%=ctx%>/loginUserSubmit");
                form1.submit();
            }
        }
        function signupUser() {

            var form1=$('#signupUserForm');
            form1.validate({
                rules:{
                    username:{
                        required:true,
                        checkName:true
                    },
                    password:{
                        required:true,
                        checkPwd:true
                    },
                    email:{
                        required:true,
                        checkEml:true
                    }
                },
                messages:{
                    username:{
                        required:"*用户名不能为空"
                    },
                    password:{
                        required:"*密码不能为空"
                    },
                    email:{
                        required:"*邮箱不能为空"
                    }
                }
            });
            if(form1.valid()&&window.confirm("确认注册?")) {
                alert("注册成功，请登录邮件进行激活");
                form1.attr("action","<%=ctx%>/signupUserSubmit");
                form1.submit();
            }
        }

        function signupInst() {
            var form1=$('#signupInstForm');
            if(window.confirm("确认申请")){
                form1.attr("action","<%=ctx%>/signupInstSubmit");
                form1.submit();
            }
        }

        function loginInst() {
            var form1=$('#loginInstForm');
            form1.attr("action","<%=ctx%>/loginInstSubmit");
            form1.submit();
        }

        function loginManager() {
            var form1=$('#loginManagerForm');
            form1.attr("action","<%=ctx%>/loginManagerSubmit");
            form1.submit();
        }
    </script>
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
    <style type="text/css">
        label.error
        {
            color:Red;
            display: block;
            text-align: center;
            font-size:10px;
        }

        .alert-center{
            position: absolute;
            top:80px;
            left: 50%;
            margin-left:-40%;
            width: 80%;
        }
    </style>
</head>
<%--<body style="background: url(<%=ctx%>/resources/img/login/banner.jpg)">--%>
<body>
<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand" href="<%=ctx%>/index.jsp"><span class="glyphicon glyphicon-book"></span>&nbsp;TrainingCollege</a>
        </div>
        <div>

            <ol class="nav navbar-nav navbar-right">
                <li><a href="<%=ctx%>/loginUser"><span class="glyphicon glyphicon-log-in"></span>登录</a></li>
                <li><a href="<%=ctx%>/signupUser"><span class="glyphicon glyphicon-user"></span>注册</a></li>
            </ol>

        </div>
    </div>

</nav>



<%
    String action=request.getParameter("action");
    if(action==null){
%>

<div class="container-fluid" style="padding: 0;">
    <div class="jumbotron" style="background: url(<%=ctx%>/resources/img/banner.jpg);height:450px;text-align: center;color: white">
        <h1 style="margin-top:120px">欢迎来到Training College</h1>
        <h3>你可以在这里找到各样的课程!</h3>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" style="text-align: center;height: 300px">
                    <img src="<%=ctx%>/resources/img/education.png" style="height: 100px;margin-top: 35px">
                    <button class="btn-detail" onclick="httpPost('<%=ctx%>/signupInst')" style="margin-top: 50px">教育机构申请</button>
                </div>
            </div>

        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" style="text-align: center;height: 300px">
                    <img src="<%=ctx%>/resources/img/education1.png" style="height: 100px;margin-top: 35px">
                    <button class="btn-detail" onclick="httpPost('<%=ctx%>/loginInst')" style="margin-top: 50px">教育机构登录</button>
                </div>
            </div>

        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" style="text-align: center;height: 300px">
                    <img src="<%=ctx%>/resources/img/avatar.png" style="height: 100px;margin-top: 35px">
                    <button class="btn-detail" onclick="httpPost('<%=ctx%>/loginManager')" style="margin-top: 50px">经理登录</button>
                </div>
            </div>

        </div>
    </div>
</div>

<%
    }else if(action.equals("loginUser")){
        String msg=request.getParameter("msg");
//        System.out.println(msg);
        if(msg!=null){
%>

<div class="alert alert-danger alert-center" style="">
    <%=msg%>
</div>

<%

        }

%>

<div class="container" style="width:700px;margin-top: 200px">
    <div class="panel panel-default" >
        <div class="panel-body">
            <form id="loginUserForm" style="width: 500px;margin: 10px auto 0 auto" method="post">
                <h3 style="text-align: center;margin-bottom: 30px;color: #0e77af ">用户登录</h3>
                <div class="form-group" style="margin-top: 40px">
                    <input type="text" name="username" class="form-control" placeholder="用户名">
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <input type="password" name="password" class="form-control" placeholder="密码">
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <button type="button" onclick="loginUser()" class="btn btn-primary btn-block">登录</button>
                </div>

            </form>
        </div>
    </div>
</div>

<%

    }else if(action.equals("signupUser")){

%>

<div class="container" style="width:700px;margin-top: 200px">
    <div class="panel panel-default" >
        <div class="panel-body">
            <form id="signupUserForm" style="width: 500px;margin: 10px auto 0 auto" method="post">
                <h3 style="text-align: center;color:#0e77af;margin-bottom: 30px ">用户注册</h3>
                <div class="form-group" style="margin-top: 40px">
                    <input type="text" name="username" class="form-control" placeholder="用户名" required>
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <input type="password" name="password" class="form-control" placeholder="密码" required>
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <input type="email" name="email" class="form-control" placeholder="邮箱" required>
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <button type="button" onclick="signupUser()" class="btn btn-primary btn-block">注册</button>
                </div>

            </form>
        </div>
    </div>
</div>

<%

    }else if(action.equals("signupInst")){
        String msg=request.getParameter("msg");
        if(msg!=null&&msg.equals("申请成功")){
            String eid=request.getParameter("eid");
%>

<div class="alert alert-success alert-center">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg+"机构的编号是:"+eid%>
</div>

<%
    }else if(msg!=null&&msg.equals("申请失败")){
%>
<div class="alert alert-danger alert-center">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>

<%
    }
%>



<div class="container" style="width:700px;margin-top: 130px">
    <div class="panel panel-default" >
        <div class="panel-body">
            <form id="signupInstForm" style="width: 500px;margin: 10px auto 0 auto" method="post">
                <h3 style="text-align: center;color:#0e77af;margin-bottom: 30px ">教育机构申请</h3>
                <div class="form-group" style="margin-top: 40px">
                    <input type="text" name="name" class="form-control" placeholder="机构名称">
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <input type="password" name="password" class="form-control" placeholder="设置密码">
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <input type="text" name="location" class="form-control" placeholder="地点">
                </div>
                <textarea name="info" class="form-control" style="margin-top: 40px;height: 200px" placeholder="师资情况"></textarea>
                <div class="form-group" style="margin-top: 40px">
                    <button type="button" onclick="signupInst()" class="btn btn-primary btn-block">申请</button>
                </div>

            </form>
        </div>
    </div>
</div>

<%
    }else if(action.equals("loginInst")){
        String msg=request.getParameter("msg");
        if(msg!=null){
%>

<div class="alert alert-danger alert-center">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>

<%
    }
%>

<div class="container" style="width:700px;margin-top: 180px">
    <div class="panel panel-default" >
        <div class="panel-body">
            <form id="loginInstForm" style="width: 500px;margin: 10px auto 0 auto" method="post">
                <h3 style="text-align: center;color:#0e77af;margin-bottom: 30px ">教育机构登录</h3>
                <div class="form-group" style="margin-top: 40px">
                    <input type="text" name="eid" class="form-control" placeholder="机构编号">
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <input type="password" name="password" class="form-control" placeholder="密码">
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <button type="button" onclick="loginInst()" class="btn btn-primary btn-block">登录</button>
                </div>

            </form>
        </div>
    </div>
</div>

<%
    }else if(action.equals("loginManager")){
        String msg=request.getParameter("msg");
        if(msg!=null){
%>

<div class="alert alert-danger alert-center">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>

<%
    }
%>

<div class="container" style="width:700px;margin-top: 180px">
    <div class="panel panel-default" >
        <div class="panel-body">
            <form id="loginManagerForm" style="width: 500px;margin: 10px auto 0 auto" method="post">
                <h3 style="text-align: center;color:#0e77af;margin-bottom: 30px ">总经理登录</h3>
                <div class="form-group" style="margin-top: 40px">
                    <input type="text" name="username" class="form-control" placeholder="账号" required>
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <input type="password" name="password" class="form-control" placeholder="密码" required>
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <button type="button" onclick="loginManager()" class="btn btn-primary btn-block">登录</button>
                </div>

            </form>
        </div>
    </div>
</div>

<%
    }
%>

</body>
</html>
