<#import "/spring.ftl" as spring>
<h1> ${title}</h1>


<form method="post" action="${req.contextPath}/company/save">
    <input type="hidden" name="id" value="${entity.id}">
    公司名称： <input type="text" name="companyName" value="${entity.companyName}"><br>
    公司地址： <input type="text" name="companyAddress" value="${entity.companyAddress}"><br>
    公司联系方式： <input type="text" name="companyLinkway" value="${entity.companyLinkway}"><br>
    公司简介： <input type="text" name="companySummary" value="${entity.companySummary}"><br>
    企业文化： <input type="text" name="companyCulture" value="${entity.companyCulture}"><br>
    <input type="submit" value="保存">


</form>