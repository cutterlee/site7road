<#import "/spring.ftl" as spring>
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
       <#include "*/common/grid_button.ftl"/>
        职位名称:<input class="easyui-textbox" style="width:120px" id="positionName" propertyName="positionName" where="like">
        <a href="#" class="easyui-linkbutton searchEntity" iconCls="icon-search">搜索</a>
    </div>
</div>


<table id="${entityName}grid" class="easyui-datagrid" style="width:100%;height:auto;"
       url="${req.contextPath}/${entityName}/list" toolbar="#${entityName}tb"
       iconCls="icon-reload" singleSelect="true" fitColumns="true" autoRowHeight="false"
       sortName="id" sortOrder="asc"
       rownumbers="true" pagination="true" pageSize="20">
    <thead>
    <tr>
        <th field="positionName"  sortable="true" align="center">职位名称</th>
        <th field="positionPlace"  align="left" sortable="true" data-options="formatter:function(value,row,index){return CONFIGMAP[value]}">所在城市</th>
         <th field="positionNeedNum"  align="left">所需人数</th>
        <th field="positionProperty"  align="left"  data-options="formatter:function(value,row,index){return CONFIGMAP[value]}">职位性质</th>
        <th field="positionDuty" width="200px" fixed="true" rowspan="1" colspan="1">工作职责</th>
        <th field="positionRequirement" width="200px">职位要求</th>
        <#--<th field="hotStatus" >是否热招</th>-->
        <th data-options="field:'createTime',sortable:true,formatter:
                    function(value,row,index){
                    var unixTimestamp = new Date(value);
                    return unixTimestamp.format('yyyy-MM-dd hh:mm:ss');
                    }">创建时间</th>
    </tr>
    </thead>
</table>


<script type="text/javascript">
$(function(){
    $(".addEntity").bind("click", function () {
        var titleName = '增加${title}';
        var contentHref = '${req.contextPath}/${entityName}/create';
        var iconCls = 'icon-add';
        openTab(titleName, contentHref, iconCls,"${req.contextPath}");
    });
    $(".editEntity").bind("click", function () {
        var row = $('#' + '${entityName}grid').datagrid('getSelected');
        if (row) {
            var titleName = '编辑${title}';
            var contentHref = '${req.contextPath}/${entityName}/'+row.id+'/modify';
            var iconCls = 'icon-edit';
            openTab(titleName, contentHref, iconCls,"${req.contextPath}");

        }
    });


        $(".removeEntity").bind("click", function () {
            var row = $('#' + '${entityName}grid').datagrid('getSelected');
            if (row) {
                $.messager.confirm('确认', '你确定删除这条数据?', function (r) {
                    if (r) {
                        $.post('${req.contextPath}/${entityName}/' + row.id + '/remove', function (result) {
                            if (result.success) {
                                $('#'+'${entityName}grid').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: '错误提示',
                                    msg: result.errorMsg
                                });
                            }
                        }, 'json');
                    }
                });
            }
        });

        $(".searchEntity").bind("click", function () {
            $('#' + '${entityName}grid').datagrid('load', {
                "condition_1.propertyName": $("#positionName").attr("propertyName"), "condition_1.where":$("#positionName").attr("where") , "condition_1.propertyValue": $("#positionName").val()
            });
        });
    });
</script>