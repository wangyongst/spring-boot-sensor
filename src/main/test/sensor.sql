/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sensor

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-09-02 17:30:34
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blacklist
-- ----------------------------
INSERT INTO `blacklist` VALUES ('1', '', '1');
INSERT INTO `blacklist` VALUES ('2', '', '2');

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
INSERT INTO `dept` VALUES ('3', '1', '办公楼', '1', '0', '0', '1', '没有');
INSERT INTO `dept` VALUES ('4', '2 ', '总经办', '1', '3', '0', '2', '没有');
INSERT INTO `dept` VALUES ('6', '2', '项目部', '2', '3', '0', '3', '没有');
INSERT INTO `dept` VALUES ('11', '2', '质监部', '1', '3', '0', '4', '没有');
INSERT INTO `dept` VALUES ('12', '4', '技术部', '1', null, '0', '5', '没有');
INSERT INTO `dept` VALUES ('13', '4', '设备维护部', '1', '12', '0', '6', '没有');
INSERT INTO `dept` VALUES ('14', '2323', '数据分析部', '1', '12', null, '7', '没有');
INSERT INTO `dept` VALUES ('15', '232', '安全保障部', '1', null, null, '8', '没有');
INSERT INTO `dept` VALUES ('16', '323', '设备维护部', '1', null, null, '9', '没有');

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
  `createtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('3', '1', '办公楼', '1', '0', null, '没有');
INSERT INTO `logs` VALUES ('4', '2 ', '总经办', '1', '3', null, '没有');
INSERT INTO `logs` VALUES ('6', '2', '项目部', '2', '3', null, '没有');
INSERT INTO `logs` VALUES ('11', '2', '质监部', '1', '3', null, '没有');
INSERT INTO `logs` VALUES ('12', '4', '技术部', '1', null, null, '没有');
INSERT INTO `logs` VALUES ('13', '4', '设备维护部', '1', '12', null, '没有');
INSERT INTO `logs` VALUES ('14', '2323', '数据分析部', '1', '12', null, '没有');
INSERT INTO `logs` VALUES ('15', '232', '安全保障部', '1', null, null, '没有');
INSERT INTO `logs` VALUES ('16', '323', '设备维护部', '1', null, null, '没有');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

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
INSERT INTO `permission` VALUES ('69', '新增', 'zzjg-new', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('70', '添加下级组织', 'zzjg-xiaji', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('71', '添加同级组织', 'zzjg-tongji', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('72', '修改', 'zzjg-update', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('73', '查看', 'zzjg-chakan', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('74', '删除', 'zzjg-delete', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('75', '批量删除', 'zzjg-deleteall', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('76', '导入', 'zzjg-import', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('77', '导出', 'zzjg-export', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('78', '暂时停用', 'zzjg-lock', null, null, null, '2', '62', null, null, null);
INSERT INTO `permission` VALUES ('79', '新增', 'user-new', '', '', null, '2', '61', '', null, '');
INSERT INTO `permission` VALUES ('80', '修改', 'user-update', '', '', null, '2', '61', '', null, '');
INSERT INTO `permission` VALUES ('81', '查看', 'user-chakan', '', '', null, '2', '61', '', null, '');
INSERT INTO `permission` VALUES ('82', '删除', 'user-delete', '', '', null, '2', '61', '', null, '');
INSERT INTO `permission` VALUES ('83', '批量删除', 'user-deleteall', '', '', null, '2', '61', '', null, '');
INSERT INTO `permission` VALUES ('84', '导入', 'user-import', '', '', null, '2', '61', '', null, '');
INSERT INTO `permission` VALUES ('85', '导出', 'user-export', '', '', null, '2', '61', '', null, '');
INSERT INTO `permission` VALUES ('86', '暂时停用', 'user-lock', '', '', null, '2', '61', '', null, '');
INSERT INTO `permission` VALUES ('87', '用户激活', 'user-use', null, null, null, '2', '61', null, null, null);
INSERT INTO `permission` VALUES ('88', '新增', 'permission-new', '', '', null, '2', '63', '', null, '');
INSERT INTO `permission` VALUES ('89', '修改', 'permission-update', '', '', null, '2', '63', '', null, '');
INSERT INTO `permission` VALUES ('90', '查看', 'permission-chakan', '', '', null, '2', '63', '', null, '');
INSERT INTO `permission` VALUES ('91', '删除', 'permission-delete', '', '', null, '2', '63', '', null, '');
INSERT INTO `permission` VALUES ('92', '批量删除', 'permission-deleteall', '', '', null, '2', '63', '', null, '');
INSERT INTO `permission` VALUES ('93', '导入', 'permission-import', '', '', null, '2', '63', '', null, '');
INSERT INTO `permission` VALUES ('94', '导出', 'permission-export', '', '', null, '2', '63', '', null, '');
INSERT INTO `permission` VALUES ('95', '导出', 'rizhi-export', null, null, null, '2', '66', null, null, null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('48', 'testrole', '测试角色', null, null, null);

-- ----------------------------
-- Table structure for role2permission
-- ----------------------------
DROP TABLE IF EXISTS `role2permission`;
CREATE TABLE `role2permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role2permission
-- ----------------------------
INSERT INTO `role2permission` VALUES ('480', '48', '60');
INSERT INTO `role2permission` VALUES ('481', '48', '61');
INSERT INTO `role2permission` VALUES ('482', '48', '62');
INSERT INTO `role2permission` VALUES ('483', '48', '63');
INSERT INTO `role2permission` VALUES ('484', '48', '64');
INSERT INTO `role2permission` VALUES ('485', '48', '65');
INSERT INTO `role2permission` VALUES ('486', '48', '66');
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
INSERT INTO `role2permission` VALUES ('514', '48', '95');

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
INSERT INTO `user` VALUES ('85', '111', '111', '21232f297a57a5a743894a0e4a801fc3', '112', '111', '222', null, '48', null, '6', '0', null);
INSERT INTO `user` VALUES ('86', '11', '1', '1', '121212', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user2dept
-- ----------------------------
DROP TABLE IF EXISTS `user2dept`;
CREATE TABLE `user2dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user2dept
-- ----------------------------
INSERT INTO `user2dept` VALUES ('266', '13', '13');
INSERT INTO `user2dept` VALUES ('267', '13', '38');
INSERT INTO `user2dept` VALUES ('268', '13', '39');
INSERT INTO `user2dept` VALUES ('269', '13', '40');
INSERT INTO `user2dept` VALUES ('270', '13', '41');
INSERT INTO `user2dept` VALUES ('271', '13', '42');
INSERT INTO `user2dept` VALUES ('272', '13', '43');
INSERT INTO `user2dept` VALUES ('273', '13', '18');
INSERT INTO `user2dept` VALUES ('274', '13', '44');
INSERT INTO `user2dept` VALUES ('275', '13', '45');
INSERT INTO `user2dept` VALUES ('276', '13', '46');
INSERT INTO `user2dept` VALUES ('277', '13', '47');
INSERT INTO `user2dept` VALUES ('278', '13', '48');
INSERT INTO `user2dept` VALUES ('279', '13', '56');
INSERT INTO `user2dept` VALUES ('280', '13', '24');
INSERT INTO `user2dept` VALUES ('281', '13', '49');
INSERT INTO `user2dept` VALUES ('282', '13', '50');
INSERT INTO `user2dept` VALUES ('283', '13', '51');
INSERT INTO `user2dept` VALUES ('284', '13', '57');
INSERT INTO `user2dept` VALUES ('285', '13', '28');
INSERT INTO `user2dept` VALUES ('286', '13', '52');
INSERT INTO `user2dept` VALUES ('287', '13', '53');
INSERT INTO `user2dept` VALUES ('288', '13', '54');
INSERT INTO `user2dept` VALUES ('289', '13', '55');
INSERT INTO `user2dept` VALUES ('330', '13', '51');
INSERT INTO `user2dept` VALUES ('331', '13', '56');
INSERT INTO `user2dept` VALUES ('332', '13', '58');
INSERT INTO `user2dept` VALUES ('333', '13', '59');
INSERT INTO `user2dept` VALUES ('360', '48', '13');
INSERT INTO `user2dept` VALUES ('361', '48', '38');
INSERT INTO `user2dept` VALUES ('362', '48', '39');
INSERT INTO `user2dept` VALUES ('363', '48', '40');
INSERT INTO `user2dept` VALUES ('364', '48', '41');
INSERT INTO `user2dept` VALUES ('365', '48', '42');
INSERT INTO `user2dept` VALUES ('366', '48', '43');
INSERT INTO `user2dept` VALUES ('367', '48', '18');
INSERT INTO `user2dept` VALUES ('368', '48', '44');
INSERT INTO `user2dept` VALUES ('369', '48', '45');
INSERT INTO `user2dept` VALUES ('370', '48', '46');
INSERT INTO `user2dept` VALUES ('371', '48', '47');
INSERT INTO `user2dept` VALUES ('372', '48', '48');
INSERT INTO `user2dept` VALUES ('373', '48', '56');
INSERT INTO `user2dept` VALUES ('374', '48', '58');
INSERT INTO `user2dept` VALUES ('375', '48', '59');
INSERT INTO `user2dept` VALUES ('376', '48', '24');
INSERT INTO `user2dept` VALUES ('377', '48', '49');
INSERT INTO `user2dept` VALUES ('378', '48', '50');
INSERT INTO `user2dept` VALUES ('379', '48', '51');
INSERT INTO `user2dept` VALUES ('380', '48', '57');
INSERT INTO `user2dept` VALUES ('381', '48', '28');
INSERT INTO `user2dept` VALUES ('382', '48', '52');
INSERT INTO `user2dept` VALUES ('383', '48', '53');
INSERT INTO `user2dept` VALUES ('384', '48', '54');
INSERT INTO `user2dept` VALUES ('385', '48', '55');
INSERT INTO `user2dept` VALUES ('388', '49', '38');
INSERT INTO `user2dept` VALUES ('389', '49', '39');
INSERT INTO `user2dept` VALUES ('390', '49', '44');
INSERT INTO `user2dept` VALUES ('391', '49', '49');
INSERT INTO `user2dept` VALUES ('392', '49', '53');
INSERT INTO `user2dept` VALUES ('408', '51', '13');
INSERT INTO `user2dept` VALUES ('409', '51', '38');
INSERT INTO `user2dept` VALUES ('410', '51', '18');
INSERT INTO `user2dept` VALUES ('411', '51', '44');
INSERT INTO `user2dept` VALUES ('412', '51', '24');
INSERT INTO `user2dept` VALUES ('413', '51', '49');
INSERT INTO `user2dept` VALUES ('414', '51', '28');
INSERT INTO `user2dept` VALUES ('415', '51', '52');
INSERT INTO `user2dept` VALUES ('452', '52', '13');
INSERT INTO `user2dept` VALUES ('453', '52', '38');
INSERT INTO `user2dept` VALUES ('454', '52', '39');
INSERT INTO `user2dept` VALUES ('455', '52', '40');
INSERT INTO `user2dept` VALUES ('456', '52', '41');
INSERT INTO `user2dept` VALUES ('457', '52', '42');
INSERT INTO `user2dept` VALUES ('458', '52', '43');
INSERT INTO `user2dept` VALUES ('459', '52', '18');
INSERT INTO `user2dept` VALUES ('460', '52', '44');
INSERT INTO `user2dept` VALUES ('461', '52', '45');
INSERT INTO `user2dept` VALUES ('462', '52', '46');
INSERT INTO `user2dept` VALUES ('463', '52', '47');
INSERT INTO `user2dept` VALUES ('464', '52', '48');
INSERT INTO `user2dept` VALUES ('465', '52', '56');
INSERT INTO `user2dept` VALUES ('466', '52', '58');
INSERT INTO `user2dept` VALUES ('467', '52', '59');
INSERT INTO `user2dept` VALUES ('468', '52', '24');
INSERT INTO `user2dept` VALUES ('469', '52', '49');
INSERT INTO `user2dept` VALUES ('470', '52', '50');
INSERT INTO `user2dept` VALUES ('471', '52', '51');
INSERT INTO `user2dept` VALUES ('472', '52', '57');
INSERT INTO `user2dept` VALUES ('473', '53', '44');
INSERT INTO `user2dept` VALUES ('474', '53', '45');
INSERT INTO `user2dept` VALUES ('475', '53', '46');
INSERT INTO `user2dept` VALUES ('476', '53', '47');
INSERT INTO `user2dept` VALUES ('477', '53', '48');
INSERT INTO `user2dept` VALUES ('478', '53', '56');
INSERT INTO `user2dept` VALUES ('479', '53', '58');
