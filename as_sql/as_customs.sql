/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.241
Source Server Version : 50718
Source Host           : 192.168.20.241:3306
Source Database       : mytable

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-02 16:58:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for as_customs
-- ----------------------------
DROP TABLE IF EXISTS `as_customs`;
CREATE TABLE `as_customs` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `agentId` int(20) NOT NULL,
  `agentName` varchar(255) NOT NULL,
  `customName` varchar(255) NOT NULL,
  `customType` int(11) NOT NULL,
  `customTypeName` varchar(50) NOT NULL,
  `siteUrl` varchar(255) DEFAULT NULL,
  `customStatus` int(11) NOT NULL,
  `bossName` varchar(50) NOT NULL,
  `cardType` int(11) NOT NULL,
  `cardTypeName` varchar(20) NOT NULL,
  `cardNum` varchar(60) NOT NULL,
  `companyTel` varchar(50) NOT NULL,
  `companyFax` varchar(50) DEFAULT NULL,
  `regdateTime` datetime DEFAULT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(200) NOT NULL,
  `area` varchar(20) NOT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `agentCode` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of as_customs
-- ----------------------------
INSERT INTO `as_customs` VALUES ('1', '2', '汤姆', '眼镜中心营业厅', '1', '企业', 'http://url', '1', '法人一', '2', '境外身份证', '11101101', '888', '0-88', '2017-04-14 23:41:24', '中国', '1', '12', '120', '地址1', 'xxxxx', 'tom', null);
INSERT INTO `as_customs` VALUES ('2', '2', '汤姆', '嘉顿实业', '1', '企业', 'http://url', '1', '法人二', '2', '境外身份证', '11223322', '999', '0-99', '2017-04-14 23:41:24', '中国', '1', '11', '110', '地址2', 'xxxxx', 'tom', null);
INSERT INTO `as_customs` VALUES ('3', '1', '管理员', 'sdad', '2', '个人', 'http://xcxc', '1', 'sdsds', '1', '国内身份证', '330283199411111111', '00000000', '00000000', '2017-05-15 00:00:00', '中国', '120000', '120100', '120109', 'cxxxx', 'dsfdfds', 'admin', 'fdfsfds');
INSERT INTO `as_customs` VALUES ('4', '1', '管理员', 'fdds', '1', '企业', 'http://', '1', '地方', '3', '营业执照', '123244343424', '7', '7', '2017-05-11 00:00:00', '中国', '120000', '120200', '120221', '倒萨大', '7', 'admin', '7');
INSERT INTO `as_customs` VALUES ('5', '1', '管理员', 'fafa', '1', '企业', 'http://', '1', 'fafaf', '3', '营业执照', 'afaf', 'af', 'faf', '2018-02-20 00:00:00', '中国', '120000', '120100', '120102', 'fafa', 'affafa', 'admin', 'afaf');
INSERT INTO `as_customs` VALUES ('6', '1', '管理员', 'vzvzvz', '-1', '', 'http://zvzvz', '1', 'zzzz', '1', '国内身份证', 'qqqq', 'vzvzv', 'zvz', '2018-02-15 00:00:00', '中国', '120000', '120200', '120223', 'vzv', 'faf', 'admin', '799845210@qq.com');
