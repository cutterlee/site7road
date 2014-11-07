<script type="text/javascript">
    $(function () {
        $(".addEntity").bind("click", function () {
            $('#' + '${entityName}Fm').form('clear');
            $('.textbox-value').val('0');
            $('#' + '${entityName}dlg').dialog('open').dialog('setTitle', '增加${title}');
        });
        $(".editEntity").bind("click", function () {
            var row = $('#' + '${entityName}grid').datagrid('getSelected');
            if (row) {
                $('#' + '${entityName}dlg').dialog('open').dialog('setTitle', '编辑${title}');
                $('#' + '${entityName}Fm').form('load', row);
            }
        });
        $(".saveEntity").bind("click", function () {
            $('#' + '${entityName}Fm').form('submit', {
                url: '${req.contextPath}/${entityName}/save',
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (result) {
                    alert(result);
                    var result = eval('(' + result + ')');
                    if ( !result.success) {
                        $.messager.show({
                            title: '错误提示',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#' + '${entityName}dlg').dialog('close');        // close the dialog
                        $('#' + '${entityName}grid').datagrid('reload');    // reload the user data
                    }
                }
            });
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
                "condition.propertyName": $("#companyNameSearch").attr("textboxname"), "condition.where": "like", "condition.propertyValue": $("#companyNameSearch").val()
            });
        });
    });
</script>