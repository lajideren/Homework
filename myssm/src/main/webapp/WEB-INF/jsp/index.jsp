<%@ page import="util.RandomUtil" %>
<%@ page import="pobject.Course" %>
<%@ page import="java.util.List" %><%--
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
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/header.css" />

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

            $('.all_section li').click(function () {
                window.location.href='http://localhost:8080/course/showInfo?cid='+$(this).val();
            })


        });
    </script>


</head>
<body>

<div class="top_header" >

    <div class="logo">
        <span class="title_font glyphicon glyphicon-education"></span>
        <a href="http://localhost:8080/index.jsp" class="slogan_font">Training College</a>
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

<div class="mid_section">
    <div class="nav_stand" >
        <dl>
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
                <div class="nav_panel">
                    <dl>
                        <dt>初一</dt>
                        <dd>
                            <a>语文</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>英语</a><span>|</span>
                            <a>物理</a><span>|</span>
                            <a>化学</a><span>|</span>
                            <a>生物</a><span>|</span>
                            <a>政治</a><span>|</span>
                            <a>历史</a><span>|</span>
                            <a>地理</a><span>|</span>
                            <a>科学</a><span>|</span>
                        </dd>
                        <dt>初二</dt>
                        <dd>
                            <a>语文</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>英语</a><span>|</span>
                            <a>物理</a><span>|</span>
                            <a>化学</a><span>|</span>
                            <a>生物</a><span>|</span>
                            <a>政治</a><span>|</span>
                            <a>历史</a><span>|</span>
                            <a>地理</a><span>|</span>
                            <a>科学</a><span>|</span>
                        </dd>
                        <dt>中考</dt>
                        <dd>
                            <a>语文</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>英语</a><span>|</span>
                            <a>物理</a><span>|</span>
                            <a>化学</a><span>|</span>
                            <a>生物</a><span>|</span>
                            <a>政治</a><span>|</span>
                            <a>历史</a><span>|</span>
                            <a>地理</a><span>|</span>
                            <a>科学</a><span>|</span>
                            <a>理综</a><span>|</span>
                            <a>文综</a><span>|</span>
                        </dd>
                        <dt>高一</dt>
                        <dd>
                            <a>语文</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>英语</a><span>|</span>
                            <a>物理</a><span>|</span>
                            <a>化学</a><span>|</span>
                            <a>生物</a><span>|</span>
                            <a>政治</a><span>|</span>
                            <a>历史</a><span>|</span>
                            <a>地理</a><span>|</span>
                            <a>理综</a><span>|</span>
                            <a>文综</a><span>|</span>
                        </dd>
                        <dt>高二</dt>
                        <dd>
                            <a>语文</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>英语</a><span>|</span>
                            <a>物理</a><span>|</span>
                            <a>化学</a><span>|</span>
                            <a>生物</a><span>|</span>
                            <a>政治</a><span>|</span>
                            <a>历史</a><span>|</span>
                            <a>地理</a><span>|</span>
                            <a>理综</a><span>|</span>
                            <a>文综</a><span>|</span>
                        </dd>
                        <dt>高三</dt>
                        <dd>
                            <a>语文</a><span>|</span>
                            <a>数学</a><span>|</span>
                            <a>英语</a><span>|</span>
                            <a>物理</a><span>|</span>
                            <a>化学</a><span>|</span>
                            <a>生物</a><span>|</span>
                            <a>政治</a><span>|</span>
                            <a>历史</a><span>|</span>
                            <a>地理</a><span>|</span>
                            <a>理综</a><span>|</span>
                            <a>文综</a><span>|</span>
                        </dd>
                    </dl>
                </div>
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
                    <img src="<%=ctx%>/resources/img/custom/p1.jpg" alt="First slide">
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <img src="<%=ctx%>/resources/img/custom/p2.jpg" alt="Second slide">
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <img src="<%=ctx%>/resources/img/custom/p3.jpg" alt="Third slide">
                    <div class="carousel-caption"></div>
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

    <%--<div class="login_tip">--%>
        <%--<h4 style="margin-bottom: 40px">马上学习精品课程</h4>--%>
        <%--<img style="width: 80px" src="<%=ctx%>/resources/img/custom/avatar.png">--%>
        <%--<button class="login_btn">登录</button>--%>
    <%--</div>--%>

    <div class="clear"></div>

</div>

<%
    int[] nums=RandomUtil.randomArray(1,14,10);
    List<List<Course>> list=(List)request.getAttribute("list");

    List<Course> likeList=list.get(0);
    List<Course> allList1=list.get(1);
    List<Course> allList2=list.get(2);
    List<Course> allList3=list.get(3);

%>

<div class="like_section">
    <div>
        <span class="font_title">猜你喜欢</span>
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
                    <p class="font_info">课程简介：轻松愉快的氛围中培养孩子英语学习兴趣，进一步习得语言知识，积累英语语感，提高语言能力</p>
                </a>
            </li>
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c2.jpg">
                </div>

                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info">课程简介：通过深入浅出的讲解帮助学员在初中开始阶段占得学习先机，快速完成学习转型。享受独到的优能中学课程服务体系。严格的考勤管理，以学员为中心的课堂管理机制，针对性的课后训练。更多的增值服务等待学员家长来亲身体验</p>
                </a>
            </li>
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c3.jpg">
                </div>

                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info">课程简介：以学员为中心的课堂管理机制，针对性的课后训练。更多的增值服务等待学员家长来亲身体验</p>
                </a>
            </li>
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c4.jpg">
                </div>

                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info">课程简介：以学员为中心的课堂管理机制，针对性的课后训练。更多的增值服务等待学员家长来亲身体验</p>
                </a>
            </li>
            <li>
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c5.jpg">
                </div>

                <a>
                    <p class="font_cname">三年级英语培优春季班</p>
                    <p class="font_info">课程简介：以学员为中心的课堂管理机制，针对性的课后训练。更多的增值服务等待学员家长来亲身体验</p>
                </a>
            </li>

        </ul>
    </div>


</div>




<div class="all_section">
    <div>
        <span class="font_title">学前辅导</span>
        <a style="margin-left: 50px">幼儿</a>
        <a>幼儿多元智能</a>
    </div>
    <div class="all_courses">
        <ul class="all_list">
            <%
                for(int i=0;i<10;i++){
            %>
            <li value="<%=allList1.get(i).getCid()%>">
                <div class="all_img">
                    <img src="<%=ctx%>/resources/img/custom/c<%=nums[i]%>.jpg">
                </div>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span class="glyphicon glyphicon-map-marker font_info1_left"></span>长沙天马301教室</p>
                    <%--<p class="font_info1"><span class="glyphicon glyphicon-time font_info1_left"></span>2018-07-18至2018-08-06</p>--%>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <%
                }
            %>

        </ul>
    </div>
</div>

<%
    nums=RandomUtil.randomArray(1,14,10);
%>
<div class="all_section">
    <div>
        <span class="font_title">小学辅导</span>
        <a style="margin-left: 50px">一年级</a>
        <a>二年级</a>
        <a>三年级</a>
        <a>四年级</a>
        <a>五年级</a>
        <a>六年级</a>
    </div>
    <div class="all_courses">
        <ul class="all_list">
            <%
                for(int i=0;i<10;i++){
            %>
            <li value="<%=allList1.get(i).getCid()%>">
                <div class="all_img">
                    <img src="<%=ctx%>/resources/img/custom/c<%=nums[i]%>.jpg">
                </div>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span class="glyphicon glyphicon-map-marker font_info1_left"></span>长沙天马301教室</p>
                    <%--<p class="font_info1"><span class="glyphicon glyphicon-time font_info1_left"></span>2018-07-18至2018-08-06</p>--%>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</div>

<%
    nums=RandomUtil.randomArray(1,14,10);
%>
<div class="all_section">
    <div>
        <span class="font_title">中学辅导</span>
        <a style="margin-left: 50px">初一</a>
        <a>初二</a>
        <a>中考</a>
        <a>高一</a>
        <a>高二</a>
        <a>高三</a>
    </div>
    <div class="all_courses">
        <ul class="all_list">
            <%
                for(int i=0;i<10;i++){
            %>
            <li value="<%=allList1.get(i).getCid()%>">
                <div class="all_img">
                    <img src="<%=ctx%>/resources/img/custom/c<%=nums[i]%>.jpg">
                </div>
                <a>
                    <p class="font_cname1">三年级英语培优春季班</p>
                    <p class="font_info1"><span class="glyphicon glyphicon-map-marker font_info1_left"></span>长沙天马301教室</p>
                    <%--<p class="font_info1"><span class="glyphicon glyphicon-time font_info1_left"></span>2018-07-18至2018-08-06</p>--%>
                    <p class="font_price1">￥318</p>
                </a>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</div>


<div style="height: 300px"></div>

</body>
</html>
