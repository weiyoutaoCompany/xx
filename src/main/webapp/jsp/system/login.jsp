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

</head>
<body class="signin">
<div class="container">
    <img alt="" src="<%=basePath%>img/logozc.png">

    <form id="form" class="form" method="post">
        <input id="username" name="username" class="captcha" type="text" placeholder="请输入您的账号" /><br><i id="c_usernameError"></i></li>
        <input id="password" name="password" class="password" type="password" placeholder="请输入您的登录密码"/><br><i id="c_passwordError"></i></li>
        <button  class="btn" type="button" >登录</button>
    </form>

</div>
<div class="footer">
    <p>(c) 版权所有 2017 橙汁 技术支持：橙汁软件</p>
</div>

<script>

    $(document).ready(function(e) {
        var a=false;
        var b=false;
        //账号
        $("#username").blur(function(){
            var cname=$(this).val();
            var reg=/^[a-zA-Z0-9]{4,15}$/;/*字母开头，长度为4-15位数!*/

            if(reg.test(cname)==false){
                $("#c_usernameError").html("用户名为字母开头，长度为4-15位数!");
                a=false;
                return false;
            }
            $("#c_usernameError").html("");
            a=true;
            return true;
        })
        //密码
        $("#password").blur(function(){
            var pass=$(this).val();
            var reg=/^[a-zA-Z0-9]{6,20}$/;/*字母开头，长度为6-15位英文或数字组成*/

            if(reg.test(pass)==false){
                $("#c_passwordError").html("密码长度为6-20位英文或数字组成");
                b=false;
                return false;
            }
            $("#c_passwordError").html("");
            b=true;
            return true;
        })

        $(".btn").click(function(){
            if (a!=false&&b!=false){

                //使用ajax执行登录操作
                //第一个参数指要访问的服务端地址；
                //第二个参数，指要传递的表单的数据，$("#myForm").serialize()
                //第三个参数，function(data)用于接收服务端返回来的值，data
                $.post("<%=basePath%>system/login",
                    $("#form").serialize(),
                    function(data) {
                        //根据服务端返回来的值，判断登录是否成功
                        if(data.status==1){
                            alert("登录成功");
                            //$("#cuswin").html("欢迎你登录!");
                            location.href="<%=basePath%>system/index";

                        }else{
                            alert("登录失败");
                            return false;
                        }
                    });
            }else {a=false;b=false;}
        })

    });
</script>
</html>
