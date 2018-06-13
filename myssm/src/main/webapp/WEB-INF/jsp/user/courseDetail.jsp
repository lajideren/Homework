<%@ page import="po.User" %>
<%@ page import="po.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="po.Section" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


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


    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=ctx%>/index.jsp">TrainingCollege</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="<%=ctx%>/user/courses">所有课程</a></li>
                <li><a href="<%=ctx%>/user/info">我的信息</a></li>
                <li><a href="<%=ctx%>/user/orders">我的订单</a></li>

            </ul>

            <%
                User user=(User)request.getAttribute("user");
            %>

            <ul class="nav navbar-nav navbar-right">
                <li><a ><%=user.getUsername()%>,欢迎你</a></li>
                <li><a href="<%=ctx%>/logoutUser"><span class="glyphicon glyphicon-log-out"></span>退出登录</a></li>
            </ul>


        </div>
    </div>

</nav>

<%
    Course course=(Course)request.getAttribute("course");
%>

<%
    String msg=(String)request.getAttribute("msg");
    if(msg!=null&&msg.equals("预订成功")){
%>
<div class="alert alert-success" style="position: absolute;top:80px;left: 50%;margin-left:-40%;width: 80%">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>
<%
    }else if(msg!=null&&msg.equals("预订失败")){
%>
<div class="alert alert-danger" style="position: absolute;top:80px;left: 50%;margin-left:-40%;width: 80%">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>
<%
    }
%>


<div class="container" style="margin-top: 80px;width: 70%">
    <div style="margin-bottom: 20px;border-bottom: 1px solid #e7e7e7;font-size: 40px">
        <span style="font-size: 30px;color: #3fb7b4"><%=course.getName()%></span>
        <span style="font-size: 20px;color: red">￥<%=course.getPrice()%></span>
    </div>

    <div class="panel panel-default" >
        <div class="panel-heading">
            <h3 class="panel-title">课程简介</h3>
        </div>

        <div class="panel-body">

            <div style="width: 27%;height:200px;float:left;text-align:center;padding-top: 10px;margin-left: 10px">
                <img src="<%=ctx%>/resources/img/user/abc.png" width="100%" height="100%">
            </div>

            <ul style="width: 70%;height:200px;float:right;border-left: 1px solid rgb(230,230,230)">
                <li style="list-style-type: none;margin-top: 10px "><span style="color:#3fb7b4;">类型：</span><%=course.getType()%></li>
                <li style="list-style-type: none;margin-top: 5px"><span style="color:#3fb7b4 ">班型：</span><%=course.getNumber()%>人</li>
                <li style="list-style-type: none;margin-top: 5px"><span style="color:#3fb7b4 ">开课时间：</span><%=course.getStart_time()%></li>
                <li style="list-style-type: none;margin-top: 5px"><span style="color:#3fb7b4 ">每周课时：</span><%=course.getHours_weekly()%></li>
                <li style="list-style-type: none;margin-top: 5px"><span style="color:#3fb7b4 ">周数：</span><%=course.getWeeks()%></li>
                <li style="list-style-type: none;margin-top: 5px"><span style="color:#3fb7b4 ">课程描述：</span><%=course.getDetail()%></li>

            </ul>
        </div>
    </div>

    <div class="panel panel-default" >
        <div class="panel-heading btn-primary">
            <h3 class="panel-title">班级安排</h3>
        </div>

        <div class="panel-body">
            <table class="table">
                <thead>
                    <tr>
                        <th>班级编号</th>
                        <th>教师</th>
                        <th>地点</th>
                        <th>已选</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Section> sections=(List)request.getAttribute("sections");
                        for(Section section:sections){
                    %>
                    <tr>
                        <td><%=section.getCid()+"-"+section.getRank()%></td>
                        <td><%=section.getTeacher()%></td>
                        <td><%=section.getLocation()%></td>
                        <td><%=section.getSelected()+"/"+section.getAmount()%></td>
                        <td><button class="btn btn-sm btn-success" value="<%=section.getSid()%>" data-toggle="modal" data-target="#myModal" onclick="setSmall(this)">预订</button></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="panel-footer" style="height: 55px">
            <button class="btn btn-primary" style="float: right" data-toggle="modal" data-target="#myModal" onclick="setBig()">直接预订(不选择班级)</button>
        </div>
    </div>

</div>

<script type="application/javascript">
    var index=0;
    var max;
    function setSmall(obj) {
        $('#sid').val(obj.value);
        max=3;
        $('#myForm').attr("action","<%=ctx%>/user/handleSmallOrder")
    }
    function setBig() {
        max=9;
        $('#myForm').attr("action","<%=ctx%>/user/handleBigOrder")
    }
    function addRow() {
        if(index<max) {
            var text = "<div class='form-group'><lable>成员"+(index+1)+":</lable><input type='text' class='form-control' name='members'><td><tr></div>";
            $('#myForm').append(text);
            index += 1;
        }else {
            var msg;
            msg="最多添加"+max+"名成员";
            alert(msg);
        }
    }

    function cancel() {
        index=0;
        $('#myForm').html('<input type="hidden" value="<%=course.getCid()%>" name="cid"><input type="hidden" id="sid" name="sid">');
    }

    function submit(){
        $('#myForm').submit();
    }
</script>

<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" onclick="cancel()">&times;</button>
                <h4 class="modal-title">添加成员</h4>
            </div>
            <div class="modal-body">
                <form id="myForm" method="post">
                    <input type="hidden" value="<%=course.getCid()%>" name="cid">
                    <input type="hidden" id="sid" name="sid">
                </form>
            </div>
            <div class="modal-footer">
                <button onclick="addRow()" class="btn btn-success">增加成员</button>
                <button onclick="submit()" class="btn btn-default">提交</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
