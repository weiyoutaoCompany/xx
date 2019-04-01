<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/28
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>日历</title>
    <link rel="stylesheet" href="<%=basePath%>css/calendar.css">

    <script type="text/javascript">
        function getTime() {

            var dateObj = new Date();

            var year = dateObj.getFullYear(); //年
            var month = dateObj.getMonth() + 1; //月  (注意：月份+1)
            var date = dateObj.getDate(); //日
            var day = dateObj.getDay();
            var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
            var week = weeks[day]; //根据day值，获取星期数组中的星期数。
            var hours = dateObj.getHours(); //小时
            var minutes = dateObj.getMinutes(); //分钟
            var seconds = dateObj.getSeconds(); //秒

            if(month < 10) {
                month = "0" + month;
            }
            if(date < 10) {
                date = "0" + date;
            }
            if(hours < 10) {
                hours = "0" + hours;
            }
            if(minutes < 10) {
                minutes = "0" + minutes;
            }
            if(seconds < 10) {
                seconds = "0" + seconds;
            }

            var newDate = year + "年" + month + "月" + date + "日" + hours + ":" + minutes + ":" + seconds + "&nbsp &nbsp" + week;
            document.getElementById("date1").innerHTML =   newDate; //在div中写入时间
            setTimeout('getTime()', 500); //每隔500ms执行一次getTime()
        }
    </script>
</head>
<body onload="getTime()">
<div id="date1"></div>

<div id="calendar" class="calendar"></div>

<script src="<%=basePath%>jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>plugins/calendar.js"></script>

<div style="text-align:center;clear:both">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>
</body>
</html>
