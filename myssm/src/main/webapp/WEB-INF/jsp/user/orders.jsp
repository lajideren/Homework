<%@ page import="po.User" %>
<%@ page import="po.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="po.Order" %>
<%@ page import="util.LevelUtil" %>
<%@ page import="util.NumberUtil" %>
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
            if(window.confirm("确认执行此操作?")) {
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
        }
    </script>

    <style>
        .nav-pills li a{
            border: 0;
            border-radius: 0;
            background-color: white!important;
            color: black!important;
            opacity: 0.5;
            /*color: #59afee;*/
        }
        .nav-pills li a:hover{
            border: 0;
            border-radius: 0;
            background-color: white!important;
            color: black!important;
            /*color: #59afee;*/
            border-bottom: 1px solid #68777e;
        }
        .nav-pills li.active a{
            border: 0;
            border-radius: 0;
            background-color: white!important;
            color: black!important;
            /*color: #59afee;*/
            border-bottom: 2px solid #11a7b3;
            opacity: 1.0;
        }
        .nav-pills li.active a:hover{
            border: 0;
            border-radius: 0;
            background-color: white!important;
            color: black!important;
            /*color: #59afee;*/
            border-bottom: 2px solid #11a7b3;
        }
        .table th, .table td {
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



    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/dataTables.bootstrap4.min.css">
    <script type="application/javascript">

        var option={
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
            $('#myTable1').DataTable(option);
            $('#myTable2').DataTable(option);
            $('#myTable3').DataTable(option);
            $('#myTable4').DataTable(option);

        });
    </script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=ctx%>/WEB-INF/index.jsp">TrainingCollege</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="<%=ctx%>/user/courses">所有课程</a></li>
                <li><a href="<%=ctx%>/user/info">我的信息</a></li>
                <li  class="active"><a href="<%=ctx%>/user/orders">我的订单</a></li>

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
    String msg=(String)request.getAttribute("msg");
    if(msg!=null&&(msg.equals("支付成功")||msg.equals("退订成功"))){
%>
<div class="alert alert-success" style="position: absolute;top:80px;left: 50%;margin-left:-40%;width: 80%;z-index: 10">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>
<%
}else if(msg!=null&&(msg.equals("支付失败")||msg.equals("退订失败"))){
%>
<div class="alert alert-danger" style="position: absolute;top:80px;left: 50%;margin-left:-40%;width: 80%;z-index: 10">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>
<%
    }
%>



<div class="container" style="margin-top: 80px;width: 80%">
    <%--<span style="display: block;font-size: 30px;border-bottom: 1px solid #e7e7e7;margin-bottom: 10px">我的订单</span>--%>

    <%--<div class="tab">--%>

    <ul class="nav nav-pills" style="border-bottom: 1px solid #b3b3b3;margin-bottom: 20px;width: 97%;margin-left: 13px">
        <li  class="active"><a href="#tab1" data-toggle="tab">待支付</a></li>
        <li><a href="#tab2" data-toggle="tab">已支付</a></li>
        <li><a href="#tab3" data-toggle="tab">已退订</a></li>
        <li><a href="#tab4" data-toggle="tab">未支付</a></li>

    </ul>



        <div class="tab-content">
            <div class="tab-pane fade in active" id="tab1">
                <table id="myTable1" class="table">
                    <thead>
                        <tr>
                            <th style="width: 10%">订单编号</th>
                            <th style="width: 10%">课程编号</th>
                            <th style="width: 15%">课程名称</th>
                            <th style="width: 10%">班级编号</th>
                            <th style="width: 20%">成员</th>
                            <th style="width: 15%">下单时间</th>
                            <th style="width: 10%">总金额</th>
                            <th style="width: 15%">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Order> orders=(List)request.getAttribute("orders");
                            int level= LevelUtil.getLevel(user.getTotal_money());
                            for(Order order:orders){
                                if(!order.isCanceled()&&!order.isPayed()&&!order.isReturned()){
                                double totalMoney= NumberUtil.formatDouble2( order.getTotalMoney()*(1-level*0.05) );
                        %>
                        <tr style="height: 50px">
                            <td><%=order.getOid()%></td>
                            <td><%=order.getCid()%></td>
                            <td><%=order.getCname()%></td>
                            <%
                                if(order.getSid()!=0){
                            %>
                            <td><%=order.getCid()+"-"+order.getSrank()%></td>
                            <%
                                }else {
                            %>
                            <td>无</td>
                            <%
                                }
                            %>
                            <td><%=order.getMembers()%></td>
                            <td><%=order.getCreateTime()%></td>
                            <td><%=totalMoney%><span style="color: green">(-<%=5*level%>%)</span></td>
                            <td>
                                <button class="btn btn-success btn-sm" onclick="httpPost('<%=ctx%>/user/pay',{oid:<%=order.getOid()%>,totalMoney:<%=totalMoney%>})">
                                支付
                                </button>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>

                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="tab2">
                <table id="myTable2" class="table">
                    <thead>
                    <tr>
                        <th style="width: 10%!important;">订单编号</th>
                        <th style="width: 10%!important;">课程编号</th>
                        <th style="width: 15%!important;">课程名称</th>
                        <th style="width: 10%!important;">班级编号</th>
                        <th style="width: 20%!important;">成员</th>
                        <th style="width: 15%!important;">下单时间</th>
                        <th style="width: 10%!important;">总金额</th>
                        <th style="width: 15%!important;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(Order order:orders){
                            if(order.isPayed()&&!order.isReturned()){
                    %>
                    <tr style="height: 50px">
                        <td><%=order.getOid()%></td>
                        <td><%=order.getCid()%></td>
                        <td><%=order.getCname()%></td>
                        <%
                            if(order.getSid()==0){
                        %>
                        <td>尚未分配班级</td>
                        <%
                        }else if(order.getSid()==-1){
                        %>
                        <td>已分配班级</td>
                        <%
                            }else {
                        %>
                        <td><%=order.getCid()+"-"+order.getSrank()%></td>
                        <%
                            }
                        %>
                        <td><%=order.getMembers()%></td>
                        <td><%=order.getCreateTime()%></td>
                        <td><%=order.getRealMoney()%></td>
                        <td><button class="btn btn-warning btn-sm" onclick="httpPost('<%=ctx%>/user/returnOrder',{oid:<%=order.getOid()%>,sid:<%=order.getSid()%>})">退订</button></td>
                    </tr>
                    <%
                            }
                        }
                    %>

                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="tab3">
                <table id="myTable3" class="table">
                    <thead>
                    <tr>
                        <th style="width: 10%">订单编号</th>
                        <th style="width: 10%">课程编号</th>
                        <th style="width: 15%">课程名称</th>
                        <th style="width: 10%">班级编号</th>
                        <th style="width: 20%">成员</th>
                        <th style="width: 15%">下单时间</th>
                        <th style="width: 10%">总金额</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(Order order:orders){
                            if(order.isReturned()){
                    %>
                    <tr style="height: 50px">
                        <td><%=order.getOid()%></td>
                        <td><%=order.getCid()%></td>
                        <td><%=order.getCname()%></td>
                        <%
                            if(order.getSid()==0){
                        %>
                        <td>尚未分配班级</td>
                        <%
                        }else if(order.getSid()==-2){
                        %>
                        <td>分配班级失败(自动退单)</td>
                        <%
                        }else if(order.getSid()==-1){
                        %>
                        <td>已分配班级</td>
                        <%
                        }else {
                        %>
                        <td><%=order.getCid()+"-"+order.getSrank()%></td>
                        <%
                            }
                        %>
                        <td><%=order.getMembers()%></td>
                        <td><%=order.getCreateTime()%></td>
                        <td><%=order.getRealMoney()%></td>
                    </tr>
                    <%
                            }
                        }
                    %>

                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="tab4">
                <table id="myTable4" class="table">
                    <thead>
                    <tr>
                        <th style="width: 10%">订单编号</th>
                        <th style="width: 10%">课程编号</th>
                        <th style="width: 15%">课程名称</th>
                        <th style="width: 10%">班级编号</th>
                        <th style="width: 20%">成员</th>
                        <th style="width: 15%">下单时间</th>
                        <th style="width: 10%">总金额</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(Order order:orders){
                            if(order.isCanceled()){
                    %>
                    <tr style="height: 50px">
                        <td><%=order.getOid()%></td>
                        <td><%=order.getCid()%></td>
                        <td><%=order.getCname()%></td>
                        <%
                            if(order.getSid()!=0){
                        %>
                        <td><%=order.getCid()+"-"+order.getSrank()%></td>
                        <%
                        }else {
                        %>
                        <td>无</td>
                        <%
                            }
                        %>
                        <td><%=order.getMembers()%></td>
                        <td><%=order.getCreateTime()%></td>
                        <td><%=order.getRealMoney()%></td>
                    </tr>
                    <%
                            }
                        }
                    %>

                    </tbody>
                </table>
            </div>
        </div>

    <%--</div>--%>

</div>




</body>
</html>
