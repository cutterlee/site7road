<#import "/spring.ftl" as spring>

    <div>
        <form  method="post"  id="${entityName}Fm">

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
               <#include "*/common/form_save.ftl"/>
            </table>
        </form>
    </div>

