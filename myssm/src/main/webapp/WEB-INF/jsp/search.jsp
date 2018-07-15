<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "pobject.Course" %>
<%@ page import = "java.util.List" %>
<%--
  Created by IntelliJ IDEA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    String ctx=request.getContextPath();
    String sort = (String) request.getAttribute("sort");
    String grade = (String) request.getAttribute("grade");
    String subject = (String) request.getAttribute("subject");
    int pageNum = (int) request.getAttribute("page");
    int max = (int) request.getAttribute("max");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%--jquery引入要在bootstrap之前  ！！！！非常重要--%>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery.validate.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/js/select.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/js/header.js"></script>



    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css"/>

    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/main.css" />
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/header.css" />
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/search.css" />
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/jquery-ui-1.12.1/jquery-ui.css" />
    
    <script>
        $(function () {
            $("#toPage").click(function () {
                var p = $("#nextPage").val();
                window.location.href = "<%=ctx%>/search/changePage?sort=<%=sort%>&grade=<%=grade%>&subject=<%=subject%>&page="+p;
                event.stopPropagation();
            });
            $("#before").click(function () {
                var p = <%=pageNum%> - 1;
                window.location.href = "<%=ctx%>/search/changePage?sort=<%=sort%>&grade=<%=grade%>&subject=<%=subject%>&page="+p;
                event.stopPropagation();
            });
            $("#next").click(function () {
                var p = <%=pageNum%> + 1;
                window.location.href = "<%=ctx%>/search/changePage?sort=<%=sort%>&grade=<%=grade%>&subject=<%=subject%>&page="+p;
                event.stopPropagation();
            })
        })
    </script>


</head>
<body onload="changeBox(<%=sort%>, <%=grade%>, <%=subject%>)">

<%@include file="header.jsp"%>

<div class="select_box" style="margin-top: 70px;">
    <%

    %>
    <div class="selecter">
        <ul>
            <li id="s">
                <p class="l fl">
                    <i class="glyphicon glyphicon-dashboard"></i>分类:
                </p>
                <ul class="l nor">
                    <li class="l" id="1"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=0&subject=0">学前辅导</a></li>
                    <li class="l" id="2"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=0&subject=0">小学辅导</a></li>
                    <li class="l" id="3"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=0&subject=0">中学辅导</a></li>
                    <li class="l" id="4"><a>大学考试</a></li>
                    <li class="l" id="5"><a>英语学习</a></li>
                    <li class="l" id="6"><a>出国留学</a></li>
                    <li class="l" id="7"><a>夏冬令营</a></li>
                </ul>
            </li>
            <li id="g">
                <p class="l fl">
                    <i class="glyphicon glyphicon-th-list"></i>年级:
                </p>
                <ul class="l nor" id="10" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=0&subject=0">不限</a></li>
                    <li class="l" id="11"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=1&subject=0">幼儿</a></li>
                    <li class="l" id="12"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=2&subject=0">幼儿多元智能</a></li>
                </ul>
                <ul class="l nor" id="20" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=0&subject=0">不限</a></li>
                    <li class="l" id="21"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=1&subject=0">一年级</a></li>
                    <li class="l" id="22"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=2&subject=0">二年级</a></li>
                    <li class="l" id="23"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=3&subject=0">三年级</a></li>
                    <li class="l" id="24"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=4&subject=0">四年级</a></li>
                    <li class="l" id="25"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=5&subject=0">五年级</a></li>
                    <li class="l" id="26"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=6&subject=0">六年级</a></li>
                </ul>
                <ul class="l nor" id="30" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=0&subject=0">不限</a></li>
                    <li class="l" id="31"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=0">初一</a></li>
                    <li class="l" id="32"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=0">初二</a></li>
                    <li class="l" id="33"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=0">中考</a></li>
                    <li class="l" id="34"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=0">高一</a></li>
                    <li class="l" id="35"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=0">高二</a></li>
                    <li class="l" id="36"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=0">高三</a></li>
                </ul>
            </li>
            <li id="sub">
                <p class="l fl">
                    <i class="glyphicon glyphicon-tags"></i>科目:
                </p>
                <ul class="l nor" id="110" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=1&subject=0">不限</a></li>
                    <li class="l" id="111"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=1&subject=1">英语</a></li>
                    <li class="l" id="112"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=1&subject=2">数学</a></li>
                    <li class="l" id="113"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=1&subject=3">语文</a></li>
                </ul>
                <ul class="l nor" id="120" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=2&subject=0">不限</a></li>
                    <li class="l" id="121"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=2&subject=1">英语</a></li>
                    <li class="l" id="122"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=2&subject=2">数学</a></li>
                    <li class="l" id="123"><a href="<%=ctx%>/search/getCourseList?sort=1&grade=2&subject=3">语文</a></li>
                </ul>
                <ul class="l nor" id="210" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=1&subject=0">不限</a></li>
                    <li class="l" id="211"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=1&subject=1">英语</a></li>
                    <li class="l" id="212"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=1&subject=2">数学</a></li>
                    <li class="l" id="213"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=1&subject=3">语文</a></li>
                </ul>
                <ul class="l nor" id="220" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=2&subject=0">不限</a></li>
                    <li class="l" id="221"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=2&subject=1">英语</a></li>
                    <li class="l" id="222"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=2&subject=2">数学</a></li>
                    <li class="l" id="223"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=2&subject=3">语文</a></li>
                </ul>
                <ul class="l nor" id="230" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=3&subject=0">不限</a></li>
                    <li class="l" id="231"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=3&subject=1">英语</a></li>
                    <li class="l" id="232"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=3&subject=2">数学</a></li>
                    <li class="l" id="233"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=3&subject=3">语文</a></li>
                </ul>
                <ul class="l nor" id="240" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=4&subject=0">不限</a></li>
                    <li class="l" id="241"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=4&subject=1">英语</a></li>
                    <li class="l" id="242"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=4&subject=2">数学</a></li>
                    <li class="l" id="243"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=4&subject=3">语文</a></li>
                </ul>
                <ul class="l nor" id="250" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=5&subject=0">不限</a></li>
                    <li class="l" id="251"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=5&subject=1">英语</a></li>
                    <li class="l" id="252"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=5&subject=2">数学</a></li>
                    <li class="l" id="253"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=5&subject=3">语文</a></li>
                </ul>
                <ul class="l nor" id="260" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=6&subject=0">不限</a></li>
                    <li class="l" id="261"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=6&subject=1">英语</a></li>
                    <li class="l" id="262"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=6&subject=2">数学</a></li>
                    <li class="l" id="263"><a href="<%=ctx%>/search/getCourseList?sort=2&grade=6&subject=3">语文</a></li>
                </ul>
                <ul class="l nor" id="310" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=0">不限</a></li>
                    <li class="l" id="311"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=1">语文</a></li>
                    <li class="l" id="312"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=2">数学</a></li>
                    <li class="l" id="313"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=3">英语</a></li>
                    <li class="l" id="314"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=4">物理</a></li>
                    <li class="l" id="315"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=5">化学</a></li>
                    <li class="l" id="316"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=6">生物</a></li>
                    <li class="l" id="317"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=7">政治</a></li>
                    <li class="l" id="318"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=8">历史</a></li>
                    <li class="l" id="319"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=1&subject=9">地理</a></li>
                </ul>
                <ul class="l nor" id="320" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=0">不限</a></li>
                    <li class="l" id="321"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=1">语文</a></li>
                    <li class="l" id="322"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=2">数学</a></li>
                    <li class="l" id="323"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=3">英语</a></li>
                    <li class="l" id="324"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=4">物理</a></li>
                    <li class="l" id="325"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=5">化学</a></li>
                    <li class="l" id="326"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=6">生物</a></li>
                    <li class="l" id="327"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=7">政治</a></li>
                    <li class="l" id="328"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=8">历史</a></li>
                    <li class="l" id="329"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=2&subject=9">地理</a></li>
                </ul>
                <ul class="l nor" id="330" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=0">不限</a></li>
                    <li class="l" id="331"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=1">语文</a></li>
                    <li class="l" id="332"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=2">数学</a></li>
                    <li class="l" id="333"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=3">英语</a></li>
                    <li class="l" id="334"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=4">物理</a></li>
                    <li class="l" id="335"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=5">化学</a></li>
                    <li class="l" id="336"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=6">生物</a></li>
                    <li class="l" id="337"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=7">政治</a></li>
                    <li class="l" id="338"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=8">历史</a></li>
                    <li class="l" id="339"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=3&subject=9">地理</a></li>
                </ul>
                <ul class="l nor" id="340" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=0">不限</a></li>
                    <li class="l" id="341"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=1">语文</a></li>
                    <li class="l" id="342"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=2">数学</a></li>
                    <li class="l" id="343"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=3">英语</a></li>
                    <li class="l" id="344"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=4">物理</a></li>
                    <li class="l" id="345"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=5">化学</a></li>
                    <li class="l" id="346"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=6">生物</a></li>
                    <li class="l" id="347"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=7">政治</a></li>
                    <li class="l" id="348"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=8">历史</a></li>
                    <li class="l" id="349"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=9">地理</a></li>
                    <li class="l" id="3410"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=10">理综</a></li>
                    <li class="l" id="3411"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=4&subject=11">文综</a></li>
                </ul>
                <ul class="l nor" id="350" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=0">不限</a></li>
                    <li class="l" id="351"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=1">语文</a></li>
                    <li class="l" id="352"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=2">数学</a></li>
                    <li class="l" id="353"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=3">英语</a></li>
                    <li class="l" id="354"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=4">物理</a></li>
                    <li class="l" id="355"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=5">化学</a></li>
                    <li class="l" id="356"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=6">生物</a></li>
                    <li class="l" id="357"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=7">政治</a></li>
                    <li class="l" id="358"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=8">历史</a></li>
                    <li class="l" id="359"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=9">地理</a></li>
                    <li class="l" id="3510"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=10">理综</a></li>
                    <li class="l" id="3511"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=5&subject=11">文综</a></li>
                </ul>
                <ul class="l nor" id="360" style="display: none">
                    <li class="l activeXiang"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=0">不限</a></li>
                    <li class="l" id="361"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=1">语文</a></li>
                    <li class="l" id="362"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=2">数学</a></li>
                    <li class="l" id="363"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=3">英语</a></li>
                    <li class="l" id="364"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=4">物理</a></li>
                    <li class="l" id="365"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=5">化学</a></li>
                    <li class="l" id="366"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=6">生物</a></li>
                    <li class="l" id="367"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=7">政治</a></li>
                    <li class="l" id="368"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=8">历史</a></li>
                    <li class="l" id="369"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=9">地理</a></li>
                    <li class="l" id="3610"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=10">理综</a></li>
                    <li class="l" id="3611"><a href="<%=ctx%>/search/getCourseList?sort=3&grade=6&subject=11">文综</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<div class="wrapper">
    <div class="column">
        <div style="width: 1000px;">
            <%
                List<Course> courses = (List<Course>) request.getAttribute("courses");
            %>
            <c:forEach items="<%=courses%>" var="course">
                <div class="m-courselist">
                    <div class="m-courselist-l pr">
                        <h2><a href="<%=ctx%>/course/showInfo?cid=${course.cid}">${course.cname}</a></h2>
                        <h4></h4>
                        <p class="u-title max-h"><em>开课时间:</em>${course.startTime}</p>
                        <p class="u-title max-h"><em>上课人数:</em>40</p>
                        <p class="u-title max-h"><em>简介:</em>${course.summary}</p>
                        <div class="m-courselist-select">
                            <div class="u-price">
                                ￥<span>${course.price}</span>
                            </div>
                            <a class="u-btn4" href="<%=ctx%>/course/showInfo?cid=${course.cid}">
                                查看详情
                            </a>
                        </div>
                    </div>
                    <div class="m-courselist-r"></div>
                    <div class="m-dotline"></div>
                </div>
            </c:forEach>
            <%--<div class="m-courselist">--%>
                <%--<div class="m-courselist-l pr">--%>
                    <%--<h2><a>CourseName</a></h2>--%>
                    <%--<h4></h4>--%>
                    <%--<p class="u-title max-h"><em>开课时间:</em>2019/2/29</p>--%>
                    <%--<p class="u-title max-h"><em>上课人数:</em>40</p>--%>
                    <%--<p class="u-title max-h"><em>简介:</em>无</p>--%>
                    <%--<div class="m-courselist-select">--%>
                        <%--<div class="u-price">--%>
                            <%--￥<span>1480</span>--%>
                        <%--</div>--%>
                        <%--<a class="u-btn4">--%>
                            <%--查看详情--%>
                        <%--</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="m-courselist-r"></div>--%>
                <%--<div class="m-dotline"></div>--%>
            <%--</div>--%>
            <div class="l selectPageBox">
                <div class="selectPage r">
                    <%
                        if (pageNum>1){
                    %>
                    <span id="before">&#60上一页</span>
                    <%
                        }else {
                    %>
                    <span class="disabled">&#60上一页</span>
                    <%
                        }
                    %>
                    <span><%=pageNum%></span>
                    <%
                        if (pageNum<max){
                    %>
                    <span id="next">下一页&#62</span>
                    <%
                        }else {
                    %>
                    <span class="disabled xyy">下一页&#62</span>
                    <%
                        }
                    %>
                    共<%=max%>页 到第
                    <input id="nextPage" type="number" placeholder="<%=pageNum%>">
                    <span id="toPage">确定</span>
                </div>
            </div>
        </div>
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
                        <input name="username" class="form-control" type="text" placeholder="2-10位字母或数字">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input name="password" class="form-control" type="password" placeholder="2-10位字母或数字">
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


</body>
</html>
