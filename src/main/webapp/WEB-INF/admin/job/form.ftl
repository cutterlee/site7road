<#import "/spring.ftl" as spring>
    <div>
        <form  method="POST"  id="${entityName}Fm">

            <table cellpadding="5">
                <tr style="display: none;">
                    <td colspan="4"><input name="id" value="${entity.id}" id="entityId" type="number" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td style="width: 100px;"><label>排序号:</label></td>
                    <td><input name="orderNum" value="${entity.orderNum}" class="easyui-numberbox" required="true" style="width: 400px;" /></td>
                    <td><label>职位名称:</label></td>
                    <td><input name="positionName"  value="${entity.positionName!""}" class="easyui-textbox" required="true" style="width: 400px;"></td>
                </tr>
                <tr>
                    <td><label>所在城市:</label></td>
                    <td><input name="positionPlace"  value="${entity.positionPlace!""}" class="easyui-textbox" style="width: 400px;" required="true" maxlength="10"></td>
                    <td><label>所需人数:</label></td>
                    <td><input name="positionNeedNum" value="${entity.positionNeedNum!0}" class="easyui-numberbox"  style="width: 400px;"   required="true"></td>
                </tr>

                <tr>
                    <td><label>职位性质:</label></td>
                    <td><input name="positionProperty"  value="${entity.positionProperty!""}"   class="easyui-textbox"   required="true"></td>
                    <#--<td><label>是否热招职位:</label></td>-->
                    <#--<td><input name="hotStatus"  type="radio" value="1" checked="checked">热招 <input name="hotStatus"  type="radio" value="0">普通</td>-->
                </tr>
                <tr>
                    <td><label>工作职责:</label></td>
                    <td colspan="3">
                        <textarea  name="positionDuty" id="positionDuty${version}"  style="width: 80%">${entity.positionDuty!""}</textarea>
                    </td>
                </tr>
                <tr>
                    <td><label>岗位要求:</label></td>
                    <td colspan="3">
                        <textarea  name="positionRequirement" id="positionRequirement${version}" style="width: 80%">${entity.positionRequirement!""}</textarea>

                    </td>
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
        var duty=  UE.getEditor("positionDuty${version}");
      var requirement=  UE.getEditor("positionRequirement${version}");


        //防止工具栏的事件冒泡
        $(this.container).click(function(e){
            e.stopPropagation()
        });

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

