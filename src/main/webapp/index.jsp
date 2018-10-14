<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>

    <title>八九不离十</title>
    <script src="<%=basePath%>jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
</head>
<body>
<div id=whole>
    <div class="top">
        <div class="wrap">
            <div class="top-l left">欢迎光临Secretly论坛，<c:if test="${customer!=null }">${customer.name}&nbsp;<a href="<%=basePath%>customer/deletecus">退出</a></c:if>
<c:if test="${customer==null }">请
                <a href="<%=basePath%>customer/login1" class="top-login">登录</a> <a href="<%=basePath%>customer/signup">免费注册</a>
                </c:if></div>
            <ul class="top-m right">
                <li> <a href=""><i class="top-car left"></i>购物车</a> </li>
                <li class="line"></li>
                <li> <a href="">我的帖子</a> </li>
                <li class="line"></li>
                <li> <a href="">会员中心</a> </li>
                <li class="line"></li>
                <li> <a href=""><i class="">♥</i>我的关注</a> </li>
                <li class="line"></li>
                <li class="on"> <a href="" class="menu-btn">个人中心</a>
                    <ul class="topDown">
                        <li> <a href="">我的帖子</a> </li>
                        <li> <a href="">我要吐槽</a> </li>
                        <li> <a href="">在线客服</a> </li>
                        <li> <a href="">咨询JIMI</a> </li>
                        <li> <a href="">客服邮箱</a> </li>
                    </ul>
                </li>
                <li class="line"></li>
                <li> <a href="" >帮助中心</a> </li>
                <li class="line"></li>
                <li> <a href="">联系我们</a> </li>
            </ul>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="head"> <img src="img/logo.png"> </div>


    <div class="content_l">
        <nav class="nav">
            <header>分区导航</header>
            <ul>
                <li>
                    <dl>
                        <dt>浏览</dt>
                        <dd><a href="calendar.html" target= "iframe">日历</a></dd>
                        <dd><a href="guide.html" target= "iframe">指引</a></dd>
                        <dd><a href="rankings.html" target= "iframe">我排行榜</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>帖子</dt>
                        <dd><a href="#">我的回帖</a></dd>
                        <dd><a href="#">我的帖子</a></dd>
                        <dd><a href="#">回复我的</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>版块</dt>
                        <dd><a href="#">新手保护区</a></dd>
                        <dd><a href="#">新人须知</a></dd>
                        <dd><a href="#">体育</a></dd>
                        <dd><a href="#">游戏</a></dd>
                        <dd><a href="#">新闻</a></dd>
                        <dd><a href="#">互助</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>钱包</dt>
                        <dd><a href="#">余额</a></dd>
                        <dd><a href="#">自助充值</a></dd>
                        <dd><a href="#">自动服务及常见问题</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>我有疑问</dt>
                        <dd><a href="#">常见问题</a></dd>
                        <dd><a href="#">事务所</a></dd>
                        <dd><a href="#">如何汉化</a></dd>
                        <dd><a href="#">优质游戏汇众</a></dd>
                        <dd><a href="#">优质汉化汇众</a></dd>
                        <dd><a href="#">新手提问快速通道</a></dd>
                        <dd><a href="#">两部验证设置教程</a></dd>
                    </dl>
                </li>
            </ul>
        </nav>
    </div>
    <div class="content_r"><iframe name="iframe" src="index_ubpage.html" height="1000px" width="995px"  frameborder="no"></iframe></div>
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
</script>
</html>
