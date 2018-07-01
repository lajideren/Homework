<%@ page import="java.util.List" %>
<%@ page import="po.Institution" %>
<%@ page import="po.Course" %>
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
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery.dataTables.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/dataTables.bootstrap4.min.js"></script>
    <script type="application/javascript">
        function httpPost(URL,PARAMS) {

            var temp = document.createElement("form");
            temp.action = URL;
            temp.method = "post";
            temp.style.display = "none";

            for (var x in PARAMS) {
                var opt = document.createElement("textarea");
                opt.name = x;
                opt.value = PARAMS[x];
                temp.appendChild(opt);
            }

            document.body.appendChild(temp);

            temp.submit();

            return temp;

        }
    </script>

    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/dataTables.bootstrap4.min.css">

    <style>
        th,td{
            text-align: center;
            vertical-align: middle!important;
            font-size: 13px;
        }


        .table thead tr{
            /*background-color: rgba(190, 188, 198, 0.67)!important;*/
            color: #11a7b3;
            font-size: 15px;
        }

        table tbody tr:hover{
            /*background-color: rgba(199, 228, 241, 0.73) !important;*/
            background-color: #f5fafe !important;

        }
    </style>

    <script type="application/javascript">

        var option={
            "bLengthChange" : false,
            "bInfo": false,
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "暂无记录",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sSearch": "<span style='color: black;' class='glyphicon glyphicon-search'></span>",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                }
            },
            "aLengthMenu": [[8, -1], [8, "All"]]

        };
        $(document).ready(function() {
            $('#myTable').DataTable(option);

        });
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
                <li class="active"><a href="<%=ctx%>/inst/courses">所有课程</a></li>
                <li><a href="<%=ctx%>/inst/plan">发布课程</a></li>
                <li><a href="<%=ctx%>/inst/editInfo">修改机构信息</a></li>
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

<div class="container" style="margin-top: 80px;width: 70%">

    <%
        Boolean started=(Boolean)request.getAttribute("started");
    %>

    <ol class="breadcrumb">
        <%
            if(started==null){
        %>
        <li>所有课程</li>
        <li><a href="<%=ctx%>/inst/courses?started=true">已开课</a></li>
        <li><a href="<%=ctx%>/inst/courses?started=false">未开课</a></li>
        <%
            }else if(started){
        %>
        <li><a href="<%=ctx%>/inst/courses">所有课程</a></li>
        <li>已开课</li>
        <li><a href="<%=ctx%>/inst/courses?started=false">未开课</a></li>
        <%
            }else{
        %>
        <li><a href="<%=ctx%>/inst/courses">所有课程</a></li>
        <li><a href="<%=ctx%>/inst/courses?started=true">已开课</a></li>
        <li>未开课</li>
        <%
            }
        %>
    </ol>

    <table id="myTable" class="table">
        <thead>
            <tr>
                <th style="width: 10%">编号</th>
                <th style="width: 15%">名称</th>
                <th style="width: 10%">类型</th>
                <th style="width: 10%">价格</th>
                <th style="width: 10%">班型</th>
                <th style="width: 15%">开课</th>
                <th style="width: 10%">课时</th>
                <th style="width: 10%">周数</th>
                <th style="width: 15%">操作</th>
            </tr>
        </thead>

        <tbody>
            <%
                List<Course> courses=(List)request.getAttribute("courses");

                for(Course course:courses){
                    if(started!=null) {
                        if (started) {
                            if (course.getStart_time().getTime() > System.currentTimeMillis()) {
                                continue;
                            }
                        } else {
                            if (course.getStart_time().getTime() <= System.currentTimeMillis()) {
                                continue;
                            }
                        }
                    }
            %>
            <tr>
                <td><%=course.getCid()%></td>
                <td><%=course.getName()%></td>
                <td><%=course.getType()%></td>
                <td><%=course.getPrice()%></td>
                <td><%=course.getNumber()%></td>
                <td><%=course.getStart_time()%></td>
                <td><%=course.getHours_weekly()%></td>
                <td><%=course.getWeeks()%></td>
                <td><button class="btn btn-primary btn-sm" onclick="httpPost('<%=ctx%>/inst/sections',{cid:<%=course.getCid()%>})">查看班级</button></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

</div>




</body>
</html>
