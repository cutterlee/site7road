/*
Navicat MySQL Data Transfer

Source Server         : 10.10.4.12
Source Server Version : 50612
Source Host           : 10.10.4.12:2433
Source Database       : db_site_7road

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2014-10-11 19:18:39
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='代理商信息表';

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_at_company
-- ----------------------------

-- ----------------------------
-- Table structure for `t_company_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_company_info`;
CREATE TABLE `t_company_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(200) DEFAULT NULL COMMENT '公司地址',
  `company_linkway` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `company_summary` text COMMENT '公司描述',
  `company_culture` varchar(100) DEFAULT NULL COMMENT '企业文化',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='公司信息表';

-- ----------------------------
-- Records of t_company_info
-- ----------------------------
INSERT INTO t_company_info VALUES ('1', '第七大道', '可信科学院', '07557987987', '真诚,创新,成果', '真诚,创新,成果');
INSERT INTO t_company_info VALUES ('11', '第八大道', '科兴科学园A栋', '07557987988', '真诚,创新,成果', '真诚,创新,成果');
INSERT INTO t_company_info VALUES ('12', '第九大道', '科兴科学园', '07557987989', '真诚,创新,成果', '真诚,创新,成果');
INSERT INTO t_company_info VALUES ('13', '第十大道', '科兴科学园', '07557987990', '真诚,创新,成果xxxxxxx的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的对的', '真诚,创新,成果');

-- ----------------------------
-- Table structure for `t_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `item_status` int(11) NOT NULL,
  `key_tag` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_words` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `english_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q3t011lh9hcyfhsyi5fmbltvy` (`key_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_config
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='事件信息表';

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='招聘职位表';

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO t_job VALUES ('3', '1', 'java开发工程师', '10', '深圳', '技术', 'java开发工程师java开发工程师java开发工程师', 'java开发工程师java开发工程师java开发工程师java开发工程师', '1', '0', '2014-09-19 17:15:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='产品信息表';

-- ----------------------------
-- Records of t_product
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resource_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_info`;
CREATE TABLE `t_resource_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '-1' COMMENT '父id',
  `res_name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `res_icon` varchar(20) DEFAULT 'icon-man' COMMENT '资源的图标',
  `res_summary` varchar(500) DEFAULT NULL COMMENT '权限说明',
  `res_url` varchar(200) DEFAULT NULL COMMENT '权限url',
  `order_no` int(11) DEFAULT NULL COMMENT '序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource_info
-- ----------------------------
INSERT INTO t_resource_info VALUES ('1', '0', '公司官网', 'icon-man', '公司官网', '0', '1', '2014-09-16 12:12:45');
INSERT INTO t_resource_info VALUES ('3', '1', '站点配置', 'icon-edit', '公司官网的站点配置', '/siteConfig/index', '1', '2014-09-16 18:20:02');
INSERT INTO t_resource_info VALUES ('4', '1', '公司信息', 'icon-save', '公司的基本信息管理', '/companyInfo/index', '2', '2014-09-16 18:19:42');
INSERT INTO t_resource_info VALUES ('5', '1', '招贤纳士', 'icon-search', '招贤纳士', '/job/index', '3', '2014-09-16 18:50:45');
INSERT INTO t_resource_info VALUES ('6', '1', '公司大事件', 'icon-man', '公司大事件', '/event/index', '5', '2014-09-15 18:01:03');
INSERT INTO t_resource_info VALUES ('7', '1', '代理商', 'icon-man', '代理商', '/agent/index', '6', '2014-09-15 18:01:37');
INSERT INTO t_resource_info VALUES ('8', '1', '人在七道', 'icon-man', '人在七道', '0', '7', '2014-09-15 18:02:27');
INSERT INTO t_resource_info VALUES ('9', '8', '工作环境', 'icon-man', '工作环境', '/road7/evn/index', '1', '2014-09-16 16:51:37');
INSERT INTO t_resource_info VALUES ('10', '8', '七道生活', 'icon-man', '七道生活', '/road7/life/index', '2', '2014-09-16 16:57:21');
INSERT INTO t_resource_info VALUES ('11', '8', '生活花絮', 'icon-man', '生活花絮', '/road7/titbits/index', '3', '2014-09-16 16:57:29');
INSERT INTO t_resource_info VALUES ('12', '8', '培训发展', 'icon-man', '培训发展', '/road7/train/index', '4', '2014-09-16 16:57:35');
INSERT INTO t_resource_info VALUES ('13', '8', '视频专区', 'icon-man', '视频专区', '/road7/video/index', '5', '2014-09-16 16:57:45');
INSERT INTO t_resource_info VALUES ('14', '0', '系统模块', 'icon-man', '系统模块', '0', '2', '2014-09-15 18:06:09');
INSERT INTO t_resource_info VALUES ('15', '14', '用户管理', 'icon-man', '用户管理', '/usr/index', '1', '2014-09-15 18:09:30');
INSERT INTO t_resource_info VALUES ('16', '14', '角色管理', 'icon-man', '角色管理', '/role/index', '2', '2014-09-15 18:09:49');
INSERT INTO t_resource_info VALUES ('17', '14', '权限管理', 'icon-man', '权限管理', '/auth/index', '3', '2014-09-15 18:10:48');
INSERT INTO t_resource_info VALUES ('18', '14', '站点管理', 'icon-man', '站点管理', '/site/index', '4', '2014-09-15 18:11:13');
INSERT INTO t_resource_info VALUES ('19', '14', '配置管理', 'icon-man', '配置管理', '/config/index', '5', '2014-09-15 18:11:49');
INSERT INTO t_resource_info VALUES ('20', '14', '日志管理', 'icon-man', '日志管理', '/log/index', '6', '2014-09-15 18:12:05');
INSERT INTO t_resource_info VALUES ('21', '0', '招聘中心', 'icon-man', '招聘中心', '0', '3', '2014-09-15 18:15:18');
INSERT INTO t_resource_info VALUES ('22', '21', '首页轮播图', 'icon-man', '首页轮播图', '/indexImg/index', '1', '2014-09-15 18:16:39');
INSERT INTO t_resource_info VALUES ('23', '21', '走进七道轮播图', 'icon-man', '走进七道轮播图', '/life7road/index', '2', '2014-09-15 18:17:28');
INSERT INTO t_resource_info VALUES ('24', '21', '招聘动态', 'icon-man', '招聘动态', '/job/trend/index', '3', '2014-09-15 18:19:00');
INSERT INTO t_resource_info VALUES ('25', '21', '职位申请', 'icon-man', '职位申请', '/job/apply/index', '4', '2014-09-15 18:18:47');
INSERT INTO t_resource_info VALUES ('26', '0', '微信公众号', 'icon-man', '微信公众号', '0', '4', '2014-09-15 18:23:48');
INSERT INTO t_resource_info VALUES ('27', '26', '菜单管理', 'icon-man', '菜单管理', '/menu/index', '1', '2014-09-15 18:24:11');
INSERT INTO t_resource_info VALUES ('28', '26', '消息管理', 'icon-man', '消息管理', '/msg/index', '2', '2014-09-15 18:24:33');

-- ----------------------------
-- Table structure for `t_role_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_info`;
CREATE TABLE `t_role_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_summary` varchar(500) DEFAULT NULL COMMENT '角色描述',
  `last_modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `site_id` int(11) DEFAULT NULL COMMENT '所属站点',
  `function_set_str` text COMMENT '拥有的权限集合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role_info
-- ----------------------------
INSERT INTO t_role_info VALUES ('1', '系统管理员', '系统管理员2', '2014-09-15 17:17:54', '1', null);
INSERT INTO t_role_info VALUES ('3', '微信公众号管理员', '微信公众号管理员', '2014-09-16 14:28:59', '1', null);

-- ----------------------------
-- Table structure for `t_site_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_site_info`;
CREATE TABLE `t_site_info` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='站点信息表';

-- ----------------------------
-- Records of t_site_info
-- ----------------------------
INSERT INTO t_site_info VALUES ('1', '1', 'site7road', '公司官网', 'http://www.7road.com', '/data/www/webpage', 'http://static.7road.com/464646.png', 'http://static.7road.com', '/data/www/static', '/data/www/web/WEB-INF/template');
INSERT INTO t_site_info VALUES ('2', '1', 'ddt', '弹弹堂官网', 'http://ddt.7road.com', 'xxxx', 'http://static.7road.com', 'http://ddt.static.7road.com', 'xxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxx');

-- ----------------------------
-- Table structure for `t_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO t_user_info VALUES ('3', 'anyelangwang', 'abcabc', null, '李福春', 'cutter.li@7road.com', '2014-09-15 00:00:00', '0:0:0:0:0:0:0:1', '2014-09-15 09:31:08', '0', '1', '1');
