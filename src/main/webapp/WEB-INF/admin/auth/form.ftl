<#import "/spring.ftl" as spring>

    <div>
        <form  method="POST"  id="${entityName}Fm">

            <table cellpadding="5">
                <tr style="display: none;">
                    <td><input name="id" id="entityId" class="easyui-textbox" value="${entity.id!0}"/></td>
                </tr>
                <tr>
                    <td><label>父权限:</label></td>
                    <td>
                        <input name="pid"  class="easyui-combotree" required="true" value="${entity.pid!0}" data-options="url:'${req.contextPath}/${entityName}/comboTree',method:'get'" style="width:50%;height:26px">
                    </td>
                </tr>
                <tr>
                    <td><label>排序号:</label></td>
                    <td><input name="orderNum" class="easyui-numberbox"  style="width: 400px;" required="true" value="${entity.orderNum}"></td>
                </tr>
                <tr>
                    <td><label>资源名称:</label></td>
                    <td><input name="resourceName" class="easyui-textbox" required="true" validType="length[4,20]" style="width: 400px;" value="${entity.resourceName!''}"></td>
                </tr>
                <tr>
                    <td><label>资源类型:</label></td>
                    <td>
                        <select name="resourceType" class="easyui-combobox" style="width: 400px;" required="true" value="${entity.resourceType!1}">
                            <option value=1>菜单</option>
                            <option value=2>页面</option>
                            <option value=3>接口</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>资源url:</label></td>
                    <td><input name="resourceUrl" class="easyui-textbox" style="width: 400px;" required="true" validType="length[1,100]" value="${entity.resourceUrl!''}"></td>
                </tr>
                <tr>
                    <td><label>资源图标:</label></td>
                    <td>
                        <span class="icon-man" id="resourceIconImg">&nbsp;&nbsp;&nbsp;</span>
                        <input class="easyui-combotree" required="true"
                               name="resourceIcon" value="${entity.resourceIcon!'icon-man'}"
                               data-options=" url:'${req.contextPath}/combo/icon', method:'get',valueField:'id', textField:'text', panelHeight:'auto'
                               ,onSelect:function(rec){
                                 $('#resourceIconImg').removeClass().addClass(rec.text);
                                }
                               ">
                    </td>
                </tr>
                <tr>
                    <td><label>资源简介:</label></td>
                    <td><input name="resourceSummary" class="easyui-textbox" style="width: 400px;height: 60px;" data-options="multiline:true" required="true"  validType="length[4,200]" value="${entity.resourceSummary!''}"></td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="保存" class="easyui-linkbutton c6 saveEntity" iconCls="icon-save" style="width:90px">
                    </td>
                </tr>
            </table>
        </form>


    </div>


<script type="text/javascript">
    $(function () {

        $(".saveEntity").bind("click", function () {
            $('input[name=resourceIcon]').val($("#resourceIconImg").attr("class"));
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
                        var titleName = '权限管理';
                        var contentHref = '${req.contextPath}/${entityName}/index';
                        var iconCls = 'icon-add';
                        openTab(titleName, contentHref, iconCls,'${req.contextPath}');
                    }
                }
            });
        });
    });
</script>

