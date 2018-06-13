<%@ page import="po.Institution" %>
<%@ page import="java.util.List" %>
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
            "aLengthMenu": [[6, 10, 20, -1], [6,10, 20, "All"]]

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

            <a class="navbar-brand" href="<%=ctx%>/index.jsp"><span class="glyphicon glyphicon-book"></span>&nbsp;TrainingCollege</a>
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
        <li>机构统计</li>
    </ol>
</div>

<div class="container" style="width: 70%">
    <table id="myTable" class="table">
        <thead>
            <tr>
                <th>机构编号</th>
                <th>机构名称</th>
                <th>累计营业额</th>
                <th>当前营业额</th>
                <th>预订额</th>
                <th>退订额</th>
                <th>累计收入</th>
                <th>线下缴费</th>
                <th>线上结算</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Institution> insts=(List)request.getAttribute("insts");
                double[][] nums=(double[][])request.getAttribute("nums");
                for(int i=0;i<nums.length;i++){
            %>
            <tr>
                <td><%=insts.get(i).getEid()%></td>
                <td><%=insts.get(i).getName()%></td>
                <td><%=nums[i][0]%></td>
                <td><%=insts.get(i).getSales()%></td>
                <td><%=nums[i][1]%></td>
                <td><%=nums[i][2]%></td>
                <td><%=nums[i][3]%></td>
                <td><%=nums[i][4]%></td>
                <td><%=nums[i][5]%></td>
                <td><button data-toggle="modal" data-target="#myModal" class="btn btn-success" onclick="setEid('<%=insts.get(i).getEid()%>')">结算</button> </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<script type="application/javascript">
    function setEid(str) {
        $('#eid').val(str);
    }

</script>

<div class="modal fade" id="myModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 style="text-align: center;color:#0e77af">收入结算</h3>
            </div>
            <form action="<%=ctx%>/admin/settleInst">
            <div class="modal-body" >

                    <div class="form-group" style="width: 50%;margin: 0 auto 0 auto">
                        <input class="form-control" name="percent" type="text" placeholder="输入比例(百分比）">
                        <input name="eid" id="eid" type="hidden">
                    </div>

            </div>

            <div class="modal-footer">
                <button type="submit" class="btn btn-success btn-md" style="width: 100px">结算</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
</html>
