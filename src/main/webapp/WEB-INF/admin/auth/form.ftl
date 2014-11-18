<#import "/spring.ftl" as spring>

    <div>
        <form  method="post"  id="${entityName}Fm">

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
                    <td><label>权限字符:</label></td>
                    <td><input name="shiroPermission" class="easyui-textbox" style="width: 400px;" required="true" validType="length[1,100]" value="${entity.shiroPermission!''}"></td>
                </tr>
                <tr>
                    <td><label>资源图标:</label></td>
                    <td>
                        <span class="${entity.resourceIcon!'icon-man'}" id="resourceIconImg">&nbsp;&nbsp;&nbsp;</span>
                        <select class="easyui-combotree" required="true" style="width: 200px;"
                               name="resourceIcon"
                               data-options=" url:'${req.contextPath}/combo/icon', method:'get',valueField:'id', textField:'text', panelHeight:'auto',value:'${entity.resourceIcon!'icon-man'}'
                               ,onSelect:function(rec){
                                 $('#resourceIconImg').removeClass().addClass(rec.text);
                                }
                               "></select>
                    </td>
                </tr>
                <tr>
                    <td><label>资源简介:</label></td>
                    <td><input name="resourceSummary" class="easyui-textbox" style="width: 400px;height: 60px;" data-options="multiline:true" required="true"  validType="length[4,200]" value="${entity.resourceSummary!''}"></td>
                </tr>
                  <#include "*/common/form_save.ftl"/>
            </table>
        </form>
    </div>

<script type="text/javascript">
    function saveRole()
    {
        $('input[name=resourceIcon]').val($('#resourceIconImg').attr('class'));
        saveEntity('${entityName}','${req.contextPath}','${indexTitle}','${indexIconCls}','${title}');
    }
</script>




