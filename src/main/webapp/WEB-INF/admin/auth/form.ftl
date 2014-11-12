<#import "/spring.ftl" as spring>

    <div>
        <form  method="post"  id="${entityName}Fm">

            <table cellpadding="5">
                <tr style="display: none;">
                    <td><input name="id" id="entityId" class="easyui-textbox"/></td>
                </tr>
                <tr>
                    <td><label>父权限:</label></td>
                    <td>
                        <input name="pid"  class="easyui-combotree" value="${entity.pid!0}" data-options="url:'${req.contextPath}/${entityName}/comboTree',method:'get'" style="width:50%;height:26px">
                    </td>
                </tr>
                <tr>
                    <td><label>排序号:</label></td>
                    <td><input name="orderNum" class="easyui-textbox" style="width: 400px;" required="true" value="${entity.orderNum}"></td>
                </tr>
                <tr>
                    <td><label>资源名称:</label></td>
                    <td><input name="resourceName" class="easyui-textbox" required="true" style="width: 400px;" value="${entity.resourceName!''}"></td>
                </tr>
                <tr>
                    <td><label>资源图标:</label></td>
                    <td>
                        <input class="easyui-combotree"
                               name="resourceIcon" value="${entity.resourceIcon!''}"
                               data-options=" url:'${req.contextPath}/combo/icon', method:'get',valueField:'id', textField:'text', panelHeight:'auto'">
                    </td>
                </tr>
                <tr>
                    <td><label>资源简介:</label></td>
                    <td><input name="resourceSummary" class="easyui-textbox" style="width: 400px;" required="true" value="${entity.resourceSummary!''}"></td>
                </tr>

                <tr>
                    <td><label>资源url:</label></td>
                    <td><input name="resourceUrl" class="easyui-textbox" style="width: 400px;" required="true" value="${entity.resourceUrl!''}"></td>
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

