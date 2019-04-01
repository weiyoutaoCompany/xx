<%--
  Created by IntelliJ IDEA.
  User: ljyadbefgh
  Date: 2018/9/6
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>编辑管理账户</title>
    <!--导入bootstrap插件-->
    <link rel="stylesheet" href="<%=basePath%>plugins/bootstrap/css/bootstrap.css">
    <script src="<%=basePath%>plugins/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugins/bootstrap/js/bootstrap.js"></script>
    <!-- 导入kindEditor所需插件 -->
    <link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css" />
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/kindeditor.js"></script>
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <!--导入自定义样式文件-->
    <link rel="stylesheet" href="<%=basePath%>css/mycss.css">

    <script type="text/javascript">
        $(document).ready(function() {
            $("button[name='addCustomer']").click(function() {
                var $myForm = $("#myForm");//获取指定a标签的jquery对象
                $.post("<%=basePath%>systemcus/editUpdate",
                    $myForm.serialize(),
                    function(data) {
                        //jquery自带的json转换方法
                        if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换成JS对象

                            data = $.parseJSON(data);

                        }
                        alert(data.myMessage);
                    }
                );
            });
        });

        //实现kindeditor弹出图片上传窗口
        KindEditor.ready(function(K) {
            var editor = K.editor({//图片上传
                //指定上传文件的服务器端程序。
                uploadJson:  '<%=basePath%>plugins/kindeditor-4.1.10/jsp/upload_json.jsp',
                //指定浏览远程图片的服务器端程序
                fileManagerJson: '<%=basePath%>plugins/kindeditor-4.1.10/jsp/file_manager_json.jsp',
                allowFileManager : true
            });
            K('#image1').click(function() {
                editor.loadPlugin('image', function() {//动态加载插件，image为插件名
                    editor.plugin.imageDialog({
                        showLocal : true,//是否显示本地图片上传窗口
                        showRemote : true,//是否显示网络图片窗口
                        fillDescAfterUploadImage:false,//个人建议只在文本编辑器中使用true，true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框。
                        imageUrl : K('#images').val(),
                        clickFn : function(url, title, width, height, border, align) {
                            K('#images').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
        });
    </script>

</head>
<body>
<form class="form-horizontal modal-open"  method="post" id="myForm">
    <input type="hidden" name="id" value="${requestScope.customer.id}">
    <h1 style="margin: 20px; auto auto 50px; ">修改用户信息</h1>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">昵称</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="name" name="name" value="${requestScope.customer.name}">
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">账号</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="username" name="username" value="${requestScope.customer.username}" disabled="disabled">
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">密码</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="password" name="password" value="${requestScope.customer.password}">
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">头像</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="images" name="images" placeholder="请上传头像头像" value="${requestScope.customer.images}"  readonly="readonly"/>
            <input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片"  />
        </div>
    </div>

    <div class="form-group">
        <label for="name" class="col-sm-1 control-label"></label>
        <div class="col-sm-4">
            <button name="addCustomer" type="button" class="btn btn-default">修改</button>
            <a class="btn btn-info" href="<%=basePath %>systemcus/list">返回账户管理页面</a>
        </div>
    </div>

</form>

</form>
</body>
</html>
