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
    <script type="application/javascript" src="<%=ctx%>/resources/bootstrap-3.3.5-dist/js/bootstrap-paginator.js"></script>


    <link rel="stylesheet" type="text/css" href="<%=ctx%>/resources/bootstrap-3.3.5-dist/css/bootstrap.css">
</head>
<body>

<div class="container">
    <table class="table table-bordered table-hover" style="margin-top: 10px">
        <thead>
        <tr>
            <th style="width: 10%">订单编号</th>
            <th style="width: 10%">课程编号</th>
            <%--<th style="width: 15%">课程名称</th>--%>
            <%--<th style="width: 10%">班级编号</th>--%>
            <%--<th style="width: 20%">成员</th>--%>
            <%--<th style="width: 15%">下单时间</th>--%>
            <%--<th style="width: 10%">总金额</th>--%>
            <%--<th style="width: 15%">操作</th>--%>
        </tr>
        </thead>
        <tbody id="myBody">
        </tbody>
    </table>
    <div style="position: absolute;left:100px;top:400px">
        <ul class="pagination" id="example"></ul>
    </div>
</div>

<script type='text/javascript'>

    $.ajax({
        type:'POST',
        url:'<%=ctx%>/inst/orders',
        dataType:'json',
        success:function (data) {

            console.log(data.pageCount);
            console.log(data.orders);

            var pageCount=data.pageCount;
            var orders=data.orders;

            var content='';
            for(i=0;i<orders.length;i++){
                content+='<tr><td>'+orders[i].oid+'</td><td>'+orders[i].cid+'</td></tr>';
            }

            $('#myBody').html(content);

            var options = {

                currentPage: 1,
                totalPages: pageCount,
                numberOfPages:10,
                bootstrapMajorVersion:3,
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first":
                            return "第一页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "最后一页";
                        case "page":
                            return page;
                    }
                },
                onPageClicked: function(event, originalEvent, type, page){
                    $.ajax({
                        type:'POST',
                        url:'<%=ctx%>/inst/orders',
                        data:{pageNum:page},
                        dataType:'json',
                        success:function (data) {

                            console.log(page);
                            console.log(data.pageCount);
                            console.log(data.orders);

                            var orders = data.orders;

                            var content = '';
                            for (j = 0; j < orders.length; j++) {
                                content += '<tr><td>' + orders[j].oid + '</td><td>' + orders[j].cid + '</td></tr>';
                            }
                            $('#myBody').html(content);
                        }
                    })
                }


            };

            $('#example').bootstrapPaginator(options);

        }
    });



    </script><span style="font-family:'sans serif, tahoma, verdana, helvetica';"><span style="white-space:normal;"> </span></span>

</body>
</html>
