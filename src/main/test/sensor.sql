/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sensor

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-09-06 17:14:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blacklist
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(2550) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blacklist
-- ----------------------------
INSERT INTO `blacklist` VALUES ('1', null, '1');
INSERT INTO `blacklist` VALUES ('2', null, '2');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `pId` int(11) DEFAULT NULL,
  `isuse` int(11) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('14', '2323', '数据分析部', '1', '12', '0', '7', '没有');
INSERT INTO `dept` VALUES ('15', '232', '安全保障部', '1', null, '0', '8', '没有');
INSERT INTO `dept` VALUES ('16', '323', '设备维护部', '1', null, '0', '9', '没有');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `userusername` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `urlpath` varchar(255) DEFAULT NULL,
  `iconpath` varchar(255) DEFAULT NULL,
  `ischeck` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `pId` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  `isuse` int(11) DEFAULT NULL,
  `islock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('60', '用户管理', 'yonghuguanliP', null, null, null, '1', null, null, null, null, null, null);
INSERT INTO `permission` VALUES ('61', '用户管理', 'yonghuguanli', '/yonghuguanli', null, null, '1', '60', null, null, null, null, null);
INSERT INTO `permission` VALUES ('62', '组织架构管理', 'zuzhijiagouguanli', '/zuzhijiagouguanli', null, null, '1', '60', null, null, null, null, null);
INSERT INTO `permission` VALUES ('63', '角色权限', 'juesequanxian', '/juesequanxian', null, null, '1', '60', null, null, null, null, null);
INSERT INTO `permission` VALUES ('64', '系统管理', 'xitongguanli', '', null, null, '1', null, null, null, null, null, null);
INSERT INTO `permission` VALUES ('65', '菜单按钮功能管理', 'caidananniugongnengguanli', '/caidananniugongnengguanli', null, null, '1', '64', null, null, null, null, null);
INSERT INTO `permission` VALUES ('66', '系统日志', 'xitongrizhi', '/xitongrizhi', null, null, '1', '64', null, null, null, null, null);
INSERT INTO `permission` VALUES ('67', '系统白名单', 'xitongbaimingdan', '/xitongbaimingdan', null, null, '1', '64', null, null, null, null, null);
INSERT INTO `permission` VALUES ('69', '新增', 'zzjg-new', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('70', '添加下级组织', 'zzjg-xiaji', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('71', '添加同级组织', 'zzjg-tongji', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('72', '修改', 'zzjg-update', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('73', '查看', 'zzjg-chakan', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('74', '删除', 'zzjg-delete', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('75', '批量删除', 'zzjg-deleteall', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('76', '导入', 'zzjg-import', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('77', '导出', 'zzjg-export', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('78', '暂时停用', 'zzjg-lock', null, null, null, '2', '62', null, null, null, null, null);
INSERT INTO `permission` VALUES ('79', '新增', 'user-new', '', '', null, '2', '61', '', null, '', null, null);
INSERT INTO `permission` VALUES ('80', '修改', 'user-update', '', '', null, '2', '61', '', null, '', null, null);
INSERT INTO `permission` VALUES ('81', '查看', 'user-chakan', '', '', null, '2', '61', '', null, '', null, null);
INSERT INTO `permission` VALUES ('82', '删除', 'user-delete', '', '', null, '2', '61', '', null, '', null, null);
INSERT INTO `permission` VALUES ('83', '批量删除', 'user-deleteall', '', '', null, '2', '61', '', null, '', null, null);
INSERT INTO `permission` VALUES ('84', '导入', 'user-import', '', '', null, '2', '61', '', null, '', null, null);
INSERT INTO `permission` VALUES ('85', '导出', 'user-export', '', '', null, '2', '61', '', null, '', null, null);
INSERT INTO `permission` VALUES ('86', '暂时停用', 'user-lock', '', '', null, '2', '61', '', null, '', null, null);
INSERT INTO `permission` VALUES ('87', '用户激活', 'user-use', null, null, null, '2', '61', null, null, null, null, null);
INSERT INTO `permission` VALUES ('88', '新增', 'permission-new', '', '', null, '2', '63', '', null, '', null, null);
INSERT INTO `permission` VALUES ('89', '修改', 'permission-update', '', '', null, '2', '63', '', null, '', null, null);
INSERT INTO `permission` VALUES ('90', '查看', 'permission-chakan', '', '', null, '2', '63', '', null, '', null, null);
INSERT INTO `permission` VALUES ('91', '删除', 'permission-delete', '', '', null, '2', '63', '', null, '', null, null);
INSERT INTO `permission` VALUES ('92', '批量删除', 'permission-deleteall', '', '', null, '2', '63', '', null, '', null, null);
INSERT INTO `permission` VALUES ('93', '导入', 'permission-import', '', '', null, '2', '63', '', null, '', null, null);
INSERT INTO `permission` VALUES ('94', '导出', 'permission-export', '', '', null, '2', '63', '', null, '', null, null);
INSERT INTO `permission` VALUES ('95', '导出', 'rizhi-export', null, null, null, '2', '66', null, null, null, null, null);
INSERT INTO `permission` VALUES ('96', '安全权限', 'anquan', null, null, null, '3', null, null, null, null, null, '1');
INSERT INTO `permission` VALUES ('97', '11', '11', null, null, null, '1', null, '111111', '1', null, '0', null);
INSERT INTO `permission` VALUES ('98', '2', '22', null, null, null, '2', null, '222222', '22', null, '0', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isuse` int(11) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `islock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('48', 'xitong', '系统管理员', '0', '1', null, '1');
INSERT INTO `role` VALUES ('50', 'anquan', '安全管理员', '0', '2', '', '1');
INSERT INTO `role` VALUES ('51', 'shenji', '审计管理员', '0', '3', null, '1');
INSERT INTO `role` VALUES ('53', 'jianhu', '监护人', '0', '4', '', '1');

-- ----------------------------
-- Table structure for role2permission
-- ----------------------------
DROP TABLE IF EXISTS `role2permission`;
CREATE TABLE `role2permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role2permission
-- ----------------------------
INSERT INTO `role2permission` VALUES ('480', '48', '60');
INSERT INTO `role2permission` VALUES ('481', '48', '61');
INSERT INTO `role2permission` VALUES ('482', '48', '62');
INSERT INTO `role2permission` VALUES ('483', '48', '63');
INSERT INTO `role2permission` VALUES ('484', '48', '64');
INSERT INTO `role2permission` VALUES ('485', '48', '65');
INSERT INTO `role2permission` VALUES ('487', '48', '67');
INSERT INTO `role2permission` VALUES ('488', '48', '69');
INSERT INTO `role2permission` VALUES ('489', '48', '70');
INSERT INTO `role2permission` VALUES ('490', '48', '71');
INSERT INTO `role2permission` VALUES ('491', '48', '72');
INSERT INTO `role2permission` VALUES ('492', '48', '73');
INSERT INTO `role2permission` VALUES ('493', '48', '74');
INSERT INTO `role2permission` VALUES ('494', '48', '75');
INSERT INTO `role2permission` VALUES ('495', '48', '76');
INSERT INTO `role2permission` VALUES ('496', '48', '77');
INSERT INTO `role2permission` VALUES ('497', '48', '78');
INSERT INTO `role2permission` VALUES ('498', '48', '79');
INSERT INTO `role2permission` VALUES ('499', '48', '80');
INSERT INTO `role2permission` VALUES ('500', '48', '81');
INSERT INTO `role2permission` VALUES ('501', '48', '82');
INSERT INTO `role2permission` VALUES ('502', '48', '83');
INSERT INTO `role2permission` VALUES ('503', '48', '84');
INSERT INTO `role2permission` VALUES ('504', '48', '85');
INSERT INTO `role2permission` VALUES ('505', '48', '86');
INSERT INTO `role2permission` VALUES ('506', '48', '87');
INSERT INTO `role2permission` VALUES ('507', '48', '88');
INSERT INTO `role2permission` VALUES ('508', '48', '89');
INSERT INTO `role2permission` VALUES ('509', '48', '90');
INSERT INTO `role2permission` VALUES ('510', '48', '91');
INSERT INTO `role2permission` VALUES ('511', '48', '92');
INSERT INTO `role2permission` VALUES ('512', '48', '93');
INSERT INTO `role2permission` VALUES ('513', '48', '94');
INSERT INTO `role2permission` VALUES ('515', '51', '66');
INSERT INTO `role2permission` VALUES ('516', '51', '95');
INSERT INTO `role2permission` VALUES ('517', '50', '96');
INSERT INTO `role2permission` VALUES ('519', '50', '61');
INSERT INTO `role2permission` VALUES ('520', '50', '80');
INSERT INTO `role2permission` VALUES ('521', '50', '60');
INSERT INTO `role2permission` VALUES ('522', '51', '64');
INSERT INTO `role2permission` VALUES ('523', '50', '89');
INSERT INTO `role2permission` VALUES ('524', '50', '63');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `workno` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `isuse` int(11) DEFAULT NULL,
  `finger` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `pwtime` varchar(255) DEFAULT NULL,
  `errortime` int(11) DEFAULT NULL,
  `islock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('85', 'xitong', '系统管理员', '21232f297a57a5a743894a0e4a801fc3', '112', '111', '222', null, '48', '6', '0', null, null, null, null, '1');
INSERT INTO `user` VALUES ('86', 'anquan', '安全管理员', '21232f297a57a5a743894a0e4a801fc3', '121212', '11', '11', '11', '50', '16', '0', null, '', null, null, '1');
INSERT INTO `user` VALUES ('90', 'shenji', '审计管理员', '21232f297a57a5a743894a0e4a801fc3', '111', '111', '111', '11', '51', '1', '0', '', '', null, null, null);
