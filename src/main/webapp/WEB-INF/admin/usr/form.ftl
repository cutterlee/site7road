<#import "/spring.ftl" as spring>

    <div>
        <form  method="post"  id="${entityName}Fm">

            <table cellpadding="5">
                    <tr style="display: none;">
                        <td><input name="id" id="entityId" value="${entity.id!0}" class="easyui-numberbox" /></td>
                    </tr>
                    <tr>
                        <td style="width: 150px;"><label><@spring.message "user.role"/>:</label></td>
                        <td>
                            <select name="roleId" style="width: 300px;"  class="easyui-combogrid" required="true" validType="selectValueRequired" data-options="
                            panelWidth: 500,
                            value:'${entity.roleId!0}',
                            idField: 'id',
                            textField: 'roleName',
                            url: '${req.contextPath}/role/list',
                            method: 'get',
                            pagination:true,
                            columns: [[
                                {field:'roleName',title:'<@spring.message "role.name"/>',width:80},
                                {field:'roleSummary',title:'<@spring.message "role.summary"/>',width:200}
                            ]],
                            fitColumns: true
                        ">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "user.username"/>:</label></td>
                        <td>
                            <input name="username"  value="${entity.username!''}" class="easyui-validatebox" required="true" validType="username" style="width: 400px;" />
                        </td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "user.password"/>:</label></td>
                        <td>
                            <input name="password" value="${entity.password!''}" class="easyui-validatebox" id="password" type="password" required="true"  validType="length[6,20]" style="width: 400px;">
                        </td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "user.re.password"/>:</label></td>
                        <td>
                            <input name="repassword"  value="${entity.password!''}" class="easyui-validatebox" type="password" validType="same['password']" required="true" style="width: 400px;">
                        </td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "user.nick.name"/>:</label></td>
                        <td>
                            <input name="nickName"  value="${entity.nickName!''}"class="easyui-validatebox"  validType="length[2,8]" style="width: 400px;" required="true">
                        </td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "user.email"/>:</label></td>
                        <td>
                            <input name="userEmail" value="${entity.userEmail!''}" class="easyui-validatebox"  style="width: 400px;" required="true" data-options="validType:'email'">
                        </td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "user.status"/>:</label></td>
                        <td>
                            <select name="userStatus"  value="${entity.userStatus!''}" style="width: 150px;" class="easyui-combobox" value="1" required="true" validType="selectValueRequired">
                                <option value="1" checked="checked"><@spring.message "account.normal"/></option>
                                <option value="2"><@spring.message "account.fenghao"/></option>
                            </select>
                        </td>
                    </tr>

               <#include "*/common/form_save.ftl"/>
            </table>
        </form>
    </div>

