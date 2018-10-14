<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/14
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="<%=basePath%>plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>css/sysmain.css" rel="stylesheet">
<html>
<head>
    <title>Title</title>
</head>
<body style="overflow-x: hidden;">
<nav class="navbar navbar-default">
    <div class="navbar-left"><img alt="" src="<%=basePath%>img/system/logo.png"></div>
    <ul class="nav navbar-nav navbar-right">

        <c:if test="${admin!=null }">
            <li><a href="#"><img alt="" src="<%=basePath%>img/system/accountGray.png">	${admin.username }</a></li>

            <li><a href="system/exit">退出登录</a></li>
        </c:if>

        <c:if test="${admin==null }"><li><a href="system/signin">登录</a></li></c:if>
    </ul>
</nav>
<div class="container-fluid">
    <img class="drop-open" alt="" src="<%=basePath%>img/system/drop1.png">
    <div class="row">
        <div class="col-md-2 menu">
            <ul class="list-group">
                <li class="list-group-item"><img class="img-circle center-block" alt="" src="<%=basePath%>img/system/header.png"><br><div class="text-center"><c:if test="${admin==null }">未登录 </c:if><c:if test="${admin!=null }">	${admin.username } </c:if></div></li>
                <li class="list-group-item"><a href="system/ordermanage"><img alt="" src="<%=basePath%>img/system/order.png">订单管理</a></li>
                <li class="list-group-item">
                    <a class="drop-down product-manage" href="#"><img alt="" src="<%=basePath%>img/system/product.png">餐品类型</a>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="system/goodstype/add">添加餐品类型</a></li>
                        <li class="list-group-item"><a href="system/goodstype/manage">餐品类型管理</a></li>
                    </ul>
                </li>
                <li class="list-group-item">
                    <a class="drop-down product-manage" href="#"><img alt="" src="<%=basePath%>img/system/product.png">餐品管理</a>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="system/goods/add">添加餐品</a></li>
                        <li class="list-group-item"><a href="system/goods/manage">餐品管理</a></li>
                    </ul>
                </li>
                <li class="list-group-item">
                    <a class="drop-down product-manage" href="#"><img alt="" src="<%=basePath%>img/system/account.png">用户管理</a>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="system/customer/add">添加用户</a></li>
                        <li class="list-group-item"><a href="system/customer/manage">用户管理</a></li>
                    </ul>
                </li>
                <li class="list-group-item">
                    <a class="drop-down product-manage" href="#"><img alt="" src="<%=basePath%>img/system/setting.png">系统设置</a>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="system/admin/add">添加管理员</a></li>
                        <li class="list-group-item"><a href="system/admin/manage">管理员信息</a></li>
                        <li class="list-group-item"><a href="product-manage.jsp">退出</a></li>
                    </ul>
                </li>
            </ul>
            <img class="drop-close" alt="" src="<%=basePath%>img/system/drop.png">
        </div>
        <div class="col-md-10 main" id="sub-page" style="min-height: 6930px;">

        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function() {
        var href="${href}";
        if(href != '' && href != "#"){
            $('#sub-page').load(href);
        }
        //$('#sub-page').load('system/goodstype/manage');

        $('.menu .list-group a').click(function() {
            var href = $(this).attr('href');
            if(href != '' && href != "#") {
                $('#sub-page').load(href);
            }
            return false;
        });

        $('.drop-down').click(function() {
            if($(this).hasClass('open')) {
                $(this).removeClass('open').next('.list-group').slideUp();
            } else {
                $(this).addClass('open').next('.list-group').slideDown();
            }
            return false;
        });

        $('.drop-close').css({'top': $(window).height() / 2}).click(function() {
            $('.menu').hide();
            $('.drop-open').show();
            $('.main').removeClass('col-md-10').addClass('col-md-12');
        });

        $('.drop-open').css({'top': $(window).height() / 2 + 60}).hide().click(function() {
            $('.menu').show();
            $('.drop-open').hide();
            $('.main').removeClass('col-md-12').addClass('col-md-10');
        });
    });
</script>
</body>
</html>
