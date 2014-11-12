<#import "/spring.ftl" as spring>

    <div>
        <form  method="post"  id="${entityName}Fm">

            <table cellpadding="5">
                <tr style="display: none;">
                    <td colspan="4"><input name="id" value="${entity.id}" id="entityId" type="number" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td>父配置项:</td>
                    <td><select name="pid" value="${entity.pid!0}">
                        <option value="0">根</option>
                        <#if configParent??>
                            <#list configParent as config>
                                <option value="${config.id}">${config.configTitle}</option>
                            </#list>
                        </#if>

                    </select></td>
                </tr>
                <tr>
                    <td style="width: 100px;"><label>排序号:</label></td>
                    <td><input name="orderNum" value="${entity.orderNum!0}" class="easyui-numberbox" required="true" style="width: 400px;" /></td>
                </tr>

                <tr>
                    <td style="width: 100px;"><label>配置key:</label></td>
                    <td><input name="configKey" value="${entity.configKey!''}" class="easyui-textbox" required="true" style="width: 400px;" /></td>
                </tr>
                <tr>
                    <td style="width: 100px;"><label>配置值:</label></td>
                    <td><input name="configTitle" value="${entity.configTitle!''}" class="easyui-textbox" required="true" style="width: 400px;" /></td>
                </tr>

                <tr>
                    <td style="width: 100px;"><label>配置说明:</label></td>
                    <td><input name="configRemark" value="${entity.configRemark!''}" class="easyui-textbox" required="true" style="width: 400px;" /></td>
                </tr>

                <tr>
                    <td>
                        <input type="button" value="保存" class="easyui-linkbutton c6 saveEntity" iconCls="icon-ok" style="width:90px">
                    </td>
                </tr>
            </table>
        </form>


    </div>


<script type="text/javascript">

    $(function () {
        $(".saveEntity").bind("click", function () {
            $('#' + '${entityName}Fm').form('submit', {
                url: '${req.contextPath}/${entityName}/save',
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (result) {
                    var result = eval('(' + result + ')');
                    if ( !result.success) {
                        $.messager.show({
                            title: '错误提示',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#handleArea').tabs('close', '${title}');
                        var titleName = '${titleName}';
                        var contentHref = '${req.contextPath}/${entityName}/index';
                        var iconCls = 'icon-add';
                        openTab(titleName, contentHref, iconCls,"${req.contextPath}");
                    }
                }
            });
        });
    });
</script>

