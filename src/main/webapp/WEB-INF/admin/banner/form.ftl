<#import "/spring.ftl" as spring>

    <div>
        <form  method="post"  id="${entityName}Fm" enctype="multipart/form-data">

            <table cellpadding="5">
                <tr style="display: none;">
                    <td colspan="4"><input name="id" value="${entity.id}" id="entityId" type="number" class="easyui-textbox" />
                        <input name="path" value="${entity.path}"  class="easyui-textbox" />
                    </td>
                </tr>

                <tr>
                    <td style="width: 100px;"><label><@spring.message "banner.pid"/>:</label></td>
                    <td>
                        <select class="easyui-combotree" name="pid" propertyName="pid" where="eq"   data-options="url:'${req.contextPath}/banner/comboTree',method:'post',panelHeight:'auto',panelWidth:'auto',value:'<#if entity.pid gt 0>${entity.pid}</#if>'" style="width: 200px;"></select>
                    </td>
                </tr>

                <tr>
                    <td><@spring.message "banner.name"/>:</td>
                    <td>
                        <input name="bannerName"  class="easyui-validatebox" value="${entity.bannerName!''}" required="true"  style="width:80%;height:26px">
                    </td>
                </tr>




                <tr>
                    <td><@spring.message "banner.keywords"/>:</td>
                    <td>
                        <input name="keyWords"  class="easyui-validatebox" value="${entity.keyWords!''}"  required="true"  style="width:80%;height:26px">
                    </td>
                </tr>

                <tr>
                    <td><@spring.message "banner.description"/>:</td>
                    <td>
                        <input name="description"  value="${entity.description!''}" class="easyui-validatebox" data-options="multiline:true"  required="true"  style="width:80%;height: 60px;">
                    </td>
                </tr>

                <tr>
                    <td><@spring.message "banner.open"/>:</td>
                    <td>
                        <input class="easyui-combobox"
                               data-options="
                           editable:false,
                            value:'<#if entity.target gt 0>${entity.target}</#if>',
                            url:'${req.contextPath}/config/select?configKey=banner_open_way',
                            method:'post',
                            valueField:'id',
                            textField:'configTitle',
                            panelHeight:'auto'"
                               name="target" style="width: 200px;" required="true"
                        ">
                    </td>
                </tr>



                <tr>
                    <td style="width: 100px;"><label><@spring.message "banner.nav.show"/>:</label></td>
                    <td>
                        <input class="easyui-combobox"
                               data-options="
                           editable:false,
                            value:'<#if entity.showNav gt 0>${entity.showNav}</#if>',
                            url:'${req.contextPath}/config/select?configKey=item_show',
                            method:'post',
                            valueField:'orderNum',
                            textField:'configTitle',
                            panelHeight:'auto'"
                               name="showNav" style="width: 200px;" required="true"
                        >
                    </td>
                </tr>

                <tr>
                    <td style="width: 100px;"><label><@spring.message "banner.nav.order.num"/>:</label></td>
                    <td>
                        <input type="number" name="orderNum" value="${entity.orderNum!1}">
                    </td>
                </tr>


                <tr>
                    <td style="width: 100px;"><label><@spring.message "banner.index.show"/>:</label></td>
                    <td>
                        <input class="easyui-combobox"
                               data-options="
                           editable:false,
                            value:'<#if entity.indexShow gt 0>${entity.indexShow}</#if>',
                            url:'${req.contextPath}/config/select?configKey=item_show',
                            method:'post',
                            valueField:'orderNum',
                            textField:'configTitle',
                            panelHeight:'auto'"
                            name="indexShow" style="width: 200px;" required="true"
                        >
                    </td>
                </tr>


                <tr>
                    <td style="width: 100px;"><label><@spring.message "banner.index.order.num"/>:</label></td>
                    <td>
                        <input type="number" name="indexOrderNum" value="${entity.indexOrderNum!1}" >
                    </td>
                </tr>

                <tr>
                    <td style="width: 100px;"><label><@spring.message "banner.index.show.num"/>:</label></td>
                    <td>
                        <input type="number" name="indexNum" value="${entity.indexNum!1}" >
                    </td>
                </tr>


                <tr>
                    <td style="width: 100px;"><label><@spring.message "banner.link.url"/>:</label></td>
                    <td><input name="linkUrl" value="${entity.linkUrl!''}" class="easyui-textbox" validType="length[2,100]" style="width: 400px;" /></td>
                </tr>


                <tr>
                    <td style="width: 100px;"><label><@spring.message "banner.html.name"/>:</label></td>
                    <td>
                        <input class="easyui-validatebox" name="htmlName" required="true" value="${entity.htmlName!''}">
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


            <#include "*/common/form_save.ftl"/>
            </table>
        </form>


    </div>



