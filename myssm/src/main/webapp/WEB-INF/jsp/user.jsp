<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pobject.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="pobject.Client" %><%--
  Created by IntelliJ IDEA.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    String ctx=request.getContextPath();
    Client client = (Client) request.getAttribute("client");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%--jquery引入要在bootstrap之前  ！！！！非常重要--%>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery.validate.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery.dataTables.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/dataTables.bootstrap4.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/jquery-ui-1.12.1/jquery-ui.js"></script>



    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/dataTables.bootstrap4.min.css">

    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/main.css" />
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/css/header.css" />
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/jquery-ui-1.12.1/jquery-ui.css" />

    <script type="application/javascript" src="<%=ctx%>/resources/js/header.js"></script>

    <style>
        .nav-tabs li a{
            border: 0;
            border-radius: 0;
            background-color: white;
            color: black;
            opacity: 0.5;
            /*color: #59afee;*/
        }
        .nav-tabs li a:hover{
            border: 0;
            border-radius: 0;
            background-color: white;
            color: black;
            /*color: #59afee;*/
            border-bottom: 1px solid #68777e;
        }
        .nav-tabs li.active a{
            border: 0;
            border-radius: 0;
            background-color: white;
            color: black;
            opacity: 1.0;
            /*color: #59afee;*/
            border-bottom: 2px solid #11a7b3;
        }
        .nav-tabs li.active a:hover{
            border: 0;
            border-radius: 0;
            background-color: white;
            color: black;
            /*color: #59afee;*/
            border-bottom: 2px solid #11a7b3;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle!important;
        }

        .table thead tr{
            /*background-color: rgba(190, 188, 198, 0.67)!important;*/
            color: #11a7b3;
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
            "bSort": false,
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
            "aLengthMenu": [[8,-1], [8, "All"]]

        };
        $(document).ready(function() {
            $('#myTable').DataTable(option);

        });
    </script>
</head>
<body style="background-color: white">

<%@include file="header.jsp"%>

<div style="width: 200px;height:200px;position: absolute;padding-top: 10px;margin-left: 200px;">
    <img src="<%=ctx%>/resources/img/user/user.png" width="100%" height="100%">
    <span style="margin-top: 20px;display: inline-block;font-size: 25px"><%=username%></span>
    <br>

    <div style="margin-top: 20px">
        <span class="glyphicon glyphicon-send" style="color: #ff8b31"></span><span style="font-size: 15px;margin-left: 10px;color: #ff8b31"><%=client.getEmail()%></span>
    </div>
    <a style="margin-top: 20px;margin-left: 2px;display: inline-block" href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>&nbsp修改密码</a>
    <span style="display: block;border-bottom: 1px #b3b3b3 solid;margin-top: 20px"></span>
</div>

<div class="tab" style="width: 50%;margin-left: 30%;margin-top: 100px">
    <ul class="nav nav-tabs nav-pills">
        <li class="active"><a href="#orderList" data-toggle="tab">我的课程</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="orderList" style="padding-top: 20px;">
            <table id="myTable" class="table" style="font-size: 13px">
                <thead>
                <tr>
                    <th style="width: 15%">订单编号</th>
                    <th style="width: 20%">课程编号</th>
                    <th style="width: 20%">课程名称</th>
                    <th style="width: 45%">创建时间</th>
                    <th style="width: 20%">价格</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Order> orders = (List<Order>) request.getAttribute("orders");
                %>
                <c:forEach items="<%=orders%>" var="order">
                    <tr onclick="window.location.href='http://localhost:8080/course/showInfo?cid=${order.cid}'">
                        <td s>${order.oid}</td>
                        <td>${order.cid}</td>
                        <td>${order.cname}</td>
                        <td>${order.createTime}</td>
                        <td>${order.price}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
