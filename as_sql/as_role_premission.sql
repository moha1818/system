/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.241
Source Server Version : 50718
Source Host           : 192.168.20.241:3306
Source Database       : mytable

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-02 16:58:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for as_role_premission
-- ----------------------------
DROP TABLE IF EXISTS `as_role_premission`;
CREATE TABLE `as_role_premission` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `roleId` int(20) NOT NULL,
  `functionId` int(20) NOT NULL,
  `creationTime` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `lastUpdatetime` datetime NOT NULL,
  `isStart` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of as_role_premission
-- ----------------------------
INSERT INTO `as_role_premission` VALUES ('2', '1', '1', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('3', '1', '2', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('4', '1', '3', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('5', '1', '4', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('6', '1', '5', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('7', '1', '6', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('8', '1', '7', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('9', '1', '8', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('10', '1', '9', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('11', '1', '10', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('12', '1', '11', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('13', '1', '12', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('14', '1', '13', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('15', '1', '14', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('16', '1', '15', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('17', '1', '16', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('18', '1', '17', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('19', '1', '18', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
INSERT INTO `as_role_premission` VALUES ('20', '1', '19', '2017-04-14 16:46:11', 'admin', '2017-04-14 16:46:11', '1');
