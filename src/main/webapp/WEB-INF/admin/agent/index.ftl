<#import "/spring.ftl" as spring>
<div class="easyui-panel indexDiv">
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <#include "*/common/grid_button.ftl"/>
        <@spring.message "agent.agentName"/>:<input class="easyui-textbox" style="width:120px"  id="agentName"   propertyName="agentName" where="like">
        <a href="#" class="easyui-linkbutton searchEntity${entityName}" iconCls="icon-search"><@spring.message "search"/></a>
    </div>
</div>

<table id="${entityName}grid" class="easyui-datagrid indexTableDiv" style="height: 88%;"
       url="${req.contextPath}/${entityName}/list" toolbar="#${entityName}tb"
       iconCls="icon-reload" singleSelect="true" fitColumns="true"
       sortName="id" sortOrder="asc" stripe="true" autoRowHeight="false"
       rownumbers="true" pagination="true" pageSize="20">
    <thead>
        <tr>
            <th field="orderNum"  sortable="true" align="center"><@spring.message "orderNum"/></th>
            <th field="region"  sortable="true" align="center" data-options="formatter:function(value){return CONFIGMAP[value];}"><@spring.message "agent.region"/></th>
            <th field="agentName"  align="left" fixed="true" rowspan="1" colspan="1"><@spring.message "agent.agentName"/></th>
            <th field="agentUrl"  align="left" fixed="true" rowspan="1" colspan="1"><@spring.message "agent.url"/></th>
            <th field="agentImg"  align="left"><@spring.message "agent.img"/></th>

        </tr>
    </thead>
</table>


</div>
<script type="text/javascript">
    $(function () {
        $(".searchEntity${entityName}").bind("click", function () {
                    $('#' + '${entityName}grid').datagrid('load',
                            {"condition_1.propertyName": $("#agentName").attr("propertyName"),"condition_1.propertyValue": $("#agentName").val() ,"condition_1.where":$("#agentName").attr("where")
                            });
        });
    });
</script>