<#import "/spring.ftl" as spring>

    <div>
        <form  method="post"  id="${entityName}Fm">

            <table cellpadding="5">
                <tr style="display: none;">
                    <td colspan="4"><input name="id" value="${entity.id}" id="entityId" type="number" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td>父配置项:</td>
                    <td>
                        <input name="pid"  class="easyui-combotree" value="${entity.pid!0}" data-options="url:'${req.contextPath}/${entityName}/comboTree',method:'get'" style="width:50%;height:26px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;"><label>排序号:</label></td>
                    <td><input name="orderNum" value="${entity.orderNum!0}" class="easyui-numberbox" required="true" style="width: 400px;" /></td>
                </tr>

                <tr>
                    <td style="width: 100px;"><label>配置key:</label></td>
                    <td><input name="configKey" value="${entity.configKey!''}" class="easyui-textbox" required="true" validType="length[4,40]" style="width: 400px;" /></td>
                    <td><label>需要显示的根据key取得配置值的请填写配置值</label></td>
                </tr>
                <tr>
                    <td style="width: 100px;"><label>配置值:</label></td>
                    <td><input name="configTitle" value="${entity.configTitle!''}" class="easyui-textbox" required="true" validType="length[2,100]" style="width: 400px;" /></td>
                </tr>

                <tr>
                    <td style="width: 100px;"><label>配置说明:</label></td>
                    <td><input name="configRemark" value="${entity.configRemark!''}" class="easyui-textbox" data-options="multiline:true" required="true" validType="length[2,100]" style="width: 400px;height: 60px;" /></td>
                </tr>

               <#include "*/common/form_save.ftl"/>
            </table>
        </form>


    </div>



