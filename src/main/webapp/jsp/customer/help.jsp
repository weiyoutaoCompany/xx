<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/28
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>帮助中心</title>
    <link rel="stylesheet" href="<%=basePath%>plugins//layui/css/layui.css" media="all">
    <script src="<%=basePath%>plugins/layui/layui.js"></script>
    <script src="<%=basePath%>jquery-1.8.3.min.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <center>
        <h1>帮助中心</h1></center>
</fieldset>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>常见问题</legend>
</fieldset>
<div class="layui-collapse" lay-filter="test">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">如何成为本站会员？</h2>
        <div class="layui-colla-content">
            <p>打开浏览器搜索暗地里的小秘密，进入论坛，在左上角点击注册，进入注册页面按照提示填写信息后点击提交便可注册成功了。</p>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">如何实名认证？</h2>
        <div class="layui-colla-content">
            <p>1、提供联系电话和详细的居住地址。 2、请手持身份证拍照（要求露出脸部） 确保证件上字体清晰； 3、提供身份证清晰地正反面照片，确保证件上字体清晰。

            </p>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">我的密码忘记了该如何找回？</h2>
        <div class="layui-colla-content">
            <p>如果您的密码忘记了，可以点击登陆框旁边的[忘记密码？]按钮。 第一步：输入资料（用户名/手机/邮箱）选择其中一个填写 第二步：输入手机号码，获取验证码（放心输入你的手机号码，不会泄露出去） 第三步：重置密码 第四步：完成/立即登陆暗地小秘密论坛网站。
            </p>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">我为何被禁言了？</h2>
        <div class="layui-colla-content">
            <p>严重违反交流规章的处罚，如需知详细处罚缘由，请查看自己的系统消息。</p>
        </div>
    </div>

    <div class="layui-colla-item">
        <h2 class="layui-colla-title">我的注册信息是安全的吗？</h2>
        <div class="layui-colla-content">
            <p>当然，网站对所有注册会员的信息都是严格保密的，除了网站工作人员外任何人都不会看到您的注册信息。</p>
        </div>
    </div>
</div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>论坛问题</legend>
</fieldset>
<div class="layui-collapse" lay-filter="test">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">我必须要注册吗？</h2>
        <div class="layui-colla-content">
            <p>如果不登录论坛，仅有浏览权限，不能发表主题和回复帖子</p>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">论坛如何使用个性化昵称？</h2>
        <div class="layui-colla-content">
            <p>论坛昵称同游戏昵称一致，不可以单独修改。</p>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">如何在论坛发表新主题？</h2>
        <div class="layui-colla-content">
            <p>在论坛各版块中，点“发帖”即可进入功能齐全的发帖界面。 注：必须选择话题分类才能发表主题帖。
            </p>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">论坛帖子如何发表回复？</h2>
        <div class="layui-colla-content">
            <p>回复有分三种： 第一、贴子最下方的发表回复； 第二、在您想回复的楼层点击右下方“回复”； 第三、完整回复页面，可在发表回复的上方点击“高级模式。

            </p>
        </div>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>安全中心问题</legend>
    </fieldset>
    <div class="layui-collapse" lay-filter="test">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">禁止私下交易</h2>
            <div class="layui-colla-content">
                <p>1、禁止任何利用人民币私自在游戏中买卖虚拟物品（游戏币及游戏道具）的交易行为，一经发现和查实，将对参与交易的双方的游戏帐号进行封停，虚拟物品进行扣除。<br /> 2、禁止在游戏中进行上述违规交易的广告宣传行为（包括通过各种信息的发送），一经发现和查实，将对违规游戏帐号进行封停处理。

                    <br /> 3、参与上述违规交易的玩家，如因此造成任何损失，运营团队概不负责。

                    <br /> 4、私下交易得不到任何官方的保护，而且其中多是欺骗和陷阱。我们再次提醒广大玩家务必提高自我保护和账号安全意识，不要使用过于简单的密码；及时申请相关密保服务；定期使用杀毒软件对电脑/手机进行扫描清除病毒；在公共场所上网要注意周围环境及账号安全；不要在游戏中轻信他人言语，泄露账号信息。

                    <br /> 5、最终解释权归运营团队所有。

                </p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">手机密保收不到验证码？</h2>
            <div class="layui-colla-content">
                <p>如遇到密保手机无法接收验证码的情况，请按以下方式尝试： ①请确认手机是否欠费 ②是否短信被拦截 ③重启手机尝试 ④拔插sim卡 如果还不行就把sim卡换到其他手机上接收 如果依然不行，可联系客服。
                </p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">如何设置二级密码？</h2>
            <div class="layui-colla-content">
                <p>可以在官网设置或修改二级密码 也可以在客户端自行设置或修改： PC端：头像—账户安全—二级密码 手机端：头像栏—设置—账户管理—密码管理—修改二级密码 二级密码可用于物品合成等操作
                </p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">身份证号码是否可以修改？</h2>
            <div class="layui-colla-content">
                <p>注册成功后，实名认证操作无法撤销及修改，请确认无误后再提交。</p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">账号申诉的审核期是多久？</h2>
            <div class="layui-colla-content">
                <p>找回用户名、找回密码、解绑手机申诉：1小时内处理。 物品申诉：提交后专员会在3小时内处理(特殊情况延长至48小时内处理）。

                </p>
            </div>
        </div>
    </div>

    <script src="../res/layui/layui.js" charset="utf-8"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
    <script>
        layui.use(['element', 'layer'], function() {
            var element = layui.element;
            var layer = layui.layer;

            //监听折叠

        });
    </script>

</body>
</html>
