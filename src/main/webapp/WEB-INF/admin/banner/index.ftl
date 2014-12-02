<#import "/spring.ftl" as spring>
<div>

            <div id="${entityName}tb" style="padding:2px;height:auto;">
                <div style="margin-bottom:2px">
                  <#include "*/common/tree_button.ftl"/>
                  <@spring.message "banner.name"/>:<input class="easyui-textbox" style="width:120px"  id="bannerName"   propertyName="bannerName" where="like">
                      <a href="#" class="easyui-linkbutton searchEntity${entityName}" iconCls="icon-search"><@spring.message "search"/></a>
                </div>
            </div>


            <table id="${entityName}grid" class="easyui-treegrid"
                   url="${req.contextPath}/${entityName}/tree" toolbar="#${entityName}tb"
                    singleSelect="true" fitColumns="true" animate="true"
                   sortName="id" sortOrder="asc" idField="id" treeField="bannerName"
                   rownumbers="false" pagination="true" pageSize="20">
                <thead>
                <tr>
                    <th field="bannerName" sortable="true" width="200px" align="left"><@spring.message "banner.name"/></th>
                    <th field="isMenu" align="left"  width="100px" data-options="formatter:function(value,row,index){return initShow(value);}"><@spring.message "banner.isMenu"/></th>
                    <th field="orderNum"  align="left" width="100px"><@spring.message "banner.drank"/></th>
                    <th field="isIndex"  align="left" width="100px" data-options="formatter:function(value,row,index){return initShow(value);}"><@spring.message "banner.isIndex"/></th>
                    <th field="iRank" align="left"  width="100px"><@spring.message "banner.irank"/></th>
                    <th width="200px" field="id" data-options="formatter:function(value,row,index){return initBanner(row);}"><@spring.message "operate"/></th>
                </tr>
                </thead>
            </table>

</div>

<script type="text/javascript">
    function initShow(value){
        if(value==1)
        {
            return "<span class='icon-ok'>&nbsp;&nbsp;&nbsp;</span>";
        } else{
            return "<span class='icon-clear'>&nbsp;&nbsp;&nbsp;</span>";
        }
    }
    function initBanner(row){
       return "<a iconCls='icon_edit'  href='javascript:void(0)' onclick='showField("+row.id+")'><span class='icon-wheel'>&nbsp;&nbsp;&nbsp;</span><@spring.message "banner.show.field"/></a>&nbsp;&nbsp;&nbsp;"+
               "<a iconCls='icon_edit'  href='javascript:void(0)' onclick='controllTemplate("+row.id+")'><span class='icon-wrench'>&nbsp;&nbsp;&nbsp;</span><@spring.message "banner.controller.template"/></a>";
    }
    function showField(roleId)
    {
        //打开一个tab,到赋权限的页面
        SITE_7ROAD.openTab("<@spring.message "banner.show.field"/>","${req.contextPath}/role/auth?roleId="+roleId,"icon-man",'${req.contextPath}');
    }
    function controllTemplate(roleId)
    {
        //打开一个tab,到赋权限的页面
        SITE_7ROAD.openTab("<@spring.message "banner.controller.template"/>","${req.contextPath}/role/auth?roleId="+roleId,"icon-man",'${req.contextPath}');
    }
    $(function () {
        $(".searchEntity${entityName}").bind("click", function () {
            $('#' + '${entityName}grid').treegrid('reload', {
                "condition_1.propertyName": $("#bannerName").attr("propertyName"), "condition_1.where": $("#bannerName").attr("where"), "condition_1.propertyValue": $("#bannerName").val()
            });
        });
    });
</script>