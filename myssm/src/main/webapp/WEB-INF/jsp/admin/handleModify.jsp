<%@ page import="po.Apply" %>
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

<%
    String msg=(String)request.getAttribute("msg");
    if(msg!=null){
%>
<div class="alert alert-success" style="position: absolute;top:80px;left: 50%;margin-left:-40%;width: 80%;z-index: 3;">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>
<%
    }
%>

<%
    List<Apply> modifies=(List)request.getAttribute("modifies");
    int count=1;
%>

<div class="container" style="margin-top: 80px;width: 70%">
    <ol class="breadcrumb">
        <li><a href="<%=ctx%>/admin/admin">主页</a></li>
        <li>机构修改申请</li>
    </ol>
    <table id="myTable" class="table">
        <thead>
        <tr>
            <th>申请编号</th>
            <th>机构编号</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(Apply apply:modifies){
        %>
        <tr>
            <td><%=count++%></td>
            <td><%=apply.getEid()%></td>
            <td><%=apply.getCreateTime()%></td>
            <td><button data-toggle="modal" data-target="#myModal" onclick="showModify('<%=apply.getCreateTime()%>')" class="btn btn-success btn-sm">查看</button></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script type="application/javascript">
    function showModify(time) {
        $.ajax({
            type:"POST",
            url:"<%=ctx%>/admin/showModify",
            data:{time:time},
            dataType:"json",
            success:function (data) {
                var modify=data.modify;
                $('#eid').val(modify.eid);
                $('#name').val(modify.name);
                $('#location').val(modify.location);
                $('#info').val(modify.info);
                $('#btn1').click(function() {
                    httpPost('<%=ctx%>/admin/approveModify', {time: modify.createTime, approved: 1});
                });
                $('#btn2').click(function() {
                    httpPost('<%=ctx%>/admin/approveModify', {time: modify.createTime, approved: -1});
                });
            }
        });
    }
</script>

<div class="modal fade" id="myModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 style="text-align: center;color:#0e77af">机构修改申请</h3>
            </div>
            <div class="modal-body" >
                <form id="editForm" style="width: 500px;margin: 10px auto 0 auto" method="post">
                    <div class="form-group" style="margin-bottom: 40px">
                        <input id="eid" type="text" class="form-control" style="float: right;width: 80%;margin-right: 20px;margin-top: -3px">
                        <span style="color:#0e77af;font-size: 15px">编号</span>
                    </div>
                    <div class="form-group" style="margin-bottom: 40px">
                        <input id="name" type="text" class="form-control" style="float: right;width: 80%;margin-right: 20px;margin-top: -3px">
                        <span style="color:#0e77af;font-size: 15px">名称</span>
                    </div>
                    <div class="form-group" style="margin-bottom: 40px">
                        <input id="location" type="text" class="form-control" style="float: right;width: 80%;margin-right: 20px;margin-top: -3px">
                        <span style="color:#0e77af;font-size: 15px">地点</span>
                    </div>
                    <div class="form-group" style="margin-bottom: 40px">
                        <textarea id="info" class="form-control" style="height: 200px;float: right;width: 80%;margin-right: 20px;"></textarea>
                        <span style="color:#0e77af;font-size: 15px">师资情况</span>
                    </div>

                </form>
            </div>

            <div class="modal-footer" style="margin-top: 150px">
                <button id="btn1" class="btn btn-success btn-md" style="width: 100px">通过</button>
                <button id="btn2" class="btn btn-danger btn-md" style="width: 100px">不通过</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
