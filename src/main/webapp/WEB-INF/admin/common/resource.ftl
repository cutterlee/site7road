<link rel="stylesheet" id="themeCss" type="text/css" href="${req.contextPath}/static/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${req.contextPath}/static/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${req.contextPath}/static/js/easyui/themes/color.css">
<link rel="stylesheet" id="themeCss" type="text/css" href="${req.contextPath}/static/css/common.css?v=<#if version??>${version}</#if>">
<#--设置站点的图标-->
<link rel="shortcut icon" href="${req.contextPath}/static/img/favicon.ico" />
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/sys/validate.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/jquery.cookie.js"></script>

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
</script>
