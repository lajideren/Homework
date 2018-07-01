<%@ page import="po.Institution" %>
<%@ page import="po.Course" %>
<%@ page import="po.Member" %>
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

        input:disabled {
            background-color: transparent;
            height: 25px;
            border: 0;
            text-align: center;
            color: #000000;
        }

        input{
            background-color: white;
            height: 25px;
            border: 1px solid #6ecaec;
            text-align: center;
        }
    </style>

    <script type="application/javascript">

        var option={
            "bLengthChange": false,
            "bFilter": false, //过滤功能
            "bSort": false, //排序功能
            "bInfo": false,//页脚信息
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
            "aLengthMenu": [[10, 20, 30, -1], [10,20, 30, "All"]]

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
                int cid=(int)request.getAttribute("cid");
                int sid=(int)request.getAttribute("sid");
//                System.out.println("jsp:"+cid+" "+sid);
            %>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><%=inst.getName()%>,欢迎你</a></li>
                <li><a href="<%=ctx%>/logoutUser"><span class="glyphicon glyphicon-log-out"></span>退出登录</a></li>
            </ul>


        </div>
    </div>

</nav>

<script type="application/javascript">
    function edit() {
        $('input').attr("disabled",false);
        $('#edit').attr("disabled",true);
        $('#save').attr("disabled",false);
        $('#cancel').attr("disabled",false);
    }
    
    function save() {
        if(window.confirm("确认保存?")){
            $('#myForm').submit();
        }
    }

    function cancel() {
        httpPost("<%=ctx%>/inst/members",{sid:<%=sid%>,cid:<%=cid%>});
    }
</script>

<div class="container" style="margin-top: 80px;width: 70%">
    <ol class="breadcrumb">
        <li><a href="<%=ctx%>/inst/courses">所有课程</a></li>
        <li><a href="<%=ctx%>/inst/sections?cid=<%=cid%>&sid=<%=sid%>">班级列表</a></li>
        <li class="active">班级成员</li>
    </ol>



</div>

<div class="container" style="width: 50%">

    <form id="myForm" action="<%=ctx%>/inst/saveGrade">
        <input type="hidden" name="sid" value="<%=sid%>">
        <input type="hidden" name="cid" value="<%=cid%>">
        <table id="myTable" class="table">
            <thead>
            <tr>
                <th style="width: 50%">名称</th>
                <th style="width: 50%">成绩</th>
            </tr>
            </thead>
            <tbody>


                <%
                    List<Member> members=(List)request.getAttribute("members");
                    for(Member member:members){
                %>
                <tr>
                    <td><%=member.getUsername()%></td>
                    <%
                        if(member.getGrade()==0){
                    %>
                    <%--<td>暂无成绩</td>--%>
                    <td><input name="grade" value="暂无成绩" disabled> </td>
                    <%
                    }else {
                    %>
                    <%--<td><%=member.getGrade()%></td>--%>
                    <td><input name="grade" value="<%=member.getGrade()%>" disabled> </td>
                    <%
                        }
                    %>
                </tr>
                <%
                    }
                %>

            </tbody>
        </table>
    </form>
    <div style="border-top: 1px solid #e7e7e7;padding-top: 20px">
    <button id="edit" style="float: left;margin-left: 15px;width: 100px" class="btn btn-md btn-primary" onclick="edit()">编辑</button>
    <button id="save" style="float: left;margin-left: 15px;width: 100px" class="btn btn-md btn-success" onclick="save()"  disabled>保存</button>
    <button id="cancel" style="float: left;margin-left: 15px;width: 100px" class="btn btn-md btn-warning" onclick="cancel()" disabled>取消</button>
    </div>
</div>

</body>
</html>
