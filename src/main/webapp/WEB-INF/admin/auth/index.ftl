<#import "/spring.ftl" as spring>
<div style="height: 100%;width: 100%">
            <div id="${entityName}tb" style="padding:2px;height:auto;">
                <div style="margin-bottom:2px">
                    <a href="#" class="easyui-linkbutton addEntity${entityName}" iconCls="icon-add" >增加</a>
                    <a href="#" class="easyui-linkbutton editEntity${entityName}" iconCls="icon-edit" >编辑</a>
                    <a href="#" class="easyui-linkbutton removeEntity${entityName}" iconCls="icon-remove" >删除</a>
                    <a href="#" class="easyui-linkbutton expand${entityName}" iconCls="icon-man" >展开</a>
                    <a href="#" class="easyui-linkbutton close${entityName}" iconCls="icon-lock" >关闭</a>
                    权限名称:<input class="easyui-textbox" style="width:120px" id="resourceName" propertyName="resourceName" where="like" >
                    权限url:<input class="easyui-textbox" style="width:120px" id="resourceUrl" propertyName="resourceUrl" where="like" >
                    资源类型:<select class="easyui-combobox" style="width: 200px;"  name="resourceType" id="resourceType" propertyName="resourceType" where="eq" >
                        <option value=0>请选择</option>
                        <option value=1>菜单</option>
                        <option value=2>页面</option>
                        <option value=3>接口</option>
                    </select>
                    <a href="#" class="easyui-linkbutton searchEntity${entityName}" iconCls="icon-search">搜索</a>

                </div>
            </div>


            <table id="${entityName}grid" class="easyui-treegrid" style="width:100%;height:100%;"
                   url="${req.contextPath}/${entityName}/tree" toolbar="#${entityName}tb"
                   iconCls="icon-reload" singleSelect="true" fitColumns="true" autoRowHeight="true" lines="true"
                   sortName="id" sortOrder="asc" idField="id" treeField="resourceName" showFooter="true"
                   rownumbers="false" pagination="true" pageSize="20">
                <thead>
                <tr>
                    <th field="resourceName" width="100" align="left" sortable="true">资源名称</th>
                    <th field="resourceUrl" width="200">资源url</th>
                    <th field="resourceType" width="200" data-options="formatter:function(value){
                    if(value==1) return '菜单';
                     if(value==2) return '页面';
                      if(value==3) return '接口';
                    }">资源类型</th>
                    <th field="orderNum" width="100">排序号</th>
                    <th field="resourceSummary" width="200" align="left">资源简介</th>
                </tr>
                </thead>
            </table>

</div>

<script type="text/javascript">
    $(function () {
        $(".close${entityName}").bind("click", function () {
            $('#' + '${entityName}grid').treegrid('collapseAll');
        });
        $(".expand${entityName}").bind("click", function () {
            $('#' + '${entityName}grid').treegrid('expandAll');
        });
        $(".addEntity${entityName}").bind("click", function () {
            var row = $('#' + '${entityName}grid').datagrid('getSelected');
            var contentHref = '${req.contextPath}/${entityName}/create?pid=0';
            if (row) {
                contentHref = '${req.contextPath}/${entityName}/create?pid='+row.id;
            }
            var titleName = '增加${title}';
            var iconCls = 'icon-add';
            openTab(titleName, contentHref, iconCls,"${req.contextPath}");
        });
        $(".editEntity${entityName}").bind("click", function () {
            var row = $('#' + '${entityName}grid').datagrid('getSelected');
            if (row) {
                var titleName = '编辑${title}';
                var contentHref = '${req.contextPath}/${entityName}/' + row.id + '/modify?pid='+row.id;
                var iconCls = 'icon-edit';
                openTab(titleName, contentHref, iconCls, "${req.contextPath}");

            }else{
                $.messager.alert("提示","请先选择数据","error")
            }
        });
        $(".removeEntity${entityName}").bind("click", function () {
            var row = $('#' + '${entityName}grid').datagrid('getSelected');
            if (row) {
                $.messager.confirm('确认', '你确定删除这条数据?', function (r) {
                    if (r) {
                        $.post('${req.contextPath}/${entityName}/' + row.id + '/remove', function (result) {
                            if (result.success) {
                                $('#' + '${entityName}grid').treegrid('reload');
                                $('#' + '${entityName}grid').treegrid('unselectAll');

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
                $.messager.alert("提示","请先选择数据","error")
            }
        });

        $(".searchEntity${entityName}").bind("click", function () {
            $('#' + '${entityName}grid').treegrid('reload', {
                "condition_1.propertyName": $("#resourceName").attr("propertyName"), "condition_1.where": $("#resourceName").attr("where"), "condition_1.propertyValue": $("#resourceName").val(),
                "condition_2.propertyName": $("#resourceUrl").attr("propertyName"), "condition_2.where": $("#resourceUrl").attr("where"), "condition_2.propertyValue": $("#resourceUrl").val(),
                "condition_3.propertyName": $("#resourceType").attr("propertyName"), "condition_3.where": $("#resourceType").attr("where"), "condition_3.propertyValue": $("input[name=resourceType]").val()
            });
        });
    });
</script>