<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/9/26
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>登录</title>
    <!--导入自定义样式文件-->
    <link rel="stylesheet" href="<%=basePath%>css/layout.css">
    <script language="JavaScript" src="<%=basePath%>jquery.js"></script>
    <script>
        $(function () {
            $(".btn").click(function () {
                //账号
                var u=document.getElementById("username");
                if(u.validity.valueMissing==true){
                    u.setCustomValidity("账号不能为空");
                }else if(u.validity.patternMismatch==true){
                    u.setCustomValidity("账号为4~15位的英文字母和数字");
                }
                else{
                    u.setCustomValidity("");
                }
                //密码验证
                var p=document.getElementById("password");
                if(p.validity.valueMissing==true){
                    p.setCustomValidity("密码不能为空");
                }else if(p.validity.patternMismatch==true){
                    p.setCustomValidity("密码必须是6~20位的英文字母和数字");
                }
                else{

                    p.setCustomValidity("");
                    //使用ajax执行登录操作
                    //第一个参数指要访问的服务端地址；
                    //第二个参数，指要传递的表单的数据，$("#myForm").serialize()
                    //第三个参数，function(data)用于接收服务端返回来的值，data
                    $.post("<%=basePath%>customer/login",
                        $("#cus").serialize(),
                        function(data) {
                            //根据服务端返回来的值，判断登录是否成功
                            if(data.status==1){
                                alert("登录成功");
                                //$("#cuswin").html("欢迎你登录!");
                                location.href="<%=basePath%>customer/index";
                            }else{
                                alert("登录失败");
                            }
                        });
                }

            })

        })

    </script>
</head>
<body class="signin">
<div class="container">
    <a href="index.html"><img alt="" src="<%=basePath%>img/logozc.png"></a>
    <form id="cus" class="form" method="post">
        <input id="username" name="username" class="captcha" type="text" placeholder="请输入您的账号" required pattern="[a-zA-Z0-9]{4,15}" />
        <input id="password" name="password" class="password" type="password" placeholder="请输入您的登录密码"   required  pattern="[a-zA-Z0-9]{6,20}">
        <button class="btn" type="button">登录</button>
    </form>
    <div class="ext">
        <a class="signup" href="signup.html">没有账号?立即注册</a>
        <a class="backpass" href="backpass.html">忘记密码?</a>
    </div>
</div>
<div class="footer">
    <p>©1996-2018 Secretly论坛 Corporation, All Rights Reserved</p>
</div>

</body>
</html>
