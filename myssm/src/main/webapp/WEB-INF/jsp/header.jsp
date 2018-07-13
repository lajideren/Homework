<%--
  Created by IntelliJ IDEA.
  User: wsy
  Date: 2018/7/13
  Time: 上午11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top_header" >

    <div class="logo">
        <span class="title_font glyphicon glyphicon-education"></span>
        <a href="http://localhost:8080/" class="slogan_font">Training College</a>
    </div>

    <div class="selector">
        <span id="cur_city">
            <%
                String city=(String)session.getAttribute("city");
                if(city!=null){
            %>
            <%=city%>
            <%
            }else{
            %>
            所在地
            <%
                }
            %>
        </span>
        <span style="display: inline-block;font-size: 8px" class="glyphicon glyphicon-chevron-down"></span>
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
        <a data-toggle="modal" data-target="#loginModal">登录</a>
        |
        <a data-toggle="modal" data-target="#registerModal">注册</a>
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
        <input id="searchText" class="searchbox" type="text" placeholder="输入课程名称">
        <button class="searchbtn" onclick="search()"><span class="glyphicon glyphicon-search"></span></button>
    </div>


</div>
