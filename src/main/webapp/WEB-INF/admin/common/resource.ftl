<#--设置站点的图标-->
<link rel="shortcut icon" href="${req.contextPath}/static/img/favicon.ico" />
<#--加载easyui资源-->
<link rel="stylesheet" id="themeCss" type="text/css" href="${req.contextPath}/static/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${req.contextPath}/static/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${req.contextPath}/static/js/easyui/themes/color.css">
<link rel="stylesheet" id="themeCss" type="text/css" href="${req.contextPath}/static/css/common.css?v=<#if version??>${version}</#if>">
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/sys/validate.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/jquery.cookie.js"></script>
<#--加载bootstrap资源-->
<#--CDN-->
<#--<!-- 新 Bootstrap 核心 CSS 文件 -->
<#--<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">-->
<#--<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<#--<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">-->
<#--<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<#--<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>-->
<#--<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<#--<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>-->



<#--自定义所需的js资源-->
<#include "*/common/js.ftl"/>

<!-- 配置文件 -->
<script type="text/javascript" src="${req.contextPath}/static/js/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${req.contextPath}/static/js/ueditor/ueditor.all.js"></script>
<!-- 编辑器转换文件 -->
<script type="text/javascript" src="${req.contextPath}/static/js/ueditor/ueditor.parse.js"></script>
<!-- 编辑器的语言文件 -->
<script type="text/javascript" src="${req.contextPath}/static/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<!--加载上传的配置文件-->
<script type="text/javascript">
    window.UEDITOR_CONFIG.UEDITOR_HOME_URL="${req.contextPath}/static/js/ueditor/";
    window.UEDITOR_CONFIG.serverUrl = "${req.contextPath}/img/upload";
    //防止工具栏的事件冒泡
    $(this.container).click(function (e) {
        e.stopPropagation()
    });
</script>
