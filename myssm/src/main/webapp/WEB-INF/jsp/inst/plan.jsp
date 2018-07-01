<%@ page import="po.Institution" %>
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
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap-datetimepicker.js"></script>
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap-datetimepicker.zh-CN.js"></script>

    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap-datetimepicker.min.css">

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

        function submitPlan() {
            if(window.confirm("确认发布?")) {

                $.ajax({
                    type:"POST",
                    url:"<%=ctx%>/inst/planSubmit",
                    data:$('#courseForm').serialize(),
                    dataType:"json",
                    success:function (data) {
                        alert(data.msg);
                    }
                });

            }
        }
    </script>

    <style>
        .input-group-addon{
            background-color: #ffffff;
            width: 20%;
            border: 0;
            text-align: left;
        }

        form>span{
            margin-left: 2%;
            width: 15%;
            height: 30px;
            display: inline-block;
        }

        form>input{
            margin-bottom: 30px;
            width: 30%;
            height: 30px;
            display: inline-block;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle!important;
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
                <li class="active"><a href="<%=ctx%>/inst/plan">发布课程</a></li>
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



<div class="container" style="width:700px;margin-top: 80px">
    <div class="panel panel-default" >
        <div class="panel-body">
            <form id="courseForm" style="width: 500px;margin: 10px auto 0 auto" method="post">
                <h3 style="text-align: center;color:#0e77af;margin-bottom: 30px ">发布课程</h3>
                <span>课程名称</span><input type="text" name="name" style="" placeholder="课程名称" required>
                <span>课程类型</span><input type="text" name="type" placeholder="课程类型" required>
                <span>价格(元)</span><input type="text" name="price" placeholder="价格" required>
                <span>班型(人/班)</span><input type="text" name="number" placeholder="班型" required>
                <span>每周课时(h)</span><input type="text" name="hours_weekly" placeholder="每周课时" required>
                <span>总周数</span><input type="text" name="weeks" placeholder="总周数" required>
                <span>开课时间</span><input name="start_time" type="text" id="datetimeStart" placeholder="开课时间" class="form_datetime" required>

                <div class="form-group">
                    <span style="margin-bottom: 10px;margin-left: 10px">课程描述:</span>
                    <textarea name="detail" class="form-control" placeholder="输入课程描述" style="height: 150px;margin-left: 10px" required></textarea>
                </div>

                <button type="button" class="btn btn-success btn-sm" style="margin-left: 10px" onclick="addSection()"><span class="glyphicon glyphicon-plus"></span> 添加班级</button>


                <table class="table table-bordered table-striped" style="margin-top: 10px;margin-left: 10px">
                    <thead>
                        <tr>
                            <th style="width: 20%">班级编号</th>
                            <th style="width: 40%">教师</th>
                            <th style="width: 40%">地点</th>
                        </tr>
                    </thead>

                    <script type="application/javascript">
                        var index=1;
                        function addSection() {
                            var temp='<tr>';
                            temp+='<td>'+(index++)+'</td>';
                            temp+='<td><input name="teacher" type="text"></td>';
                            temp+='<td><input name="location" type="text"></td>';
                            temp+='</tr>';
                            $('#myBody').append(temp);
                        }
                    </script>


                    <tbody id="myBody">

                    </tbody>
                </table>

                <button type="button" class="btn btn-primary" onclick="submitPlan()" style="margin-top: 30px;margin-left: 100px;width: 60%">确认发布</button>

            </form>
        </div>
    </div>
</div>


<%--<input size="16" type="text" id="datetimeStart" readonly class="form_datetime">--%>
<%--<input size="16" type="text" id="datetimeEnd" readonly class="form_datetime">--%>

<script type="text/javascript">
    $("#datetimeStart").datetimepicker({
        format: 'yyyy-mm-dd',
        minView:'month',
        language: 'zh-CN',
        autoclose:true,
        startDate:new Date()
    })
    // $("#datetimeStart").datetimepicker({
    //     format: 'yyyy-mm-dd',
    //     minView:'month',
    //     language: 'zh-CN',
    //     autoclose:true,
    //     startDate:new Date()
    // }).on("click",function(){
    //     $("#datetimeStart").datetimepicker("setEndDate",$("#datetimeEnd").val())
    // });
    // $("#datetimeEnd").datetimepicker({
    //     format: 'yyyy-mm-dd',
    //     minView:'month',
    //     language: 'zh-CN',
    //     autoclose:true,
    //     startDate:new Date()
    // }).on("click",function(){
    //     $("#datetimeEnd").datetimepicker("setStartDate",$("#datetimeStart").val())
    // });
</script>

</body>
</html>
