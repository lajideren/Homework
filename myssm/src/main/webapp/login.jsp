<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>




    <script type="application/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath }/resources/bootstrap-3.3.5-dist/js/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>用户登陆</title>
</head>
<body>

    <script>
        $(document).ready(function(c) {
            $('.close').on('click', function(c) {
                $('.login-form').fadeOut('slow', function(c) {
                    $('.login-form').remove();
                });
            });
        });
    </script>
        <!--SIGN UP-->
        <h1>用户登陆</h1>
        <div class="login-form">
            <div class="close"></div>
            <div class="head-info">
                <label class="lbl-1"></label>
                <label class="lbl-2"></label>
                <label class="lbl-3"></label>
            </div>
            <div class="clear"></div>
            <div class="avtar">
                <img src="<c:url value="/resources/img/login/avtar.png"/>" />
            </div>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <input type="text" class="text" name="username">
                <div class="key">
                    <input type="password" name="password">
                </div>

                <div class="signin">
                    <input type="submit" value="登陆">
                </div>
            </form>
        </div>

</body>
</html>