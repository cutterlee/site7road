CREATE TABLE IF NOT EXISTS `t_article` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `titlecolor` varchar(80) DEFAULT NULL,
  `author` char(20) DEFAULT NULL,
  `keywords` char(40) DEFAULT NULL,
  `description` mediumtext,
  `note` mediumtext,
  `linkurl` char(100) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `copyfrom` varchar(100) DEFAULT NULL,
  `addtime` varchar(32) DEFAULT NULL,
  `islink` tinyint(1) unsigned DEFAULT '0',
  `isflash` tinyint(1) DEFAULT '0',
  `istop` tinyint(1) unsigned DEFAULT '0',
  `isimg` tinyint(1) unsigned DEFAULT '0',
  `imgurl` varchar(255) DEFAULT NULL,
  `ishot` tinyint(1) unsigned DEFAULT '0',
  `pagenum` int(8) unsigned DEFAULT '0',
  `hits` mediumint(9) DEFAULT '1',
  `content` longtext,
  `typeid` smallint(5) unsigned DEFAULT NULL,
  `voteid` int(10) unsigned DEFAULT '0',
  `is_from_mobile` int(11) DEFAULT '0' COMMENT '是否来自手机发布',
  `price` text,
  `color` text,
  `product_xinghao` text,
  `dami_uid` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

--
-- 转存表中的数据 `dami_article`
--

INSERT INTO `t_article` (`aid`, `title`, `titlecolor`, `author`, `keywords`, `description`, `note`, `linkurl`, `status`, `copyfrom`, `addtime`, `islink`, `isflash`, `istop`, `isimg`, `imgurl`, `ishot`, `pagenum`, `hits`, `content`, `typeid`, `voteid`, `is_from_mobile`, `price`, `color`, `product_xinghao`, `dami_uid`) VALUES
(55, '企业概况', NULL, '未知', '', '\r\n	大米CMS(又名3gcms)是一个免费开源、快速、简单的PC建站和手机建站集成一体化系统， 我们致力于为用户提供简单、快捷的PC建站和智能手机建站解决方案。 提供开源的安卓手机客户端（APK）和', '...', NULL, 1, '', '2014-11-24 15:49:10', 0, 0, 0, 0, NULL, 0, NULL, 1, '<p style="margin-top:0px;margin-bottom:0px;padding:0px;line-height:30px;letter-spacing:1px;text-align:justify;font-family:Tahoma, ''Microsoft Yahei'', Simsun;font-size:14px;white-space:normal;background-color:#FFFFFF;">\r\n	大米CMS(又名3gcms)是一个免费开源、快速、简单的PC建站和手机建站集成一体化系统， 我们致力于为用户提供简单、快捷的PC建站和智能手机建站解决方案。 提供开源的安卓手机客户端（APK）和对应的服务器端系统源码下载。 您有什么建议或发现什么BUG，请发送邮件至cchaoming@163.com,我们将尽快为您解决\r\n</p>\r\n<div class="detail-bd" style="margin:0px;padding:0px;font-family:Tahoma, ''Microsoft Yahei'', Simsun;font-size:14px;line-height:21px;white-space:normal;background-color:#FFFFFF;">\r\n	<br style="margin:0px;padding:0px;" />\r\n大米CMS特点<br style="margin:0px;padding:0px;" />\r\n<br style="margin:0px;padding:0px;" />\r\n1:扩展字段自定义,根据自己系统需要无限扩展字段<br style="margin:0px;padding:0px;" />\r\n<br style="margin:0px;padding:0px;" />\r\n2:后台栏目分类无限极，并可以控制字段的显示或隐藏,方便管理<br style="margin:0px;padding:0px;" />\r\n<br style="margin:0px;padding:0px;" />\r\n3：列表模板（list目录下）和详细模板（page目录下）自定义<br style="margin:0px;padding:0px;" />\r\n<br style="margin:0px;padding:0px;" />\r\n4:基于thinkphp框架开发（官网www.thinkphp.cn）, 内置大量函数方便前台模板调用标签请参看tp官网<br style="margin:0px;padding:0px;" />\r\n<br style="margin:0px;padding:0px;" />\r\n5:作站灵活,可以将该系统做成任何类型网站，内置新闻类型站、企业站、手机3g站模型,通过http://***安装目录****/?t=xinwen这种查看，方便二次开发出不同模板<br style="margin:0px;padding:0px;" />\r\n<br style="margin:0px;padding:0px;" />\r\n6:支持手机访问\r\n</div>\r\n<br />', 15, NULL, 0, NULL, NULL, NULL, 0),
(56, '企业文化', NULL, '未知', '', '', '', NULL, 1, '', '2013-02-20 15:18:15', 0, 0, 0, 0, NULL, 0, 0, 12, '<span style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">企业文化写这里</span>', 16, 0, 0, NULL, NULL, NULL, 0),
(57, '企业荣誉', NULL, '未知', '', '企业荣誉放这里', '企业荣誉放这里...', NULL, 1, '', '2014-11-14 20:02:36', 0, 0, 0, 0, NULL, 0, NULL, 0, '企业荣誉放这里<img src="/dm/dami/Public/Uploads/attach/1415966526.jpg" /><img src="/dm/dami/Public/Editor/attached/image/20141114/20141114200233_97214.jpg" alt="" />', 17, NULL, 0, NULL, NULL, NULL, 0),
(58, '信息时代不用手机,活得很糟糕?', NULL, '不详', '', '', '“我', NULL, 1, '网络', '2013-02-20 15:19:04', 0, 0, 0, 0, NULL, 0, 0, 8, '<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">“我没有智能手机。我甚至一部手机也没有。”</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">Roz Warren 是一名 57 岁的大叔，在图书馆工作，在给《纽约时报》的撰稿中，他从一个非手机用户的角度，描述了自手机出现后，身边的人荒诞的行为。当然，这些行为在你我看来也许再正常不过。 没有手机给 Roz 的生活带来不少方便。比如当他跟朋友约好下午 1 点在星巴克见面，朋友在 12：50 没办法打电话告诉他：“我得迟一点，大概 20 分钟。”这迫使朋友不得不准时出现。而如果朋友无法准时，Roz 也能预料到。</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">然而在有手机的人那里，约会是另一种情形。首先，“1 点星巴克见”并不意味着真的是 1 点，甚至也不是在星巴克。当你出现在星巴克附近时，你就开始跟对方电话： ——我下地铁了。 ——我在停车。 ——我现在从 XX 路口走下来。 ——你在路的哪边？ ——我看到你了。右边，我在挥手。 ——我也看到了。</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">Roz 把这形象地称为“Smartphone Tango（智能手机探戈）”。没有手机，他自然无法参与其中，自私地剥夺了朋友的乐趣。他可不想获得这种手机乐趣。在他看来，人们过于追求手机所带来的兴奋，而这些“症状”被他称为“cellgasms（cell+orgasm）”——这就不只是 Smartphone Tango，而是任何与智能手机互动所带来的兴奋，人们已经对手机上瘾了。</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">有一天 Roz 与朋友 Deb 去纽约。结果在地铁上，Deb 发现自己的 iPhone 落在家里，那个下午，她无数次提到自己没有带电话，时不时拍下口袋，仿佛她身体丢失的某部分会突然出现。基于手机的一切乐趣——搜索、更新状态、发信息——都丢失了。她只能毫无联系地待在那一刻那个地方，就像很多年前她没有智能手机一样。 Roz 自认过时，要联系他，可以打固话，如果他不在家，你可以留言。在这 57 年里，他认为没有什么事情如此重要，需要立刻联系上，无法等到他回到家。特别当他儿子已经长大，他不需要被叫到学校校医室，而他的图书馆工作更需要保持安静。</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">如果有紧急灾难呢？没有手机如何求助？Roz 觉得这个问题很可笑，难道带着一部手机就是为了以防万一？手机真的能在紧要关头救你一命？Roz 认为带着手机更多时候只是在最后一刻跟亲友道别。而他不打算这样做，如果那一刻真的来临，他希望尖叫着、怒吼着，绝望地试图跟上帝讨价还价，如原始人般。 何伟在《寻路中国》一开始就讲到他在中国的“神奇”经历：当他在公路上开着车，农民们在路上晒谷子，特别欢迎他将车轮碾过去。我看了觉得一点都不新奇，但接下来何伟一句话就点醒了我：这同时违反了交通安全和食品安全的法律。 如果你问我为什么要在一个科技网站介绍一个非手机用户的观点，我只能说我们时不时需要换个角度看问题。好不容易放假回到家中，你仍低着头玩手机，可能有时你会后悔，觉得是不是该陪陪爸妈说说话，但实在躲不开手机的诱惑。这难道不反常？甚至我们的情感也寄托在手机上：多少女生因为男朋友没有及时回复自己短信，没有经常打电话，积怨已久，某天突然在电话那端提出分手。</p>', 19, 0, 0, NULL, NULL, NULL, 0),
(59, '通过手机网络发展潜在客户', NULL, '不详', '', '', '...', NULL, 1, '网络', '2013-02-20 15:33:55', 0, 0, 0, 0, NULL, 0, NULL, 27, '<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">\r\n	年轻有为的程序员 Luke Thomas 不仅喜欢写程序，还十分上心与发展客户 / 用户的技巧。用他自己的话说，“让一个项目从企划成为现实真是太美妙了”。\r\n</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">\r\n	他认为，一个创业计划在上路的时候是最为艰难的，因为一切都还只是一片空白。对于如何通过网络渠道发展潜在客户，Luke 在博客中分享了自己的秘诀。 利用搜索引擎 Luke 推荐的是 Google 关键字工具（Google Adwords Keyword Tool）。假设有一位创业者想办一家车险公司，创业者在宣传中既可以说自己经营的是“汽车保险（car insurance）”，也可以说自己经营的是“车辆保险（auto insurance）”。\r\n</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">\r\n	Google 关键字工具提供的信息会显示，人们搜索“汽车保险（car insurance）”的次数比“车辆保险（auto insurance）”要多，所以选择前者更符合消费者的兴趣。 这种做法的理论依据是“使用消费者的惯用语言”。除了利用搜索引擎外，Luke 还推荐了阅读相关书籍、阅读业内博客、逛行业论坛、逛行业相关社交群组、与业内人士聚会等办法。\r\n</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">\r\n	鉴于国内的情况，Google 能帮上忙的地方可能不多，百度似乎没有提供类似于 Google 关键字工具的服务，但有一个“百度指数搜索”。通过这个工具我们可以获知，对 36 氪感兴趣的网友主要分布在北京、上海、广州、杭州，以男性居多（81.64%），他们多数是 IT 从业者，大部分人的年龄在 30 至 39 岁之间。 如何应用国内搜索引擎提供的数据服务帮助自己发展潜在客户 / 用户呢？大家可以摸索摸索。 利用社交网络的公共主页 Luke 认为，Facebook 等社交网络的兴起极大地简化了市场调研的过程。他举例，一个创业者准备入驻自主学习（Homeschool）行业，社交网络的公共主页就是他最好的市场信息来源。关注自主学习在 Facebook 上的粉丝页，可以看到这个组群里有超过 20000 人。他们最热议的话题是，应该选用哪一本教材。怎样，有灵感了吗？ Luke 表示，这些公共主页的价值不仅如此，你可以给群组内的成员发信息，与他们进一步沟通。你还可以一个一个地点开这些组内成员的个人主页，看看他们的兴趣所在，说不定会有惊人的发现。\r\n</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">\r\n	利用微博名人 Luke 建议创业者们去搜索一下自己行业内的 Twitter 名人，比如那个准备入驻自主学习行业的创业者就可以在 Twitter 上搜索 Homeschool，看看哪些名字在圈子里面是最有价值的。新浪微博也有搜索的功能，我们通过标签搜索“创业”，可以看到李开复、薛蛮子等人。 找到名人了然后呢，直接给他们发信息让对方 @你吗？当然不是。Luke 建议大家还是脚踏实地，一步一步来，先在小圈子内培养自己的名声，做出一定成果后再去联系他们。当你的名字出现在这些大咖的页面上，这就是很好的推广。 学会发信息找到若干潜在客户 / 用户后，如何经营和他们的关系，从他们身上获取可贵的市场信息呢？发一封电邮不乏为真诚且恰当的做法。邮件内容要简单，没有任何的导向性，这样获取的信息才不会有失偏颇。比如：在 XXX 领域，如果你有能力，你最愿意优化 ____？\r\n</p>\r\n<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">\r\n	假设你要上线一个网站，你可以直接发去两个网站入口，询问对方更加偏好哪一种。面对大量的采访信息，你可能需要借助于一些数据分析软件来帮助分析结论。 对于如何问问题，这里面有一些讲究。使用选择题会使答案受限于几个你预设的框架，而开放性问题容易答非所问。Luke 表示，自己曾向潜在客户咨询某领域的优化建议，结果对方回复他，该被优化的是 Safari 浏览器，这显然不是他要的结果。福特汽车创始人、让汽车普及的 Henry Ford 有名言：“如果我当时问大众需要什么，大家只会告诉我，他们要跑得更快的马儿。” 推己及人不论你采取哪种方法，请记住推己及人。与潜在客户交洽时把自己放在对方的位置上，让他们感到舒服。\r\n</p>', 19, NULL, 0, NULL, NULL, NULL, 0),
(60, '大米cms1.21发布', NULL, '不详', '', '新增： 1、入口页面UI美化 2、手机客户端访问识别。 3、非手机客户端访问用到某些功能时，提示安装客户端 修正： 1、入口页布局 2、个人中心页布局 3、图片云上传机制优化。', '新增...', NULL, 1, '网络', '2014-11-24 18:25:18', 0, 0, 0, 0, NULL, 1, NULL, 29, '<p style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">新增： 1、入口页面UI美化 2、手机客户端访问识别。 3、非手机客户端访问用到某些功能时，提示安装客户端 修正： 1、入口页布局 2、个人中心页布局 3、图片云上传机制优化。</p>', 20, NULL, 0, NULL, NULL, NULL, 0),
(72, '测试测试哈哈哈', NULL, '不详', '', '', 'dfdfsfdfdfdfdfdff\r\n\r\n\r\n	中文测试\r\n\r\n\r\n	\r\n\r\n\r\n	牛人\r\n\r\n\r\n	dfdfdsf...', NULL, 1, '网络', '2013-02-27 14:32:57', 0, 0, 0, 0, NULL, 0, NULL, 26, '<p>\r\n	dfdfsfdfdfdfdfdff\r\n</p>\r\n<p>\r\n	中文测试\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	牛人\r\n</p>\r\n<p>\r\n	dfdfdsf\r\n</p>', 19, NULL, 0, NULL, NULL, NULL, 0),
(61, '大米CMS手机客户端1.2发布', NULL, '不详', '', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试...', NULL, 1, '网络', '2013-02-20 15:34:59', 0, 0, 0, 0, NULL, 0, NULL, 47, '测试测试测试测试测试测试测试测试<span style="white-space:normal;">测试测试测试测试测试测试测试测试<span style="white-space:normal;">测试测试测试测试测试测试测试测试<span style="white-space:normal;">测试测试测试测试测试测试测试测试<span style="white-space:normal;">测试测试测试测试测试测试测试测试</span></span></span></span>', 20, NULL, 0, NULL, NULL, NULL, 0),
(62, '公司公告内测1', NULL, '未知', '', '', '', NULL, 1, '', '2013-02-20 15:35:50', 0, 0, 0, 0, NULL, 0, 0, 17, '<span style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1 公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1 公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1 公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1公司公告内测1</span>', 21, 0, 0, NULL, NULL, NULL, 0),
(63, '大米CMS全新UI内测中', NULL, '未知', '', '大米CMS为改进用户体验，全面更新UI，内测中，在使用的过程中，可能会遇到一些问题，我们会在后续的版本解决。 如果有你建议，请到我们团队论坛中留言。 http://www.damicms.com/bb', '...', NULL, 1, '', '2013-02-20 15:36:17', 0, 0, 0, 0, NULL, 0, NULL, 15, '<span style="color:#333333;font-family:Helvetica, Arial, sans-serif;font-size:medium;line-height:normal;background-color:#f9f9f9;">大米CMS为改进用户体验，全面更新UI，内测中，在使用的过程中，可能会遇到一些问题，我们会在后续的版本解决。 如果有你建议，请到我们团队论坛中留言。 http://www.damicms.com/bbs</span>', 21, NULL, 0, NULL, NULL, NULL, 0),
(66, '测试产品', NULL, '未知', '', '型号: 价格：面议 颜色:', 'android开发android开发android开发a...', NULL, 1, '', '2014-02-24 09:57:45', 0, 0, 0, 1, '/Public/Uploads/thumb/thumb_1393207060.jpg', 0, NULL, 66, 'android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发<span style="white-space:normal;">android开发</span></span></span></span></span></span></span></span></span></span></span></span></span></span>', 24, NULL, 1, '4000', '灰色', 'M002457J', 0),
(68, '招聘PHP开发人员', NULL, '未知', '', '待遇4K-6k名额:2', '...', NULL, 1, '', '2013-02-20 15:46:25', 0, 0, 0, 0, NULL, 0, NULL, 9, '<h3 class="ui-li-heading" style="font-size:16px;margin:0.6em 0px;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;color:#333333;font-family:Helvetica, Arial, sans-serif;line-height:normal;"><span style="font-size:12px;font-weight:normal;">精通PHP +mysql开发，至少熟练掌握一个框架！有项目开发经验</span></h3>', 25, NULL, 0, NULL, NULL, NULL, 0),
(69, '大米CMS手机开发专版', NULL, '未知', '大米测试', '型号: 价格：面议 颜色:', '大米CMS手机开发专版大米CMS手机开发专版大米CMS手机开发专版大米CMS手机开发专版...', NULL, 1, '', '2014-02-24 09:56:18', 0, 0, 0, 1, '/Public/Uploads/thumb/thumb_1393206337.jpg', 1, NULL, 23, '大米CMS手机开发专版大米CMS手机开发专版大米CMS手机开发专版大米CMS手机开发专版', 23, NULL, 1, '5400', '灰色', 'M002456J', 0),
(70, '大米手机CMS', NULL, '未知', '', '型号: 价格：面议 颜色:', 'PHP项目开发...', NULL, 1, '', '2014-02-24 13:05:48', 0, 0, 0, 1, '/Public/Uploads/thumb/thumb_1393218295.jpg', 0, NULL, 260, 'PHP项目开发', 23, NULL, 1, '5400', '灰色', 'M002458J', 0),
(124, '联系我们', NULL, '未知', '', '联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们', '联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们', NULL, 1, '', '2014-02-24 13:40:19', 0, 0, 0, 0, NULL, 0, 0, 4, '联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们', 35, 0, 0, NULL, NULL, NULL, 0),
(125, '测试案例', NULL, '不详', '', '测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例', '测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例', NULL, 1, '网络', '2014-02-24 14:32:58', 0, 0, 0, 1, '/Public/Uploads/thumb/thumb_1393223678.jpg', 0, 0, 5, '测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例测试案例', 34, 0, 0, NULL, NULL, NULL, 0),
(126, '测试产品案例', NULL, '不详', '', '测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例', '测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例', NULL, 1, '网络', '2014-02-24 14:35:37', 0, 0, 0, 1, '/Public/Uploads/thumb/thumb_1393223761.jpg', 0, 0, 17, '测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例测试产品案例', 34, 0, 0, NULL, NULL, NULL, 0),
(127, '大米测试产品', NULL, '未知', 'xxx', '测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2', '测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2...', NULL, 1, '', '2014-11-24 15:52:11', 0, 1, 1, 1, '/Public/Uploads/thumb/thumb_1393218295.jpg', 1, NULL, 655, '测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2测试产品2', 23, NULL, 0, '6000', '灰色', 'M002458J', 0),
(129, 'xxxxxxx', NULL, '未知', '', 'sdfss', 'sdfss', NULL, 1, '', '2014-11-24 15:43:03', 0, 0, 0, 0, NULL, 0, 0, 2, 'sdfss', 15, 0, 0, NULL, NULL, NULL, 0),
(130, 'CMS', NULL, '未知', '', 'CMS', 'CMSCMSCMSCMSCMSCMS', NULL, 1, '', '2014-11-24 18:28:22', 0, 0, 1, 1, '/Public/Uploads/thumb/thumb_1416824886.jpg', 0, 0, 96, 'CMSCMSCMSCMSCMSCMS', 23, 0, 0, '200', '灰色', 'CMS', 0),
(131, 'CMS幻灯', NULL, '未知', '', 'CMS幻灯', 'CMS幻灯CMS幻灯CMS幻灯CMS幻灯CMS幻灯CMS幻灯CMS幻灯', NULL, 1, '', '2014-11-24 18:29:27', 0, 0, 0, 1, '/Public/Uploads/thumb/thumb_1416824955.jpg', 1, 0, 964, 'CMS幻灯CMS幻灯CMS幻灯CMS幻灯CMS幻灯CMS幻灯CMS幻灯', 23, 0, 0, 'CMS幻灯', 'CMS幻灯', 'CMS幻灯', 0),
(132, '公司大boss', NULL, '不详', '', '公司大boss', '公司大boss', NULL, 1, '网络', '2014-11-26 16:34:56', 0, 1, 1, 1, '/Public/Uploads/thumb/thumb_1416990920.jpg', 1, 0, 10, '公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss公司大boss[dami_page]', 37, 0, 0, NULL, NULL, NULL, 0);




CREATE TABLE IF NOT EXISTS `t_banner` (
  `typeid` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `isindex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `indexnum` tinyint(2) unsigned NOT NULL,
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `isuser` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `readme` varchar(255) NOT NULL,
  `drank` mediumint(5) unsigned NOT NULL,
  `irank` mediumint(5) NOT NULL,
  `fid` mediumint(5) unsigned NOT NULL,
  `path` varchar(128) NOT NULL,
  `show_fields` varchar(120) DEFAULT NULL,
  `list_path` varchar(250) DEFAULT 'list/list_default.html',
  `page_path` varchar(255) DEFAULT 'page/page_default.html',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `dami_type`
--

INSERT INTO `t_banner` (`typeid`, `typename`, `keywords`, `description`, `ismenu`, `isindex`, `indexnum`, `islink`, `url`, `isuser`, `target`, `readme`, `drank`, `irank`, `fid`, `path`, `show_fields`, `list_path`, `page_path`) VALUES
(14, '关于我们', '', '', 1, 0, 10, 0, '/index.php?s=lists/15', 0, 1, '', 1, 10, 0, '0', NULL, 'list/list_default.html', 'page/page_default.html'),
(15, '企业概况', '', '', 0, 0, 10, 0, '', 0, 1, '', 10, 10, 14, '0-14', '1|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0', 'list/list_default.html', 'page/page_default.html'),
(16, '企业文化', '', '', 0, 0, 10, 0, '', 0, 1, '', 10, 10, 14, '0-14', '1|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0', 'list/list_default.html', 'page/page_default.html'),
(17, '企业荣誉', '', '', 1, 1, 10, 0, '', 1, 1, '', 10, 10, 14, '0-14', '1|1|1|1|0|0|0|0|0|0|1|1|0|0|0|0', 'list/list_default.html', 'page/page_default.html'),
(18, '新闻中心', '', '', 1, 1, 10, 0, '', 1, 1, '', 2, 10, 0, '0', NULL, 'list/list_default.html', 'page/page_default.html'),
(19, '行业新闻', '', '', 0, 1, 10, 0, '', 1, 1, '', 10, 10, 18, '0-18', '1|0|0|1|1|1|0|0|0|0|1|1|1|1|0|0', 'list/list_default.html', 'page/page_default.html'),
(20, '公司新闻', '', '', 0, 1, 10, 0, '', 1, 1, '', 10, 10, 18, '0-18', '1|0|0|1|1|1|0|0|0|0|1|1|1|1|0|0', 'list/list_default.html', 'page/page_default.html'),
(21, '公司公告', '', '', 0, 1, 10, 0, '', 1, 1, '', 10, 10, 18, '0-18', '1|0|0|0|0|0|0|0|0|0|1|1|1|0|0|0', 'list/list_default.html', 'page/page_default.html'),
(22, '产品展示', '', '', 1, 1, 10, 0, '', 1, 1, '', 3, 10, 0, '0', NULL, 'list/list_product.html', 'page/page_product.html'),
(23, '移动互联网开发', '', '', 0, 1, 10, 0, '', 1, 1, '', 10, 10, 22, '0-22', '1|1|1|0|0|1|0|0|1|0|0|1|0|1|0|0', 'list/list_product.html', 'page/page_product.html'),
(24, 'JAVA软件开发', '', '', 0, 1, 10, 0, '', 1, 1, '', 10, 10, 22, '0-22', '1|1|1|0|0|1|0|0|1|0|0|1|0|1|0|0', 'list/list_product.html', 'page/page_product.html'),
(25, '招聘信息', '', '', 1, 1, 10, 0, '', 1, 1, '', 5, 10, 0, '0', '1|0|1|0|0|0|0|0|0|0|1|1|1|1|0|0', 'list/list_zhaoping.html', 'page/page_default.html'),
(26, '在线留言', '', '', 1, 1, 10, 1, '/index.php?s=guestbook', 1, 1, '', 10, 10, 0, '0', NULL, 'list/list_default.html', 'page/page_default.html'),
(27, '工程案例', '', '', 1, 1, 10, 0, '', 1, 1, '', 4, 10, 0, '0', NULL, 'list/list_product.html', 'page/page_default.html'),
(28, '网站案例', '', '', 0, 1, 10, 0, '', 1, 1, '', 10, 10, 27, '0-27', NULL, 'list/list_product.html', 'page/page_anli.html'),
(33, '安卓开发', '', '', 0, 1, 10, 0, '', 1, 1, '', 10, 10, 27, '0-27', NULL, 'list/list_product.html', 'page/page_anli.html'),
(35, '联系我们', '', '', 0, 0, 10, 0, '', 0, 1, '', 10, 10, 14, '0-14', '1|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0', 'list/list_default.html', 'page/page_default.html'),
(34, 'B/S软件', '', '', 0, 1, 10, 0, '', 1, 1, '', 10, 10, 27, '0-27', '1|1|1|1|1|1|0|0|1|0|1|1|1|1|1|0', 'list/list_product.html', 'page/page_anli.html'),
(36, '财经新闻', '', '', 0, 1, 10, 0, '', 1, 1, '', 10, 10, 19, '0-18-19', NULL, 'list/list_default.html', 'page/page_default.html'),
(37, '公司boss', 'xxx', 'xxxxxxxxxx', 1, 1, 10, 0, '', 1, 0, '', 10, 10, 14, '0-14', NULL, 'list/list_default.html', 'page/page_default.html');
