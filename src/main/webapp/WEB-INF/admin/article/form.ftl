<#import "/spring.ftl" as spring>

    <div>
        <form  method="post"  id="${entityName}Fm" enctype="multipart/form-data">

            <table cellpadding="5">
                    <tr style="display: none;">
                        <td><input name="id" id="entityId" value="${entity.id!0}" class="easyui-numberbox" /></td>
                    </tr>
                    <tr>
                        <td style="width: 150px;"><label><@spring.message "article.name"/>:</label></td>
                        <td>
                           <input class="easyui-validatebox" value="${entity.title!''}" name="title" required="true" style="width: 400px;">
                        </td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "article.content"/>:</label></td>
                        <td>
                            <textarea name="content" id="articleContent${op}" validType="required" style="width: 98%;height: 600px;">${entity.content!''}</textarea>
                        </td>
                    </tr>
               <#include "*/common/form_save.ftl"/>
            </table>
        </form>
    </div>

<script type="text/javascript">
    $(function(){
        UE.getEditor("articleContent${op}");
    });

</script>

