<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/17
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <script src="<%=basePath%>plugins/jquery.js"></script>
    <link rel="stylesheet" href="<%=basePath%>plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=basePath%>css/index_subpage.css" />

</head>
<body>
<div class="content">
    <div class="content_top">
        <div class="button_one">
            <a href="<%=basePath%>customer/index" target="view_window">首页</a>
        </div>
        <div class="button_two">
            <a href="#"><img src="<%=basePath%>img/ope_wj.png" />&nbsp&nbsp所有分类</a>
        </div>
    </div>
    <div class="content_l">

        <div class="navigation_bar1">≡最新消息</div>

        <table style="table-layout:fixed" class="table_z1 table">
            <c:forEach var="send" items="${requestScope.send}">
            <tr>
                <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" width="50%">
                    <dt>
                    <dd><input type="button" class="button_a" value="${send.getSendType().getName()}"/><a href="<%=basePath%>send/sendpost?id=${send.id}" target="_blank" class="yx">${send.theme}</a></dd>
                    <dd>${send.content}</dd>
                    </dt>
                </td>
                <td width="10%">
                    <dt>
                    <dd>1&nbsp回复</dd>
                    <dd>0&nbsp查看</dd>
                    </dt>
                </td>
                <td width="10%">
                    <img src="${send.getCustomer().getImages()}" class="img_a">
                </td>
                <td>
                    <dt>
                    <dd>${send.getCustomer().getName()}</dd>
                    <dd><fmt:formatDate value="${send.time}" pattern="yyyy年MM月dd日 HH:mm"/></dd>
                    </dt>
                </td>
            </tr>
            </c:forEach>


        </table>


        <h2 style="color: #999;">板块</h2>


        <div class="navigation_bar2">
            <a href="#" class="float-left">联盟社区</a>
            <a href="#" class="float-right">》</a>
        </div>
        <table class="table_z1 table ">
            <c:forEach var="t" items="${requestScope.type}">
            <tr>
                <td width="10%">
                    <dt>
                    <dd><img src="<%=basePath%>img/20150419H1958_NsFLd.jpeg" class="img_b"></dd>
                    </dt>
                </td>
                <td width="30%">
                    <dt>
                    <dd><h6>${t.name}</h6></dd>
                    <dd>${t.content}</dd>
                    </dt>
                </td>
                <td width="24%">
                    <dt>
                    <dd><h5>111，111，110</h5></dd>
                    <dd class="float-right">个帖子</dd>
                    </dt>
                </td>
                <td width="10%">
                    <img src="<%=basePath%>img/u=4222409178,1939118407&fm=26&gp=0.jpg" class="img_a">
                </td>
                <td>
                    <dt>
                    <dd>asd123</dd>
                    <dd>5分钟前</dd>
                    </dt>
                </td>
            </tr>
            </c:forEach>

        </table>
    </div>


    <div class="content_r">
        <img src="<%=basePath%>img/index_ubpage_logo.jpg">
        <div class="content_r_div1">★当前热门</div>
        <div class="content_r_div2">
            <table class="table table_z2">
                <tr>
                    <td>
                        <dt>
                        <dd><img src="<%=basePath%>img/1da679b59a.jpg" class="img_a"></dd>
                        </dt>
                    </td>
                    <td>
                        <dt>
                        <dd >版主招募签到，祝大家每天开心【2018.10.15】</dd>
                        </dt>
                    </td>
                </tr>

                <tr>
                    <td>
                        <dt>
                        <dd><img src="<%=basePath%>img/1da679b59a.jpg" class="img_a"></dd>
                        </dt>
                    </td>
                    <td>
                        <dt>
                        <dd >版主招募签到，祝大家每天开心【2018.10.15】</dd>
                        </dt>
                    </td>
                </tr>
            </table>
        </div>

        <div class="content_r_div3">
            <div class="content_r_div1">×优质测评</div>
            <table class="table table_z2">
                <tr>
                    <td>
                        <dt>
                        <dd><img src="<%=basePath%>img/1da679b59a.jpg" class="img_a"></dd>
                        </dt>
                    </td>
                    <td>
                        <dt>
                        <dd >【檔案失效】麻将~琳达的堕落大冒险v0.5【BYE2♂娘完整汉化RPG\MV\欧美\1G】就是不差钱 · 发布于 八月 12  首先这评分是给汉化的，现在欧美游戏机翻遍地，能有一篇稍微润色过的汉化已经很不错了</dd>
                        </dt>
                    </td>
                </tr>

                <tr>
                    <td>
                        <dt>
                        <dd><img src="<%=basePath%>img/1da679b59a.jpg" class="img_a"></dd>
                        </dt>
                    </td>
                    <td>
                        <dt>
                        <dd >【檔案失效】麻将~琳达的堕落大冒险v0.5【BYE2♂娘完整汉化RPG\MV\欧美\1G】就是不差钱 ·</dd>
                        </dt>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
