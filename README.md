版权所属 cutter.li
======================================================================

site for company


 <ul>
        <li>后台采用的技术是springMVC,Hibernate,freemarker</li>
        <li>权限控制采用的是shiro框架</li>
        <li>前端使用js库 easyui,富文本编辑器使用百度编辑器ueditor</li>
        <li>把公司官网,招聘站点,公众号站点的现有业务都转移过来</li>
        <li>弹出层的例子,请看用户管理</li>
        <li>ueditor的例子,请看职位信息</li>
        <li>treeGrid的例子,请看权限管理</li>
    </ul>

======================================================================

ftl模板放在/WEB-INF/page/分站点放置
比如sq站点就是page下的sq目录下

生成的html,放在/static/html/分站点放置
比如sq的html就放在html下的sq目录下

静态资源也分别放在/static下的img,css,js下
没有分站点的表示是后台用到的或者说是公用的
