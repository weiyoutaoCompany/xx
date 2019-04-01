<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/28
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>404</title>
    <link rel="stylesheet" href="<%=basePath%>plugins/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/global.css">
</head>
<body>
<div class="layui-container fly-marginTop">
    <div class="fly-panel">
        <div class="fly-none">
            <h2><i class="iconfont icon-404"></i></h2>
            <p>页面或者数据被<a href="#" target="_blank"> 纸飞机 </a>运到火星了，啥都看不到了…</p>
        </div>
    </div>
</div>


<script src="<%=basePath%>plugins/layui/layui.js"></script>


</body>
</html>
