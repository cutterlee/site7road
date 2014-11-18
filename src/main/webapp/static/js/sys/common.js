/**
 * 打开一个tab
 * @param titleName
 * @param contentHref
 * @param iconCls
 * @param contextPath
 */
function openTab(titleName, contentHref,iconCls,contextPath) {
    var isExists = $('#handleArea').tabs("exists", titleName);
    //如果不存在,创建tab
    if (isExists){
        $('#handleArea').tabs('close', titleName);
    }
    $('#handleArea').tabs('add', {
        title: titleName,
        href: contentHref,
        iconCls:iconCls,
        closable: true,
        cache: true,
        loadingMessage: '玩命加载中',
        onLoadError: function () {
            //如果加载出错,给出提示信息
            $('#handleArea').tabs("getSelected").panel('refresh', contextPath+"/noRight");
        }
    });
}

/**
 * 打开增加页面的对话框
 * @param entityName
 * @param title
 */
function openAddDialog(entityName,title) {
    $('#' + entityName+'Fm').form('clear');
    $('.textbox-value').val('0');
    $('#' + entityName+'dlg').dialog('open').dialog('setTitle', '增加'+title);
}

/**
 * 打开编辑页面的对话框
 * @param entityName
 * @param title
 */
function openEditDialog(entityName,title) {
    var row = $('#' + entityName+'grid').datagrid('getSelected');
    if (row) {
        $('#' + entityName+'dlg').dialog('open').dialog('setTitle', '编辑'+title);
        $('#' + entityName+'Fm').form('load', row);
    }else{
        $.messager.alert("编辑","请先选择编辑的行","error");
    }
}

/**
 * 删除grid的某一行
 * @param entityName
 * @param contextPath
 */
function removeGridItem(entityName,contextPath) {
    var row = $('#' + entityName+'grid').datagrid('getSelected');
    if (row) {
        $.messager.confirm('确认', '你确定删除这条数据?', function (r) {
            if (r) {
                $.post('/'+contextPath+'/'+entityName +'/'+ row.id + '/remove', function (result) {
                    if (result.success) {
                        $('#'+entityName+'grid').datagrid('reload');    // reload the user data
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
        $.messager.alert("删除","请先选择删除的行","error");
    }
}

/**
 * 表单保存数据,并重新加载grid
 * @param entityName
 * @param contextPath
 */
function  saveGridForm(entityName,contextPath) {
    $('#' + entityName+'Fm').form('submit', {
        url: contextPath+'/'+entityName+'/save',
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (result) {
            var result = eval('(' + result + ')');
            if (result.success) {
                $('#' + entityName+'dlg').dialog('close');        // close the dialog
                $('#' + entityName+'grid').datagrid('reload');    // reload the user data

            } else {
                $.messager.show({
                    title: '错误提示',
                    msg: result.errorMsg
                });
            }
        }
    });
}




/**
 * 时间对象的格式化;
 */
Date.prototype.format = function(format) {
    /*
     * eg:format="YYYY-MM-dd hh:mm:ss";
     */
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

function formateDateTime(value,row,index){
    var unixTimestamp = new Date(value);
    return unixTimestamp.format('yyyy-MM-dd hh:mm:ss');
}

function setIcon(value, row, index) {
    return "<span class='"+value+"'>&nbsp;&nbsp;&nbsp;</span>";
}
/**
 * 格式化grid的日期
 * @param value
 * @returns {*}
 */
function formateGridDate(value){
    var unixTimestamp = new Date(value);
    return unixTimestamp.format('yyyy-MM-dd hh:mm:ss');
}

