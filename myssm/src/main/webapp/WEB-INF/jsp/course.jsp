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
    String requestUrl = (String)request.getAttribute("requestUrl");

//    System.out.println(requestUrl);
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

    <script type="application/javascript">
        $(document).ready(function(){
            $.validator.addMethod("checkName",function(value,element,params){
                var checkName = /^\w{2,10}$/g;
                return this.optional(element)||(checkName.test(value));
            },"只允许6-15位英文字母或数字");
            $.validator.addMethod("checkPwd",function(value,element,params){
                var checkPwd = /^\w{2,10}$/g;
                return this.optional(element)||(checkPwd.test(value));
            },"只允许6-15位英文字母或数字");
            $.validator.addMethod("checkEml",function(value,element,params){
                var checkEmail = /^[a-z0-9]+@([a-z0-9]+\.)+[a-z]{2,4}$/i;
                return this.optional(element)||(checkEmail.test(value));
            },"请输入正确的邮箱！");
        })
    </script>
    <script type="application/javascript">
        function login() {
            var form1 = $('#loginForm');
            form1.validate({
                rules: {
                    username: {
                        required: true,
                        // checkName: true
                    },
                    password: {
                        required: true,
                        // checkPwd: true
                    }
                },
                messages: {
                    username: {
                        required: "名字必填"
                    },
                    password: {
                        required: "密码必填"
                    }
                }
            });
            if (form1.valid()) {
                form1.attr("action", "<%=ctx%>/client/login");
                form1.submit();
            }
        }
        function register() {
            var form1=$('#registerForm');
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
                        required:"用户名不能为空"
                    },
                    password:{
                        required:"密码不能为空"
                    },
                    email:{
                        required:"邮箱不能为空"
                    }
                }
            });
            if(form1.valid()) {
                alert("注册成功");
                form1.attr("action","<%=ctx%>/client/register");
                form1.submit();
            }
        }
    </script>

    <script type="application/javascript">
        $(document).ready(function () {
            $('.selector').hover(
                function () {
                    $('.city_panel').css('display','block');
                },
                function () {
                    $('.city_panel').css('display','none');
                }

            );

            $('.city_panel a').click(function () {
                $('#cur_city').text($(this).text());
                $('.city_panel').css('display','none');

            });

        });
    </script>

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
            if(username=='null'){
                $('#btn_login').click();
            }else{
                sleep(500);
                alert('订购成功');
            }
        }
    </script>

</head>
<body>

<%
    Course course=(Course) request.getAttribute("course");

%>

<div class="top_header">

    <div class="logo">
        <span class="title_font glyphicon glyphicon-education"></span>
        <a href="http://localhost:8080/" class="slogan_font">Training College</a>
    </div>

    <div class="selector">
        <span id="cur_city">北京</span>
        <span style="display: inline-block;font-size: 6px" class="glyphicon glyphicon-chevron-down"></span>
        <div class="city_panel" >
            <dl>
                <dd><span>A</span><a>鞍山</a><a>安阳</a></dd>
                <dd><span>B</span><a>北京</a><a>保定</a></dd>
                <dd><span>C</span><a>重庆</a><a>成都</a><a>长沙</a><a>长春</a><a>沧州</a></dd>
                <dd><span>D</span><a>大连</a><a>东莞</a></dd>
                <dd><span>F</span><a>福州</a><a>佛山</a></dd>
                <dd><span>G</span><a>广州</a><a>贵阳</a></dd>
                <dd><span>H</span><a>哈尔滨</a><a>杭州</a><a>合肥</a><a>呼和浩特</a><a>黄石</a><a>邯郸</a><a>海口</a></dd>
                <dd><span>J</span><a>济南</a><a>荆州</a><a>吉林</a><a>焦作</a><a>锦州</a></dd>
                <dd><span>K</span><a>昆明</a></dd>
                <dd><span>L</span><a>兰州</a><a>洛阳</a><a>连云港</a></dd>
            </dl>
            <dl>
                <dd><span>M</span><a>绵阳</a></dd>
                <dd><span>N</span><a>南京</a><a>南昌</a><a>南宁</a><a>宁波</a><a>南通</a></dd>
                <dd><span>Q</span><a>青岛</a><a>秦皇岛</a></dd>
                <dd><span>S</span><a>上海</a><a>沈阳</a><a>深圳</a><a>石家庄</a><a>苏州</a><a>十堰</a></dd>
                <dd><span>T</span><a>天津</a><a>太原</a><a>唐山</a></dd>
                <dd><span>W</span><a>武汉</a><a>无锡</a><a>乌鲁木齐</a><a>温州</a><a>潍坊</a></dd>
                <dd><span>X</span><a>西安</a><a>厦门</a><a>徐州</a><a>襄阳</a><a>湘潭</a><a>新乡</a></dd>
                <dd><span>Y</span><a>宜昌</a><a>烟台</a><a>扬州</a><a>银川</a><a>盐城</a></dd>
                <dd><span>Z</span><a>郑州</a><a>镇江</a><a>株洲</a><a>珠海</a><a>中山</a></dd>
            </dl>
        </div>
    </div>

    <div class="login_panel">

        <%
            String username=(String) session.getAttribute("username");
            if(username==null){
        %>
        <a data-toggle="modal" data-target="#loginModal" id="btn_login">登录</a>
        |
        <a data-toggle="modal" data-target="#registerModal" >注册</a>
        <%
        }else{
        %>
        <a>个人中心</a>
        |
        <a href="<%=ctx%>/client/logout">登出</a>
        <%
            }
        %>

    </div>

    <div class="search">
        <form>
            <input class="searchbox" type="text" placeholder="输入课程或班号">
            <button class="searchbtn"><span class="glyphicon glyphicon-search"></span></button>
        </form>
    </div>

    <div>

    </div>


</div>

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
                <div class="timediv">
                    <p><span class="font_left">开课时间:</span><%=course.getStartTimeString()%>至<%=course.getEndTimeString()%>至</p>
                    <p><span class="font_left">总计课时:</span><%=course.getPeriod()%></p>
                    <p><span class="font_left">上课时间:</span><%=course.getTime()%></p>
                    <p><span class="font_left">地点:</span><%=course.getLocation()%></p>
                </div>
                <button class="btn_buy" onclick="buy()">立即订购</button>
            </div>




        </div>
    </div>

</div>

<div class="detail_section">
    <div class="detail_title">
        <span class="font_detail_title">课程详情</span>
    </div>

    <span class="font_detail_title_sm"><span class="glyphicon glyphicon-th-list"></span>课程简介</span>
    <span class="font_detail_content"><%=course.getSummary()%></span>
    <span class="font_detail_title_sm"><span class="glyphicon glyphicon-user"></span>适用学员</span>
    <span class="font_detail_content"><%=course.getCrowd()%></span>
    <span class="font_detail_title_sm"><span class="glyphicon glyphicon-globe"></span>学习目标</span>
    <span class="font_detail_content"><%=course.getGoal()%></span>
    <span class="font_detail_title_sm"><span class="glyphicon glyphicon-book"></span>课程内容</span>
    <span class="font_detail_content"><%=course.getContent()%></span>
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
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="loginForm" class="form-group">
                    <div class="form-group">
                        <label for="">用户名</label>
                        <input name="username" class="form-control" type="text" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="">密码</label>
                        <input name="password" class="form-control" type="password" placeholder="">
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" onclick="login()">登录</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#registerModal">还没有账号？点我注册</a>
                    <input type="hidden" name="requestUrl" value="<%=requestUrl%>">
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 注册窗口 -->
<div id="registerModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog" style="width: 400px;margin-top: 200px">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="registerForm" class="form-group">
                    <div class="form-group">
                        <label for="">用户名</label>
                        <input name="username" class="form-control" type="text" placeholder="6-15位字母或数字">
                    </div>
                    <div class="form-group">
                        <label for="">密码</label>
                        <input name="password" class="form-control" type="password" placeholder="6-15位字母或数字">
                    </div>
                    <div class="form-group">
                        <label for="">邮箱</label>
                        <input name="email" class="form-control" placeholder="例如:123@123.com">
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" onclick="register()">提交</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#loginModal">已有账号？点我登录</a>
                    <input type="hidden" name="requestUrl" value="<%=requestUrl%>">
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
