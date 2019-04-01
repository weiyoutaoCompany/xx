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
    <link rel="stylesheet" href="<%=basePath%>css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/global.css">
    <link rel="stylesheet" href="<%=basePath%>css/postbar.css">
    <!-- 导入kindEditor所需插件 -->
    <link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css" />
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/kindeditor.js"></script>
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script src="<%=basePath%>plugins/layui/layui.js"></script>
    <script>
        $(function () {
            $("button[name='cus']").click(function() {

                var $myForm = $("#myForm");//获取指定a标签的jquery对象
                $.post("<%=basePath%>customer/editUpdate",
                    $("#myForm").serialize(),
                    function(data) {
                        //jquery自带的json转换方法
                        if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换
                            成JS对象
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
                        fillDescAfterUploadImage:false,//个人建议只在文本编辑器中使用true，true时图片上传成功后切换到图片
                        //编辑标签，false时插入图片后关闭弹出框。
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
<div id=whole>
    <div class="top">
        <div class="wrap">
            <!--<img style="width: 25px;" class="img-circle" src="" />  头像圆角需要引入boost-->
            <div class="top-l left">欢迎光临Secretly论坛，<c:if test="${customer!=null }">${customer.name}&nbsp;&nbsp;<a href="<%=basePath%>customer/deletecus">退出</a></c:if>
                <c:if test="${customer==null }">请
                    <a href="<%=basePath%>customer/login1" class="top-login">登录</a> <a href="<%=basePath%>customer/signup">免费注册</a>
                </c:if></div>
            <ul class="top-m right">
                <li> <a href=""><i class="top-car left"></i>购物车</a> </li>
                <c:if test="${customer!=null }"> <li class="line"></li>
                    <li> <a href="">我的帖子</a> </li></c:if>
                <li class="line"></li>
                <li> <a href="">会员中心</a> </li>
                <li class="line"></li>
                <li> <a href=""><i class="">♥</i>我的关注</a> </li>
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
                <li> <a href="" >帮助中心</a> </li>
                <li class="line"></li>
                <li> <a href="">联系我们</a> </li>
            </ul>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="head"> <img src="<%=basePath%>img/logo.png"> </div>

    <div class="layui-container fly-marginTop fly-user-main">
        <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
            <li class="layui-nav-item">
                <a href="index.html">
                    首页
                </a>
            </li>
            <li class="layui-nav-item layui-this">
                <a href="<%=basePath%>customer/myset">
                    基本设置
                </a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>customer/deletecus">
                    退出
                </a>
            </li>
        </ul>

        <div class="site-tree-mobile layui-hide">
            <i class="layui-icon">&#xe602;</i>
        </div>
        <div class="site-mobile-shade"></div>

        <div class="site-tree-mobile layui-hide">
            <i class="layui-icon">&#xe602;</i>
        </div>
        <div class="site-mobile-shade"></div>


        <div class="fly-panel fly-panel-user" pad20>
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title" id="LAY_mine">
                    <li class="layui-this" lay-id="info">我的资料</li>
                </ul>
                <form class="form-horizontal modal-open"  method="post" id="myForm" >

                    <input type="hidden" name="id" value="${customer.id}" />
                    <br>
                    <div class="layui-form-item">
                        <label class="layui-form-label">昵称</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" id="name" name="name" value="${customer.name}"/>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"  id="username" name="username"value="${customer.username}" readonly/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="password" class="layui-input" id="password" name="password"
                                   value="${customer.password}"/>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" id="images" name="images" placeholder="请上传头像头像"
                                   value="${customer.images}"  readonly="readonly"/>
                            <input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片"  />
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <div class="layui-input-block">
                            <button name="cus" type="button" class="btn layui-btn">修改</button>
                        </div>
                    </div>
                </form>
                    </div>

            </div>
        </div>
    </div>



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
