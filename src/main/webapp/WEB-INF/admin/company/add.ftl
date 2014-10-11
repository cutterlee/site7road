<#import "/spring.ftl" as spring>
<h1> ${title}</h1>


<form method="post" action="${req.contextPath}/company/save">
    <input type="hidden" name="id" value="${entity.id}">
    公司名称： <input type="text" name="companyName"><br>
    公司地址： <input type="text" name="companyAddress"><br>
    公司联系方式： <input type="text" name="companyLinkway"><br>
    公司简介： <input type="text" name="companySummary"><br>
    企业文化： <input type="text" name="companyCulture"><br>
    <input type="submit" value="保存">


</form>