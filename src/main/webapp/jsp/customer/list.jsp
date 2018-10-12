<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/10
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>管理账户列表</title>
    <!--导入bootstrap插件-->
    <link rel="stylesheet" href="<%=basePath%>plugins/bootstrap/css/bootstrap.css">
    <script src="<%=basePath%>plugins/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugins/bootstrap/js/bootstrap.js"></script>
    <!--导入自定义样式文件-->
    <link rel="stylesheet" href="<%=basePath%>css/mycss.css">
</head>
<body>
<table class="table table-bordered table-hover  table-striped">
    <%--<caption>管理账户列表</caption>--%>
    <thead>
    <tr>
        <th>账户名</th>
        <th>密码</th>
        <th>姓名</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${requestScope.list}">
        <tr>
            <td>${customer.username}</td>
            <td>${customer.password}</td>
            <td>${customer.name}</td>
            <td style="width:20%;"><a href="<%=basePath %>customer/edit?id=${customer.id}" class="btn btn-info btn-xs">修改</a>
                <a name="deleteAdmin" class="btn btn-info btn-xs" href="<%=basePath %>customer/delete/?id=${customer.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
