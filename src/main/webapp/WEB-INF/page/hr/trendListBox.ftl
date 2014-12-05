
<ul>
    <#if trendList??>
        <#list trendList as trend>
            <li>
                <span>${trend.createTime?string("yyyy-MM-dd")}</span>
                <a href="${HrServerHost}/trend/${trend.id}.html" target="_blank" title="${trend.title}">${trend.title}</a>
            </li>
        </#list>
    </#if>
</ul>

<div class="page-num">
    <a href="javascript:;" onclick="changePage('${HrServerHost}/trend/trend_list_1.html?ver=${version}');">首页</a>
    <#if (currentPage != 1)>
        <a href="javascript:;" onclick="changePage('${HrServerHost}/trend/trend_list_${currentPage-1}.html?ver=${version}');">&lt;&lt;上一页</a>
    <#else>
        <span>&lt;&lt;上一页</span>
    </#if>

    &nbsp;&nbsp; ${currentPage}/${totalPage} &nbsp;&nbsp;

    <#if (currentPage != totalPage)>
        <a href="javascript:;" onclick="changePage('${HrServerHost}/trend/trend_list_${currentPage+1}.html?ver=${version}');">下一页&gt;&gt;</a>
    <#else>
        <span>下一页&gt;&gt;</span>
    </#if>
    <a href="javascript:;" onclick="changePage('${HrServerHost}/trend/trend_list_${totalPage}.html?ver=${version}');">尾页</a>
</div>
