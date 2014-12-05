<!--全部-->
<ul class="on">
    <#if yearList??>
        <#list yearList as data>
            <li <#if data_index = 0>class="curr"</#if> year="${data.year?c}年">
                <div>
                    <em>${data.publishTime?string("yyyy-MM")}</em>
                    <i></i>
                    <a href="javascript:;" title="${data.title}">
                        <#if data.title?length gt 40>
                            ${data.title?substring(0,40)}...
                        <#else>
                            ${data.title}
                        </#if>
                    </a>
                </div>
                <div class="eventMain">
                    <div class="newsPic f_l">
                        <#if (data.eventImgInEventPage != 'null')>
                            <img src="${data.eventImgInEventPage}" />
                        </#if>
                    </div>
                    <div class="eventDetail">${data.eventContentSmall}</div>
                </div>
            </li>
        </#list>
    </#if>
</ul>
