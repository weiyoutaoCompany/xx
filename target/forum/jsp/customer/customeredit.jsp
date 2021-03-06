<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/10
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>修改页面</title>
    <!--导入bootstrap插件-->
    <link rel="stylesheet" href="<%=basePath%>plugins/bootstrap/css/bootstrap.css">
    <script src="<%=basePath%>plugins/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugins/bootstrap/js/bootstrap.js"></script>
    <!--导入自定义样式文件-->
    <link rel="stylesheet" href="<%=basePath%>css/mycss.css">


    <script type="text/javascript">
        $(document).ready(function() {
            $("button[name='addAdmin']").click(function() {
                var $myForm = $("#myForm");//获取指定a标签的jquery对象
                $.post("<%=basePath%>customer/list",
                    $myForm.serialize(),
                    function(data) {
                        //jquery自带的json转换方法
                        if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换成JS对象
                            data = $.parseJSON(data);
                        }
                        alert(data.myMessage);
                    }
                );
            });
        });
    </script>
</head>
<body>
<form id="myForm" role="form">
    <input type="hidden" name="id" value="${requestScope.customer.id}">
    <div class="form-group">
        <label for="username">账户名</label>
        <input type="text" class="form-control" id="username" name="username" placeholder="请输入账户名" value="${requestScope.customer.username}" disabled="disabled">
    </div>
    <div class="form-group">
        <label for="name">名称</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名" value="${requestScope.customer.name}">
    </div>

    <button name="addAdmin" type="button" class="btn btn-default">修改</button>
    <a class="btn btn-info" href="<%=basePath %>customer/list">返回账户管理页面</a>
</form>
</body>
</html>
