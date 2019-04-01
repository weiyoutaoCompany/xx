<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>

    <title>八九不离十</title>
    <script src="<%=basePath%>/plugins/jquery.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
</head>
<body>
<div id=whole>
    <div class="top">
        <div class="wrap">
            <!--<img style="width: 25px;" class="img-circle" src="" />  头像圆角需要引入boost-->
            <div class="top-l left">欢迎光临Secretly论坛，<c:if test="${customer!=null }">${customer.name}&nbsp;&nbsp;<a href="<%=basePath%>customer/deletecus">退出</a></c:if>
<c:if test="${customer==null }">请
                <a href="<%=basePath%>customer/login1" class="top-login">登录</a> <a href="<%=basePath%>customer/signup">免费注册</a>
                </c:if></div>
            <ul class="top-m right">

<%--                <c:if test="${customer!=null }">--%>
<%--                <li> <a href="">我的帖子</a> </li>--%>


<%--                </c:if>--%>


                <li class="line"></li>
                <li class="on"> <a href="<%=basePath%>customer/myset" class="menu-btn">个人中心</a>
                    <ul class="topDown">
                        <li> <a href="<%=basePath%>send/mypost?id=${customer.id}" class="click">我的帖子</a> </li>
                        <li> <a href="">我要吐槽</a> </li>
                        <li> <a href="">在线客服</a> </li>
                        <li> <a href="">咨询JIMI</a> </li>
                        <li> <a href="">客服邮箱</a> </li>
                    </ul>
                </li>
                <li class="line"></li>

            </ul>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="head"> <img src="<%=basePath%>img/logo.png"> </div>


    <div class="content_l">
        <nav class="nav">
            <header><a href="<%=basePath%>customer/index">首页</a></header>
            <ul>
                <li>
                    <dl>
                        <dt>浏览</dt>
                        <dd><a href="<%=basePath%>calendar" class="click">日历</a></dd>
                        <dd><a href="<%=basePath%>guide" class="click">指引</a></dd>

                    </dl>
                </li>
                <c:if test="${customer!=null }">
                <li>
                    <dl>
                        <dt>帖子</dt>
                        <dd><a href="<%=basePath%>send/mypostnew" class="click">发布新帖</a></dd>
                        <dd><a href="<%=basePath%>send/mypost?id=${customer.id}" class="click">我的帖子</a></dd>
                    </dl>
                </li>
                </c:if>
                <li>
                    <dl>
                        <dt>版块</dt>

                        <dd><a href="<%=basePath%>send/bankuai?id=1" class="click">体育</a></dd>

                        <dd><a href="<%=basePath%>send/bankuai?id=2" class="click">游戏</a></dd>
                        <dd><a href="<%=basePath%>send/bankuai?id=3" class="click">新闻</a></dd>
                        <dd><a href="<%=basePath%>send/bankuai?id=4" class="click">互助</a></dd>
                    </dl>
                </li>

                <li>
                    <dl>
                        <dt>我有疑问</dt>
                        <dd><a href="<%=basePath%>/help" class="click">常见问题</a></dd>


                    </dl>
                </li>
            </ul>
        </nav>
    </div>
    <div class="content_r"><iframe id="my_iframe" name="iframe" src="<%=basePath%>send/index"  width="100%" height="100%"  frameborder="0" scrolling="no"></iframe></div>
    <div class="bottom"> Copyright ©1996-2018 Secretly论坛 Corporation, All Rights Reserved</br>
        桂公网安备 00000000000000号 中国互联网举报中心    互联网违法与不良信息举报中心</br>
        桂ICP备0000000号 互联网新闻信息服务许可证：000000000   违法及不良信息举报电话：000-00000000</br>
        <a href="">联系我们</a>｜ <a href="">关于我们</a>｜ <a href="">版权声明</a>｜ <a href="">刊登广告</a>｜ <a href="">联系微博</a>｜ <a href="">加入我们</a>｜ <a href="">举报链接</a>｜ <a href="">举报制度规范</a> </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function(e) {
        $(".top .on").hover(function() {
            $(".topDown").show("slow");
        }, function() {
            $(".topDown").hide("fast");
        });
        $(".nav dt").toggle(function() {
            $(this).siblings().slideDown("slow");
        }, function() {
            $(this).siblings().slideUp("fast");
        });
    });

    $(document).ready(function(e) {


        $(".nav dt").toggle(
            function(){
                $(this).siblings().slideDown("slow");
            },
            function(){
                $(this).siblings().slideUp("fast");
            }
        )
    });
    $(".click").click(function(){
        var url=$(this).attr("href");//获取地址
        $("#my_iframe").attr("src",url);
        return false;

    });

</script>
</html>
