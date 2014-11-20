<#import "/spring.ftl" as spring>
<div title="系统说明" data-options="iconCls:'icon-help',closable:true,height:'auto'">
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
        <#if icons??>
        <table>  <tr>
            <#list icons as icon>


                <#if (icon_index+1)%25==0 >
                </tr><tr>
                <#else >
                    <td><span class="${icon.text}">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;</td>
                </#if>


            </#list></tr>
            </table>
        </#if>



    </p>
    <br>

    <p>
        系统信息:<br>
    <table>
        <tr>
            <td>JAVA版本:</td><td>${javaVersion}</td>
            <td>JAVA路径:</td><td>${javaHome}</td>
        </tr>
        <tr>
            <td>操作系统名称:</td><td>${osName}</td>
            <td>操作系统构架:</td><td>${osArch}</td>
        </tr>
        <tr>
            <td>服务器域名:</td><td>${host}</td>
            <td>服务器ip:</td><td>${ip}</td>
        </tr>
    </table>
    </p>
</div>