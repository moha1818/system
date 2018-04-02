/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.241
Source Server Version : 50718
Source Host           : 192.168.20.241:3306
Source Database       : mytable

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-02 16:58:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for as_contacts
-- ----------------------------
DROP TABLE IF EXISTS `as_contacts`;
CREATE TABLE `as_contacts` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `customId` int(20) NOT NULL,
  `contactName` varchar(20) NOT NULL,
  `contactTel` varchar(20) NOT NULL,
  `contactFax` varchar(20) DEFAULT NULL,
  `contactEmail` varchar(20) NOT NULL,
  `contactRole` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of as_contacts
-- ----------------------------
