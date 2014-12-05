
<!DOCTYPE html>
<html>
<head>
    
<#include "head.ftl">

</head>

<body id="top0">
    
    <!-- 菜单 -->
    <#include "menu.ftl">

    <div class="work-environment">
        <div class="center">
            <a class="down" href="javascript:;"></a>
            <div class="work-environment-title title-box" id="top1">
                <h2>工作环境</h2>
                <h3>WORK ENVIRONMENT</h3>
                <h4>我们创造更好的环境，只为带给大家更为愉快的工作体验。</h4>
            </div>
            <div class="work-environment-list">
                <ul>
                    <#if at7roadLifeImgList??>
                        <#list at7roadLifeImgList as data>
                            <#if data_index == 3><#break></#if>
                            <li>
                                <a href="javascript:;">
                                    <img src="${data.text}" width="202" height="202" alt="${data.desc}" />
                                </a>
                                <h5>${data.desc}</h5>
                                <#if data.imgWords??>
                                    <p>${data.imgWords}</p>
                                </#if>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>

    <div class="training-and-development" id="top2">
        <div class="center">
            <div class="training-and-development-title title-box">
                <h2>培训与发展</h2>
                <h3>TRAINING AND DEVELOPMENT</h3>
                <h4>我们视每位成员为团队最宝贵的财富，提供人性化的综合福利，丰富成员生活。</h4>
            </div>
            <div class="development-process">
                <span class="process1">初作者</span>
                <span class="process2">有经验者</span>
                <span class="process3">监督者</span>
                <span class="process4">管理者</span>
                <span class="process5">领导者</span>
                <span class="process6">专家</span>
                <span class="process7">高级专家</span>
                <span class="process8">资深专家</span>
            </div>
        </div>
    </div>

    <div class="training-and-development-list">
        <div class="center">
            <div class="training-and-development-box">
                <ul>
                    <li>
                        <h5>员工发展机制</h5>
                        <h6>Advance</h6>
                    </li>
                    <li>
                        <h5>职业发展通道</h5>
                        <h6>Development</h6>
                    </li>
                    <li>
                        <h5>员工培养体系</h5>
                        <h6>Training </h6>
                    </li>
                    <li>
                        <h5>阅读好时光</h5>
                        <h6>Reading</h6>
                    </li>
                    <li>
                        <h5>读书分享会</h5>
                        <h6>Share</h6>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="member-welfare" id="top3">
        <div class="center">
            <div class="member-welfare-title title-box">
                <h2>成员福利</h2>
                <h3>MEMBERS OF WELFARE</h3>
                <h4>我们视每位成员为团队最宝贵的财富，提供人性化的综合福利，丰富成员生活。</h4>
            </div>
            <div class="member-welfare-list">
                <ul>
                    <li>
                        <img class="pngie6" src="${imageHost}/hr/work-in-7road/w01.png" width="161" height="161" alt="成员福利" />
                        <h5>爱孝薪 & 子女教育津贴</h5>
                        <p>七道员工直系长辈将享受每月共计 2000 元的爱孝薪，已有子女的员工还能享受每年10000元的子女教育津贴。</p>
                    </li>
                    <li>
                        <img class="pngie6" src="${imageHost}/hr/work-in-7road/w02.png" width="161" height="161" alt="成员福利" />
                        <h5>五险一金&商业保险</h5>
                        <p>除了国家规定的养老保险综合医疗保险、工伤保险失业保险、女职工生育保险之外，我们还为员工提供了住房公积金和平安公司的商业保险。</p>
                    </li>
                    <li>
                        <img class="pngie6" src="${imageHost}/hr/work-in-7road/w03.png" width="161" height="161" alt="成员福利" />
                        <h5>年度体检</h5>
                        <p>加入七道，您将享受每年度组织的员工体检，七道通过这项福利来关爱您的身体健康。</p>
                    </li>
                    <li>
                        <img class="pngie6" src="${imageHost}/hr/work-in-7road/w04.png" width="161" height="161" alt="成员福利" />
                        <h5>团队餐厅</h5>
                        <p>加入第七大道，您将皆享受团队免费提供精致丰盛的一日三餐，团队更贴心为晚上加班的员工提供免费宵夜和报销的士福利。</p>
                    </li>
                    <li>
                        <img class="pngie6" src="${imageHost}/hr/work-in-7road/w05.png" width="161" height="161" alt="成员福利" />
                        <h5>办公娱乐</h5>
                        <p>七道有咖啡吧、空中花园桌球室、乒乓室、健身房甚至健身后的淋浴室一应俱全，让员工健康工作。</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="life-in-7road" id="top4">
        <div class="center">
            <div class="life-in-7road-title title-box">
                <h2>七道生活</h2>
                <h3>MEMBERS LIFE IN 7ROAD</h3>
                <h4>每逢节日、生日我们会举办热闹的活动，全民参与其中，七道就像一个热闹的大家庭。</h4>
            </div>
            <div class="life-in-7road-pic">
                <ul>
                    <#if road7LifeList??>
                        <li>
                            <#list road7LifeList as life>
                                <#if (life_index > 0) && (life_index) % 4 == 0></li><li></#if>
                                <div <#if life_index == 0>class="curr"</#if> id="${life_index}">
                                    <img src="${life.bigImage}" width="329" height="243" alt="七道生活" />
                                    <span class="pngie6">${life.title}</span>
                                </div>
                            </#list>
                        </li>
                    </#if>
                </ul>
            </div>
            <div class="life-in-7road-pic-nav">
                <a href="javascript:;" class="prev-btn"></a>
                <a href="javascript:;" class="next-btn"></a>
            </div>
            <div class="life-in-7road-pic-introduction">
                <ul>
                    <#if road7LifeList??>
                        <#list road7LifeList as life>
                            <li>
                                <h3>Life in 7road</h3>
                                <h2 title="${life.title}">${life.title}</h2>
                                <div>${life.content}</div>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>


    <!-- 底部 -->
    <#include "footer.ftl">

    <!--右侧浮动导航-->
    <div class="work-in-7road-float-nav pngie6">
        <a><span class="nav0 pngie6"></span></a>
        <a><span class="nav1 pngie6"></span></a>
        <a><span class="nav2 pngie6"></span></a>
        <a><span class="nav3 pngie6"></span></a>
        <a><span class="nav4 pngie6"></span></a>
        <a><span class="nav5 pngie6"></span></a>
    </div>

    <script type="text/javascript">
    $(function(){
        var page = 1;
        var i = 1; //显示个数
        //向后按钮
        $(".life-in-7road-pic-nav .next-btn").click(function(){
            scrollBox("next-btn");
        });
        //往前按钮
        $(".life-in-7road-pic-nav .prev-btn").click(function(){
            scrollBox("prev-btn");
        });
        var scrollBox = function(className){
            var pic = $(".life-in-7road-pic");
            var ul = $(".life-in-7road-pic ul");
            var w = pic.width();
            var len = ul.find("li").length;
            var count = Math.ceil(len / i) ;
            if(className == "next-btn"){
                if( page == count ){
                    ul.animate({ left : '0px'}, "slow"); 
                    page = 1;
                }else{
                    ul.animate({ left : '-='+w }, "slow");
                    page++;
                }
            }else if(className == "prev-btn"){
                if( page == 1 ){
                    ul.animate({ left : '-='+w*(count-1) }, "slow");
                    page = count;
                }else{
                    ul.animate({ left : '+='+w }, "slow");
                    page--;
                }
            }
            $(".life-in-7road-pic ul li").eq(page-1).children("div:first-child").click();
        }

        $(".life-in-7road-pic div").on("click",function(){
            $(this).addClass("curr").siblings().removeClass("curr");
            var index = $(this).attr("id");
            $(".life-in-7road-pic-introduction ul li").eq(index).show().siblings().hide();
        });

        //右侧浮动导航
        $(".work-in-7road-float-nav a").live("click",function(){
            var index = $(this).index();
            if( index == 5 ){
                index = 0;
            }
            $("html,body").animate({scrollTop : $("#top" + index).offset().top},300);            
        });
        $(window,document).scroll(function(){
            var scrollTop = $(document).scrollTop();
            var top2 = $("#top2").offset().top - 220;
            var top3 = $("#top3").offset().top - 220;
            var top4 = $("#top4").offset().top - 280;
            if( scrollTop > 200 ){
                $(".work-in-7road-float-nav").show();
                if( scrollTop > 200 && scrollTop < top2 ){
                    addRemoveClass(1);
                }else if( scrollTop >= top2 && scrollTop < top3 ){
                    addRemoveClass(2);
                }else if( scrollTop >= top3 && scrollTop < top4 ){
                    addRemoveClass(3);
                }else if( scrollTop >= top4 ){
                    addRemoveClass(4);
                }
            }else{
                $(".work-in-7road-float-nav").hide();
            }
        });
        var addRemoveClass = function(index){
            $(".work-in-7road-float-nav a").eq(index).addClass("curr").siblings().removeClass("curr");
        }
    });
    </script>

</body>
</html>
