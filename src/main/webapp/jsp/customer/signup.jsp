<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/9/30
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>注册页面</title>
    <script language="JavaScript" src="<%=basePath%>jquery.js"></script>
    <script>
        $(function () {
            $("#sub").click(function () {
                //使用ajax执行登录操作
                //第一个参数指要访问的服务端地址；
                //第二个参数，指要传递的表单的数据，$("#myForm").serialize()
                //第三个参数，function(data)用于接收服务端返回来的值，data
                $.post("<%=basePath%>customer/add",
                    $("#sig").serialize(),
                    function(data) {
                        //根据服务端返回来的值，判断登录是否成功
                        if(data.status==1){
                            alert("注册成功");
                            $("#cuswin").html("欢迎你注册论坛，请登录!");
                            location.href="<%=basePath%>jsp/customer/login.jsp";
                        }else{
                            alert("注册失败!");
                        }
                    });
            })

        })

    </script>
</head>
<body>
<div id="cuswin">
<form  method="post" id="sig">
    昵称:<input name="name"/>
    账户名：<input name="username"/>
    密码：<input name="password"/>

    <input id="sub"  type="button" value="登录"/>
</form>
</div>
</body>
</html>
