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
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%--jquery引入要在bootstrap之前  ！！！！非常重要--%>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap.js"></script>



    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css"/>

    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/main.css" />

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

            $('.courses_header a').click(function () {

                $('.courses_header a').removeClass('a_active');
                $('.courses_header a').addClass('a_notactive');
                $(this).removeClass('a_notactive');
                $(this).addClass('a_active');

            })
        });
    </script>


</head>
<body>

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
                <dd><span>D</span><a></a></dd>
                <dd><span>E</span><a></a></dd>
                <dd><span>F</span><a></a></dd>
                <dd><span>G</span><a></a></dd>
                <dd><span>H</span><a></a></dd>

                <dd><span></span><a></a></dd>
            </dl>
            <dl>
                <dd><span>A</span><a>鞍山</a><a>安阳</a></dd>
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

<div class="mid_section">
    <div class="nav_stand">
        <dl style="margin-top: 40px">
            <dd>
                <span class="glyphicon glyphicon-book dd_span1"></span><a>学前辅导</a>
                <span class="glyphicon glyphicon-chevron-right dd_span2" aria-hidden="true"></span>
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
                <span class="glyphicon glyphicon-compressed dd_span1"></span>
                <a>小学辅导</a>
                <span class="glyphicon glyphicon-chevron-right dd_span2" aria-hidden="true"></span>
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
                <span class="glyphicon glyphicon-list-alt dd_span1"></span>
                <a>中学辅导</a>
                <span class="glyphicon glyphicon-chevron-right dd_span2" aria-hidden="true"></span>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <span class="glyphicon glyphicon-pencil dd_span1"></span>
                <a>大学考试</a>
                <span class="glyphicon glyphicon-chevron-right dd_span2" aria-hidden="true"></span>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <span class="glyphicon glyphicon-globe dd_span1"></span>
                <a>英语学习</a>
                <span class="glyphicon glyphicon-chevron-right dd_span2" aria-hidden="true"></span>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <span class="glyphicon glyphicon-plane dd_span1"></span>
                <a>出国留学</a>
                <span class="glyphicon glyphicon-chevron-right dd_span2" aria-hidden="true"></span>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <span class="glyphicon glyphicon-picture dd_span1"></span>
                <a>夏冬令营</a>
                <span class="glyphicon glyphicon-chevron-right dd_span2" aria-hidden="true"></span>
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
                <div class="item active">
                    <img src="<%=ctx%>/resources/img/custom/p1.jpg" alt="First slide" style="height: 100%;width: 100%">
                    <div class="carousel-caption">标题 1</div>
                </div>
                <div class="item">
                    <img src="<%=ctx%>/resources/img/custom/p2.jpg" alt="Second slide" style="height: 100%;width: 100%">
                    <div class="carousel-caption">标题 2</div>
                </div>
                <div class="item">
                    <img src="<%=ctx%>/resources/img/custom/p3.jpg" alt="Third slide" style="height: 100%;width: 100%">
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

    <div class="login_tip">
        <h4 style="margin-bottom: 40px">马上学习精品课程</h4>
        <img style="width: 80px" src="<%=ctx%>/resources/img/custom/avatar.png">
        <button class="login_btn">登录</button>
    </div>

    <div class="clear"></div>

</div>

<div class="like_section">
    <div>
        <span style="font-size:25px">猜你喜欢</span>
        <a class="refresh"><span class="glyphicon glyphicon-refresh"></span>换一批</a>

    </div>
    <div class="like_courses">
        <ul class="like_list">
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c1.jpg">
                </div>

                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price">￥318</p>
                </a>
            </li>
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c2.jpg">
                </div>
                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price">￥318</p>
                </a>
            </li>
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c3.jpg">
                </div>
                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price">￥318</p>
                </a>
            </li>
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c4.jpg">
                </div>
                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price">￥318</p>
                </a>
            </li>
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c5.jpg">
                </div>
                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price">￥318</p>
                </a>
            </li>
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c6.jpg">
                </div>
                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price">￥318</p>
                </a>
            </li>

        </ul>
    </div>


</div>


<div class="all_courses">

    <div class="courses_header">
        <span style="font-size: 20px;margin-left: 10px;line-height: 45px">热门课程</span>
        <a class="a_active" style="margin-left: 50px">大学</a>
        <a class="a_notactive">小学</a>
        <a class="a_notactive">中学</a>
        <a class="a_notactive">英语</a>
        <a class="a_notactive">留学</a>
    </div>
    <div class="all_left">
        <span class="font_vertical">精选课程</span>
    </div>

    <div style="float:left;width: 1000px">
        <ul class="all_list">
            <li>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <li>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <li>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <li>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <li>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <li>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <li>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <li>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>鞍山</p>
                    <p class="font_info1"><span style="margin-right: 5px" class="glyphicon glyphicon-time"></span>2017-9-24至2018-9-24</p>
                    <p class="font_price1">￥318</p>
                </a>
            </li>


        </ul>
    </div>
</div>

<div style="height: 300px"></div>

</body>
</html>
