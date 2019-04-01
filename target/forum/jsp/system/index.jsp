<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/14
  Time: 23:39
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
    <title>Secretly后台管理系统</title>
    <link rel="stylesheet" href="<%=basePath%>plugins/layui/css/layui.css">

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">Secretly系统后台管理界面</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="">首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="">账号管理</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">板块帖子</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="">体育</a>
                    </dd>
                    <dd>
                        <a href="">游戏</a>
                    </dd>
                    <dd>
                        <a href="">新闻</a>
                    </dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img"> <c:if test="${admin!=null }">${admin.username}</c:if>
                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="">基本资料</a>
                    </dd>
                    <dd>
                        <a href="">修改密码</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>system/exit">注销</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">管理员</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="<%=basePath%>system/signup">添加管理员账号</a>
                        </dd>
                        <dd>
                            <a href="<%=basePath%>system/list">管理员账号列表</a>
                        </dd>
                 </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="<%=basePath%>systemcus/signup">添加用户</a>
                        </dd>
                        <dd>
                            <a href="<%=basePath%>systemcus/list">用户账号列表</a>
                        </dd>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">帖子管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="<%=basePath%>systemsend/list">帖子审核</a>
                        </dd>
                        <dd>
                            <a href="<%=basePath%>systemsend/list2">帖子管理</a>
                        </dd>
                </li>

                <li class="layui-nav-item">
                    <a href="">购物车</a>
                </li>
                <li class="layui-nav-item">
                    <a href="">订单</a>
                </li>
            </ul>
        </div>
    </div>

    <div id="main_div" class="layui-body">
        <!-- 内容主体区域 -->
            <iframe id="main_zt" src="" height="100%" width="100%" scrolling="no" marginheight="0px" marginwidth="0px" frameborder="0"></iframe>
        </div>

            <div class="layui-footer">
                <!-- 底部固定区域 -->
                © 八九不离十团队- 版权所有
            </div>
        </div>
        <script src="<%=basePath%>plugins/layui/layui.js"></script>
        <script src="<%=basePath%>jquery-1.8.3.min.js"></script>
        <script>
            //JavaScript代码区域
            layui.use('element', function() {
                var element = layui.element;
            });
            //点击左边内容切换右边页面，两者完全不相关
            $(".layui-nav-child a").click(function(){
                var url=$(this).attr("href");

                $("#main_zt").attr("src",url);
                return false;//不让链接事件自动生效
            });
        </script>
</body>
</html>
