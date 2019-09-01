/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : sensor

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-09-01 13:13:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `isuse` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '11', '111', '1', null, '1', '111', '1111');
INSERT INTO `dept` VALUES ('2', '', '', '1', null, '1', '1', '');
INSERT INTO `dept` VALUES ('3', 'sadf sadf as', 'df asdf asdf ', '1', null, '1', '1', 'asdf asdf asdf as ');
INSERT INTO `dept` VALUES ('4', 'adsf asdf ', 'asdf asdf asdf ', '1', null, '1', '222', 'asdfasd fasdf asf asdf asdf asdf ');
INSERT INTO `dept` VALUES ('5', '1', '1', '1', null, '1', '1', '12121212');
INSERT INTO `dept` VALUES ('6', '基石无人机 ', '械a', '2', null, '0', '1', '西南非花木成畦手自栽 asd');
INSERT INTO `dept` VALUES ('7', '1', '11', '1', null, '1', '1', '11111');
INSERT INTO `dept` VALUES ('8', '1', '1', '1', null, '1', '1', '1111111');
INSERT INTO `dept` VALUES ('9', '1', '1', '1', null, '1', '1', '111111');
INSERT INTO `dept` VALUES ('10', '11', '11', '1', null, '1', '1', '1111111');
INSERT INTO `dept` VALUES ('11', '撒打发sd', '地花木成畦手自栽 a', '1', null, '1', '1', '槈花木成畦手自栽 花木成畦手自栽 花木成畦手自栽 花木成畦手自栽 ');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `urlpath` varchar(255) DEFAULT NULL,
  `iconpath` varchar(255) DEFAULT NULL,
  `ischeck` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('60', '用户管理', 'yonghuguanliP', null, null, null, '1', null, null, null, null);
INSERT INTO `permission` VALUES ('61', '用户管理', 'yonghuguanli', '/yonghuguanli', null, null, '1', '60', null, null, null);
INSERT INTO `permission` VALUES ('62', '组织架构管理', 'zuzhijiagouguanli', '/zuzhijiagouguanli', null, null, '1', '60', null, null, null);
INSERT INTO `permission` VALUES ('63', '角色权限', 'juesequanxian', '/juesequanxian', null, null, '1', '60', null, null, null);
INSERT INTO `permission` VALUES ('64', '系统管理', 'xitongguanli', '', null, null, '1', null, null, null, null);
INSERT INTO `permission` VALUES ('65', '菜单按钮功能管理', 'caidananniugongnengguanli', '/caidananniugongnengguanli', null, null, '1', '64', null, null, null);
INSERT INTO `permission` VALUES ('66', '系统日志', 'xitongrizhi', '/xitongrizhi', null, null, '1', '64', null, null, null);
INSERT INTO `permission` VALUES ('67', '系统白名单', 'xitongbaimingdan', '/xitongbaimingdan', null, null, '1', '64', null, null, null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cnname` varchar(255) DEFAULT NULL,
  `isuse` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('48', '测试角色', null, null, null, null);

-- ----------------------------
-- Table structure for role2permission
-- ----------------------------
DROP TABLE IF EXISTS `role2permission`;
CREATE TABLE `role2permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role2permission
-- ----------------------------
INSERT INTO `role2permission` VALUES ('266', '48', '60');
INSERT INTO `role2permission` VALUES ('267', '48', '61');
INSERT INTO `role2permission` VALUES ('268', '48', '62');
INSERT INTO `role2permission` VALUES ('269', '48', '63');
INSERT INTO `role2permission` VALUES ('270', '48', '64');
INSERT INTO `role2permission` VALUES ('271', '48', '65');
INSERT INTO `role2permission` VALUES ('272', '48', '66');
INSERT INTO `role2permission` VALUES ('273', '48', '67');

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
  `remark` varchar(255) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `isuse` int(11) DEFAULT NULL,
  `finger` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('85', '111', '111', '21232f297a57a5a743894a0e4a801fc3', null, null, null, null, null, null, null, '0', null);
INSERT INTO `user` VALUES ('86', '11', '1', '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('87', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user2role
-- ----------------------------
DROP TABLE IF EXISTS `user2role`;
CREATE TABLE `user2role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user2role
-- ----------------------------
INSERT INTO `user2role` VALUES ('480', '85', '48');
