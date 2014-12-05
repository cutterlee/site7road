<ul>
    <#if recruitmentList??>
    	<#list recruitmentList as data>
    	    <li industry="${data.positionProperty}">
    	        <a class="postName" href="${serverHost}/recruit/page/${data.id}.html">${data.positionName}</a>
    	        <span class="industry">${data.positionProperty}</span>
    	        <span class="address">${data.positionPlace}</span>
    	        <span class="date">${data.createTime?string("yyyy-MM-dd")}</span>
    	    </li>
        </#list>
    </#if>
</ul>

<div class="pageNum">
    <a href="javascript:;" onclick="changePage('${serverHost}/recruit/recruitmentList_${typeName}_1.html?ver=${version}');">首页</a>
    <#if (currentPage != 1)>
        <a href="javascript:;" onclick="changePage('${serverHost}/recruit/recruitmentList_${typeName}_${currentPage-1}.html?ver=${version}');">&lt;&lt;上一页</a>
    <#else>
        <span>&lt;&lt;上一页</span>
    </#if>

    &nbsp;&nbsp; ${currentPage}/${totalPage} &nbsp;&nbsp;

    <#if (currentPage != totalPage)>
        <a href="javascript:;" onclick="changePage('${serverHost}/recruit/recruitmentList_${typeName}_${currentPage+1}.html?ver=${version}');">下一页&gt;&gt;</a>
    <#else>
        <span>下一页&gt;&gt;</span>
    </#if>
    <a href="javascript:;" onclick="changePage('${serverHost}/recruit/recruitmentList_${typeName}_${totalPage}.html?ver=${version}');">尾页</a>
</div>

