<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30
  Time: 2:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>帖子展开</title>
    <script src="<%=basePath%>plugins/jquery.js"></script>
    <!-- 导入kindEditor所需插件 -->
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/kindeditor.js"></script>
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css" />
    <link rel="stylesheet" href="<%=basePath%>css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/global.css">
    <link rel="stylesheet" href="<%=basePath%>css/postbar.css">


    <script>
        $(function () {
            $("button[name='sub']").click(function() {

                var $myForm = $("#myForm");//获取指定a标签的jquery对象
                $.post("<%=basePath%>send/add",
                    $("#myForm").serialize(),
                    function(data) {
                        //jquery自带的json转换方法
                        if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换成JS对象
                            data = $.parseJSON(data);
                        }
                        alert(data.myMessage);
                        if(data.status == 1) {
                            location.reload();
                        }
                    }
                );

            });


        });

        //实现kindeditor弹出图片上传窗口
        KindEditor.ready(function(K) {
            editor2 = K.create('#content', { //文本编辑器
                width: '730px', //文本编辑器宽度
                height: '600px',
                //指定上传文件的服务器端程序。
                //从cookie中读取jsessionid',因为用Kindeditor上传多文件时会丢失SESSION（BUG），因此上传多文件时必须加上
                uploadJson: '<%=basePath%>plugins/kindeditor-4.1.10/jsp/upload_json.jsp;jsessionid=' + '${cookie.JSESSIONID.value}',
                //指定浏览远程图片的服务器端程序
                fileManagerJson: '<%=basePath%>plugins/kindeditor-4.1.10/jsp/file_manager_json.jsp;jsessionid=' + '${cookie.JSESSIONID.value}',
                newlineTag: 'p', //设置回车换行标签，可设置p、br。
                allowFileManager: true, //是否显示服务器文件夹中文件
                fillDescAfterUploadImage: true, //个人建议只在文本编辑器中使用true，true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框。
                allowFileUpload: true, //是否显示文件上传按钮，否则只能用网络地址;
                allowMediaUpload: true, //是否显示音频视频上传按钮，否则只能用网络地址;
                allowFlashUpload: true, //是否显示FLASH上传按钮，否则只能用网络地址;
                cssPath: '<%=basePath%>plugin/editor/kindeditor-4.1.10/plugins/code/prettify.css', //缺省这个参数，编辑器中插入代码跟普通文字一样，并且再次编辑的时候被隐藏了，所以这一步很关键。
                afterChange: function() { //编辑器内容发生变化后执行的回调函数，这里用来统计字数
                    K('#ljy_article_content_prompt').html("纯文本：" + this.count('text') + "个字符\t；总共（含HTML）：" + this.count() + "个字符");
                },
                afterBlur: function() { this.sync(); } //加入此方法才能将文本编辑器里的数据通过表单传送出去
            });
            var editor = K.editor({ //图片上传
                //指定上传文件的服务器端程序。
                uploadJson: '<%=basePath%>plugins/kindeditor-4.1.10/jsp/upload_json.jsp',
                //指定浏览远程图片的服务器端程序
                fileManagerJson: '<%=basePath%>plugins/kindeditor-4.1.10/jsp/file_manager_json.jsp',
                allowFileManager: true
            });
            K('#image1').click(function() {
                editor.loadPlugin('image', function() { //动态加载插件，image为插件名
                    editor.plugin.imageDialog({
                        showLocal: true, //是否显示本地图片上传窗口
                        showRemote: true, //是否显示网络图片窗口
                        fillDescAfterUploadImage: false, //个人建议只在文本编辑器中使用true，true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框。
                        imageUrl: K('#url1').val(),
                        clickFn: function(url, title, width, height, border, align) {
                            K('#url1').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });

        });


    </script>
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

                <c:if test="${customer!=null }">
                    <li> <a href="">我的帖子</a> </li>


                </c:if>


                <li class="line"></li>
                <li class="on"> <a href="<%=basePath%>customer/myset" class="menu-btn">个人中心</a>
                    <ul class="topDown">
                        <li> <a href="">我的帖子</a> </li>
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



    <div class="layui-container">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md8 content detail">
                <div class="fly-panel detail-box">
                    <h1>${requestScope.sendpost.theme}</h1>
                    <br />
                    <div class="detail-about">
                        <a class="fly-avatar" href="../user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="贤心">
                        </a>
                        <div class="fly-detail-user">

                                <cite>${requestScope.sendpost.getCustomer().getName()}</cite>&nbsp;

                            <span><fmt:formatDate value="${requestScope.sendpost.time}" pattern="yyyy年MM月dd日 HH:mm"/></span>
                        </div>
                        <div class="detail-hits" id="LAY_jieAdmin" data-id="123">
                            <span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="add.html">编辑此贴</a></span>
                        </div>
                    </div>
                    <div class="detail-body photos">
                        <p>
                            ${requestScope.sendpost.content}
                        <p>
                            <img src="<%=basePath%>img/1531969199_618060.jpg" alt="Secretly论坛">
                        </p>
                    </div>
                </div>

                <div class="fly-panel detail-box" id="flyReply">
                    <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                        <legend>回帖</legend>
                    </fieldset>

                    <ul class="jieda" id="jieda">
                <c:forEach var="c" items="${requestScope.cus}">

                        <li data-id="111">
                            <a name="item-1111111111"></a>
                            <div class="detail-about detail-about-reply">
                                <a class="fly-avatar" href="">
                                    <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt=" ">
                                </a>
                                <div class="fly-detail-user">
                                    <a href="" class="fly-link">
                                        <cite>${c.getCustomer().getName()}</cite>
                                    </a>
                                </div>
                                <div class="detail-hits">
                                    <span>2017-11-30</span>
                                </div>
                            </div>
                            <div class="detail-body jieda-body photos">
                                <p>${c.reply}</p>
                            </div>
                            <div class="jieda-reply">

                                <span type="reply"><!--<i class="iconfont icon-svgmoban53"></i>回复</span>-->
                                <div class="jieda-admin">

                                    <c:if test="${customer!=null }">  <span type="del"><a name="dleHf" href="<%=basePath%>send/delete?id=${c.id}">删除</a></span></c:if>

                                </div>
                            </div>
                        </li>
                </c:forEach>
                        <!-- 无数据时 -->
                        <!-- <li class="fly-none">消灭零回复</li> -->
                    </ul>
                    <c:if test="${customer!=null }">
                    <div class="layui-form layui-form-pane" >
                        <form method="post" id="myForm">
                            <input type="hidden" name="customer.id" value="${customer.id}"/>
                            <input type="hidden" name="send.id" value="${sendpost.id}"/>
                            <div class="layui-form-item layui-form-text">
                                <a name="comment"></a>
                                <div class="layui-input-block">
                                    <textarea id="content" name="reply"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn" lay-filter="*" type="button" name="sub">提交回复</button>
                            </div>
                        </form>
                    </div></c:if>
                    <c:if test="${customer==null}">  <div class="layui-form layui-form-pane">登陆后，就能回复帖子！</div></c:if>
                </div>
            </div>


            <div class="layui-col-md4">
                <dl class="fly-panel fly-list-one">
                    <dt class="fly-panel-title">本周热议</dt>
                    <dd>
                        <a href="">只狼：影逝二度 （Sekiro：Shadows Die Twice）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>
                    <dd>
                        <a href="">全面战争：三国 （Total War: THREE KINGDOMS）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>
                    <dd>
                        <a href="">皇牌空战7：未知空域 （Ace Combat 7：Skies Unknown）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>
                    <dd>
                        <a href="">海岛大亨6 （Tropico 6）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>
                    <dd>
                        <a href="">王国之心3 （Kingdom Hearts III）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>
                    <dd>
                        <a href="">生化危机2：重制版 （Biohazard Re:2）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>
                    <dd>
                        <a href="">噬神者3 （God Eater 3）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>
                    <dd>
                        <a href="">暗黑血统3 （Darksiders 3）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>
                    <dd>
                        <a href="">古剑奇谭3 （GuJian3）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>
                    <dd>
                        <a href="">河洛群侠传 （He Luo Qun Xia Zhuan）</a>
                        <span><i class="iconfont icon-pinglun1"></i> 16</span>
                    </dd>

                    <!-- 无数据时 -->
                    <!--
                    <div class="fly-none">没有相关数据</div>
                    -->
                </dl>

                <div class="fly-panel">
                    <div class="fly-panel-title">
                        Secretly论坛
                    </div>
                    <div class="fly-panel-main">
                        <a href="<%=basePath%>" target="_blank" class="fly-zanzhu" time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;">官网首页</a>
                    </div>
                </div>

                <div class="fly-panel" style="padding: 20px 0; text-align: center;">
                    <img src="<%=basePath%>img/logozc.png" style="max-width: 100%;" alt="layui">
                    <p style="position: relative; color: #666;">微信扫码关注 Secretly论坛 公众号</p>
                </div>

            </div>
        </div>
    </div>

    <div class="fly-footer">
        <p><a href="http://fly.layui.com/" target="_blank">Secretly论坛</a> 2017 &copy; <a href="#">secretly.com 出品</a></p>
        <p>
            <a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
            <a href="http://www.layui.com/template/fly/" target="_blank">Secretly论坛</a>
            <a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
        </p>
    </div>

</body>
</html>
