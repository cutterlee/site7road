<#import "/spring.ftl" as spring>

<div class="easyui-panel" style="padding:5px">
    <ul id="tt" class="easyui-tree" data-options="url:'${req.contextPath}/role/authTree',method:'get',animate:true,checkbox:true"></ul>
</div>

<div style="text-align: center;align-content: center">
    <a class="easyui-linkbutton checkAll">全选</a> <a class="easyui-linkbutton disCheckAll">全不选</a> <a class="easyui-linkbutton giveRightSubmit">分配权限</a>
</div>

<script type="text/javascript">
        $(function(){
            $(".checkAll").bind("click",function(){

            });
            $(".disCheckAll").bind("click",function(){});
            $(".giveRightSubmit").bind("click",function(){});
        });


</script>