<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30
  Time: 1:27
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
    <title>发表帖子</title>
    <link rel="stylesheet" href="<%=basePath%>css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/global.css">
    <!--导入bootstrap插件-->
    <link rel="stylesheet" href="<%=basePath%>plugins/bootstrap/css/bootstrap.css">
    <script src="<%=basePath%>plugins/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugins/bootstrap/js/bootstrap.js"></script>
    <script src="<%=basePath%>/plugins/layui/layui.js"></script>
    <!-- 导入kindEditor所需插件 -->
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/kindeditor.js"></script>
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css" />
    <script>
        $(function () {
            $("button[name='sub']").click(function() {

                var $myForm = $("#myForm");//获取指定a标签的jquery对象
                $.post("<%=basePath%>send/addSend",
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
<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <!--<div class="fly-none">没有权限</div>-->
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">发表新帖<!-- 编辑帖子 --></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<form class="form-horizontal modal-open"  method="post" id="myForm" >
    <input type="hidden" name="sendState.id" value="2"/>
    <input type="hidden" name="customer.id" value="${customer.id}"/>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">主题</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="theme" name="theme" value="">
        </div>
    </div>

<div class="form-group">
    <label for="name" class="col-sm-1 control-label">分区</label>
    <div class="col-sm-4">
        <select class="form-control"  name="sendType.id">

            <c:forEach var="type" items="${type }">

                <option value="${type.id }">${type.name }</option>

            </c:forEach>
        </select>
    </div>
</div>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">内容</label>
        <div class="col-sm-4">
            <textarea id="content" name="content"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label"></label>
        <div class="col-sm-4">
            <button class="layui-btn" lay-filter="*" type="button" name="sub">发布</button>
        </div>
    </div>



</form>
</body>
</html>
