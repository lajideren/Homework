<%--
  Created by IntelliJ IDEA.
  User: wsy
  Date: 2018/6/22
  Time: 上午10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    String ctx=request.getContextPath();
%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%--jquery引入要在bootstrap之前  ！！！！非常重要--%>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap.js"></script>



    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/custom.css">


</head>
<body>

<div>
    <div class="nav_stand">
        <div class="nav_head">
            <b>课程导航</b>
        </div>
        <dl>
            <dd>
                <a>学前辅导</a>
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <div class="nav_panel">
                    <dl>
                        <dt>幼儿</dt>
                        <dd>
                            <a>英语</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>语文</a>
                        </dd>
                        <dt>幼儿多元智能</dt>
                        <dd>
                            <a>英语</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>语文</a>
                        </dd>
                    </dl>
                </div>
            </dd>
            <dd>
                <a>小学辅导</a>
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <div class="nav_panel">
                    <dl>
                        <dt>一年级</dt>
                        <dd>
                            <a>英语</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>语文</a>
                        </dd>
                        <dt>二年级</dt>
                        <dd>
                            <a>英语</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>语文</a>
                        </dd>
                        <dt>三年级</dt>
                        <dd>
                            <a>英语</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>语文</a>
                        </dd>
                        <dt>四年级</dt>
                        <dd>
                            <a>英语</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>语文</a>
                        </dd>
                        <dt>五年级</dt>
                        <dd>
                            <a>英语</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>语文</a>
                        </dd>
                        <dt>六年级</dt>
                        <dd>
                            <a>英语</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>语文</a>
                        </dd>
                    </dl>
                </div>
            </dd>
            <dd>
                <a>中学辅导</a>
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <a>大学考试</a>
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <a>英语学习</a>
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <a>出国留学</a>
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <a>夏冬令营</a>
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <div class="nav_panel"></div>
            </dd>
        </dl>
    </div>

    <div class="nav_scn">
        <div id="myCarousel" class="carousel slide">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <div class="item active" style="height: 381px;width: 800px;">
                    <img style="width: 100%;height: 100%" src="<%=ctx%>/resources/img/custom/english.jpg" alt="First slide">
                    <div class="carousel-caption">标题 1</div>
                </div>
                <div class="item" style="height: 381px;width: 800px;">
                    <img style="width: 100%;height: 100%" src="<%=ctx%>/resources/img/custom/english.jpg" alt="Second slide">
                    <div class="carousel-caption">标题 2</div>
                </div>
                <div class="item" style="height: 381px;width: 800px;">
                    <img style="width: 100%;height: 100%" src="<%=ctx%>/resources/img/custom/english.jpg" alt="Third slide">
                    <div class="carousel-caption">标题 3</div>
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>

</body>
</html>
