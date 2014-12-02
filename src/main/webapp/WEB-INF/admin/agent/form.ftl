<#import "/spring.ftl" as spring>
    <div style="width: 100%;">
        <form  method="post"  id="${entityName}Fm" enctype="multipart/form-data">
            <table>
                    <tr style="display: none;">
                        <td><input name="id" id="entityId" value="${entity.id!0}" class="easyui-numberbox" /></td>
                    </tr>
                    <tr>
                        <td style="width: 150px;"><label><@spring.message "orderNum"/>:</label></td>
                        <td><input name="orderNum" value="${entity.orderNum!0}" class="easyui-numberbox" type="number" required="true" style="width: 400px;"></td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "agent.region"/>:</label></td>
                        <td>
                            <select name="region" class="easyui-combobox" style="width: 200px;" required="true"
                                    data-options="
                            editable:false,
                            value:'<#if entity.region gt 0>${entity.region}</#if>',
                            url:'${req.contextPath}/config/select?configKey=agent_region',
                            method:'post',
                            valueField:'id',
                            textField:'configTitle',
                            panelHeight:'auto'
            "></select>
                        </td>
                    </tr>
                <tr>
                    <td style="width: 150px;"><label><@spring.message "agent.agentName"/>:</label></td>
                    <td><input name="agentName" value="${entity.agentName!''}" class="easyui-validatebox"  required="true" style="width: 400px;"></td>
                </tr>
                <tr>
                    <td style="width: 150px;"><label><@spring.message "agent.url"/>:</label></td>
                    <td><input name="agentUrl" value="${entity.agentUrl!''}" class="easyui-validatebox"   style="width: 400px;"></td>
                </tr>
                    <tr>
                        <td><label><@spring.message "agent.img"/></label></td>
                        <td><input type="hidden" name="agentImg" value="${entity.agentImg!''}"/>
                            <input class="easyui-filebox" name="files" data-options="prompt:'<@spring.message "file.choose.prompt"/>'" style="width:400px;"></td>
                    </tr>

                    <#include "*/common/form_save.ftl"/>
            </table>
        </form>
    </div>


