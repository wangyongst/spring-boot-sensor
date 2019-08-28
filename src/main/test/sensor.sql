/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sensor

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-08-28 15:53:07
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
  `order` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('13', '首页', 'index', '0', '0');
INSERT INTO `permission` VALUES ('18', '采购管理', 'purch', '0', '0');
INSERT INTO `permission` VALUES ('24', '财务管理', 'finance', '0', '0');
INSERT INTO `permission` VALUES ('28', '权限中心', 'permission', '0', '0');
INSERT INTO `permission` VALUES ('38', '新建', 'index-create', '2', '13');
INSERT INTO `permission` VALUES ('39', '查询', 'index-query', '2', '13');
INSERT INTO `permission` VALUES ('40', '修改', 'index-update', '2', '13');
INSERT INTO `permission` VALUES ('41', '删除', 'index-delete', '2', '13');
INSERT INTO `permission` VALUES ('42', '导出', 'index-export', '2', '13');
INSERT INTO `permission` VALUES ('43', '耗材类型', 'index-material', '2', '13');
INSERT INTO `permission` VALUES ('44', '查询', 'purch-query', '2', '18');
INSERT INTO `permission` VALUES ('45', '导出', 'purch-export', '2', '18');
INSERT INTO `permission` VALUES ('46', '新增', 'purch-create', '2', '18');
INSERT INTO `permission` VALUES ('47', '删除', 'purch-delete', '2', '18');
INSERT INTO `permission` VALUES ('48', '修改', 'purch-update', '2', '18');
INSERT INTO `permission` VALUES ('49', '查询', 'finance-query', '2', '24');
INSERT INTO `permission` VALUES ('50', '导出', 'finance-export', '2', '24');
INSERT INTO `permission` VALUES ('51', '填写发票号', 'finance-fapiao', '2', '24');
INSERT INTO `permission` VALUES ('52', '新建', 'permission-create', '2', '28');
INSERT INTO `permission` VALUES ('53', '查询', 'permission-query', '2', '28');
INSERT INTO `permission` VALUES ('54', '修改', 'permission-update', '2', '28');
INSERT INTO `permission` VALUES ('55', '删除', 'permission-delete', '2', '28');
INSERT INTO `permission` VALUES ('56', '撤回', 'purch-back', '2', '18');
INSERT INTO `permission` VALUES ('57', '审核', 'finance-yes', '2', '24');
INSERT INTO `permission` VALUES ('58', '发起', 'purch-start', '2', '18');
INSERT INTO `permission` VALUES ('59', '价格系数', 'purch-price', '2', '18');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `projectid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('13', '系统管理员', null);
INSERT INTO `role` VALUES ('48', '测试角色', '145');
INSERT INTO `role` VALUES ('49', '普通用户', '145');
INSERT INTO `role` VALUES ('51', '开发', '175');
INSERT INTO `role` VALUES ('52', '采购经理', null);
INSERT INTO `role` VALUES ('53', '业务员', '177');

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
INSERT INTO `role2permission` VALUES ('266', '13', '13');
INSERT INTO `role2permission` VALUES ('267', '13', '38');
INSERT INTO `role2permission` VALUES ('268', '13', '39');
INSERT INTO `role2permission` VALUES ('269', '13', '40');
INSERT INTO `role2permission` VALUES ('270', '13', '41');
INSERT INTO `role2permission` VALUES ('271', '13', '42');
INSERT INTO `role2permission` VALUES ('272', '13', '43');
INSERT INTO `role2permission` VALUES ('273', '13', '18');
INSERT INTO `role2permission` VALUES ('274', '13', '44');
INSERT INTO `role2permission` VALUES ('275', '13', '45');
INSERT INTO `role2permission` VALUES ('276', '13', '46');
INSERT INTO `role2permission` VALUES ('277', '13', '47');
INSERT INTO `role2permission` VALUES ('278', '13', '48');
INSERT INTO `role2permission` VALUES ('279', '13', '56');
INSERT INTO `role2permission` VALUES ('280', '13', '24');
INSERT INTO `role2permission` VALUES ('281', '13', '49');
INSERT INTO `role2permission` VALUES ('282', '13', '50');
INSERT INTO `role2permission` VALUES ('283', '13', '51');
INSERT INTO `role2permission` VALUES ('284', '13', '57');
INSERT INTO `role2permission` VALUES ('285', '13', '28');
INSERT INTO `role2permission` VALUES ('286', '13', '52');
INSERT INTO `role2permission` VALUES ('287', '13', '53');
INSERT INTO `role2permission` VALUES ('288', '13', '54');
INSERT INTO `role2permission` VALUES ('289', '13', '55');
INSERT INTO `role2permission` VALUES ('330', '13', '51');
INSERT INTO `role2permission` VALUES ('331', '13', '56');
INSERT INTO `role2permission` VALUES ('332', '13', '58');
INSERT INTO `role2permission` VALUES ('333', '13', '59');
INSERT INTO `role2permission` VALUES ('360', '48', '13');
INSERT INTO `role2permission` VALUES ('361', '48', '38');
INSERT INTO `role2permission` VALUES ('362', '48', '39');
INSERT INTO `role2permission` VALUES ('363', '48', '40');
INSERT INTO `role2permission` VALUES ('364', '48', '41');
INSERT INTO `role2permission` VALUES ('365', '48', '42');
INSERT INTO `role2permission` VALUES ('366', '48', '43');
INSERT INTO `role2permission` VALUES ('367', '48', '18');
INSERT INTO `role2permission` VALUES ('368', '48', '44');
INSERT INTO `role2permission` VALUES ('369', '48', '45');
INSERT INTO `role2permission` VALUES ('370', '48', '46');
INSERT INTO `role2permission` VALUES ('371', '48', '47');
INSERT INTO `role2permission` VALUES ('372', '48', '48');
INSERT INTO `role2permission` VALUES ('373', '48', '56');
INSERT INTO `role2permission` VALUES ('374', '48', '58');
INSERT INTO `role2permission` VALUES ('375', '48', '59');
INSERT INTO `role2permission` VALUES ('376', '48', '24');
INSERT INTO `role2permission` VALUES ('377', '48', '49');
INSERT INTO `role2permission` VALUES ('378', '48', '50');
INSERT INTO `role2permission` VALUES ('379', '48', '51');
INSERT INTO `role2permission` VALUES ('380', '48', '57');
INSERT INTO `role2permission` VALUES ('381', '48', '28');
INSERT INTO `role2permission` VALUES ('382', '48', '52');
INSERT INTO `role2permission` VALUES ('383', '48', '53');
INSERT INTO `role2permission` VALUES ('384', '48', '54');
INSERT INTO `role2permission` VALUES ('385', '48', '55');
INSERT INTO `role2permission` VALUES ('388', '49', '38');
INSERT INTO `role2permission` VALUES ('389', '49', '39');
INSERT INTO `role2permission` VALUES ('390', '49', '44');
INSERT INTO `role2permission` VALUES ('391', '49', '49');
INSERT INTO `role2permission` VALUES ('392', '49', '53');
INSERT INTO `role2permission` VALUES ('408', '51', '13');
INSERT INTO `role2permission` VALUES ('409', '51', '38');
INSERT INTO `role2permission` VALUES ('410', '51', '18');
INSERT INTO `role2permission` VALUES ('411', '51', '44');
INSERT INTO `role2permission` VALUES ('412', '51', '24');
INSERT INTO `role2permission` VALUES ('413', '51', '49');
INSERT INTO `role2permission` VALUES ('414', '51', '28');
INSERT INTO `role2permission` VALUES ('415', '51', '52');
INSERT INTO `role2permission` VALUES ('452', '52', '13');
INSERT INTO `role2permission` VALUES ('453', '52', '38');
INSERT INTO `role2permission` VALUES ('454', '52', '39');
INSERT INTO `role2permission` VALUES ('455', '52', '40');
INSERT INTO `role2permission` VALUES ('456', '52', '41');
INSERT INTO `role2permission` VALUES ('457', '52', '42');
INSERT INTO `role2permission` VALUES ('458', '52', '43');
INSERT INTO `role2permission` VALUES ('459', '52', '18');
INSERT INTO `role2permission` VALUES ('460', '52', '44');
INSERT INTO `role2permission` VALUES ('461', '52', '45');
INSERT INTO `role2permission` VALUES ('462', '52', '46');
INSERT INTO `role2permission` VALUES ('463', '52', '47');
INSERT INTO `role2permission` VALUES ('464', '52', '48');
INSERT INTO `role2permission` VALUES ('465', '52', '56');
INSERT INTO `role2permission` VALUES ('466', '52', '58');
INSERT INTO `role2permission` VALUES ('467', '52', '59');
INSERT INTO `role2permission` VALUES ('468', '52', '24');
INSERT INTO `role2permission` VALUES ('469', '52', '49');
INSERT INTO `role2permission` VALUES ('470', '52', '50');
INSERT INTO `role2permission` VALUES ('471', '52', '51');
INSERT INTO `role2permission` VALUES ('472', '52', '57');
INSERT INTO `role2permission` VALUES ('473', '53', '44');
INSERT INTO `role2permission` VALUES ('474', '53', '45');
INSERT INTO `role2permission` VALUES ('475', '53', '46');
INSERT INTO `role2permission` VALUES ('476', '53', '47');
INSERT INTO `role2permission` VALUES ('477', '53', '48');
INSERT INTO `role2permission` VALUES ('478', '53', '56');
INSERT INTO `role2permission` VALUES ('479', '53', '58');

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
  `islogin` int(11) DEFAULT NULL,
  `roleid` int(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `islock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
