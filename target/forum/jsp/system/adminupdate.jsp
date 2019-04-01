<%--
  Created by IntelliJ IDEA.
  User: ljyadbefgh
  Date: 2018/9/6
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>编辑管理账户</title>
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
                $.post("<%=basePath%>system/editUpdate",
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
            /*
            $("button[name='addAdmin']").click(function() {
                var $myForm = $("#myForm");//获取指定a标签的jquery对象
                $.post("<%=basePath%>system/editUpdate",
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
            */

        });
    </script>

</head>
<body>

<form class="form-horizontal modal-open"  method="post" id="myForm">
    <input type="hidden" name="id" value="${requestScope.admin.id}">
    <h1 style="margin: 20px; auto auto 50px; ">修改管理信息</h1>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">昵称</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="name" name="name" value="${requestScope.admin.name}">
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">账号</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="username" name="username" value="${requestScope.admin.username}" disabled="disabled">
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">密码</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="password" name="password" value="${requestScope.admin.password}">
        </div>
    </div>

    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">账号</label>
        <div class="col-sm-4">
            <button name="addAdmin" type="button" class="btn btn-default">修改</button>
            <a class="btn btn-info" href="<%=basePath %>system/list">返回账户管理页面</a>
        </div>
    </div>

</form>
</body>
</html>
