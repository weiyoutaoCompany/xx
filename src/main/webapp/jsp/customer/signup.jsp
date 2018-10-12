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
    <!--导入自定义样式文件-->
    <link rel="stylesheet" href="<%=basePath%>css/layout.css">
    <script language="JavaScript" src="<%=basePath%>jquery.js"></script>
    <script>
        $(function () {
            var a=false;
            var b=false;
            var c=false;
            //账号
            $("#c_username").blur(function(){
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
            //第一次密码
            $("#c_password").blur(function(){
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
            //核对密码
            $("#c_nickName").blur(function(){
                var passw=$(this).val();
                //获取密码
                var pass=$("#c_password").val();
                var reg=/^[a-zA-Z0-9]{6,20}$/;/*字母开,头长度为6-20位英文或数字组成*/

                if(pass!=passw){
                    $("#c_nickNameError").html("两次密码不一致");
                    c=false;
                    return false;
                }
                $("#c_nickNameError").html("");
                    c=true;
                return true;


            })

                $(".btn").click(function () {
                    if (a!=false&&b!=false&&c!=false){
                    //使用ajax执行登录操作
                    //第一个参数指要访问的服务端地址；
                    //第二个参数，指要传递的表单的数据，$("#myForm").serialize()
                    //第三个参数，function(data)用于接收服务端返回来的值，data
                    $.post("<%=basePath%>customer/add",
                        $("#customerReset").serialize(),
                        function (data) {
                            //根据服务端返回来的值，判断登录是否成功
                            if (data.status == 1) {
                                alert("注册成功");
                                $("#cuswin").html("欢迎你注册论坛，请登录!");
                                location.href = "<%=basePath%>customer/login1";
                            } else {
                                alert("注册失败!用户名已存在!");
                            }
                        });
                    }else {a=false;b=false;c=false;}

                })





        })

    </script>
</head>
<body class="signin">
<div class="container" style="top: 40%;">
    <a href="index.html"><img alt="" src="<%=basePath%>img/logozc.png"></a>

    <form id="customerReset" method="post" class="form">
        <ul>
            <li><input id="c_name" name="name" class="captcha" type="text" placeholder="请输入您的昵称"><br><i id="c_nameError"></i></li>
            <li><input id="c_username" name="username" class="captcha" type="text" placeholder="请输入您的账号"><br><i id="c_usernameError"></i></li>

            <li> <input id="c_password" name="password" class="password" type="password" placeholder="请输入您的登录密码"><br><i id="c_passwordError"></i></li>

            <li> <input id="c_nickName" name="password_2" class="password2" type="password" placeholder="请再次输入登陆密码"><br><i id="c_nickNameError"></i></li>
            <!--	 <li> <input id="c_telephone" name="c_telephone" class="phone" type="text" placeholder="请输入您的手机号码"><br><i id="c_telephoneError"></i></li>-->
            <!--<li> <input id="c_email" name="c_email" class="email" type="text" placeholder="请输入您的邮箱"><br><i id="c_emailError"></i></li>-->
            <!--	<li><input class="captcha" type="text" placeholder="请输入验证码"><button class="captcha-btn">发送验证码</button></li>-->

        </ul>

        <button id="customerReset_Button" class="btn" type="button">同意以上协议并注册</button>
    </form>
    <div class="ext">
        <a class="signup" href="signin.html">已有账号?立即登录</a>
    </div>
</div>
<div class="footer">
    <p>©1996-2018 Secretly论坛 Corporation, All Rights Reserved</p>


</div>
</body>
</html>
