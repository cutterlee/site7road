
<!DOCTYPE html>
<html>
<head>
    
<#include "head.ftl">

</head>

<body>
    
    <!-- 菜单 -->
    <#include "menu.ftl">

    <div class="bg-box">
        <div class="user-center">
            <div class="user-left">
                <h3 class="title-model">
                    <i></i>
                    <span>用户中心</span>
                </h3>
                <ul class="user-left-nav">
                    <li><a href="${HrServerHost}/center/resume.html">我的简历</a></li>
                    <li><a href="${HrServerHost}/center/applyRecord.html">职位申请记录</a></li>
                    <li><a href="${HrServerHost}/center/resetPassword.html">修改密码</a></li>
                    <li><a href="javascript:;" class="curr">已收藏职位</a></li>
                </ul>
            </div>
            <div class="user-right">
                <h3 class="title-model">
                    <i></i>
                    <span>已收藏职位</span>
                </h3>
                
                <div>
                    <table class="apply-table" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr class="apply-table-title">
                                <td class="l">职位名称</td>
                                <td width="95">职位类别</td>
                                <td width="75">地点</td>
                                <td width="125">申请日期</td>
                                <td width="80">招聘状态</td>
                                <td>操作</td>
                            </tr>
                        </thead>
                        <tbody id="collect-jobs-list">

                        </tbody>
                    </table>
                    <div class="more-apply">
                        <a href="${HrServerHost}/hr/recruitmentList.html" target="_blank">查看更多职位</a>
                    </div>
                    
                </div>

            </div>
        </div>
    </div>

    <!-- 底部 -->
    <#include "footer.ftl">
    
</body>
</html>
