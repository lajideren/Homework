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
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%--jquery引入要在bootstrap之前  ！！！！非常重要--%>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap.js"></script>



    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/header.css" />
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/course.css" />

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

</head>
<body>

<%
    Course course=(Course) request.getAttribute("course");

%>

<div class="top_header">

    <div class="logo">
        <span class="title_font glyphicon glyphicon-education"></span>
        <span class="slogan_font">Training College</span>
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
        <a>登录</a>
        |
        <a>注册</a>
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
                <button class="btn_buy">立即订购</button>
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


</body>
</html>
