<#import "/spring.ftl" as spring>
<div style="width: 100%;height: 100%;">

            <div id="${entityName}tb" style="padding:2px;height:auto;">
                <div style="margin-bottom:2px">
                    <a href="#" class="easyui-linkbutton addEntity${entityName}" iconCls="icon-add" >增加</a>
                    <a href="#" class="easyui-linkbutton editEntity${entityName}" iconCls="icon-edit" >编辑</a>
                    <a href="#" class="easyui-linkbutton removeEntity${entityName}" iconCls="icon-remove" >删除</a>
                    配置名称:<input class="easyui-textbox" style="width:120px" id="configTitle" propertyName="configTitle" where="like">
                    <a href="#" class="easyui-linkbutton searchEntity${entityName}" iconCls="icon-search">搜索</a>
                </div>
            </div>


            <table id="${entityName}grid" class="easyui-treegrid" style="width:100%;height:100%;"
                   url="${req.contextPath}/${entityName}/tree" toolbar="#${entityName}tb"
                   iconCls="icon-reload" singleSelect="true" fitColumns="true" animate="true"
                   sortName="id" sortOrder="asc" idField="id" treeField="configTitle"
                   rownumbers="false" pagination="true" pageSize="20">
                <thead>
                <tr>
                    <th field="orderNum" sortable="true" align="center">排序号</th>
                    <th field="configTitle"  align="left" width="100px">配置名称</th>
                    <th field="configRemark" align="left"  width="100px">配置说明</th>
                    <th  data-options="field:'createTime',sortable:'true',formatter:
                    function(value,row,index){
                    var unixTimestamp = new Date(value);
                    return unixTimestamp.format('yyyy-MM-dd hh:mm:ss');
                    }">创建时间</th>
                </tr>
                </thead>
            </table>

</div>

<script type="text/javascript">
    $(function () {
        $(".addEntity${entityName}").bind("click", function () {
            var row = $('#' + '${entityName}grid').treegrid('getSelected');
            var contentHref = '${req.contextPath}/${entityName}/create?pid=0';
            if (row) {
                var contentHref = '${req.contextPath}/${entityName}/create?pid='+row.id;
            }
            var titleName = '增加${title}';
            var iconCls = 'icon-add';
            openTab(titleName, contentHref, iconCls, '${req.contextPath}');
        });
        $(".editEntity${entityName}").bind("click", function () {
            var row = $('#' + '${entityName}grid').treegrid('getSelected');
            if (row) {
                var titleName = '编辑${title}';
                var contentHref = '${req.contextPath}/${entityName}/' + row.id + '/modify';
                var iconCls = 'icon-edit';
                openTab(titleName, contentHref, iconCls,'${req.contextPath}');

            }else{
                $.messager.alert("提示","请先选择数据","error");
            }
        });
        $(".removeEntity${entityName}").bind("click", function () {
            var row = $('#' + '${entityName}grid').treegrid('getSelected');
            if (row) {
                $.messager.confirm('确认', '你确定删除这条数据?', function (r) {
                    if (r) {
                        $.post('${req.contextPath}/${entityName}/' + row.id + '/remove', function (result) {
                            if (result.success) {
                                $('#' + '${entityName}grid').treegrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: '错误提示',
                                    msg: result.errorMsg
                                });
                            }
                        }, 'json');
                    }
                });
            }else{
                    $.messager.alert("提示","请先选择数据","error");
            }
        });

        $(".searchEntity${entityName}").bind("click", function () {
            $('#' + '${entityName}grid').treegrid('reload', {
                "condition_1.propertyName": $("#configTitle").attr("propertyName"), "condition_1.where": $("#configTitle").attr("where"), "condition_1.propertyValue": $("#configTitle").val()
            });
        });
    });
</script>