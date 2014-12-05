<#import "/spring.ftl" as spring>
<div style="height: 100%;height: 88%;">

<div class="easyui-panel" style="padding:5px;height: 95%;">
    <form  method="post"  id="${entityName}FmTemplate" enctype="multipart/form-data">

        <table cellpadding="5">
            <tr style="display: none;">
                <td colspan="4"><input name="id" value="${entity.id}" id="entityId" type="number" class="easyui-textbox" />
                </td>
            </tr>

            <tr>
                <td style="width: 100px;"><label><@spring.message "banner.list.template"/>:</label></td>
                <td>
                    <input class="easyui-combotree"
                           data-options="
                           editable:false,
                            value:'<#if entity.listPath??>${entity.listPath}</#if>',
                            url:'${req.contextPath}/combo/7road/template',
                            method:'post',
                            valueField:'id',
                            textField:'id',
                            panelHeight:'auto'"
                            name="listPath" style="width: 200px;" required="true"
                            >
                </td>
            </tr>

            <tr>
                <td style="width: 100px;"><label><@spring.message "banner.detail.template"/>:</label></td>
                <td>
                    <input class="easyui-combotree"
                           data-options="
                           editable:false,
                            value:'<#if entity.detailPath??>${entity.detailPath}</#if>',
                            url:'${req.contextPath}/combo/7road/template',
                            method:'post',
                            valueField:'id',
                            textField:'id',
                            panelHeight:'auto'"
                           name="detailPath" style="width: 200px;" required="true"
                            >
                </td>
            </tr>

            <tr>
                <td style="width: 100px;"><label><@spring.message "banner.current.template"/>:</label></td>
                <td>
                    <input class="easyui-combotree"
                           data-options="
                           editable:false,
                            value:'<#if entity.pagePath??>${entity.pagePath}</#if>',
                            url:'${req.contextPath}/combo/7road/template',
                            method:'post',
                            valueField:'id',
                            textField:'id',
                            panelHeight:'auto'"
                           name="pagePath" style="width: 200px;" required="true"
                            >
                </td>
            </tr>

            <tr>
                <td>
                    <a class="easyui-linkbutton" iconCls="icon-save" style="width:120px;height: 36px;" ><@spring.message "save"/></a>
                </td>
                <td>
                    <a class="easyui-linkbutton" iconCls="icon-left" style="width:120px;;height: 36px;" onclick="SITE_7ROAD.returnIndexPage('${entityName}','${req.contextPath}','${indexTitle}','${indexIconCls}','${title}');"><@spring.message "return"/></a>
                </td>
            </tr>
        </table>
    </form>
</div>



</div>
