<%@ page import="po.User" %>
<%@ page import="util.NumberUtil" %>
<%@ page import="util.LevelUtil" %>
<%@ page import="po.Course" %>
<%@ page import="po.Section" %>
<%@ page import="java.util.List" %>
<%@ page import="po.Member" %>
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


    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/dataTables.bootstrap4.min.css">

    <script type="application/javascript">
        function httpPost(URL,PARAMS) {
            if(window.confirm("确认执行此操作？")) {
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
<body>

<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=ctx%>/WEB-INF/index.jsp">TrainingCollege</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="<%=ctx%>/user/courses">所有课程</a></li>
                <li class="active"><a href="<%=ctx%>/user/info">我的信息</a></li>
                <li><a href="<%=ctx%>/user/orders">我的订单</a></li>

            </ul>

            <%
                User user=(User)request.getAttribute("user");
            %>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><%=user.getUsername()%>,欢迎你</a></li>
                <li><a href="<%=ctx%>/logoutUser"><span class="glyphicon glyphicon-log-out"></span>退出登录</a></li>
            </ul>

        </div>
    </div>

</nav>


<%
    String msg=(String)request.getAttribute("msg");
    if(msg!=null){
%>

<div class="alert alert-info" style="position: absolute;top:80px;left: 50%;margin-left:-40%;width: 80%;z-index: 10">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%=msg%>
</div>

<%
    }
%>

<%
    List<Course> courses=(List)request.getAttribute("courses");
    List<Section> sections=(List) request.getAttribute("sections");
    List<Member> members=(List) request.getAttribute("members");

//    System.out.println(courses.size());

%>

<div style="width: 200px;height:200px;position: absolute;padding-top: 10px;margin-left: 200px">
    <img src="<%=ctx%>/resources/img/user/user.png" width="100%" height="100%">
    <span style="margin-top: 20px;display: inline-block;font-size: 25px;"><%=user.getUsername()%></span>
    <label style="background-color: #f99121;color: white;border-radius: 2px;width:70px;text-align: center"><span class="glyphicon glyphicon-star"></span>Level&nbsp<%=LevelUtil.getLevel(user.getTotal_money())%></label>
    <br>

    <div style="margin-top: 20px">
    <span class="glyphicon glyphicon-send"></span><span style="font-size: 15px;margin-left: 10px"><%=user.getEmail()%></span>
    </div>

    <a style="margin-top: 20px;margin-left: 2px;display: inline-block" href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span>&nbsp修改密码</a>

    <%--<button class="btn btn-warning btn-sm" onclick="httpPost('<%=ctx%>/user/stopUser')">停止会员</button>--%>

    <button style="margin-top: 20px" class="btn btn-primary btn-md btn-block" onclick="httpPost('<%=ctx%>/user/stopUser')">停止会员</button>
    <span style="display: block;border-bottom: 1px #b3b3b3 solid;margin-top: 20px"></span>
</div>

<div class="tab" style="width: 50%;margin-left: 30%;margin-top: 100px">
    <ul class="nav nav-tabs nav-pills">
        <li class="active"><a href="#stat" data-toggle="tab">统计信息</a></li>
        <li><a href="#mycourses" data-toggle="tab">我的课程</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="stat">

            <div class="form-group" style="margin-top: 40px">
                <span style="font-size: 15px;color: #2aabd2;margin-left: 20px"> 余额：</span>
                <span style="font-size: 15px;margin-left: 20px"><%=NumberUtil.formatDouble2(user.getBalance())%>元</span>
            </div>
            <div class="form-group" style="margin-top: 40px">
                <span style="font-size: 15px;color: #2aabd2;margin-left: 20px"> 累计消费：</span>
                <span style="font-size: 15px;margin-left: 20px"><%=NumberUtil.formatDouble2(user.getTotal_money())%>元</span>
            </div>
            <div class="form-group" style="margin-top: 40px">
                <span style="font-size: 15px;color: #2aabd2;margin-left: 20px"> 积分：</span>
                <span style="font-size: 15px;margin-left: 20px"><%=NumberUtil.formatDouble2(user.getCredit())%></span>
            </div>
            <form id="changeForm" action="<%=ctx%>/user/changeCredit" method="post" style="margin-left:20px;margin-top: 30px ">

                <input type="text" name="credit" class="form-control" style="width: 30%;margin-right: 20px;display: inline-block" placeholder="输入兑换的积分数额">
                <button type="button" class="btn btn-md btn-success" style="" onclick="fun1()">积分兑换</button>

            </form>
        </div>
        <div class="tab-pane fade" id="mycourses" style="padding-top: 20px">
            <table id="myTable" class="table">
                <thead>
                <tr>
                    <th style="width: 25%">课程编号</th>
                    <th style="width: 25%">课程名称</th>
                    <th style="width: 25%">班级编号</th>
                    <th style="width: 25%">成绩</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for(int i=0;i<courses.size();i++){
                %>
                <tr>
                    <td><%=courses.get(i).getCid()%></td>
                    <td><%=courses.get(i).getName()%></td>
                    <td><%=courses.get(i).getCid()+"-"+sections.get(i).getRank()%></td>
                    <%
                        int grade=members.get(i).getGrade();
                        if(grade!=0){
                    %>
                    <td><%=grade%></td>
                    <%
                    }else {
                    %>
                    <td>暂无成绩</td>
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
    </div>
</div>



<script type="application/javascript">
    function fun1() {
        $('#changeForm').submit();
    }

    function resetPwd() {
        $('#resetForm').submit();
    }
</script>

<div class="modal fade" id="myModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="resetForm" action="<%=ctx%>/user/changePwd" method="post">
                    <div class="form-group">
                        <label>原密码</label>
                        <input type="password" class="form-control" name="oldPwd" placeholder="原密码">
                    </div>
                    <div class="form-group">
                        <label>新密码</label>
                        <input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="新密码">
                    </div>
                    <div class="form-group">
                        <label>确认新密码</label>
                        <input type="password" class="form-control" id="againPwd" name="againPwd" placeholder="再次输入新密码">
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-success" onclick="resetPwd()" value="修改">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
</html>
