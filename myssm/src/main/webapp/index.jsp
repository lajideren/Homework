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
    <style>
        .nav_stand {
            margin-left: 80px;
            width: 176px;
            height: 381px;
            background: #59afee;
            cursor: pointer;
            float: left;
            position: relative;
        }

        .nav_head {
            color: white;
            background-color: #549bd6;
            font-size: 20px;
            font-weight: bold;/*字体粗细*/
            height: 40px;
            line-height: 40px;/*行高*/
            text-indent: 20px;/*文本缩进*/
            width: 176px;
        }

        .nav_stand>dl>dd{
            margin: 0;
            height: 40px;
            display: block;
            text-indent: 20px;
            /*background: url(http://images.xdf.cn/cms20150819/zuixinban/images/index_bg.png) no-repeat 46px -35px;*/
            transition: text-indent 0.5s ease 0s;
        }

        .nav_stand>dl>dd:hover {
            background: #fff;
            text-indent: 35px;
        }

        .nav_stand>dl>dd>a{
            color: #fff;
            font-size: 15px;
            line-height: 40px;


        }

        .nav_stand>dl>dd:hover>a{
            color: #59afee;

        }

        .nav_panel dd,dt{
            font-size: 12px;
            margin: 0;
            display: block;
            text-indent: 20px;
            color: #59afee;
            line-height: 23px;
        }


        .nav_panel a{
            color: #b3b3b3;
            text-decoration: none;

        }
        .nav_panel a:hover{
            color: #59afee;
        }

        .nav_panel span{
            margin:0 15px;
        }

        .nav_stand dd .nav_panel{
            display: none;
            position: absolute;
            top:0;
            left: 176px;
            width: 484px;
            height: 381px;
            background-color: white;
            z-index: 999;



        }

        .nav_stand dd:hover .nav_panel{
            display: block;

        }

        .nav_stand>dl>dd>span{
            font-size: 5px;
            color: white;
            float: right;
            margin-top: 12px;
            margin-right: 20px;
        }

        .nav_scn{
            height: 381px;
            float: left;
            width: 700px;
            margin-left: 10px;

        }

        .carousel-inner .item{
            height: 381px;
            width: 700px;
        }
    </style>

    <style>
        .selector{
            float: left;width: 60px;height: 30px;background-color: #eea236;border-radius: 15px;
            margin:35px 0 35px 10px;
            text-align: center;
            color: white;
            line-height: 30px;
            cursor:pointer ;
            position: relative;
        }

        .city_panel{
            position: absolute;
            top: 30px;
            height: 400px;
            width: 600px;
            background-color: #ffffff;
            z-index: 100;
            text-align: left;
            display: none;

        }

        .city_panel span{
            color: #59afee;
        }

        .city_panel dd{
            margin-left: 20px;
            margin-top: 10px;
        }

        .city_panel dl{
            float: left;width: 47%;height: 100%;
        }

        .city_panel a{
             display: inline-block;
             margin-left: 13px;
             color: #0f0f0f;
            text-decoration: none;

         }
        .city_panel a:hover{
            color: white;
            background-color: #0e77af;
        }

    </style>

    <style>



        .logo{
            margin-left: 80px;float: left;width: 176px;height: 100px;
            background-size: cover;
            text-align: center;
        }

        .title_font{
            margin-top: 10px;
             font-size: 50px;
             color: #59afee;
             display: block;
         }

        .slogan_font{
            margin-top: 10px;
            font-size: 20px;
            font-weight: normal;
            color: #59afee;
            display: block;
        }



        .search{
            float: left;margin-left: 50px;height: 100px;
            font-size: 0;
        }

        .searchbox{
            padding: 0;margin: 25px 0;height: 50px;vertical-align: middle;
            width: 600px;
            border: solid 3px #59afee;
            letter-spacing: 5px;
            font-size: 15px;
        }
        .searchbtn{
            padding: 0;margin: 0;vertical-align: middle;height: 50px;width: 100px;
            border: none;
            background-color: #59afee;
            color: white;
            letter-spacing: 5px;
            font-size: 20px;
            display: inline-block;
        }
    </style>

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

            })
        });
    </script>


</head>
<body>

<div style="height: 100px;margin-bottom: 20px">

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

    <div class="search">
        <form>
            <input class="searchbox" type="text" placeholder="输入课程或班号">
            <button class="searchbtn"><span style="font-size: 17px" class="glyphicon glyphicon-search"></span>搜索</button>

        </form>
    </div>


</div>

<div >
    <div class="nav_stand">
        <div class="nav_head">
            <b>课程导航</b>
        </div>
        <dl style="margin-top: 15px">
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
                <div class="item active">
                    <img src="<%=ctx%>/resources/img/custom/scn1.jpg" alt="First slide" style="width: 100%;height: 100%">
                    <div class="carousel-caption">标题 1</div>
                </div>
                <div class="item">
                    <img src="<%=ctx%>/resources/img/custom/scn2.jpg" alt="Second slide" style="width: 100%;height: 100%">
                    <div class="carousel-caption">标题 2</div>
                </div>
                <div class="item">
                    <img src="<%=ctx%>/resources/img/custom/scn3.jpg" alt="Third slide" style="width: 100%;height: 100%">
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
