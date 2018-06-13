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
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery.validate.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/js/bootstrap.min.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/bootstrap.min.css">

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
    <style type="text/css">
        #form1 label.error
        {
            color:Red;
            display: block;
            text-align: center;
            font-size:10px;
        }
    </style>
</head>
<body style="background:url(<%=ctx%>/resources/img/login/bg1.jpg)" >

<script type="application/javascript">
    function login() {
        var form1=$('#form1');
        form1.validate({
            rules:{
                username:{
                    required:true,
                    checkName:true
                },
                password:{
                    required:true,
                    checkPwd:true
                }
            },
            messages:{
                username:{
                    required:"*名字必填"
                },
                password:{
                    required:"*密码必填"
                }
            }
        });
        if(form1.valid()) {
            form1.attr("action","<%=ctx%>/login");
            form1.submit();
        }
    }
    function signup() {

        var form1=$('#form1');
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
            form1.attr("action","<%=ctx%>/signup");
            form1.submit();
        }
    }
</script>
<div class="container">
    <h1 style="text-align: center;margin-top: 250px">Training College</h1>
    <form id="form1" style="width: 300px;margin: 10px auto 0 auto" method="post">
        <div class="form-group">
            <input type="text" name="username" class="form-control" placeholder="用户名">
        </div>
        <div class="form-group">
            <input type="password" name="password" class="form-control" placeholder="密码">
        </div>
        <div class="form-group">
            <input type="email" name="email" class="form-control" placeholder="邮箱">
        </div>
        <div class="form-group">
            <input type="button" value="登录" onclick="login()" class="btn btn-primary btn-block">
        </div>
        <div class="form-group">
            <input type="button" value="注册" onclick="signup()" class="btn btn-primary btn-block">
        </div>

    </form>
</div>






</body>
</html>
