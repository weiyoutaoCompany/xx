<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/16
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>添加用户</title>
    <!--导入bootstrap插件-->
    <link rel="stylesheet" href="<%=basePath%>plugins/bootstrap/css/bootstrap.css">
    <script src="<%=basePath%>plugins/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugins/bootstrap/js/bootstrap.js"></script>
    <script>
        $(function () {
            $("button[name='addCustomer']").click(function() {
                var $myForm = $("#myForm");//获取指定a标签的jquery对象
                $.post("<%=basePath%>systemcus/add",
                    $("#myForm").serialize(),
                    function(data) {
                        //jquery自带的json转换方法
                        if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换成JS对象
                            data = $.parseJSON(data);
                        }
                        alert(data.myMessage);
                        if(data.status == 1) {
                            window.location.href = "<%=basePath%>systemcus/list";
                        }
                    }
                );
            });

            /*$(".btn").click(function () {

                    //使用ajax执行登录操作
                    //第一个参数指要访问的服务端地址；
                    //第二个参数，指要传递的表单的数据，$("#myForm").serialize()
                    //第三个参数，function(data)用于接收服务端返回来的值，data
                    $.post("<%=basePath%>systemcus/add",
                        $("#gly_add").serialize(),
                        function (data) {
                            //根据服务端返回来的值，判断登录是否成功
                            if (data.status == 1) {
                                alert("添加成功");

                                location.href = "<%=basePath%>systemcus/list";
                            } else {
                                alert("添加失败!用户账户已存在!");
                            }
                        });


            })
*/




        })

    </script>
</head>
<body>

<form class="form-horizontal modal-open"  method="post" id="myForm">

    <h1 style="margin: 20px; auto auto 50px; ">添加用户</h1>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">昵称</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="name" name="name">
        </div>
    </div>

    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">账号</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="username" name="username">
        </div>
    </div>

    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">密码</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="password" name="password">
        </div>
    </div>



    <div class="form-group">
        <label class="col-sm-1 control-label"></label>
        <div class="col-sm-6">
            <button name="addCustomer" class="btn btn-primary btn-lg" type="button" >确认</button>
        </div>
    </div>
</form>
</body>
</html>
