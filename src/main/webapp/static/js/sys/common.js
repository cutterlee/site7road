
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

//格式化dataGrid的日期
//EasyUI用DataGrid用日期格式化
function TimeFormatter(value, rec, index) {
    if (value == undefined) {
        return "";
    }
    /*json格式时间转js时间格式*/
    value = value.substr(1, value.length - 2);
    var obj = eval('(' + "{Date: new " + value + "}" + ')');
    var dateValue = obj["Date"];
    if (dateValue.getFullYear() < 1900) {
        return "";
    }
    var val = dateValue.format("yyyy-mm-dd HH:MM:ss");
    return val.substr(11, 5);
}

function DateTimeFormatter(value, rec, index) {
    if (value == undefined) {
        return "";
    }
    /*json格式时间转js时间格式*/
    value = value.substr(1, value.length - 2);
    var obj = eval('(' + "{Date: new " + value + "}" + ')');
    var dateValue = obj["Date"];
    if (dateValue.getFullYear() < 1900) {
        return "";
    }

    return dateValue.format("yyyy-mm-dd HH:MM:ss");
}

//EasyUI用DataGrid用日期格式化
 function DateFormatter(value, rec, index) {
    if (value == undefined) {
        return "";
    }
    /*json格式时间转js时间格式*/
    value = value.substr(1, value.length - 2);
    var obj = eval('(' + "{Date: new " + value + "}" + ')');
    var dateValue = obj["Date"];
    if (dateValue.getFullYear() < 1900) {
        return "";
    }

    return dateValue.format("yyyy-mm-dd HH:MM:ss");
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

