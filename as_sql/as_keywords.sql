/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.241
Source Server Version : 50718
Source Host           : 192.168.20.241:3306
Source Database       : mytable

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-02 16:58:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for as_keywords
-- ----------------------------
DROP TABLE IF EXISTS `as_keywords`;
CREATE TABLE `as_keywords` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(100) NOT NULL,
  `agentId` int(20) NOT NULL,
  `agentName` varchar(255) NOT NULL,
  `customId` int(20) NOT NULL,
  `customName` varchar(255) NOT NULL,
  `preRegFrozenMoney` double(11,2) NOT NULL,
  `price` double(11,2) NOT NULL,
  `productType` int(11) NOT NULL,
  `serviceYears` int(11) NOT NULL,
  `openApp` int(11) NOT NULL,
  `appUserName` varchar(64) DEFAULT NULL,
  `appPassword` varchar(70) DEFAULT NULL,
  `loginUrl` varchar(255) DEFAULT NULL,
  `iosDownloadUrl` varchar(255) DEFAULT NULL,
  `androidDownloadUrl` varchar(255) DEFAULT NULL,
  `codeIosUrl` varchar(255) DEFAULT NULL,
  `codeAndroidUrl` varchar(255) DEFAULT NULL,
  `preRegdatetime` datetime DEFAULT NULL,
  `preRegPassdatetime` datetime DEFAULT NULL,
  `regdatetime` datetime DEFAULT NULL,
  `regPassdatetime` datetime DEFAULT NULL,
  `isPass` int(11) NOT NULL,
  `checkStatus` int(11) NOT NULL,
  `isUse` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of as_keywords
-- ----------------------------
INSERT INTO `as_keywords` VALUES ('1', 'faf', '1', '管理员', '4', 'fdds', '26000.00', '26000.00', '1', '1', '0', null, null, null, null, null, null, null, '2018-02-28 00:06:03', '2018-02-28 00:06:08', '2018-02-28 00:06:03', '2019-02-28 00:06:03', '0', '2', '1');
INSERT INTO `as_keywords` VALUES ('2', 'fafa', '1', '管理员', '1', '眼镜中心营业厅', '26000.00', '26000.00', '1', '1', '0', null, null, null, null, null, null, null, '2018-02-28 00:06:51', '2018-02-28 00:06:56', '2018-02-28 00:06:51', '2019-02-28 00:06:51', '0', '0', '1');
