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