<%@ page import="java.util.List" %>
<%@ page import="po.Institution" %>
<%@ page import="po.Course" %>
<%@ page import="po.Section" %>
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
            "aLengthMenu": [[ 8, 10, -1], [8, 10, "All"]]

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
            <a class="navbar-brand" href="<%=ctx%>/index.jsp">TrainingCollege</a>
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
                Course course=(Course)request.getAttribute("course");
            %>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><%=inst.getName()%>,欢迎你</a></li>
                <li><a href="<%=ctx%>/logoutUser"><span class="glyphicon glyphicon-log-out"></span>退出登录</a></li>
            </ul>


        </div>
    </div>

</nav>

<%
    String msg=(String) request.getAttribute("msg");
    if(msg!=null){

%>

<div class="alert alert-success" style="position: absolute;top:80px;left: 50%;margin-left:-40%;width: 80%">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>

<%
    }
%>

<div class="container" style="margin-top: 80px;width: 70%">
    <ol class="breadcrumb">
        <li><a href="<%=ctx%>/inst/courses">所有课程</a></li>
        <li class="active">班级列表</li>
    </ol>
    <table id="myTable" class="table">
        <thead>
            <tr>
                <th style="width:10%">编号</th>
                <th style="width:20%">教师</th>
                <th style="width:30%">地点</th>
                <th style="width:15%">已选</th>
                <th style="width:20%">操作</th>
            </tr>
        </thead>
        <tbody>
        <%
            boolean started=(boolean)request.getAttribute("started");
            List<Section> sections=(List)request.getAttribute("sections");
            for(Section section:sections){

        %>
            <tr>
                <td><%=section.getCid()+"-"+section.getRank()%></td>
                <td><%=section.getTeacher()%></td>
                <td><%=section.getLocation()%></td>
                <td><%=section.getSelected()+"/"+section.getAmount()%></td>
                <%
                    if(!started){
                %>
                <td>
                    <button class="btn btn-success btn-sm" value="<%=section.getSid()%>" onclick="setSid1(this)" data-toggle="modal" data-target="#myModal1">普通预订</button>
                    <button class="btn btn-warning btn-sm" value="<%=section.getSid()%>" onclick="setSid(this)" data-toggle="modal" data-target="#myModal">会员预订</button>
                </td>
                <%
                    }else {
                %>
                <td>
                    <button class="btn btn-primary btn-sm" onclick="httpPost('<%=ctx%>/inst/members',{sid:<%=section.getSid()%>,cid:<%=section.getCid()%>})">查看班级成员</button>
                </td>
                <%
                    }
                %>
            </tr>
        <%
            }
        %>
        </tbody>

    </table>
</div>



<script type="application/javascript">
    var index=0;
    var max=3;
    var sum=0.0;
    var price=parseFloat(<%=course.getPrice()%>);
    var checked=false;
    var level;

    function setSid(obj) {
        $('#sid').val(obj.value)
    }

    function addRow() {
        if(checked) {
            if (index < max) {
                var text = "<div class='form-group'><lable>成员" + (index + 1) + ":</lable><input type='text' class='form-control' name='members'><td><tr></div>";
                $('#myForm').append(text);
                index += 1;
                sum=price*index*(1-0.05*level);
                $('#sum').text(""+sum+"元(-"+level*5+"%)");
            } else {
                var msg;
                msg = "最多添加" + max + "名成员";
                alert(msg);
            }
        }else {
            alert("请输入正确的会员账号")
        }
    }

    function checkUser() {
        $.ajax({
            type:"POST",
            url:"<%=ctx%>/inst/checkUser",
            data:{username:$('#username').val()},
            dataType:"json",
            success:function (data) {
                if(data.level===undefined){
                    checked=false;
                    $('#level').text("");
                }else {
                    checked=true;
                    level=data.level;
                    $('#level').text("(level "+level+")");
                }
            }
        })
    }

    function cancel() {
        index=0;
        checked=false;
        sum=0.0;
        $('#level').text("");
        $('#sum').text("0.0");
        $('#myForm').html('<div class="form-group"><label>会员账号</label><span style="color: #5cb85c" id="level"></span>' +
            '<input id="username" oninput="checkUser()" onpropertychange="checkUser()" type="text" class="form-control" name="username">' +
            '</div><input type="hidden" value="<%=course.getCid()%>" name="cid"><input type="hidden" id="sid" name="sid">');
    }

    function submit(){
        $('#myForm').submit();
    }
</script>

<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" onclick="cancel()">&times;</button>
                <h4 class="modal-title">添加成员</h4>
            </div>
            <div class="modal-body">
                <form id="myForm" method="post" action="<%=ctx%>/inst/addOrder">
                    <div class="form-group">
                        <label>会员账号</label><span style="color: #5cb85c" id="level"></span>
                        <input id="username" oninput="checkUser()" onpropertychange="checkUser()" type="text" class="form-control" name="username">
                    </div>
                    <input type="hidden" value="<%=course.getCid()%>" name="cid">
                    <input type="hidden" id="sid" name="sid">


                </form>
                <h3>总计:<span id="sum" style="color: red">0.0</span></h3>
            </div>
            <div class="modal-footer">
                <button onclick="addRow()" class="btn btn-success">增加成员</button>
                <button onclick="submit()" class="btn btn-default">提交</button>
            </div>
        </div>
    </div>
</div>

<script type="application/javascript">
    var index1=0;
    var max1=3;
    var sum1=0.0;
    var price1=parseFloat(<%=course.getPrice()%>);

    function setSid1(obj) {
        $('#sid1').val(obj.value)
    }

    function addRow1() {
        if(index1<max1) {
            var text = "<div class='form-group'><lable>成员"+(index1+1)+":</lable><input type='text' class='form-control' name='members'><td><tr></div>";
            $('#myForm1').append(text);
            index1 += 1;
            sum1=price1*index1;
            $('#sum1').text(sum1+"元");
        }else {
            var msg;
            msg="最多添加"+max+"名成员";
            alert(msg);
        }
    }

    function cancel1() {
        index1=0;
        sum1=0.0;
        $('#sum1').text("0.0");
        $('#myForm1').html('<input type="hidden" value="<%=course.getCid()%>" name="cid"><input type="hidden" id="sid1" name="sid">');
    }

    function submit1(){
        $('#myForm1').submit();
    }
</script>

<div class="modal fade" id="myModal1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" onclick="cancel1()">&times;</button>
                <h4 class="modal-title">添加成员</h4>
            </div>
            <div class="modal-body">
                <form id="myForm1" method="post" action="<%=ctx%>/inst/addOrder">
                    <input type="hidden" value="<%=course.getCid()%>" name="cid">
                    <input type="hidden" id="sid1" name="sid">


                </form>
                <h3>总计:<span id="sum1" style="color: red">0.0</span></h3>
            </div>
            <div class="modal-footer">
                <button onclick="addRow1()" class="btn btn-success">增加成员</button>
                <button onclick="submit1()" class="btn btn-default">提交</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
