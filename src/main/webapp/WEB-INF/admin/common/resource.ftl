<link rel="stylesheet" id="themeCss" type="text/css" href="${req.contextPath}/static/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${req.contextPath}/static/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${req.contextPath}/static/js/easyui/themes/color.css">
<link rel="stylesheet" id="themeCss" type="text/css" href="${req.contextPath}/static/css/common.css?v=<#if version??>${version}</#if>">
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/jquery.cookie.js"></script>

<#--ueditor的配置文件-->
<!-- 配置文件 -->
<script type="text/javascript" src="${req.contextPath}/static/js/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${req.contextPath}/static/js/ueditor/ueditor.all.js"></script>
<!-- 编辑器的语言文件 -->
<script type="text/javascript" src="${req.contextPath}/static/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');
</script>
