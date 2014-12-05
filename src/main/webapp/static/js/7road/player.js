


    /**
     * 轮播组件 fadePlayer
     * @param opts.imgfield           图片
     * @param opts.oNav               菜单obj
     * @param opts.leftBtn            左侧按钮
     * @param opts.rightBtn           右侧按钮
     * @param opts.curIndex           当前索引
     * @param opts.delay              鼠标触发索引时，动画切换的延迟时间
     * @param opts.highCls            当前高亮class
     * @param opts.interval           自动轮播时 动画切换的时间
     */
    var player = function (opts) {
        var opt = $.extend({}, {
                imgField: null,
                oNav: null,
                curIndex: 0,
                leftBtn: null,
                rightBtn: null,
                delayTime: 300,
                highCls: 'current',
                interval: 3000
            },
            opts);
        var max = opt.imgField.length, q = null, T = null;
        var init = function () {
            //切换器
            var invoke = function (slideTime) {

                var b = opt.imgField.eq(opt.curIndex);
                b.css("z-index", "1");
                b.css("background", "url(" + b.attr("url") + ") center top no-repeat");

                b.siblings().css("z-index", "0");
                b.stop().animate({opacity: 1}, slideTime);
                b.siblings().stop().animate({opacity: 0}, slideTime);

                //opt.oNav.removeAttr("class").andSelf().eq(opt.curIndex).addClass(opt.highCls);
                opt.oNav.children().removeAttr("class").eq(opt.curIndex).addClass(opt.highCls);
            }, autoPlay = function () {//自动播放
                q = setTimeout(function () {
                    max - 1 > opt.curIndex ? opt.curIndex++ : opt.curIndex = 0;
                    invoke(2000);
                    autoPlay()
                }, opt.interval)
            }, hoverFun = function () {//鼠标滑过索引
                for(var i=0;i<max;i++){
                    opt.oNav.append('<li>'+(i+1)+'</li>')
                }
                opt.oNav.children().hover(function () {
                    var index = opt.oNav.children().index($(this));
                    if (!opt.oNav.children().eq(index).is('.' + opt.highCls)) {
                        opt.curIndex = index;
                        T = setTimeout(function () {
                            invoke(600);
                        }, opt.delayTime);
                    }

                }, function () {
                    clearInterval(T);
                });
            };

            //配置 左右按钮的控制
            if (opt.leftBtn != null && opt.rightBtn != null) {
                //左右按钮的鼠标移过函数
                (opt.leftBtn).add(opt.rightBtn).hover(function () {
                        clearTimeout(q);
                        (opt.leftBtn).add(opt.rightBtn).stop().fadeTo(0, 1)
                    },
                    function () {
                        (opt.leftBtn).add(opt.rightBtn).stop().fadeTo(0, 0);
                        autoPlay();
                    });
                //左按钮控制
                opt.leftBtn.click(function () {
                    opt.curIndex > 0 ? opt.curIndex-- : opt.curIndex = max - 1;
                    invoke(600);
                });
                //有按钮控制
                opt.rightBtn.click(function () {
                    max - 1 > opt.curIndex ? opt.curIndex++ : opt.curIndex = 0;
                    invoke(600);
                });
            }

            //切换
            invoke();
            //自动轮播
            autoPlay();
            //鼠标滑入
            hoverFun();
            //移入区域停止轮播
            opt.oNav.add(opt.imgField.parent()).hover(function () {
                    clearTimeout(q);
                    (opt.leftBtn != null && opt.rightBtn != null) ? opt.leftBtn.add(opt.rightBtn).css("opacity", .6) : null;
                },
                function () {
                    autoPlay();
                    (opt.leftBtn != null && opt.rightBtn != null) ? opt.leftBtn.add(opt.rightBtn).css("opacity", 0) : null;
                });
        };
        //执行初始化函数
        init();
    };


    //首页焦点图
    player({
        imgField:$(".bannerImg ul li"),
        oNav:$(".bannerNav ul"),
        curIndex:0,
        leftBtn:$(".leftBtn"),
        rightBtn:$(".rightBtn"),
        delayTime:100,
        highCls:"curr",
        interval:3000
    });