<#import "/spring.ftl" as spring>
            <div id="${entityName}tb" style="padding:2px;height:auto;">
                <div style="margin-bottom:2px">
                    <a href="#" class="easyui-linkbutton addEntity" iconCls="icon-add" >增加</a>
                    <a href="#" class="easyui-linkbutton editEntity" iconCls="icon-edit" >编辑</a>
                    <a href="#" class="easyui-linkbutton removeEntity" iconCls="icon-remove" >删除</a>
                    权限名称:<input class="easyui-textbox" style="width:120px" id="entitySearch" name="resourceName" >
                    <a href="#" class="easyui-linkbutton searchEntity" iconCls="icon-search">搜索</a>
                </div>
            </div>


            <table id="${entityName}grid" class="easyui-treegrid" style="width:100%;height:500px;"
                   url="${req.contextPath}/${entityName}/tree" toolbar="#${entityName}tb"
                   iconCls="icon-reload" singleSelect="true" fitColumns="true" autoRowHeight="true" lines="true"
                   sortName="id" sortOrder="asc" idField="id" treeField="resourceName" showFooter="true"
                   rownumbers="false" pagination="true" pageSize="20">
                <thead>
                <tr>
                    <th field="orderNum" width="100">排序号</th>
                    <th field="resourceName" width="100" align="left" sortable="true">资源名称</th>
                    <th field="resourceUrl" width="200">资源url</th>
                    <th field="resourceSummary" width="200" align="left">资源简介</th>
                </tr>
                </thead>
            </table>



<script type="text/javascript">
    $(function () {
        $(".addEntity").bind("click", function () {
            var titleName = '增加${title}';
            var contentHref = '${req.contextPath}/${entityName}/create';
            var iconCls = 'icon-add';
            openTab(titleName, contentHref, iconCls, "${req.contextPath}");
        });
        $(".editEntity").bind("click", function () {
            var row = $('#' + '${entityName}grid').datagrid('getSelected');
            if (row) {
                var titleName = '编辑${title}';
                var contentHref = '${req.contextPath}/${entityName}/' + row.id + '/modify';
                var iconCls = 'icon-edit';
                openTab(titleName, contentHref, iconCls, "${req.contextPath}");

            }
        });
        $(".removeEntity").bind("click", function () {
            var row = $('#' + '${entityName}grid').datagrid('getSelected');
            if (row) {
                $.messager.confirm('确认', '你确定删除这条数据?', function (r) {
                    if (r) {
                        $.post('${req.contextPath}/${entityName}/' + row.id + '/remove', function (result) {
                            if (result.success) {
                                $('#' + '${entityName}grid').datagrid('reload');    // reload the user data
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
                "condition.propertyName": $("#entitySearch").attr("textboxname"), "condition.where": "like", "condition.propertyValue": $("#entitySearch").val()
            });
        });
    });
</script>