<#import "/spring.ftl" as spring>
<script type="text/javascript" charset="utf-8">
    MSGTIP = {
        sure: '<@spring.message "sure"/>',
        sureRemoveTip: '<@spring.message "sure.remove.tip"/>',
        modify: '<@spring.message "modify"/>',
        modifySelect: '<@spring.message "modify.select"/>',
        remove: '<@spring.message "remove"/>',
        removeTip: '<@spring.message "remove.tip"/>',
        loadingMessage:'<@spring.message "loading"/>',
        year:'<@spring.message "year"/>',
        month:'<@spring.message "month"/>',
        day:'<@spring.message "day"/>',
        collapse: '<@spring.message "collapse"/>',
        expand:'<@spring.message "expand"/>',
    }


    <#if configList??>
    CONFIGMAP={
        <#list configList as config>
        ${config.id}:'${config.configTitle}',
        </#list>
    }
    </#if>
</script>
<script type="text/javascript" src="${req.contextPath}/static/js/sys/common.js"></script>