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
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <a>大学考试</a>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <a>英语学习</a>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <a>出国留学</a>
                <div class="nav_panel"></div>
            </dd>
            <dd>
                <a>夏冬令营</a>
                <div class="nav_panel"></div>
            </dd>
        </dl>
    </div>
</div>

</body>
</html>
