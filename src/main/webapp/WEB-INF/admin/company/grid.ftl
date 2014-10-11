<#import "/spring.ftl" as spring>

hello world!


this is ${title} ,test ok !

<a href="${req.contextPath}/company/create">增加</a>

<table border="1px">
    <thead>
    <tr>
        <td>id</td>
        <td>公司名称</td>
        <td>公司地址</td>
        <td>联系方式</td>
        <td>公司简介</td>
        <td>企业文化</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <#list entityList as entity>
    <tr>
        <td>${entity.id}</td>
        <td>${entity.companyName}</td>
        <td>${entity.companyAddress}</td>
        <td>${entity.companyLinkway}</td>
        <td>${entity.companySummary}</td>
        <td>${entity.companyCulture}</td>
        <td><a href="${req.contextPath}/company/${entity.id}/modify">编辑</a>
            <a href="${req.contextPath}/company/${entity.id}/remove">删除</a></td>
    </tr>
    </#list>
    </tbody>

</table>