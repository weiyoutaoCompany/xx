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

    <script type="text/javascript">
        $(document).ready(function() {
            $("a[name='deleteAdmin']").click(function() {
                var $a = $(this);//获取指定a标签的jquery对象
                if(window.confirm('确定要删除该账户吗？删除后无法恢复')) {
                    $.get($a.attr("href"), function(data) {
                        //jquery自带的json转换方法
                        if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换成JS对象
                            data = $.parseJSON(data);
                        }
                        if(data.status == 1) { //如果删除成功
                            $a.parents("tr").remove();//移除该元素所在表格行
                        }else{//如果删除失败
                            alert(data.myMessage);
                        }
                    });
                }
                return false;//让链接事件失效，即不再执行原链接跳转
            });
        });
    </script>
</head>
<body>
<table class="table table-bordered table-hover  table-striped">
    <%--<caption>管理账户列表</caption>--%>
    <thead>
    <tr>
        <th>账号</th>
        <th>密码</th>
        <th>姓名</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="admin" items="${requestScope.list}">
        <tr>
            <td>${admin.username}</td>
            <td>${admin.password}</td>
            <td>${admin.name}</td>
            <td style="width:20%;"><a href="<%=basePath %>system/edit?id=${admin.id}" class="btn btn-info btn-xs">修改</a>
                <a name="deleteAdmin" class="btn btn-info btn-xs" href="<%=basePath %>system/delete/?id=${admin.id}">删除</a>
            </td>
        </tr>
    </c:forEach>

    </tbody>

</table>
<ul class="pagination" style="float: left;">
    共<i class="blue">${page.tatolCount}</i>条记录,当前显示第<i class="blue">${page.pageIndex}</i>页,共<i
        class="blue">${page.pageCount}</i>页
</ul>

<ul class="pagination" style="float: right;">
    <li><a href="<%=basePath%>system/list?pageIndex=1">首页</a></li>
    <li><a href="<%=basePath%>system/list?pageIndex=${page.pageIndex-1}">上一页</a></li>
    <li><a href="<%=basePath%>system/list?pageIndex=${page.pageIndex+1}">下一页</a></li>
    <li><a href="<%=basePath%>system/list?pageIndex=${page.tatolCount}">尾页</a></li>
</ul>

</body>
</html>
