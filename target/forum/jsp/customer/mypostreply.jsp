<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30
  Time: 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>回复</title>
    <link rel="stylesheet" href="<%=basePath%>css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/global.css">
</head>
<body>

<div class="fly-panel detail-box" id="flyReply">
    <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
        <legend>帖子回复</legend>
    </fieldset>

    <ul class="jieda" id="jieda">
        <li data-id="111" class="jieda-daan">
            <a name="item-1111111111"></a>
            <div class="detail-about detail-about-reply">
                <a class="fly-avatar" href="">
                    <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt=" ">
                </a>
                <div class="fly-detail-user">
                    <a href="" class="fly-link">
                        <cite>贤心</cite>

                    </a>

                    <span>(楼主)</span>
                    <!--
                    <span style="color:#5FB878">(管理员)</span>
                    <span style="color:#FF9E3F">（社区之光）</span>
                    <span style="color:#999">（该号已被封）</span>
                    -->
                </div>

                <div class="detail-hits">
                    <span>2017-11-30</span>
                </div>


            </div>
            <div class="detail-body jieda-body photos">
                <p>香菇那个蓝瘦，这是一条被采纳的回帖</p>
            </div>
            <div class="jieda-reply">

                <span type="reply">
                <i class="iconfont icon-svgmoban53"></i>
                回复
              </span>
                <div class="jieda-admin">
                    <span type="edit">编辑</span>
                    <span type="del">删除</span>
                    <!-- <span class="jieda-accept" type="accept">采纳</span> -->
                </div>
            </div>
        </li>

        <li data-id="111">
            <a name="item-1111111111"></a>
            <div class="detail-about detail-about-reply">
                <a class="fly-avatar" href="">
                    <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt=" ">
                </a>
                <div class="fly-detail-user">
                    <a href="" class="fly-link">
                        <cite>贤心</cite>
                    </a>
                </div>
                <div class="detail-hits">
                    <span>2017-11-30</span>
                </div>
            </div>
            <div class="detail-body jieda-body photos">
                <p>蓝瘦那个香菇，这是一条没被采纳的回帖</p>
            </div>
            <div class="jieda-reply">

                <span type="reply">
                <i class="iconfont icon-svgmoban53"></i>
                回复
              </span>
                <div class="jieda-admin">
                    <span type="edit">编辑</span>
                    <span type="del">删除</span>

                </div>
            </div>
        </li>

        <!-- 无数据时 -->
        <!-- <li class="fly-none">消灭零回复</li> -->
    </ul>

    <div class="layui-form layui-form-pane">
        <form action="/jie/reply/" method="post">
            <div class="layui-form-item layui-form-text">
                <a name="comment"></a>
                <div class="layui-input-block">
                    <textarea id="L_content" name="content" required lay-verify="required" placeholder="请输入内容"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <input type="hidden" name="jid" value="123">
                <button class="layui-btn" lay-filter="*" lay-submit>提交回复</button>
            </div>
        </form>
    </div>
</div>
</div>



</body>
</html>
