<#import "/spring.ftl" as spring>

    <div >
        <form  method="post"  id="${entityName}Fm" style="height: 70%;">
            <div class="easyui-tabs" data-options="fit:true,plain:true,tabPosition:'left'">
                <div title="生成配置" style="padding:10px;">
                    <table cellpadding="5">
                        <tr style="display: none;">
                            <td><input name="id" id="entityId" value="${entity.id!0}" class="easyui-numberbox" /></td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.nick"/>:</label></td>
                            <td>
                                <input name="siteAlias"  value="${entity.siteAlias!''}" class="easyui-validatebox" required="true" validType="english" style="width: 400px;" />
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.name"/>:</label></td>
                            <td>
                                <input name="siteName" value="${entity.siteName!''}" class="easyui-validatebox" id="password"  required="true"  style="width: 400px;">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.icon"/>:</label></td>
                            <td>
                                <input name="siteIcon"  value="${entity.siteIcon!''}" class="easyui-validatebox"  validType="url" required="true" style="width: 400px;">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.url"/>:</label></td>
                            <td>
                                <input name="siteUrl"  value="${entity.siteUrl!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.dir"/>:</label></td>
                            <td>
                                <input name="siteDir"  value="${entity.siteDir!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.static.url"/>:</label></td>
                            <td>
                                <input name="staticUrl" value="${entity.staticUrl!''}" class="easyui-validatebox"  style="width: 400px;" required="true" >
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.static.dir"/>:</label></td>
                            <td>
                                <input name="staticDir"  value="${entity.staticDir!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.template.dir"/>:</label></td>
                            <td>
                                <input name="templateDir"  value="${entity.templateDir!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>
                    </table>
                </div>
                <div title="信息配置" style="padding:10px;">

                    <table cellpadding="5">
                        <tr>
                            <td><label><@spring.message "site.owner"/>:</label></td>
                            <td>
                                <input name="siteOwner"  value="${entity.siteOwner!''}" class="easyui-validatebox" required="true"  style="width: 400px;" />
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.address"/>:</label></td>
                            <td>
                                <input name="address" value="${entity.address!''}" class="easyui-validatebox" id="password"  required="true"  style="width: 400px;">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.phoneNum"/>:</label></td>
                            <td>
                                <input name="phoneNum"  value="${entity.phoneNum!''}" class="easyui-validatebox"  validType="phone" required="true" style="width: 400px;">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.zipCode"/>:</label></td>
                            <td>
                                <input name="zipCode"  value="${entity.zipCode!''}"class="easyui-validatebox"  validType="zip"  style="width: 400px;" required="true">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.backUpNum"/>:</label></td>
                            <td>
                                <input name="backUpNum"  value="${entity.backUpNum!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>

                    </table>


                </div>
                <div title="其它配置" style="padding:10px;">

                    <table cellpadding="5">
                        <tr>
                            <td><label><@spring.message "site.closeMsg"/>:</label></td>
                            <td>
                                <input name="closeMsg"  value="${entity.closeMsg!''}" class="easyui-validatebox" required="true"  style="width: 400px;" />
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.maxFileSize"/>:</label></td>
                            <td>
                                <input name="maxFileSize" value="${entity.maxFileSize!0}" class="easyui-numberbox"  required="true"  style="width: 400px;">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.fileTypes"/>:</label></td>
                            <td>
                                <input name="fileTypes"  value="${entity.fileTypes!''}" class="easyui-validatebox"  required="true" style="width: 400px;">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.imageSavePath"/>:</label></td>
                            <td>
                                <input name="imageSavePath"  value="${entity.imageSavePath!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.cssSavePath"/>:</label></td>
                            <td>
                                <input name="cssSavePath"  value="${entity.cssSavePath!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.jsSavePath"/>:</label></td>
                            <td>
                                <input name="jsSavePath"  value="${entity.jsSavePath!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.otherSavePath"/>:</label></td>
                            <td>
                                <input name="otherSavePath"  value="${entity.otherSavePath!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>
                        <tr>
                            <td><label><@spring.message "site.cookieDomain"/>:</label></td>
                            <td>
                                <input name="cookieDomain"  value="${entity.cookieDomain!''}"class="easyui-validatebox"   style="width: 400px;" required="true">
                            </td>
                        </tr>

                    </table>

                </div>
            </div>

        </form>
        <table>
        <#include "*/common/form_save.ftl"/>
        </table>
    </div>

