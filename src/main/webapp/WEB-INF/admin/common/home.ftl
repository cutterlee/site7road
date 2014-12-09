<#include "resource.ftl">
<#import "/spring.ftl" as spring>
<head>
    <title><@spring.message "system.name"/>---系统主页</title>
</head>
<body>
<div class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north'" style="height:63px;overflow: hidden;">
        <table width="100%">
            <tr>
                <td><img src="${req.contextPath}/static/img/headerLogo.jpg"></td>
                <td align="right" >选择切换主题:
                    <select class="setTheme">
                        <option  value="default">default</option>
                        <option  value="bootstrap">bootstrap</option>
                        <option  value="gray">gray</option>
                        <option  value="black">black</option>
                        <option value="metro">metro</option>
                        <option value="cupertino">cupertino</option>
                        <option value="peppergrinder">peppergrinder</option>
                        <option value="sunny">sunny</option>
                    </select>
                    <span class="realName"></span>你好,<sapn class="icon-man">&nbsp;&nbsp;&nbsp;&nbsp;</sapn><#if userInfo??>${userInfo.nickName}</#if> ,<span
                        class="logout c1">注销</span>
                </td>
            </tr>
        </table>
    </div>
    <div data-options="region:'west'"  id="navTree" title="${systemName}" style="width:180px;height: auto;">
        <#if menu=='tree'>
            <ul class="easyui-tree" data-options="url:'${req.contextPath}/authTree',method:'post',lines:'true',animate:'true'">
            <#if authList??>
                <#list  authList as item >
                <li>
                    <span class="menu " iconCls="${item.iconCls!'icon-man'}">${item.text}</span>
                    <#if item.children??>
                        <ul>
                            <#list item.children as subItem>
                                <li>
                                    <#if subItem.children??>
                                        <span class="menu ${item.iconCls!'icon-man'}">${subItem.text}</span>
                                        <ul>
                                            <#list subItem.children  as thirdItem>
                                                <li>
                                                    <a class="link"  iconCls="${thirdItem.iconCls!'icon-man'}"  path="${req.contextPath}${thirdItem.path}">${thirdItem.text}</a>
                                                </li>
                                            </#list>
                                        </ul>
                                    <#else >
                                        <a class="link"  iconCls="${subItem.iconCls!'icon-man'}"   path="${req.contextPath}${subItem.path}">${subItem.text}</a>
                                    </#if>
                                </li>
                            </#list>
                        </ul>
                    </#if>
                </li>
            </#list>
            </#if>
            </ul>
        <#else>

            <div class="easyui-accordion" data-options="border:true">
                <#if authList??>
                    <#list  authList as item >
                        <div title="${item.text}" iconCls="${item.iconCls!'icon-man'}" style="padding:10px;">
                            <#if item.children??>
                                <#list item.children as subItem>
                                    <#if subItem.children??>
                                        <div class="easyui-accordion" data-options="border:false" >
                                            <div title="${subItem.text}" iconCls="${subItem.iconCls!'icon-man'}" style="padding:10px;">
                                                <#list subItem.children as thirdItem>
                                                    <div style="line-height: 32px;" class="block">
                                                        <a path="${thirdItem.path!''}" iconCls="${thirdItem.iconCls!'icon-man'}"  title="${thirdItem.text}" class="link"><span class="${thirdItem.iconCls!'icon-man'}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${thirdItem.text}</a>
                                                    </div>
                                                </#list>
                                            </div>
                                        </div>
                                    <#else>
                                        <div style="line-height: 32px;" class="block">
                                            <a path="${subItem.path!''}" iconCls="${subItem.iconCls!'icon-man'}"  title="${subItem.text}" class="link"><span class="${subItem.iconCls!'icon-man'}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${subItem.text}</a>
                                        </div>
                                    </#if>

                                </#list>
                            </#if>
                        </div>
                    </#list>
                </#if>
            </div>

        </#if>
    </div>
    <div class="easyui-tabs" id="handleArea" style="height:auto;" data-options="region:'center'">
       <#include "index.ftl">
    </div>
    <div data-options="region:'south'" style="height:26px; text-align: center;line-height: 23px;">
        <span>Copyright &copy; &nbsp;<@spring.message "dev.info"/>  &nbsp; </span>
    </div>
</div>
<script type="text/javascript">
    $(function () {
                var THEME_COOKIE_NAME = "system_theme_name";
                if ($.cookie(THEME_COOKIE_NAME)) {
                    $("#themeCss").attr("href", "${req.contextPath}/static/js/easyui/themes/" + $.cookie(THEME_COOKIE_NAME) + "/easyui.css");
                    $(".setTheme").val($.cookie(THEME_COOKIE_NAME));
                }

                $(".setTheme").bind("change", function () {
                    var themeName = $(this).val();
                    $("#themeCss").attr("href", "${req.contextPath}/static/js/easyui/themes/" + themeName + "/easyui.css");
                    //把选择写入cookie
                    $.cookie(THEME_COOKIE_NAME, themeName, { path: '/', expires: 7 });
                });

                $(".link").bind("click", function () {
                    $("a").removeClass("click");
                    $(this).addClass("click");
                    var titleName = $(this).attr("title");
                    var contentHref = $(this).attr("path");
                    var iconCls = $(this).attr("iconCls");
                    SITE_7ROAD.openTab(titleName, contentHref, iconCls,"${req.contextPath}");
                });
                $(".logout").bind("click",function(){
                   window.location.href="${req.contextPath}/logout";
                });
            }
    );

</script>
</body>