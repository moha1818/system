/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.241
Source Server Version : 50718
Source Host           : 192.168.20.241:3306
Source Database       : mytable

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-02 16:58:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for as_role
-- ----------------------------
DROP TABLE IF EXISTS `as_role`;
CREATE TABLE `as_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) NOT NULL,
  `creationTime` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `lastUpdateTime` datetime NOT NULL,
  `isStart` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of as_role
-- ----------------------------
INSERT INTO `as_role` VALUES ('1', '系统管理员', '2017-04-14 23:41:24', '张三', '2017-04-14 23:41:24', '1');
INSERT INTO `as_role` VALUES ('2', '代理商', '2017-04-14 23:41:24', '李四', '2017-04-14 23:41:24', '1');
INSERT INTO `as_role` VALUES ('3', '市场', '2017-04-14 23:41:24', '张三', '2017-04-14 23:41:24', '1');
INSERT INTO `as_role` VALUES ('4', '财务', '2017-04-14 23:41:24', '李四', '2017-04-14 23:41:24', '1');
INSERT INTO `as_role` VALUES ('5', '客服', '2017-04-14 23:41:24', '张三', '2017-04-14 23:41:24', '1');
INSERT INTO `as_role` VALUES ('6', '大区经理', '2017-04-14 23:41:24', '李四', '2017-04-14 23:41:24', '1');
INSERT INTO `as_role` VALUES ('7', '渠道经理', '2017-04-14 23:41:24', '张三', '2017-04-14 23:41:24', '1');
