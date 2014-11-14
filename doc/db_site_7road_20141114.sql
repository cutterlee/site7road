/*
Navicat MySQL Data Transfer

Source Server         : 10.10.4.12
Source Server Version : 50612
Source Host           : 10.10.4.12:2433
Source Database       : db_site_7road

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2014-11-14 20:11:10
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_agent`
-- ----------------------------
DROP TABLE IF EXISTS `t_agent`;
CREATE TABLE `t_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '跟业务无关的主键',
  `order_num` int(11) DEFAULT '1' COMMENT '排序号',
  `agent_name` varchar(50) NOT NULL COMMENT '代理商名称',
  `agent_img` varchar(200) NOT NULL COMMENT '代理商的图片',
  `agent_url` varchar(200) DEFAULT NULL COMMENT '代理商的主页链接',
  `region_tag` varchar(50) NOT NULL COMMENT '所属区域',
  `item_status` int(11) NOT NULL DEFAULT '1' COMMENT '数据的状态 1为正常 -1为删除',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='代理商信息表';

-- ----------------------------
-- Records of t_agent
-- ----------------------------
INSERT INTO t_agent VALUES ('4', '1', 'xx', 'x', 'xx', 'xxx', '0', '2014-09-22 18:10:07');

-- ----------------------------
-- Table structure for `t_at_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_at_company`;
CREATE TABLE `t_at_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `item_status` int(11) NOT NULL,
  `title_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_summary` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信息简介',
  `content_info` text COLLATE utf8_unicode_ci,
  `type_tag` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `small_image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `big_image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q3t011lh9hcyfhsyi5fmbltvy` (`title_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_at_company
-- ----------------------------

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(200) DEFAULT NULL COMMENT '公司地址',
  `company_linkway` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `company_summary` text COMMENT '公司描述',
  `company_culture` varchar(100) DEFAULT NULL COMMENT '企业文化',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='公司信息表';

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO t_company VALUES ('1', '第七大道', '可信科学院', '07557987987', '真诚,创新,成果', '真诚,创新,成果');
INSERT INTO t_company VALUES ('11', '第八大道', '科兴科学园A栋', '07557987988', '真诚,创新,成果', '真诚,创新,成果');
INSERT INTO t_company VALUES ('12', '第九大道', '科兴科学园', '07557987989', '真诚,创新,成果', '真诚,创新,成果');
INSERT INTO t_company VALUES ('13', '第十大道', '科兴科学园', '07557987990', '真诚,创新,成果xxxxxxx的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的', '真诚,创新,成果');

-- ----------------------------
-- Table structure for `t_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父id',
  `config_type` tinyint(1) DEFAULT '1' COMMENT '配置的种类,1为系统配置,2为业务配置',
  `config_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '配置的key',
  `config_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '配置的标题',
  `config_remark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '配置的说明',
  `order_num` int(11) DEFAULT '1' COMMENT '排序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `item_status` int(11) NOT NULL DEFAULT '1' COMMENT '数据状态,1为正常,-1为删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q3t011lh9hcyfhsyi5fmbltvy` (`config_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO t_config VALUES ('1', '0', '1', 'work_city', '工作地点', '工作地点的可选城市', '1', '2014-11-10 11:41:28', '1');
INSERT INTO t_config VALUES ('2', '0', '1', 'work_property', '职位性质', '职位性质的列表', '2', '2014-11-10 13:05:59', '1');
INSERT INTO t_config VALUES ('3', '1', '1', 'work_city_sz', '深圳', '工作地点列表_深圳', '1', '2014-11-10 13:02:50', '1');
INSERT INTO t_config VALUES ('4', '1', '1', 'work_city_bj', '北京', '工作地点_北京', '2', '2014-11-10 13:03:19', '1');
INSERT INTO t_config VALUES ('5', '2', '1', 'work_property_js', '技术类', '职位性质_技术类', '1', '2014-11-10 13:03:55', '1');
INSERT INTO t_config VALUES ('6', '2', '1', 'work_property_ms', '美术类', '职位性质_美术', '2', '2014-11-10 13:04:29', '1');
INSERT INTO t_config VALUES ('7', '2', '1', 'work_property_ch', '策划类', '职位性质_策划', '3', '2014-11-10 13:05:12', '1');
INSERT INTO t_config VALUES ('8', '2', '1', 'work_property_zn', '职能类', '职位性质_职能', '4', '2014-11-10 13:05:59', '1');
INSERT INTO t_config VALUES ('9', '1', '1', 'config_key_1415863833327', '上海', '工作地点_上海', '3', '2014-11-13 15:31:20', '1');

-- ----------------------------
-- Table structure for `t_event`
-- ----------------------------
DROP TABLE IF EXISTS `t_event`;
CREATE TABLE `t_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` int(11) DEFAULT '1' COMMENT '排序号',
  `event_title` varchar(50) NOT NULL COMMENT '事件的标题',
  `publish_time` date NOT NULL COMMENT '事件发生的日期',
  `event_content_summary` longtext NOT NULL COMMENT '事件简介',
  `event_content_detail` longtext NOT NULL COMMENT '事件详细',
  `event_html_name` varchar(20) NOT NULL COMMENT '事件的html名称',
  `event_img_in_event_page` varchar(200) NOT NULL COMMENT '事件在列表页的图片',
  `item_status` int(11) NOT NULL DEFAULT '1' COMMENT '数据状态 1为正常 -1为删除',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_title` (`event_title`),
  UNIQUE KEY `unique_html_name` (`event_html_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事件信息表';

-- ----------------------------
-- Records of t_event
-- ----------------------------

-- ----------------------------
-- Table structure for `t_job`
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '跟业务无关的主键',
  `order_num` int(11) DEFAULT '1' COMMENT '排序号',
  `position_name` varchar(50) DEFAULT NULL COMMENT '职位名称',
  `position_need_num` int(11) NOT NULL COMMENT '所需人数',
  `position_place` varchar(20) DEFAULT NULL COMMENT '所在城市',
  `position_property` varchar(50) DEFAULT NULL COMMENT '职位性质',
  `position_duty` longtext COMMENT '职位职责',
  `position_requirement` longtext COMMENT '职位要求',
  `is_hot_job` tinyint(1) DEFAULT '0' COMMENT '是否热招职位 0标识不是 1标识热招',
  `item_status` int(11) NOT NULL DEFAULT '1' COMMENT '数据的状态 1 可用 -1 删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mrmoe48dhh7xbmxl4gyvi33t3` (`position_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='招聘职位表';

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO t_job VALUES ('3', '1', 'java服务器端开发工程师', '10', '深圳', '技术', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">1.依据游戏设计大纲，负责完成游戏核心玩法、世界观、剧情的设计；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">2.根据游戏世界观进行游戏整体剧情及衍生文案编写；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">3.依据游戏核心玩法完成衍生系统设计，包括场景、关卡、角色、装备等</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">4.完成相关系统策划案，确保策划案的可行性以及合理性；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">5.负责系统功能开发期间的制作跟进，与相关部门沟通协调，保证制作内容与设计方案的一致性；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">6.负责部分系统脚本的撰写，及数值体验的设计</p><p><br/></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">1.大专以上学历；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">2.丰富的游戏经验，至少3年以上网络游戏经验，对各类型的游戏都有丰富的认识；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">3.2年以上游戏系统策划经验，熟悉游戏开发的流程和方法；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">4.工作严谨，拥有较优秀的口头表达能力和清晰的逻辑思维能力；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">5.熟练使用ms office办公软件，熟悉脚本程序。</p><p><br/></p>', '1', '0', '2014-11-10 09:37:16');
INSERT INTO t_job VALUES ('6', '2', 'C#软件工程师', '10', '深圳', '技术类', '<p><span style=\"font-family: 宋体, &#39;Courier New&#39;; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">1、行业动态跟踪：行业解决方案规划、设计、完善输出系统概要设计、详细设计及行业解决方案等文档；&nbsp;</span><br style=\"font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"font-family: 宋体, &#39;Courier New&#39;; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">2、行业客户应用软件的编码开发；&nbsp;</span><br style=\"font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"font-family: 宋体, &#39;Courier New&#39;; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">3、编写开发文档、测试用例，配合测试人员对系统进行阶段测试与详细测试，提交相关开发文档和测试说明；&nbsp;</span><br style=\"font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"font-family: 宋体, &#39;Courier New&#39;; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">4、根据客户需求对程序进行功能开发与扩展等工作；&nbsp;</span><br style=\"font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"font-family: 宋体, &#39;Courier New&#39;; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);\">5、根据研发部制定的培训计划，接受必要的专业培训学习并对公司内部或客户进行培训，以提高自身的业务能力与交流能力，从而提高部门软件的研发实力；</span></p>', '<p style=\"font-size: 12px; margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 18px; font-family: 宋体, &#39;Courier New&#39;; white-space: normal; background-color: rgb(255, 255, 255);\">1、本科及以上学历，软件工程/电子工程/自动化或计算机科学与技术等相关专业；&nbsp;<br/>2、两年以上C# 开发经验。&nbsp;<br/>3、熟练WEB应用开发（B/S）或，应用软件开发(C/S)&nbsp;<br/>4、对GIS服务开发经验；&nbsp;<br/>5、精通SQL，熟练使用SQLServer，&nbsp;<br/>6、了解WPF、devExpress控件、网络通信、多线程等开发。&nbsp;<br/>7、对EXTJS、EXTASPNET或美工方面有经验者优先；&nbsp;<br/>8、理解用户需求，能够针对需求编写概要设计和详细设&nbsp;<br/>9、熟悉软件开发控制程序、软件工作流程、软件工程设计规范、软件标准化、OOA、OOD者优先；</p><p style=\"font-size: 12px; margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 18px; font-family: 宋体, &#39;Courier New&#39;; white-space: normal; background-color: rgb(255, 255, 255);\">10、责任心强， 良好的职业道德；&nbsp;<br/>11、工作细致认真，沟通领悟能力强；&nbsp;<br/>12、正直、诚实、具有较强的团队合作精神；</p><p><br/></p>', '1', '0', '2014-11-10 09:38:46');
INSERT INTO t_job VALUES ('12', '5', 'unity3d特效设计师', '100', '深圳', '技术类', '1.设计制作游戏中角色的技能、特效等各种效果；\r\n2.设计制作游戏中场景、动画、光效、爆炸、燃烧、等特殊效果；\r\n3.设计制作游戏中道具及其他效果。', '1.熟练运用3DSMax.U3D.等软件；\r\n2.够根据游戏画面或视频分析出特效分层并再现其效果；\r\n3.有游戏创造激情，具备良好的沟通能力和优秀的团队协作能力,有责任感。', '1', '0', '2014-11-07 21:36:49');
INSERT INTO t_job VALUES ('13', '7', '系统策划', '10', '深圳', '设计', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">1.依据游戏设计大纲，负责完成游戏核心玩法、世界观、剧情的设计；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">2.根据游戏世界观进行游戏整体剧情及衍生文案编写；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">3.依据游戏核心玩法完成衍生系统设计，包括场景、关卡、角色、装备等</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">4.完成相关系统策划案，确保策划案的可行性以及合理性；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">5.负责系统功能开发期间的制作跟进，与相关部门沟通协调，保证制作内容与设计方案的一致性；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">6.负责部分系统脚本的撰写，及数值体验的设计</p><p><br/></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">1.大专以上学历；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">2.丰富的游戏经验，至少3年以上网络游戏经验，对各类型的游戏都有丰富的认识；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">3.2年以上游戏系统策划经验，熟悉游戏开发的流程和方法；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">4.工作严谨，拥有较优秀的口头表达能力和清晰的逻辑思维能力；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">5.熟练使用ms office办公软件，熟悉脚本程序。</p><p><br/></p>', '1', '0', '2014-11-07 21:38:03');
INSERT INTO t_job VALUES ('14', '8', 'flash动画设计师', '10', '深圳', '美术设计', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">1.根据游戏原画设计图，制作游戏的场景建筑、自然物件的建模与贴图；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">2.能进行一些简单的道具模型制作。</p><p><br/></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">1.艺术专业类院校毕业；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">2.爱好动漫、游戏，有创意，感觉好，富于想象力和创造力；思维活跃、富有创意、 充满激情，有承受工作压力的能力；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">3.美术相关专业专科及以上学历，良好的美术基础。有1年以上3D场景工作经验；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">4.熟悉3DMAX、Maya等软件，能熟练完成建模、材质的制作；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">5.具备较强手绘贴图能力，熟练使用Photoshop, Painter等至少一个专业绘图软件；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">6.具有良好的团队合作精神及沟通能力；勤奋务实的工作作风，认真负责的工作态度；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">7.应聘者须提供个人作品。1、负责角色与各类怪物的动作设计与制作，力求达到流畅、合理、有创意。</p><p><br/></p>', '1', '0', '2014-11-07 22:10:16');
INSERT INTO t_job VALUES ('15', '6', 'UI设计师', '10', '深圳', '美术类', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">1. 从事游戏项目中各种交互界面、图标图素的相关设计与制作</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">2. 根据游戏风格，参与UI风格评审会，提供UI设计方向建议，最终确定游戏LOGO、交互界面、图标等设计标准；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">3. 根据界面风格，设计相对应的图标；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">4. 参与UI设计工具的开发和评审。</p><p><br/></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">1. 2年以上游戏UI设计工作经验，交互、艺术设计类专业毕业;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">2. 精通Photoshop、flash、Illustrator等相关图形设计软件</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">3. 具备优秀的视觉设计功底，有创作激情和丰富的想象力，善于把握多种视觉风格，执着追求多种艺术表现力。对于色彩和线条的搭配以及细节有良好的处理能力，对于各种风格界面色彩如何搭配有深入的认识，具备整合游戏UI风格方向及所有质感结构层次的处理能力；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; color: rgb(119, 119, 119); font-family: 宋体, Tahoma, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;\">4. 简历请添加作品，大小6M以内。</p><p><br/></p>', '1', '0', '2014-11-10 09:40:29');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` int(11) DEFAULT '1' COMMENT '顺序号',
  `pro_type` int(11) NOT NULL DEFAULT '0' COMMENT '产品类型',
  `pro_name` varchar(20) DEFAULT NULL COMMENT '产品名称',
  `pro_title` varchar(100) NOT NULL COMMENT '产品标题',
  `pro_website_url` varchar(100) DEFAULT NULL COMMENT '产品站点链接',
  `pro_play_url` varchar(200) DEFAULT NULL COMMENT '产品使用链接',
  `pro_html_name` varchar(20) DEFAULT NULL COMMENT '产品的html名称',
  `pro_img_in_product` varchar(200) DEFAULT NULL COMMENT '产品页的图片链接',
  `pro_short_desc` varchar(2000) DEFAULT NULL COMMENT '产品简介',
  `pro_detail_desc` longtext COMMENT '产品详细信息',
  `index_img_url` varchar(200) DEFAULT NULL COMMENT '首页图片',
  `index_img_link` varchar(200) DEFAULT NULL COMMENT '首页轮播的图片链接',
  `index_game_short` varchar(100) DEFAULT NULL COMMENT '首页轮播的简单文字',
  `index_game_detail` varchar(200) DEFAULT NULL COMMENT '首页轮播的详细文字',
  `index_order` int(11) DEFAULT '1' COMMENT '首页轮播的排序号',
  `update_time` datetime DEFAULT '2013-01-01 00:00:00' COMMENT '数据修改时间',
  `item_status` int(11) DEFAULT '1' COMMENT '数据的状态1 正常  -1删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4lf9gkwiteqhjqqr8ak8id5m3` (`pro_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品信息表';

-- ----------------------------
-- Records of t_product
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '-1' COMMENT '父id',
  `res_name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `res_icon` varchar(20) DEFAULT 'icon-man' COMMENT '资源的图标',
  `res_summary` varchar(500) DEFAULT NULL COMMENT '权限说明',
  `res_type` tinyint(1) DEFAULT '1' COMMENT '资源的类型分为menu(1菜单,用来导航),page(2页面显示,导航),service(3接口,限定功能的使用)',
  `shiro_permission` varchar(100) DEFAULT NULL COMMENT 'shiro的权限字符串 usr:index',
  `res_url` varchar(200) DEFAULT NULL COMMENT '权限url',
  `order_num` int(11) DEFAULT NULL COMMENT '序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `item_status` tinyint(1) DEFAULT '1' COMMENT '数据的状态 1为正常,2为删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO t_resource VALUES ('1', '0', '公司官网', 'icon-computer', '公司官网', '1', null, '0', '2', '2014-11-14 16:55:52', '1');
INSERT INTO t_resource VALUES ('3', '1', '站点配置', 'icon-edit', '公司官网的站点配置', '1', null, '/siteConfig/index', '1', '2014-09-16 18:20:02', '1');
INSERT INTO t_resource VALUES ('4', '1', '公司信息', 'icon-save', '公司的基本信息管理', '1', null, '/companyInfo/index', '2', '2014-09-16 18:19:42', '1');
INSERT INTO t_resource VALUES ('5', '1', '职位信息', 'icon-man', '招贤纳士', '1', null, '/job/index', '3', '2014-11-07 21:26:42', '1');
INSERT INTO t_resource VALUES ('6', '1', '公司大事件', 'icon-man', '公司大事件', '1', null, '/event/index', '5', '2014-09-15 18:01:03', '1');
INSERT INTO t_resource VALUES ('7', '1', '代理商', 'icon-man', '代理商', '1', null, '/agent/index', '6', '2014-09-15 18:01:37', '1');
INSERT INTO t_resource VALUES ('8', '1', '人在七道', 'icon-door', '人在七道', '1', null, '0', '7', '2014-11-14 17:09:16', '1');
INSERT INTO t_resource VALUES ('9', '8', '工作环境', 'icon-man', '工作环境', '1', null, '/road7/evn/index', '1', '2014-09-16 16:51:37', '1');
INSERT INTO t_resource VALUES ('10', '8', '七道生活', 'icon-man', '七道生活', '1', null, '/road7/life/index', '2', '2014-09-16 16:57:21', '1');
INSERT INTO t_resource VALUES ('11', '8', '生活花絮', 'icon-man', '生活花絮', '1', null, '/road7/titbits/index', '3', '2014-09-16 16:57:29', '1');
INSERT INTO t_resource VALUES ('12', '8', '培训发展', 'icon-man', '培训发展', '1', null, '/road7/train/index', '4', '2014-09-16 16:57:35', '1');
INSERT INTO t_resource VALUES ('13', '8', '视频专区', 'icon-man', '视频专区', '1', null, '/road7/video/index', '5', '2014-09-16 16:57:45', '1');
INSERT INTO t_resource VALUES ('14', '0', '系统模块', 'icon-lock', '系统模块', '1', null, '1', '1', '2014-11-14 16:45:13', '1');
INSERT INTO t_resource VALUES ('15', '14', '用户管理', 'icon-man', '用户管理', '1', 'usr:index', '/usr/index', '1', '2014-11-14 18:32:24', '1');
INSERT INTO t_resource VALUES ('16', '14', '角色管理', 'icon-man', '角色管理', '1', null, '/role/index', '2', '2014-09-15 18:09:49', '1');
INSERT INTO t_resource VALUES ('17', '14', '权限管理', 'icon-sum', '权限管理', '1', null, '/auth/index', '3', '2014-10-20 13:45:45', '1');
INSERT INTO t_resource VALUES ('18', '14', '站点管理', 'icon-man', '站点管理', '1', null, '/site/index', '5', '2014-11-13 14:23:59', '1');
INSERT INTO t_resource VALUES ('19', '14', '配置信息', 'icon-man', '配置信息', '1', null, '/config/index', '4', '2014-11-13 14:23:50', '1');
INSERT INTO t_resource VALUES ('20', '14', '日志管理', 'icon-man', '日志管理', '1', null, '/log/index', '6', '2014-09-15 18:12:05', '1');
INSERT INTO t_resource VALUES ('21', '0', '招聘中心', 'icon-tv', '招聘中心', '1', null, '0', '3', '2014-11-14 16:56:16', '1');
INSERT INTO t_resource VALUES ('22', '21', '首页轮播图', 'icon-man', '首页轮播图', '1', null, '/indexImg/index', '1', '2014-09-15 18:16:39', '1');
INSERT INTO t_resource VALUES ('23', '21', '走进七道轮播图', 'icon-man', '走进七道轮播图', '1', null, '/life7road/index', '2', '2014-09-15 18:17:28', '1');
INSERT INTO t_resource VALUES ('24', '21', '招聘动态', 'icon-man', '招聘动态', '1', null, '/job/trend/index', '3', '2014-09-15 18:19:00', '1');
INSERT INTO t_resource VALUES ('25', '21', '职位申请', 'icon-man', '职位申请', '1', null, '/job/apply/index', '4', '2014-09-15 18:18:47', '1');
INSERT INTO t_resource VALUES ('26', '0', '微信公众号', 'icon-cup', '微信公众号', '1', null, '0', '4', '2014-11-14 16:56:25', '1');
INSERT INTO t_resource VALUES ('27', '26', '菜单管理', 'icon-man', '菜单管理', '1', null, '/menu/index', '1', '2014-09-15 18:24:11', '1');
INSERT INTO t_resource VALUES ('28', '26', '消息管理', 'icon-man', '消息管理', '1', null, '/msg/index', '2', '2014-09-15 18:24:33', '1');
INSERT INTO t_resource VALUES ('29', '15', '增加用户', 'icon-man', '页面上的增加用户', '1', null, '/usr/create', '1', '2014-11-14 18:26:29', '1');
INSERT INTO t_resource VALUES ('30', '15', '保存用户', 'icon-save', '保存用户信息', '3', null, '/usr/save', '2', '2014-11-13 14:18:09', '1');
INSERT INTO t_resource VALUES ('31', '15', '编辑用户', 'icon-edit', '页面上的编辑用户', '2', null, '/usr/modify', '3', '2014-11-13 14:20:37', '1');
INSERT INTO t_resource VALUES ('32', '15', '删除用户', 'icon-cancel', '删除用户信息对应的接口', '3', null, '/usr/remove', '4', '2014-11-13 14:21:52', '1');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_summary` varchar(500) DEFAULT NULL COMMENT '角色描述',
  `last_modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `site_id` int(11) DEFAULT NULL COMMENT '所属站点',
  `function_set_str` text COMMENT '拥有的权限集合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO t_role VALUES ('1', '系统管理员', '系统管理员,拥有系统的所有权限', '2014-11-10 17:40:45', '1', null);
INSERT INTO t_role VALUES ('2', '招聘专员', '招聘专员', '2014-11-13 17:21:08', null, null);

-- ----------------------------
-- Table structure for `t_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE `t_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `resource_id` int(11) DEFAULT NULL COMMENT '资源id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_resource
-- ----------------------------
INSERT INTO t_role_resource VALUES ('78', '1', '14', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('79', '1', '15', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('80', '1', '16', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('81', '1', '17', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('82', '1', '18', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('83', '1', '19', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('84', '1', '20', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('85', '1', '1', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('86', '1', '3', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('87', '1', '4', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('88', '1', '5', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('89', '1', '6', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('90', '1', '7', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('91', '1', '8', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('92', '1', '9', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('93', '1', '10', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('94', '1', '11', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('95', '1', '12', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('96', '1', '13', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('97', '1', '21', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('98', '1', '22', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('99', '1', '23', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('100', '1', '24', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('101', '1', '25', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('102', '1', '26', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('103', '1', '27', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('104', '1', '28', '2014-11-12 19:46:04');
INSERT INTO t_role_resource VALUES ('105', '2', '21', '2014-11-13 17:21:16');
INSERT INTO t_role_resource VALUES ('106', '2', '22', '2014-11-13 17:21:16');
INSERT INTO t_role_resource VALUES ('107', '2', '23', '2014-11-13 17:21:16');
INSERT INTO t_role_resource VALUES ('108', '2', '24', '2014-11-13 17:21:16');
INSERT INTO t_role_resource VALUES ('109', '2', '25', '2014-11-13 17:21:16');

-- ----------------------------
-- Table structure for `t_site`
-- ----------------------------
DROP TABLE IF EXISTS `t_site`;
CREATE TABLE `t_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `site_alias` varchar(20) DEFAULT NULL COMMENT '站点简称',
  `site_name` varchar(50) DEFAULT NULL COMMENT '站点名称',
  `site_url` varchar(200) DEFAULT NULL COMMENT '站点的url',
  `site_dir` varchar(500) DEFAULT NULL COMMENT '站点的资源目录',
  `site_icon` varchar(200) DEFAULT NULL COMMENT '站点图标',
  `static_url` varchar(200) DEFAULT NULL COMMENT '静态资源域名',
  `static_dir` varchar(500) DEFAULT NULL COMMENT '静态资源的目录',
  `template_dir` varchar(500) DEFAULT NULL COMMENT '模版的根目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='站点信息表';

-- ----------------------------
-- Records of t_site
-- ----------------------------
INSERT INTO t_site VALUES ('1', '1', 'site7road', '公司官网', 'http://www.7road.com', '/data/www/webpage', 'http://static.7road.com/464646.png', 'http://static.7road.com', '/data/www/static', '/data/www/web/WEB-INF/template');
INSERT INTO t_site VALUES ('2', '1', 'ddt', '弹弹堂官网', 'http://ddt.7road.com', 'xxxx', 'http://static.7road.com', 'http://ddt.static.7road.com', 'xxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxx');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(50) DEFAULT NULL COMMENT '密码',
  `pass_salt` varchar(20) DEFAULT NULL COMMENT '密码盐',
  `nick_name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `user_email` varchar(200) DEFAULT NULL COMMENT '邮件地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_ip` varchar(30) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `login_times` int(11) DEFAULT NULL COMMENT '登录次数',
  `user_status` tinyint(1) DEFAULT '2' COMMENT ' 用户的状态 1 审核通过  2 暂未审核  3冻结 ',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id集合字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO t_user VALUES ('3', 'anyelangwang', 'abcabcabc', null, '李福春', 'cutter.li@7road.com', '2014-09-15 00:00:00', '0:0:0:0:0:0:0:1', '2014-11-14 19:47:03', '239', '1', '1');
INSERT INTO t_user VALUES ('7', 'helijun', 'abcabcabc', null, '二货媳妇', 'helijun@7road.com', '2014-11-13 00:00:00', '0:0:0:0:0:0:0:1', '2014-11-13 17:43:29', '1', '1', '1');
INSERT INTO t_user VALUES ('9', 'admin7road', 'abcabcabc', null, 'admin', 'admin@7road.com', '2014-11-13 00:00:00', '0:0:0:0:0:0:0:1', '2014-11-13 17:42:40', '1', '1', '2');
