/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.241
Source Server Version : 50718
Source Host           : 192.168.20.241:3306
Source Database       : mytable

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-02 16:58:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for as_systemconfig
-- ----------------------------
DROP TABLE IF EXISTS `as_systemconfig`;
CREATE TABLE `as_systemconfig` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `configType` int(11) NOT NULL,
  `configTypeName` varchar(20) NOT NULL,
  `configTypeValue` int(11) NOT NULL,
  `configValue` varchar(20) NOT NULL,
  `isStart` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of as_systemconfig
-- ----------------------------
INSERT INTO `as_systemconfig` VALUES ('1', '1', '代理款', '1', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('2', '1', '转账', '2', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('3', '1', '财务打款', '3', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('4', '1', '冻结', '4', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('5', '1', '扣费', '5', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('6', '1', '代理款冲抵', '6', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('7', '1', '消费', '7', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('8', '1', '退费', '8', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('9', '1', '返款', '9', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('10', '1', '罚款', '10', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('11', '1', '代理商预录', '11', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('13', '2', '上传苹果商城', '1', '26000', '1');
INSERT INTO `as_systemconfig` VALUES ('14', '2', '不上传苹果商城', '2', '18000', '1');
INSERT INTO `as_systemconfig` VALUES ('16', '4', 'APP地址', '1', 'http://url', '1');
INSERT INTO `as_systemconfig` VALUES ('17', '5', '企业', '1', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('18', '5', '个人', '2', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('19', '5', '政府', '3', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('20', '6', '国内身份证', '1', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('21', '6', '国外身份证', '2', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('22', '6', '营业执照', '3', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('23', '6', '其他证件', '4', '0', '1');
INSERT INTO `as_systemconfig` VALUES ('24', '7', '买二赠一', '3', '2', '1');
INSERT INTO `as_systemconfig` VALUES ('26', '3', '服务年限', '3', '3', '1');
