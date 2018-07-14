<%@ page import="pobject.Course" %><%--
  Created by IntelliJ IDEA.
  User: wsy
  Date: 2018/6/30
  Time: 下午4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    String ctx=request.getContextPath();
%>

<%
    Course course=(Course) request.getAttribute("course");

%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%--jquery引入要在bootstrap之前  ！！！！非常重要--%>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery.validate.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap.js"></script>



    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/header.css" />
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/course.css" />



    <script type="application/javascript" src="<%=ctx%>/resources/js/header.js"></script>

    <script type="application/javascript">
        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }

        function buy() {
            var username='<%=(String)session.getAttribute("username")%>';
            if(username==='null'){
                $('#btn_login').click();
            }else{

                $.ajax({
                    type:'POST',
                    url:'http://localhost:8080/course/addOrder',
                    data:'cid='+'<%=course.getCid()%>',
                    success:function () {
                        sleep(500);
                        alert('订购成功');
                        window.location.reload();
                    }
                })

            }
        }
    </script>

    <script>
        $(function() {
            $(".tab a").click(function() {
                $(this).addClass('curr').siblings().removeClass('curr');
                var index = $(this).index();
                number = index;
                $('.nav .content li').hide();
                $('.nav .content li:eq(' + index + ')').show();
            });
        })
    </script>

</head>
<body>



<%@include file="header.jsp"%>


<div class="contain1">
    <div class="content1">
        <div class="breadpath">
            <a>首页</a>
            <span class="breadsep">&gt</span><a><%=course.getSort()%></a>
            <span class="breadsep">&gt</span><a><%=course.getGrade()%></a>
            <span class="breadsep">&gt</span><a><%=course.getSubject()%></a>
            <span class="breadsep">&gt</span><%=course.getCname()%>
        </div>

        <div class="intro_section">
            <div class="imgdiv">
                <img src="<%=ctx%>/resources/img/custom/c9.jpg">
            </div>
            <div class="intro_right">
                <span class="font_cname"><%=course.getCname()%><span class="font_share">分享</span></span>
                <span class="font_cid">班号:<%=course.getCid()%></span>
                <span class="font_price">￥<%=course.getPrice()%></span>
                <div class="timediv">
                    <p><span class="font_left">开课时间:</span><%=course.getStartTimeString()%>至<%=course.getEndTimeString()%>至</p>
                    <p><span class="font_left">总计课时:</span><%=course.getPeriod()%></p>
                    <p><span class="font_left">上课时间:</span><%=course.getTime()%></p>
                    <p><span class="font_left">地点:</span><%=course.getLocation()%></p>
                </div>
                <%
                    boolean selected=(boolean)request.getAttribute("selected");
                    if(selected){
                %>
                <button class="btn_view" onclick="">查看课程</button>
                <%
                    }else{
                %>

                <button class="btn_buy" onclick="buy()">立即订购</button>
                <%
                    }
                %>
            </div>




        </div>
    </div>

</div>



<div class="detail_section">

        <div class="nav">
            <div class="tab border-b">
                <a href="javascript:;" rel="external nofollow" rel="external nofollow" class="curr">课程详情</a>
                <a href="javascript:;" rel="external nofollow" rel="external nofollow" >评价(12)</a>
            </div>
            <div class="content">
                <ul>
                    <li style="display: block">
                        <span class="font_detail_title_sm"><span class="glyphicon glyphicon-th-list"></span>课程简介</span>
                        <span class="font_detail_content"><%=course.getSummary()%></span>
                        <span class="font_detail_title_sm"><span class="glyphicon glyphicon-user"></span>适用学员</span>
                        <span class="font_detail_content"><%=course.getCrowd()%></span>
                        <span class="font_detail_title_sm"><span class="glyphicon glyphicon-globe"></span>学习目标</span>
                        <span class="font_detail_content"><%=course.getGoal()%></span>
                        <span class="font_detail_title_sm"><span class="glyphicon glyphicon-book"></span>课程内容</span>
                        <span class="font_detail_content"><%=course.getContent()%></span>
                        <div style="height: 100px"></div>
                    </li>
                    <li>评价</li>
                </ul>
            </div>
        </div>


</div>

<div class="teacher_section">
    <span class="font_teacher_title"><span class="font_left_sep" >|</span>授课老师</span>

    <div class="teacherdiv">
        <div class="teacherimg">
            <img src="<%=ctx%>/resources/img/avatar.png">
        </div>

        <span class="font_teacher_name">王维纲</span>
    </div>

    <div class="teacherdiv">
        <div class="teacherimg">
            <img src="<%=ctx%>/resources/img/avatar.png">
        </div>

        <span class="font_teacher_name">王维纲</span>
    </div>

    <div class="teacherdiv">
        <div class="teacherimg">
            <img src="<%=ctx%>/resources/img/avatar.png">
        </div>

        <span class="font_teacher_name">王维纲</span>
    </div>
</div>



<!-- 登录窗口 -->
<div id="loginModal" class="modal fade" >
    <div class="modal-dialog" style="width: 400px;margin-top: 200px">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
                <span class="modal_header_font">登录</span>
            </div>
            <div class="modal-body">
                <form id="loginForm" class="form-group">
                    <div class="form-group">
                        <label>用户名</label>
                        <input name="username" class="form-control" type="text" placeholder="">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input name="password" class="form-control" type="password" placeholder="">
                    </div>
                    <div class="text-right">
                        <button type="button" class="btn btn-primary" onclick="login()">登录</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#registerModal">还没有账号？点我注册</a>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 注册窗口 -->
<div id="registerModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog" style="width: 400px;margin-top: 200px">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
                <span class="modal_header_font">注册</span>
            </div>
            <div class="modal-body">
                <form id="registerForm" class="form-group">
                    <div class="form-group">
                        <label>用户名</label>
                        <input name="username" class="form-control" type="text" placeholder="6-15位字母或数字">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input name="password" class="form-control" type="password" placeholder="6-15位字母或数字">
                    </div>
                    <div class="form-group">
                        <label>邮箱</label>
                        <input name="email" class="form-control" placeholder="例如:123@123.com">
                    </div>
                    <div class="text-right">
                        <button type="button" class="btn btn-primary" onclick="register()">提交</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#loginModal">已有账号？点我登录</a>
                </form>
            </div>
        </div>
    </div>
</div>

<div style="float: left;clear: left;height: 100px"></div>

</body>
</html>
