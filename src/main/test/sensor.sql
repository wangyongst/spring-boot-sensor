/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : sensor

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-09-08 21:18:40
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('14', '2323', '数据分析部', '1', '12', '0', '7', '没有');
INSERT INTO `dept` VALUES ('15', '232', '安全保障部', '1', null, '0', '8', '没有');
INSERT INTO `dept` VALUES ('16', '323', '设备维护部', '1', null, '0', '9', '没有');
INSERT INTO `dept` VALUES ('17', '00001', '老金公司', '1', '14', '1', '1', '11111');

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
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('272', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:27');
INSERT INTO `logs` VALUES ('273', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:29');
INSERT INTO `logs` VALUES ('274', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:30');
INSERT INTO `logs` VALUES ('275', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:30');
INSERT INTO `logs` VALUES ('276', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:31');
INSERT INTO `logs` VALUES ('277', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:32');
INSERT INTO `logs` VALUES ('278', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:34');
INSERT INTO `logs` VALUES ('279', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:34');
INSERT INTO `logs` VALUES ('280', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:35');
INSERT INTO `logs` VALUES ('281', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:41');
INSERT INTO `logs` VALUES ('282', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:45');
INSERT INTO `logs` VALUES ('283', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:17:48');
INSERT INTO `logs` VALUES ('284', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:18:16');
INSERT INTO `logs` VALUES ('285', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:12');
INSERT INTO `logs` VALUES ('286', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:13');
INSERT INTO `logs` VALUES ('287', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:14');
INSERT INTO `logs` VALUES ('288', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:16');
INSERT INTO `logs` VALUES ('289', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:17');
INSERT INTO `logs` VALUES ('290', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:20');
INSERT INTO `logs` VALUES ('291', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:21');
INSERT INTO `logs` VALUES ('292', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:25');
INSERT INTO `logs` VALUES ('293', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:25');
INSERT INTO `logs` VALUES ('294', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:26');
INSERT INTO `logs` VALUES ('295', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:30');
INSERT INTO `logs` VALUES ('296', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:30');
INSERT INTO `logs` VALUES ('297', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:31');
INSERT INTO `logs` VALUES ('298', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:32');
INSERT INTO `logs` VALUES ('299', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:33');
INSERT INTO `logs` VALUES ('300', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '118.181.187.138', '2019-09-06 17:23:33');
INSERT INTO `logs` VALUES ('301', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 22:56:49');
INSERT INTO `logs` VALUES ('302', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 22:59:10');
INSERT INTO `logs` VALUES ('303', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 22:59:10');
INSERT INTO `logs` VALUES ('304', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:00:08');
INSERT INTO `logs` VALUES ('305', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:00:14');
INSERT INTO `logs` VALUES ('306', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:13:22');
INSERT INTO `logs` VALUES ('307', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:14:33');
INSERT INTO `logs` VALUES ('308', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:17:08');
INSERT INTO `logs` VALUES ('309', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:19:03');
INSERT INTO `logs` VALUES ('310', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:25:00');
INSERT INTO `logs` VALUES ('311', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:25:01');
INSERT INTO `logs` VALUES ('312', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:26:06');
INSERT INTO `logs` VALUES ('313', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:27:08');
INSERT INTO `logs` VALUES ('314', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:29:36');
INSERT INTO `logs` VALUES ('315', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:29:40');
INSERT INTO `logs` VALUES ('316', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:29:44');
INSERT INTO `logs` VALUES ('317', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:29:47');
INSERT INTO `logs` VALUES ('318', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:31:34');
INSERT INTO `logs` VALUES ('319', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-06 23:31:50');
INSERT INTO `logs` VALUES ('320', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:28:45');
INSERT INTO `logs` VALUES ('321', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:28:52');
INSERT INTO `logs` VALUES ('322', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:30:00');
INSERT INTO `logs` VALUES ('323', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:30:07');
INSERT INTO `logs` VALUES ('324', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:30:15');
INSERT INTO `logs` VALUES ('325', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:30:18');
INSERT INTO `logs` VALUES ('326', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:30:34');
INSERT INTO `logs` VALUES ('327', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:30:51');
INSERT INTO `logs` VALUES ('328', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:31:05');
INSERT INTO `logs` VALUES ('329', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:31:18');
INSERT INTO `logs` VALUES ('330', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:34:57');
INSERT INTO `logs` VALUES ('331', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:38:51');
INSERT INTO `logs` VALUES ('332', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:38:57');
INSERT INTO `logs` VALUES ('333', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:38:59');
INSERT INTO `logs` VALUES ('334', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:39:01');
INSERT INTO `logs` VALUES ('335', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:39:23');
INSERT INTO `logs` VALUES ('336', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:41:00');
INSERT INTO `logs` VALUES ('337', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:41:01');
INSERT INTO `logs` VALUES ('338', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:42:30');
INSERT INTO `logs` VALUES ('339', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:42:31');
INSERT INTO `logs` VALUES ('340', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:44:07');
INSERT INTO `logs` VALUES ('341', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:44:24');
INSERT INTO `logs` VALUES ('342', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:44:44');
INSERT INTO `logs` VALUES ('343', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:44:45');
INSERT INTO `logs` VALUES ('344', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:45:17');
INSERT INTO `logs` VALUES ('345', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 00:45:18');
INSERT INTO `logs` VALUES ('346', '角色权限', 'anquan', '/juesequanxian', 'GET', '安全管理员', '219.142.145.49', '2019-09-07 00:45:32');
INSERT INTO `logs` VALUES ('347', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:14:50');
INSERT INTO `logs` VALUES ('348', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:14:53');
INSERT INTO `logs` VALUES ('349', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:14:56');
INSERT INTO `logs` VALUES ('350', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:15:26');
INSERT INTO `logs` VALUES ('351', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:15:50');
INSERT INTO `logs` VALUES ('352', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:15:52');
INSERT INTO `logs` VALUES ('353', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:16:14');
INSERT INTO `logs` VALUES ('354', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:16:37');
INSERT INTO `logs` VALUES ('355', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:16:43');
INSERT INTO `logs` VALUES ('356', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:16:46');
INSERT INTO `logs` VALUES ('357', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:16:47');
INSERT INTO `logs` VALUES ('358', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:16:51');
INSERT INTO `logs` VALUES ('359', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:16:53');
INSERT INTO `logs` VALUES ('360', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:16:55');
INSERT INTO `logs` VALUES ('361', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:16:55');
INSERT INTO `logs` VALUES ('362', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:16:56');
INSERT INTO `logs` VALUES ('363', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:16:56');
INSERT INTO `logs` VALUES ('364', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:17:12');
INSERT INTO `logs` VALUES ('365', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:22:48');
INSERT INTO `logs` VALUES ('366', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:23:05');
INSERT INTO `logs` VALUES ('367', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:24:29');
INSERT INTO `logs` VALUES ('368', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:24:31');
INSERT INTO `logs` VALUES ('369', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:24:32');
INSERT INTO `logs` VALUES ('370', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:24:35');
INSERT INTO `logs` VALUES ('371', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '42.92.168.186', '2019-09-07 10:24:48');
INSERT INTO `logs` VALUES ('372', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:25:40');
INSERT INTO `logs` VALUES ('373', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:25:42');
INSERT INTO `logs` VALUES ('374', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:25:43');
INSERT INTO `logs` VALUES ('375', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:25:45');
INSERT INTO `logs` VALUES ('376', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:25:47');
INSERT INTO `logs` VALUES ('377', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:25:47');
INSERT INTO `logs` VALUES ('378', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:26:10');
INSERT INTO `logs` VALUES ('379', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:32:19');
INSERT INTO `logs` VALUES ('380', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '219.142.145.49', '2019-09-07 10:32:25');
INSERT INTO `logs` VALUES ('381', '系统日志', 'shenji', '/xitongrizhi', 'GET', '审计管理员', '42.92.168.186', '2019-09-08 14:41:09');
INSERT INTO `logs` VALUES ('382', '系统日志', 'shenji', '/xitongrizhi', 'GET', '审计管理员', '42.92.168.186', '2019-09-08 14:41:16');
INSERT INTO `logs` VALUES ('383', '系统日志', 'shenji', '/xitongrizhi', 'GET', '审计管理员', '42.92.168.186', '2019-09-08 14:41:27');
INSERT INTO `logs` VALUES ('384', '系统日志', 'shenji', '/xitongrizhi', 'GET', '审计管理员', '42.92.168.186', '2019-09-08 14:41:47');
INSERT INTO `logs` VALUES ('385', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 14:52:07');
INSERT INTO `logs` VALUES ('386', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 14:54:21');
INSERT INTO `logs` VALUES ('387', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 14:54:49');
INSERT INTO `logs` VALUES ('388', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 14:54:56');
INSERT INTO `logs` VALUES ('389', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 14:56:13');
INSERT INTO `logs` VALUES ('390', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 14:56:26');
INSERT INTO `logs` VALUES ('391', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:05:41');
INSERT INTO `logs` VALUES ('392', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:05:52');
INSERT INTO `logs` VALUES ('393', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:05:58');
INSERT INTO `logs` VALUES ('394', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:08:37');
INSERT INTO `logs` VALUES ('395', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:09:26');
INSERT INTO `logs` VALUES ('396', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:16:33');
INSERT INTO `logs` VALUES ('397', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:17:01');
INSERT INTO `logs` VALUES ('398', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:21:19');
INSERT INTO `logs` VALUES ('399', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:31:51');
INSERT INTO `logs` VALUES ('400', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:31:52');
INSERT INTO `logs` VALUES ('401', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:31:55');
INSERT INTO `logs` VALUES ('402', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:32:08');
INSERT INTO `logs` VALUES ('403', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:32:31');
INSERT INTO `logs` VALUES ('404', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:35:35');
INSERT INTO `logs` VALUES ('405', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:35:37');
INSERT INTO `logs` VALUES ('406', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:35:56');
INSERT INTO `logs` VALUES ('407', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:36:40');
INSERT INTO `logs` VALUES ('408', '角色权限', 'anquan', '/juesequanxian', 'GET', '安全管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:43:38');
INSERT INTO `logs` VALUES ('409', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:44:06');
INSERT INTO `logs` VALUES ('410', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:44:08');
INSERT INTO `logs` VALUES ('411', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 15:44:11');
INSERT INTO `logs` VALUES ('412', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:01:49');
INSERT INTO `logs` VALUES ('413', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:01:51');
INSERT INTO `logs` VALUES ('414', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:01:54');
INSERT INTO `logs` VALUES ('415', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:01:55');
INSERT INTO `logs` VALUES ('416', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:01:56');
INSERT INTO `logs` VALUES ('417', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:01:58');
INSERT INTO `logs` VALUES ('418', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:01:58');
INSERT INTO `logs` VALUES ('419', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:02:00');
INSERT INTO `logs` VALUES ('420', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:02:00');
INSERT INTO `logs` VALUES ('421', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:02:03');
INSERT INTO `logs` VALUES ('422', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 16:02:14');
INSERT INTO `logs` VALUES ('423', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:10:47');
INSERT INTO `logs` VALUES ('424', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:10:49');
INSERT INTO `logs` VALUES ('425', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:10:50');
INSERT INTO `logs` VALUES ('426', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:11:15');
INSERT INTO `logs` VALUES ('427', '角色权限', 'anquan', '/juesequanxian', 'GET', '安全管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:11:28');
INSERT INTO `logs` VALUES ('428', '角色权限', 'anquan', '/juesequanxian', 'GET', '安全管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:17:40');
INSERT INTO `logs` VALUES ('429', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:17:50');
INSERT INTO `logs` VALUES ('430', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:25:03');
INSERT INTO `logs` VALUES ('431', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:30:56');
INSERT INTO `logs` VALUES ('432', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:31:13');
INSERT INTO `logs` VALUES ('433', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:31:16');
INSERT INTO `logs` VALUES ('434', '菜单按钮功能管理', 'xitong', '/caidananniugongnengguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:31:22');
INSERT INTO `logs` VALUES ('435', '系统日志', 'xitong', '/xitongrizhi', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:31:24');
INSERT INTO `logs` VALUES ('436', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:31:27');
INSERT INTO `logs` VALUES ('437', '系统日志', 'xitong', '/xitongrizhi', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:31:28');
INSERT INTO `logs` VALUES ('438', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:31:34');
INSERT INTO `logs` VALUES ('439', '系统日志', 'xitong', '/xitongrizhi', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:31:35');
INSERT INTO `logs` VALUES ('440', '系统日志', 'xitong', '/xitongrizhi', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:31:39');
INSERT INTO `logs` VALUES ('441', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:32:28');
INSERT INTO `logs` VALUES ('442', '角色权限', 'xitong', '/juesequanxian', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:37:56');
INSERT INTO `logs` VALUES ('443', '系统日志', 'xitong', '/xitongrizhi', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:37:58');
INSERT INTO `logs` VALUES ('444', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:37:58');
INSERT INTO `logs` VALUES ('445', '系统日志', 'xitong', '/xitongrizhi', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:40:09');
INSERT INTO `logs` VALUES ('446', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:40:10');
INSERT INTO `logs` VALUES ('447', '系统白名单', 'xitong', '/xitongbaimingdan', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:40:31');
INSERT INTO `logs` VALUES ('448', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:55:15');
INSERT INTO `logs` VALUES ('449', '组织架构管理', 'xitong', '/zuzhijiagouguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:55:17');
INSERT INTO `logs` VALUES ('450', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 19:55:21');
INSERT INTO `logs` VALUES ('451', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 20:30:03');
INSERT INTO `logs` VALUES ('452', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 20:45:51');
INSERT INTO `logs` VALUES ('453', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 20:59:46');
INSERT INTO `logs` VALUES ('454', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 21:01:34');
INSERT INTO `logs` VALUES ('455', '用户管理', 'xitong', '/yonghuguanli', 'GET', '系统管理员', '0:0:0:0:0:0:0:1', '2019-09-08 21:02:48');

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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('60', '用户管理', 'yonghuguanliP', null, null, null, '1', null, null, null, null, null, '1');
INSERT INTO `permission` VALUES ('61', '用户管理', 'yonghuguanli', '/yonghuguanli', null, null, '1', '60', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('62', '组织架构管理', 'zuzhijiagouguanli', '/zuzhijiagouguanli', null, null, '1', '60', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('63', '角色权限', 'juesequanxian', '/juesequanxian', null, null, '1', '60', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('64', '系统管理', 'xitongguanli', '', null, null, '1', null, null, null, null, null, '1');
INSERT INTO `permission` VALUES ('65', '菜单按钮功能管理', 'caidananniugongnengguanli', '/caidananniugongnengguanli', null, null, '1', '64', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('66', '系统日志', 'xitongrizhi', '/xitongrizhi', null, null, '1', '64', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('67', '系统白名单', 'xitongbaimingdan', '/xitongbaimingdan', null, null, '1', '64', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('69', '新增', 'zzjg-new', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('70', '添加下级组织', 'zzjg-xiaji', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('71', '添加同级组织', 'zzjg-tongji', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('72', '修改', 'zzjg-update', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('73', '查看', 'zzjg-chakan', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('74', '删除', 'zzjg-delete', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('75', '批量删除', 'zzjg-deleteall', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('76', '导入', 'zzjg-import', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('77', '导出', 'zzjg-export', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('78', '暂时停用', 'zzjg-lock', null, null, null, '2', '62', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('79', '新增', 'user-new', '', '', null, '2', '61', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('80', '修改', 'user-update', '', '', null, '2', '61', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('81', '查看', 'user-chakan', '', '', null, '2', '61', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('82', '删除', 'user-delete', '', '', null, '2', '61', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('83', '批量删除', 'user-deleteall', '', '', null, '2', '61', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('84', '导入', 'user-import', '', '', null, '2', '61', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('85', '导出', 'user-export', '', '', null, '2', '61', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('86', '暂时停用', 'user-lock', '', '', null, '2', '61', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('87', '用户激活', 'user-use', null, null, null, '2', '61', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('88', '新增', 'role-new', '', '', null, '2', '63', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('89', '修改', 'role-update', '', '', null, '2', '63', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('90', '查看', 'role-chakan', '', '', null, '2', '63', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('91', '删除', 'role-delete', '', '', null, '2', '63', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('92', '批量删除', 'role-deleteall', '', '', null, '2', '63', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('93', '导入', 'role-import', '', '', null, '2', '63', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('94', '导出', 'role-export', '', '', null, '2', '63', '', null, '', null, '1');
INSERT INTO `permission` VALUES ('95', '导出', 'rizhi-export', null, null, null, '2', '66', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('96', '安全权限', 'anquan', null, null, null, '3', null, null, null, null, null, '1');
INSERT INTO `permission` VALUES ('104', '新增菜单', 'permission-new', null, null, null, '2', '65', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('105', '新增按钮', 'permission-creat', null, null, null, '2', '65', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('106', '修改', 'permission-update', null, null, null, '2', '65', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('107', '查看', 'permission-look', null, null, null, '2', '65', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('108', '删除', 'permission-delete', null, null, null, '2', '65', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('109', '批量删除', 'permission-deleteall', null, null, null, '2', '65', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('110', '导入', 'permission-import', null, null, null, '2', '65', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('111', '导出', 'permission-export', null, null, null, '2', '65', null, null, null, null, '1');
INSERT INTO `permission` VALUES ('112', '暂时停用', 'permission-isuse', null, null, null, '2', '65', null, null, null, null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role2permission
-- ----------------------------
INSERT INTO `role2permission` VALUES ('525', '48', '60');
INSERT INTO `role2permission` VALUES ('526', '48', '61');
INSERT INTO `role2permission` VALUES ('527', '48', '62');
INSERT INTO `role2permission` VALUES ('528', '48', '63');
INSERT INTO `role2permission` VALUES ('529', '48', '64');
INSERT INTO `role2permission` VALUES ('530', '48', '65');
INSERT INTO `role2permission` VALUES ('531', '48', '66');
INSERT INTO `role2permission` VALUES ('532', '48', '67');
INSERT INTO `role2permission` VALUES ('533', '48', '69');
INSERT INTO `role2permission` VALUES ('534', '48', '70');
INSERT INTO `role2permission` VALUES ('535', '48', '71');
INSERT INTO `role2permission` VALUES ('536', '48', '72');
INSERT INTO `role2permission` VALUES ('537', '48', '73');
INSERT INTO `role2permission` VALUES ('538', '48', '74');
INSERT INTO `role2permission` VALUES ('539', '48', '75');
INSERT INTO `role2permission` VALUES ('540', '48', '76');
INSERT INTO `role2permission` VALUES ('541', '48', '77');
INSERT INTO `role2permission` VALUES ('542', '48', '78');
INSERT INTO `role2permission` VALUES ('543', '48', '79');
INSERT INTO `role2permission` VALUES ('544', '48', '80');
INSERT INTO `role2permission` VALUES ('545', '48', '81');
INSERT INTO `role2permission` VALUES ('546', '48', '82');
INSERT INTO `role2permission` VALUES ('547', '48', '83');
INSERT INTO `role2permission` VALUES ('548', '48', '84');
INSERT INTO `role2permission` VALUES ('549', '48', '85');
INSERT INTO `role2permission` VALUES ('550', '48', '86');
INSERT INTO `role2permission` VALUES ('551', '48', '87');
INSERT INTO `role2permission` VALUES ('552', '48', '88');
INSERT INTO `role2permission` VALUES ('553', '48', '89');
INSERT INTO `role2permission` VALUES ('554', '48', '90');
INSERT INTO `role2permission` VALUES ('555', '48', '91');
INSERT INTO `role2permission` VALUES ('556', '48', '92');
INSERT INTO `role2permission` VALUES ('557', '48', '93');
INSERT INTO `role2permission` VALUES ('558', '48', '94');
INSERT INTO `role2permission` VALUES ('559', '48', '95');
INSERT INTO `role2permission` VALUES ('560', '50', '96');
INSERT INTO `role2permission` VALUES ('561', '48', '104');
INSERT INTO `role2permission` VALUES ('562', '48', '105');
INSERT INTO `role2permission` VALUES ('563', '48', '106');
INSERT INTO `role2permission` VALUES ('564', '48', '107');
INSERT INTO `role2permission` VALUES ('565', '48', '108');
INSERT INTO `role2permission` VALUES ('566', '48', '109');
INSERT INTO `role2permission` VALUES ('567', '48', '110');
INSERT INTO `role2permission` VALUES ('568', '48', '111');
INSERT INTO `role2permission` VALUES ('569', '48', '112');

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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('85', 'xitong', '系统管理员', '21232f297a57a5a743894a0e4a801fc3', '112', '111', '222', null, '48', '6', '0', null, null, null, null, '1');
INSERT INTO `user` VALUES ('86', 'anquan', '安全管理员', '21232f297a57a5a743894a0e4a801fc3', '121212', '11', '11', '11', '50', '16', '0', null, '', null, null, '1');
INSERT INTO `user` VALUES ('90', 'shenji', '审计管理员', '21232f297a57a5a743894a0e4a801fc3', '111', '111', '111', '11', '51', '1', '0', '', '', null, null, '1');
