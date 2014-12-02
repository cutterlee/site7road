<#import "/spring.ftl" as spring>
<div style="width: 100%;height: auto;">
    <form method="post" id="${entityName}Fm" enctype="multipart/form-data">
        <table cellpadding="5">
            <tr style="display: none;">
                <td colspan="4"><input name="id" value="${entity.id}" id="entityId" type="number"  class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td><label>职位名称:</label></td>
                <td><input name="positionName" value="${entity.positionName!""}" class="easyui-textbox" required="true" style="width: 400px;"></td>
                <td><label>所需人数:</label></td>
                <td><input name="positionNeedNum" value="${entity.positionNeedNum!0}" class="easyui-numberbox" type="number" data-options="min:1,max:1000" style="width: 200px;" required="true"></td>
        </tr>
            <tr>
                <td><label>职位性质:</label></td>
                <td>
                    <input class="easyui-combobox"
                           name="positionProperty" style="width: 200px;" required="true"
                           data-options="
                            editable:false,
                           value:'<#if entity.positionProperty gt 0>${entity.positionProperty}</#if>',
                            url:'${req.contextPath}/config/select?configKey=work_property',
                            method:'post',
                            valueField:'id',
                            textField:'configTitle',
                            panelHeight:'auto'
            ">
                </td>
                <td><label>所在城市:</label></td>
                <td>
                    <input class="easyui-combobox"
                           data-options="
                           editable:false,
                            value:'<#if entity.positionPlace gt 0>${entity.positionPlace}</#if>',
                            url:'${req.contextPath}/config/select?configKey=work_city',
                            method:'post',
                            valueField:'id',
                            textField:'configTitle',
                            panelHeight:'auto'"
                           name="positionPlace" style="width: 200px;" required="true"
            ">
            </tr>
            <tr>
                <td><label>工作职责:</label></td>
                <td colspan="3"><textarea validType="required" name="positionDuty" id="positionDuty${op}"style="width: 98%;">${entity.positionDuty!""}</textarea></td>
            </tr>
            <tr>
                <td><label>岗位要求:</label></td>
                <td colspan="3"> <textarea validType="required" name="positionRequirement" id="positionRequirement${op}" style="width: 98%;">${entity.positionRequirement!""}</textarea></td>
            </tr>
        <#include "*/common/form_save.ftl"/>
        </table>
    </form>
</div>

<script type="text/javascript">
    $(function () {
        var duty = UE.getEditor("positionDuty${op}");
        var requirement = UE.getEditor("positionRequirement${op}");
    });
</script>

