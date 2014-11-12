<#import "/spring.ftl" as spring>
<div style="height: 100%;height: 100%;">

<div class="easyui-panel" style="padding:5px;height: 95%;">
    <ul id="tt" class="easyui-tree" data-options="url:'${req.contextPath}/role/authTree?roleId=${roleId}',method:'get',animate:true,checkbox:true"></ul>
</div>

<div style="text-align: center;align-content: center">
    <a class="easyui-linkbutton checkAll">全选</a> <a class="easyui-linkbutton disCheckAll">全不选</a> <a class="easyui-linkbutton giveRightSubmit">分配权限</a>
</div>

</div>
<script type="text/javascript">
        $(function(){
            $(".checkAll").bind("click",function(){
               var roots= $("#tt").tree('getRoots');
                $.each(roots,function(index,text){
                    $("#tt").tree('check',roots[index].target);
                });
            });
            $(".disCheckAll").bind("click",function(){
                var roots= $("#tt").tree('getRoots');
                $.each(roots,function(index,text){
                    $("#tt").tree('uncheck',roots[index].target);
                });
            });
            $(".giveRightSubmit").bind("click",function(){
                var checkNodes= $("#tt").tree('getChecked');
                var resourceIdArray="[";
                $.each(checkNodes,function(index,item){
                    if(index<checkNodes.length-1)
                    {
                        resourceIdArray+=item.id+",";
                    }else{
                        resourceIdArray+=item.id;
                    }
                });
                resourceIdArray+="]";
                $.post('${req.contextPath}/role/giveRight',{'roleId':${roleId},'resourceIdArray':resourceIdArray},function(data){
                    if(data.success)
                    {
                        openTab("角色管理",'${req.contextPath}/role/index',"icon-man");
                    }else{
                        $.messager.alert(data.subject,data.errorMsg,'error');
                    }
                });
            });
        });


</script>