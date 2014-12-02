<#import "/spring.ftl" as spring>

    <div>
        <form  method="post"  id="${entityName}Fm" enctype="multipart/form-data">

            <table cellpadding="5">
                <tr style="display: none;">
                    <td><input name="id" id="entityId" value="${entity.id!0}" class="easyui-textbox"/></td>
                </tr>
                <tr>
                    <td><label><@spring.message "user.role"/>:</label></td>
                    <td><input name="roleName" value="${entity.roleName!''}" class="easyui-textbox" required="true" validType="length[4,20]" style="width: 400px;" maxlength="20"/></td>
                </tr>
                <tr>
                    <td><label><@spring.message "role.summary"/>:</label></td>
                    <td><input name="roleSummary" value="${entity.roleSummary!''}" class="easyui-textbox" required="true" data-options="multiline:true" validType="length[4,200]" style="height: 60px;width: 400px;" maxlength="200"></td>
                </tr>
                <tr>
                    <td><label><@spring.message "role.site"/>:</label></td>
                    <td>
                        <select name="siteId" style="width: 300px;"  class="easyui-combogrid" required="true" validType="selectValueRequired" data-options="
                            panelWidth: 500,
                            value:'<#if entity.siteId gt 0 > ${entity.siteId}</#if>',
                            idField: 'id',
                            textField: 'siteName',
                            url: '${req.contextPath}/site/list',
                            method: 'get',
                            pagination:true,
                            columns: [[
                                {field:'siteName',title:'<@spring.message "site.name"/>',width:80},
                                {field:'siteOwner',title:'<@spring.message "site.owner"/>',width:200}
                            ]],
                            fitColumns: true
                        ">
                        </select>


                    </td>
                </tr>
               <#include "*/common/form_save.ftl"/>
            </table>
        </form>
    </div>

