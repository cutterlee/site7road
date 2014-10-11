DROP TABLE IF EXISTS `t_auth_info`;
CREATE TABLE `t_auth_info` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '-1' COMMENT '父id',
  `auth_name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `auth_summary` varchar(500) DEFAULT NULL COMMENT '权限说明',
  `auth_url` varchar(200) DEFAULT NULL COMMENT '权限url',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `order_no` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`int`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_company_infomation`;
CREATE TABLE `t_company_infomation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comany_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(200) DEFAULT NULL COMMENT '公司地址',
  `company_linkway` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `company_summay` text COMMENT '公司描述',
  `company_culture` varchar(100) DEFAULT NULL COMMENT '企业文化',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息表';


DROP TABLE IF EXISTS `t_role_info`;
CREATE TABLE `t_role_info` (
  `id` int(11) DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_summary` varchar(500) DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_mofiy_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `site_id` int(11) DEFAULT NULL COMMENT '所属站点',
  `function_set_str` text COMMENT '拥有的权限集合'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';


DROP TABLE IF EXISTS `t_site_info`;
CREATE TABLE `t_site_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `site_alias` varchar(20) DEFAULT NULL COMMENT '站点简称',
  `site_name` varchar(50) DEFAULT NULL COMMENT '站点名称',
  `site_url` varchar(200) DEFAULT NULL COMMENT '站点的url',
  `site_dir` varchar(500) DEFAULT NULL COMMENT '站点的资源目录',
  `site_icon` varchar(200) DEFAULT NULL COMMENT '站点图标',
  `image_url` varchar(200) DEFAULT NULL COMMENT '图片域名',
  `image_dir` varchar(500) DEFAULT NULL COMMENT '图片资源目录',
  `static_url` varchar(200) DEFAULT NULL COMMENT '静态资源域名',
  `static_dir` varchar(500) DEFAULT NULL COMMENT '静态资源的目录',
  `template_dir` varchar(500) DEFAULT NULL COMMENT '模版的根目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点信息表';


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
  `role_set_str` text COMMENT '角色id集合字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';