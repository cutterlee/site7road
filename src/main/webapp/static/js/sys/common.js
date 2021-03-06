Date.prototype.format = function(format) {
    var o = {
        "M+" :this.getMonth() + 1, // month
        "d+" :this.getDate(), // day
        "h+" :this.getHours(), // hour
        "m+" :this.getMinutes(), // minute
        "s+" :this.getSeconds(), // second
        "q+" :Math.floor((this.getMonth() + 3) / 3), // quarter
        "S" :this.getMilliseconds()
        // millisecond
    }
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    }
    for ( var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
                : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}

SITE_7ROAD = {
    /**
     * 打开一个tab,展示信息
     * @param titleName tab的标题
     * @param contentHref tab的href
     * @param iconCls    tab的图标
     * @param contextPath 应用的根路径
     */
    openTab: function (titleName, contentHref, iconCls, contextPath) {
        var isExists = $('#handleArea').tabs("exists", titleName);
        if (isExists)  $('#handleArea').tabs('close', titleName);
        $('#handleArea').tabs('add', {
            title: titleName,
            href: contentHref,
            iconCls: iconCls,
            closable: true,
            cache: true,
            loadingMessage: MSGTIP.loadingMessage,
            onLoadError: function () {
                $('#handleArea').tabs("getSelected").panel('refresh', contextPath + "/noRight");
            }
        });
    },
    /**
     * 打开增加页面的对话框
     * @param entityName 操作的实体英文名
     * @param title 打开页面的标题
     */
    openAddDialog: function (entityName, title) {
        $('#' + entityName + 'Fm').form('clear');
        $('.textbox-value').val('0');
        $('#' + entityName + 'dlg').dialog('open').dialog('setTitle', title);
    },
    /**
     * 打开编辑页面的对话框
     * @param entityName 操作的英文实体名
     * @param title 编辑页面的标题
     **/
    openEditDialog: function (entityName, title) {
        var row = $('#' + entityName + 'grid').datagrid('getSelected');
        if (row) {
            $('#' + entityName + 'dlg').dialog('open').dialog('setTitle', title);
            $('#' + entityName + 'Fm').form('load', row);
        } else {
            $.messager.alert(MSGTIP.modify, MSGTIP.modifySelect, "error");
        }
    },
    /**
     * 删除grid的某一行
     * @param entityName 操作的英文实体名
     * @param contextPath  应用的路径
     */
    removeGridItem: function (entityName, contextPath) {
        var row = $('#' + entityName + 'grid').datagrid('getSelected');
        if (row) {
            $.messager.confirm(MSGTIP.sure, MSGTIP.sureRemoveTip, function (r) {
                if (r) {
                    $.post(contextPath + '/' + entityName + '/' + row.id + '/remove', function (result) {
                        if (result.success) {
                            $('#' + entityName + 'grid').datagrid('reload');
                        } else {
                            $.messager.alert(result.subject, result.errorMsg, "error");
                        }
                    }, 'json');
                }
            });
        } else {
            $.messager.alert(MSGTIP.remove, MSGTIP.removeTip, "error");
        }
    },
    /**
     * 表单保存数据,并重新加载grid
     * @param entityName
     * @param contextPath
     */
    saveGridForm: function (entityName, contextPath) {
        $('#' + entityName + 'Fm').form('submit', {
            url: contextPath + '/' + entityName + '/save',
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.success) {
                    $('#' + entityName + 'dlg').dialog('close');
                    $('#' + entityName + 'grid').datagrid('reload');
                } else {
                    $.messager.alert(result.subject, result.errorMsg, "error");
                }
            }
        });
    },
    /**
     * 从dataGrid的表格打开新增标签页
     * @param entityName
     * @param title
     * @param contextPath
     */
    openAddGridTagPage: function (entityName, title, contextPath) {
        var contentHref = contextPath + '/' + entityName + '/create?typeId=0&pid=0';
        SITE_7ROAD.openTab(title, contentHref, 'icon-add', contextPath);
    },

    /**
     * 增加打开增加文章的标签
     * @param entityName
     * @param title
     * @param contextPath
     * @param typeId
     */
    openAddArticleTagPage: function (entityName, title, contextPath,typeId) {
        var contentHref = contextPath + '/' + entityName + '/create?pid=0&typeId='+typeId;
        SITE_7ROAD.openTab(title, contentHref, 'icon-add', contextPath);
    },

    /**
     * 打开grid的编辑页面
     * @param entityName
     * @param title
     * @param contextPath
     */
    openEditGridTagPage: function (entityName, title, contextPath) {
        var row = $('#' + entityName + 'grid').datagrid('getSelected');
        if (row) {
            var contentHref = contextPath + '/' + entityName + '/' + row.id + '/modify';
            var iconCls = 'icon-edit';
            SITE_7ROAD.openTab(title, contentHref, iconCls, contextPath);

        } else {
            $.messager.alert(MSGTIP.modify, MSGTIP.modifySelect, "error");
        }
    },

    /**
     * 从treeGrid的表格打开新增标签页
     * @param entityName
     * @param title
     * @param contextPath
     */
    openAddTreeTagPage: function (entityName, title, contextPath) {
        var contentHref = contextPath + '/' + entityName + '/create?pid=0&typeId=0';
        var row = $('#' + entityName + 'grid').treegrid('getSelected');
        if (row) {
            contentHref = contextPath + '/' + entityName + '/create?typeId=0&pid=' + row.id;
        }
        SITE_7ROAD.openTab(title, contentHref, 'icon-add', contextPath);
    },

    /**
     * 打开grid的编辑页面
     * @param entityName
     * @param title
     * @param contextPath
     */
    openEditTreeTagPage: function openEditTreeTagPage(entityName, title, contextPath) {
        var row = $('#' + entityName + 'grid').treegrid('getSelected');
        if (row) {
            var contentHref = contextPath+'/'+entityName+'/' + row.id + '/modify';
            SITE_7ROAD.openTab(title, contentHref, 'icon-edit', contextPath);
        } else {
            $.messager.alert(MSGTIP.modify, MSGTIP.modifySelect, "error");
        }
    },

    /**
     * 删除grid的某一行
     * @param entityName
     * @param contextPath
     */
    removeTreeItem: function (entityName, contextPath) {
        var row = $('#' + entityName + 'grid').treegrid('getSelected');
        if (row) {
            $.messager.confirm(MSGTIP.sure,MSGTIP.sureRemoveTip, function (r) {
                if (r) {
                    $.post(contextPath+'/'+entityName+'/' + row.id + '/remove', function (result) {
                        if (result.success) {
                            $('#' + entityName+'grid').treegrid('reload');
                            $('#' + entityName+'grid').treegrid('unselectAll');

                        } else {
                            $.messager.alert(result.subject,result.errorMsg,"error");
                        }
                    }, 'json');
                }
            });
        } else {
            $.messager.alert(MSGTIP.remove, MSGTIP.removeTip, "error")
        }
    },
    /**
     * 保存页面信息,关闭当前页面,并打开列表页面
     * @param entityName
     * @param contextPath
     * @param indexTitle
     * @param indexIconCls
     * @param titleName
     * @param beforeSaveCallBack 保存之前的回调函数
     */
    saveEntity:function(entityName, contextPath, indexTitle, indexIconCls, titleName,beforeSaveCallBack) {
        beforeSaveCallBack();
        $('#' + entityName + 'Fm').form('submit', {
            url: contextPath + '/' + entityName + '/save',
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.success) {
                    $('#handleArea').tabs('close', titleName);
                    var contentHref = contextPath + '/' + entityName + '/index';
                    SITE_7ROAD.openTab(indexTitle, contentHref, indexIconCls, contextPath);
                } else {
                    $.messager.alert(result.subject, result.errorMsg, "error");
                }
            }
        });
    },
    /**
     * 关闭当前页面,打开列表页面
     * @param entityName
     * @param contextPath
     * @param indexTitle
     * @param indexIconCls
     * @param titleName
     */
    returnIndexPage:function (entityName, contextPath, indexTitle, indexIconCls, titleName) {
        $('#handleArea').tabs('close', titleName);
        var contentHref = contextPath + '/' + entityName + '/index';
        SITE_7ROAD.openTab(indexTitle, contentHref, indexIconCls, contextPath);
    },
    setIcon:function (value) {
        return "<span class='" + value + "'>&nbsp;&nbsp;&nbsp;</span>";
    },
    collapseTree:function (entityName) {
        $('#' + entityName+'grid').treegrid('collapseAll');
    },
    expandTree: function (entityName) {
        $('#' + entityName+'grid').treegrid('expandAll');
    },
    formateGridDate:function (value) {
        var unixTimestamp = new Date(value);
        return unixTimestamp.format('yyyy-MM-dd hh:mm:ss');
    },
    transGridDate:function (value) {
        var unixTimestamp = new Date(value);
        return unixTimestamp.format('yyyy'+MSGTIP.year+'MM'+MSGTIP.month+'dd'+MSGTIP.day);
    },
    generatePage:function(siteId,contextPath){
        $.post(contextPath+"/banner/"+siteId+"/generate",function(data){
            var msg= $.parseJSON(data);
            if(msg.success())
            {
                $.messager.alert("生成页面","生成成功","info");
            }
        });
    }

}