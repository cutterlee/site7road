<#import "/spring.ftl" as spring>
<script type="text/javascript" charset="utf-8">
    MSGTIP = {
        sure: '<@spring.message "sure"/>',
        sureRemoveTip: '<@spring.message "sure.remove.tip"/>',
        modify: '<@spring.message "modify"/>',
        modifySelect: '<@spring.message "modify.select"/>',
        remove: '<@spring.message "remove"/>',
        removeTip: '<@spring.message "remove.tip"/>',
        loadingMessage:'<@spring.message "loading"/>'
    }
</script>
<script type="text/javascript" src="${req.contextPath}/static/js/sys/common.js"></script>