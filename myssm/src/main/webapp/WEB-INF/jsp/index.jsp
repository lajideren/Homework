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
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery.validate.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/jquery-ui-1.12.1/jquery-ui.js"></script>



    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css"/>

    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/main.css" />
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/header.css" />
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/jquery-ui-1.12.1/jquery-ui.css" />



    <script type="application/javascript" src="<%=ctx%>/resources/js/header.js"></script>

    <script type="application/javascript">
        $(document).ready(function () {

            $('.all_section li').click(function () {
                window.location.href='http://localhost:8080/course/showInfo?cid='+$(this).attr("value");
            });

            $('.like_section li').click(function () {
                window.location.href='http://localhost:8080/course/showInfo?cid='+$(this).attr("value");;
            });
            $('#refreshdiv').click(function () {
                window.location.href='http://localhost:8080';
            });
        });
    </script>




</head>
<body>

<%@include file="header.jsp"%>

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
                            <a href="<%=ctx%>/search/getCourseList?sort=1&grade=1&subject=1">英语</a><span>|</span>
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
                    <img src="<%=ctx%>/resources/img/custom/p2.jpg" alt="First slide">
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <img src="<%=ctx%>/resources/img/custom/p1.jpg" alt="Second slide">
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
    int[] nums;
    List<List<Course>> list=(List)request.getAttribute("list");

    List<Course> likeList=list.get(0);
    List<Course> allList1=list.get(1);
    List<Course> allList2=list.get(2);
    List<Course> allList3=list.get(3);

%>

<%
    nums=RandomUtil.randomArray(1,18,5);
%>

<div class="like_section">
    <div id="refreshdiv">
        <span class="font_title">猜你喜欢</span>
        <a class="refresh"><span style="font-size: 14px;margin-right: 2px" class="glyphicon glyphicon-refresh"></span>换一批</a>
    </div>
    <div class="like_courses">
        <ul class="like_list">

            <%
                for(int i=0;i<5;i++){

            %>
            <li value="<%=likeList.get(i).getCid()%>">
                <div class="like_img">
                    <img src="<%=ctx%>/resources/img/custom/c<%=nums[i]%>.jpg">
                </div>

                <a>
                    <p class="font_cname"><%=likeList.get(i).getCname()%></p>
                    <p class="font_info"><%=likeList.get(i).getSummary()%></p>
                </a>
            </li>

            <%
                }
            %>


        </ul>
    </div>


</div>


<%
    nums=RandomUtil.randomArray(1,18,10);
%>

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
                    <p class="font_cname1"><%=allList1.get(i).getCname()%></p>
                    <p class="font_info1"><span class="glyphicon glyphicon-map-marker font_info1_left"></span><%=allList1.get(i).getLocation()%></p>
                    <%--<p class="font_info1"><span class="glyphicon glyphicon-time font_info1_left"></span>2018-07-18至2018-08-06</p>--%>
                    <p class="font_price1">￥<%=allList1.get(i).getPrice()%></p>
                </a>
            </li>
            <%
                }
            %>

        </ul>
    </div>
</div>

<%
    nums=RandomUtil.randomArray(1,18,10);
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
            <li value="<%=allList2.get(i).getCid()%>">
                <div class="all_img">
                    <img src="<%=ctx%>/resources/img/custom/c<%=nums[i]%>.jpg">
                </div>
                <a>
                    <p class="font_cname1"><%=allList2.get(i).getCname()%></p>
                    <p class="font_info1"><span class="glyphicon glyphicon-map-marker font_info1_left"></span><%=allList2.get(i).getLocation()%></p>
                    <%--<p class="font_info1"><span class="glyphicon glyphicon-time font_info1_left"></span>2018-07-18至2018-08-06</p>--%>
                    <p class="font_price1">￥<%=allList2.get(i).getPrice()%></p>
                </a>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</div>

<%
    nums=RandomUtil.randomArray(1,18,10);
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
            <li value="<%=allList3.get(i).getCid()%>">
                <div class="all_img">
                    <img src="<%=ctx%>/resources/img/custom/c<%=nums[i]%>.jpg">
                </div>
                <a>
                    <p class="font_cname1"><%=allList3.get(i).getCname()%></p>
                    <p class="font_info1"><span class="glyphicon glyphicon-map-marker font_info1_left"></span><%=allList3.get(i).getLocation()%></p>
                    <%--<p class="font_info1"><span class="glyphicon glyphicon-time font_info1_left"></span>2018-07-18至2018-08-06</p>--%>
                    <p class="font_price1">￥<%=allList3.get(i).getPrice()%></p>
                </a>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</div>


<div style="height: 300px"></div>

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
