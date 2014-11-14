<#include "resource.ftl">
<#import "/spring.ftl" as spring>
<head>
    <title>${systemName}---系统主页</title>
</head>
<style type="text/css">
    body{
        font:  1em "宋体"
    }
    a{
        color: #666666;
        text-decoration: none;
    }
    .link a:hover {
        height: 26px;
        line-height: 26px;
        display: block;
        padding-left: 10px;
        color: #5a6656;
        font: bold 1em "宋体"
        outline: none;
    }
    .block{
        border:1px solid rgba(56, 56, 56, 0.55);
        color: cornflowerblue;
    }
</style>
<body>
<div class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north'" style="height:63px;overflow: hidden;">
        <table width="100%">
            <tr>
                <td><img src="${req.contextPath}/static/img/headerLogo.jpg"></td>
                <td align="right" >
                    <select class="setTheme">
                        <option  value="default">default</option>
                        <option  value="bootstrap">bootstrap</option>
                        <option  value="gray">gray</option>
                        <option  value="black">black</option>
                        <option value="metro">metro</option>
                        <option value="cupertino">cupertino</option>
                        <option value="darkhive">darkhive</option>
                        <option value="peppergrinder">peppergrinder</option>
                        <option value="sunny">sunny</option>
                    </select>
                    <span class="realName"></span>你好,${userInfo.nickName} ,您是<span class="roleName">${roleInfo.roleName}</span>&nbsp;&nbsp;<span
                        class="logout c1">注销</span>
                </td>
            </tr>
        </table>
    </div>
<#--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>-->
    <div data-options="region:'west',split:true,collapsible:false" title="${systemName}" style="width:180px;">
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
                                        <div class="easyui-accordion" >
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
    <div class="easyui-tabs" id="handleArea" style="height:100%"
         data-options="region:'center',minHeight:500">
        <div title="系统说明" data-options="iconCls:'icon-help',closable:true">
            <p>
                重构公司官网
            <ul>
                <li>后台采用的技术是springMVC,Hibernate,freemarker</li>
                <li>权限控制采用的是shiro框架</li>
                <li>前端使用js库 easyui,富文本编辑器使用百度编辑器ueditor</li>
                <li>把公司官网,招聘站点,公众号站点的现有业务都转移过来</li>
                <li>弹出层的例子,请看用户管理</li>
                <li>ueditor的例子,请看职位信息</li>
                <li>treeGrid的例子,请看权限管理</li>
            </ul>
            </p>
            <p>
                快捷导航
                <span class="icon-man">&nbsp;&nbsp;&nbsp;</span>


            </p>
        </div>
    </div>
    <div data-options="region:'south',split:true" style="height:30px; text-align: center;line-height: 23px;">
        <span>Copyright &copy; &nbsp; 深圳###########科技有限公司 &nbsp;cutter.li </span>
    </div>
</div>
<script type="text/javascript" src="${req.contextPath}/static/js/sys/common.js"></script>
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
                    var titleName = $(this).attr("title");
                    var contentHref = $(this).attr("path");
                    var iconCls = $(this).attr("iconCls");
                    openTab(titleName, contentHref, iconCls,"${req.contextPath}");
                });
                $(".logout").bind("click",function(){
                   window.location.href="${req.contextPath}/logout";
                });
            }
    );

</script>
</body>