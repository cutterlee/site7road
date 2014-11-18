<#import "/spring.ftl" as spring>
<div style="height: 100%;height: 88%;">

<div class="easyui-panel" style="padding:5px;height: 95%;">
    <ul id="tt" class="easyui-tree" data-options="url:'${req.contextPath}/role/authTree?roleId=${roleId}',method:'get',animate:true,cascadeCheck:false,checkbox:true"></ul>
</div>

<div style="text-align: center;align-content: center">
    <a class="easyui-linkbutton checkAll"><@spring.message "check.all"/></a>
    <a class="easyui-linkbutton disCheckAll"><@spring.message "not.check.all"/></a>
    <a class="easyui-linkbutton giveRightSubmit"><@spring.message "give.right"/></a>
    <a class="easyui-linkbutton returnRightPage"><@spring.message "return"/></a>
</div>

</div>
<script type="text/javascript">
        $(function(){
            $(".checkAll").bind("click",function(){
               var roots= $("#tt").tree('getChildren');
                $.each(roots,function(index,text){
                    $("#tt").tree('check',roots[index].target);
                });
            });
            $(".disCheckAll").bind("click",function(){
                var roots= $("#tt").tree('getChildren');
                $.each(roots,function(index,text){
                    $("#tt").tree('uncheck',roots[index].target);
                });
            });
            $(".returnRightPage").bind("click",function(){
                $('#handleArea').tabs('close', '${title}');
                var contentHref = '${req.contextPath}/${entityName}/index';
                SITE_7ROAD.openTab(${indexTitle}, contentHref, ${indexIconCls},'${req.contextPath}');
            });
            $(".giveRightSubmit").bind("click",function(){
                var checkNodes= $("#tt").tree('getChecked');
                if(checkNodes.length<1)
                {
                    $.messager.alert("<@spring.message "tip"/>","<@spring.message "check.tip"/>","error");
                }else {
                    var resourceIdArray = "[";
                    $.each(checkNodes, function (index, item) {
                        if (index < checkNodes.length - 1) {
                            resourceIdArray += item.id + ",";
                        } else {
                            resourceIdArray += item.id;
                        }
                    });
                    resourceIdArray += "]";
                    $.post('${req.contextPath}/role/giveRight', {'roleId':${roleId}, 'resourceIdArray': resourceIdArray}, function (data) {
                        if (data.success) {
                            $('#handleArea').tabs('close', '${title}');
                            var contentHref = '${req.contextPath}/${entityName}/index';
                            SITE_7ROAD.openTab(${indexTitle}, contentHref, ${indexIconCls},'${req.contextPath}');
                        } else {
                            $.messager.alert(data.subject, data.errorMsg, 'error');
                        }
                    });

                }
            });
        });


</script>