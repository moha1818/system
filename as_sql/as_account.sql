/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.241
Source Server Version : 50718
Source Host           : 192.168.20.241:3306
Source Database       : mytable

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-02 16:57:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for as_account
-- ----------------------------
DROP TABLE IF EXISTS `as_account`;
CREATE TABLE `as_account` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` int(20) NOT NULL,
  `money` double(11,2) NOT NULL,
  `moneyBak` double(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of as_account
-- ----------------------------
INSERT INTO `as_account` VALUES ('1', '1', '16122002.02', '16174002.02');
INSERT INTO `as_account` VALUES ('2', '4', '10000.00', '0.00');
