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

    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">


    <style>
        .mybtn{
            background-color: white;border: 1px solid #e0e0e0;height: 180px;width: 180px;color: rgb(78, 153, 208);font-size: 20px
        }
        .mybtn:hover{
            color: rgb(89, 175, 238);
        }

        .mypanel{
            float: right;margin-right:20px;width: 180px;height: 180px;border-radius: 0
        }

        .title-font{
            color: rgb(78, 153, 208);border-bottom: 1px solid #e0e0e0;display: block;margin-top: 20px;padding-bottom: 10px;font-size: 18px;
        }

    </style>


</head>
<body>

<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand" href="<%=ctx%>/WEB-INF/index.jsp"><span class="glyphicon glyphicon-book"></span>&nbsp;TrainingCollege</a>
        </div>
        <div>

            <ol class="nav navbar-nav navbar-right">
                <li><a>总经理</a></li>
                <li><a href="<%=ctx%>/admin/logout"><span class="glyphicon glyphicon-log-out"></span>退出登录</a></li>
            </ol>

        </div>
    </div>

</nav>


<div class="container" style="margin-top: 20px;width: 55%;margin-top: 80px">

    <span class="title-font" style="margin-bottom: 10px"><span style="font-size: 15px" class="glyphicon glyphicon-tasks"></span>&nbsp我的任务</span>

    <button class="mybtn" style="margin-left: 10px" onclick="httpPost('<%=ctx%>/admin/userStat')"><span style="font-size: 30px" class="glyphicon glyphicon-user"></span><br>用户统计</button>
    <button class="mybtn" style="margin-left: 90px" onclick="httpPost('<%=ctx%>/admin/instStat')"><span style="font-size: 30px" class="glyphicon glyphicon-education"></span><br>机构统计</button>
    <div class="panel panel-default mypanel"  >
        <div class="panel-heading" style="background-color: white;color: rgb(78, 153, 208)">
            <h3 class="panel-title" style="text-align: center" ><span class="glyphicon glyphicon-check"></span>待审批</h3>
        </div>
        <div class="panel-body">
            <%
                int regCount=(int)request.getAttribute("regCount");
                int modifyCount=(int)request.getAttribute("modifyCount");
            %>
            <div><button onclick="httpPost('<%=ctx%>/admin/handleReg')" class="btn btn-default btn-block" style="margin-top: 10px;color: rgb(78, 153, 208);border-radius: 0" type="button">机构注册申请<span class="badge pull-right" style="background-color: #ee6e0e"><%=regCount%></span></button></div>
            <div><button onclick="httpPost('<%=ctx%>/admin/handleModify')" class="btn btn-default btn-block" style="margin-top: 20px;color: rgb(78, 153, 208);border-radius: 0" type="button">机构修改申请<span class="badge pull-right" style="background-color: #eea236"><%=modifyCount%></span></button></div>
        </div>


    </div>


</div>

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
            categories: ['总营业额','预订额','退订额','累计收入'],
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

        <%
            double[] nums=(double[])request.getAttribute("nums");
        %>

        var series=[{name:'详细',data:[<%=nums[0]%>,<%=nums[1]%>,<%=nums[2]%>,<%=nums[3]%>]}];

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


<div class="container" style="width: 55%;">
    <span class="title-font"><span style="font-size: 15px" class="glyphicon glyphicon-stats"></span>&nbsp财务情况</span>

    <div id="container">

    </div>

</div>

</body>
</html>
