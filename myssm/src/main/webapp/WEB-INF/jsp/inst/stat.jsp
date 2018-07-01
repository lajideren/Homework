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
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/highcharts.js"></script>


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

    <%
        double[] num=(double[])request.getAttribute("num");
    %>

    <script type="application/javascript">
        $(document).ready(function() {
            var chart = {
                type: 'column'
            };
            var title = {
                text: '机构统计数据'
            };

            var subtitle = {
                text: '财务情况'
            };

            var xAxis = {
                categories: ['总营业额','预订额','退订额','累计收入','线下缴费','线上结算'],
                crosshair: true
            };

            var yAxis = {
                min: 0,
                title: {
                    text: '金额(元)'
                }
            };

            var plotOptions = {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            };
            var credits = {
                enabled: false
            };

            var series=[{name:'详细',data:[parseFloat(<%=num[0]%>),parseFloat(<%=num[1]%>),parseFloat(<%=num[2]%>),parseFloat(<%=num[3]%>),parseFloat(<%=num[4]%>),parseFloat(<%=num[5]%>)]}];

            var json = {};
            json.chart = chart;
            json.title = title;
            json.subtitle = subtitle;
            json.xAxis = xAxis;
            json.yAxis = yAxis;
            json.series = series;
            json.plotOptions = plotOptions;
            json.credits = credits;
            $('#container').highcharts(json);
        });

    </script>

    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">

    <style>
        th,td{
            text-align: center;
            vertical-align: middle!important;
            border: 1px solid #a4a4a4 !important;
        }

        tr{
            height: 110px;
            font-size: 15px;
        }


        .table-bordered td {
            border: 1px solid #000 !important;
        }
    </style>
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
                <li><a href="<%=ctx%>/inst/editInfo">修改机构信息</a></li>
                <li class="active"><a href="<%=ctx%>/inst/stat">查看统计信息</a></li>

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

<div class="container" style="height: 250px;width: 50%;text-align: center;margin-top: 80px">

    <span style="display: block;border-bottom: 1px solid #b3b3b3;padding-bottom: 10px;margin-bottom: 10px;text-align: left;font-size: 20px">订单数统计</span>

    <div class="col-md-4" style="border-right: 1px solid #e7e7e7;height: 150px">
        <span style="font-size: 50px;display: block;margin-top: 30px;color: #66afe9"><%=(int)num[6]%></span>
        <span style="font-size: 15px;display: block;">预订</span>
    </div>
    <div class="col-md-4" style="border-right: 1px solid #e7e7e7;height: 150px">
        <span style="font-size: 50px;display: block;margin-top: 30px;color: #e95124"><%=(int)num[7]%></span>
        <span style="font-size: 15px;display: block;">退订</span>
    </div>
    <div class="col-md-4" style="height: 150px">
        <span style="font-size: 50px;display: block;margin-top: 30px;color: #e9b438"><%=(int)num[8]%></span>
        <span style="font-size: 15px;display: block;">线下</span>
    </div>

    <span style="display: block;border-bottom: 1px solid #b3b3b3;padding-bottom: 10px;margin-bottom: 10px;text-align: left;font-size: 20px">财务统计</span>
</div>

<div id="container" style="width: 50%; height: 400px; margin: 20px auto 0 auto"></div>




</body>
</html>
