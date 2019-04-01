<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30
  Time: 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>个人帖子中心</title>
    <script src="<%=basePath%>/plugins/jquery.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/global.css">
</head>
<body>
<div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title" id="LAY_mine">
            <li data-type="mine-jie" lay-id="index" class="layui-this">我发的帖<span></span></li>
        </ul>
        <div class="layui-tab-content" style="padding: 20px 0;">
            <div class="layui-tab-item layui-show">
                <ul class="mine-view jie-row">
                    <c:forEach var="my" items="${requestScope.mySend}">
                    <li>

                        <a class="jie-title" href="<%=basePath%>send/sendpost?id=${my.id}" target="_blank">${my.theme}</a>
                        <i><fmt:formatDate value="${my.time}" pattern="yyyy年MM月dd日 HH:mm"/></i>
                        <a class="mine-edit" href="<%=basePath%>send/edit?id=${my.id}">编辑</a>
                        <i>&nbsp;区域:${my.getSendType().getName()}</i>
                        <em>${my.getSendState().getName()}</em>

                    </li>
                    </c:forEach>
                </ul>
                <div id="LAY_page"></div>
            </div>

        </div>
    </div>
</div>
</div>




</body>
</html>
