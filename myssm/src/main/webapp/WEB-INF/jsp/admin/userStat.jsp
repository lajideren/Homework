<%@ page import="java.util.List" %>
<%@ page import="po.User" %>
<%@ page import="util.LevelUtil" %>
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
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/jquery.dataTables.min.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/dataTables.bootstrap4.min.js"></script>


    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/dataTables.bootstrap4.min.css">

    <style>
        th,td,span{
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
            "aLengthMenu": [[6, 10, -1], [6, 10, "All"]]

        };
        $(document).ready(function() {
            $('#myTable').DataTable(option);

        });
    </script>

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
                <li><a href="<%=ctx%>/"><span class="glyphicon glyphicon-log-out"></span>退出登录</a></li>
            </ol>

        </div>
    </div>

</nav>

<div class="container" style="margin-top: 80px;width: 70%">
    <ol class="breadcrumb">
        <li><a href="<%=ctx%>/admin/admin">主页</a></li>
        <li>学员统计</li>
    </ol>
</div>

<%
    List<User> users=(List)request.getAttribute("users");
%>

<div id="container" class="container" style="width: 70%">
  <table id="myTable" class="table">
      <thead>
            <tr>
                <th>用户名</th>
                <th>余额</th>
                <th>累计消费</th>
                <th>积分</th>
                <th>会员等级</th>
            </tr>
      </thead>
      <tbody>
            <%
                for(User user:users){
            %>
            <tr>
                <td><%=user.getUsername()%></td>
                <td><%=user.getBalance()%></td>
                <td><%=user.getTotal_money()%></td>
                <td><%=user.getCredit()%></td>
                <td><%=LevelUtil.getLevel(user.getTotal_money())%></td>
            </tr>
            <%
                }
            %>
      </tbody>
  </table>
</div>



</body>
</html>
