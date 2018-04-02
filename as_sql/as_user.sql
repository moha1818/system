/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.241
Source Server Version : 50718
Source Host           : 192.168.20.241:3306
Source Database       : mytable

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-02 16:58:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for as_user
-- ----------------------------
DROP TABLE IF EXISTS `as_user`;
CREATE TABLE `as_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userCode` varchar(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userPassword` varchar(64) NOT NULL,
  `creationTime` datetime NOT NULL,
  `lastLoginTime` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `lastUpdateTime` datetime NOT NULL,
  `isStart` int(11) NOT NULL,
  `roleid` int(20) NOT NULL,
  `salt` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of as_user
-- ----------------------------
INSERT INTO `as_user` VALUES ('1', 'admin', '管理员', '2bcd5ce7c08624013adc59f09d005e671fabca9e', '2017-04-14 23:41:06', '2018-03-02 16:08:49', 'admin', '2017-04-24 16:52:49', '1', '1', 'c8edca152549446087885ca649b1e239');
INSERT INTO `as_user` VALUES ('4', 'lili', 'lili', '15450677ad82bb591b4a441ab5532c497a5d643a', '2017-04-27 09:55:40', '2018-03-02 16:08:17', 'admin', '2017-04-27 09:55:40', '1', '1', 'b1de0bfe87384729a48c891e40239dd9');
