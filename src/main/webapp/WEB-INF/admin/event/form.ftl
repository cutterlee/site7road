<#import "/spring.ftl" as spring>
    <div style="width: 100%;">
        <form  method="post"  id="${entityName}Fm" enctype="multipart/form-data">
            <table>
                    <tr style="display: none;">
                        <td><input name="id" id="entityId" value="${entity.id!0}" class="easyui-numberbox" /></td>
                    </tr>
                    <tr>
                        <td style="width: 150px;"><label><@spring.message "event.eventTitle"/>:</label></td>
                        <td><input name="title" value="${entity.title!''}" class="easyui-validatebox" required="true" style="width: 400px;"></td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "event.publish.time"/>:</label></td>
                        <td><input name="publishTime"  value="${entity.publishTime!''}" class="easyui-datetimebox" required="true"  style="width: 400px;" /></td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "event.list.page.image"/></label></td>
                        <td><input type="hidden" name="eventImgInEventPage" value="${entity.eventImgInEventPage!''}"/>
                            <input class="easyui-filebox" name="files" data-options="prompt:'<@spring.message "file.choose.prompt"/>'" style="width:400px;"></td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "event.summary"/>:</label></td>
                        <td><textarea name="eventContentSmall" id="eventContentSmall${op}"style="width: 98%;">${entity.eventContentSmall!""}</textarea></td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "event.detail"/>:</label></td>
                        <td><textarea name="eventContentDetail" id="eventContentDetail${op}"style="width: 98%;">${entity.eventContentDetail!""}</textarea></td>
                    </tr>
                    <#include "*/common/form_save.ftl"/>
            </table>
        </form>
    </div>

<script type="text/javascript">
    $(function () {
        var summary = UE.getEditor("eventContentSmall${op}");
        var detail = UE.getEditor("eventContentDetail${op}");
    });
</script>

