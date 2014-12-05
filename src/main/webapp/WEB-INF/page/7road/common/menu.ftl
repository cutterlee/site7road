    
    <div class="headerWrap">
        <div class="header screenCenter">
            <h1><a href="${serverHost}">第七大道</a></h1>
            <div class="slogan"><img src="${index_top_logo}" /></div> 
            <div class="menu screenCenter">
                <ul>
                    <#if menuData??>
                        <#list menuData as topMenu>
                            <li>
                                <a href="${topMenu.menuUrl}" <#if topMenu.menuUrl == "http://hr.7road.com">target="_blank"</#if> >${topMenu.menuName}</a>
                                <#if topMenu.children?? && topMenu.children?size gt 0>
                                    <div class="subMenuWrap">
                                        <div class="subMenu">
                                            <#if topMenu.children??>
                                                <#list topMenu.children as secondMenu>
                                                    <a href="${secondMenu.menuUrl}">${secondMenu.menuName}</a>
                                                </#list>
                                            </#if>
                                        </div>
                                    </div>
                                </#if>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
            <a class="showTopBar" href="javascript:;"></a>
        </div>
    </div>
