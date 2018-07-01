<%@ page import="po.Institution" %>
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

    <script type="application/javascript">
        function editSubmit() {
            $.ajax({
                type:"POST",
                url:"<%=ctx%>/inst/editInfoSubmit",
                // data:{name:$('#name').val(),location:$('#location').val(),info:$('#info').val()},
                data:$('#editForm').serialize(),
                // contentType:"application/json",
                dataType:"json",
                success:function (data) {
                    alert(data.msg);
                }
            })
        }
    </script>

</head>
<body>

<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=ctx%>/WEB-INF/index.jsp">TrainingCollege</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="<%=ctx%>/inst/courses">所有课程</a></li>
                <li><a href="<%=ctx%>/inst/plan">发布课程</a></li>
                <li class="active"><a href="<%=ctx%>/inst/editInfo">修改机构信息</a></li>
                <li><a href="<%=ctx%>/inst/stat">查看统计信息</a></li>

            </ul>

            <%
                Institution inst=(Institution)request.getAttribute("inst");
            %>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><%=inst.getName()%>,欢迎你</a></li>
                <li><a href="<%=ctx%>/logoutUser"><span class="glyphicon glyphicon-log-out"></span>退出登录</a></li>
            </ul>


        </div>
    </div>

</nav>

<div class="container" style="width:700px;margin-top: 130px">
    <div class="panel panel-default" >
        <div class="panel-body">
            <form id="editForm" style="width: 500px;margin: 10px auto 0 auto" method="post">
                <h3 style="text-align: center;color:#0e77af;margin-bottom: 30px ">修改机构信息</h3>
                <div class="form-group" style="margin-top: 40px">
                    <input type="text" name="name" class="form-control" placeholder="机构名称" value="<%=inst.getName()%>" required>
                </div>
                <div class="form-group" style="margin-top: 40px">
                    <input type="text" name="location" class="form-control" placeholder="地点" value="<%=inst.getLocation()%>" required>
                </div>
                <textarea name="info" class="form-control" style="margin-top: 40px;height: 200px" placeholder="师资情况" required><%=inst.getInfo()%></textarea>
                <div class="form-group" style="margin-top: 40px">
                    <button type="button" onclick="editSubmit()" class="btn btn-primary btn-block">提交申请</button>
                </div>

            </form>
        </div>
    </div>
</div>

</body>
</html>
