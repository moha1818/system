/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.241
Source Server Version : 50718
Source Host           : 192.168.20.241:3306
Source Database       : mytable

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-02 16:58:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for as_function
-- ----------------------------
DROP TABLE IF EXISTS `as_function`;
CREATE TABLE `as_function` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `functionCode` varchar(50) NOT NULL,
  `functionName` varchar(50) NOT NULL,
  `creationTime` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `lastUpdateTime` datetime NOT NULL,
  `funcUrl` varchar(255) NOT NULL,
  `isStart` int(11) NOT NULL,
  `parentId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of as_function
-- ----------------------------
INSERT INTO `as_function` VALUES ('1', 'keywords_application', '关键词申请', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/keywords_application.action', '1', '1');
INSERT INTO `as_function` VALUES ('2', 'pageList', '代理商客户管理', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/pageList.action', '1', '1');
INSERT INTO `as_function` VALUES ('3', 'prepay', '代理商预付款', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/prepay.action', '1', '1');
INSERT INTO `as_function` VALUES ('4', 'keywordsList', '关键词申请管理', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/keywordsList.action', '1', '1');
INSERT INTO `as_function` VALUES ('5', 'loglist', '操作日志', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/loglist.action', '1', '1');
INSERT INTO `as_function` VALUES ('6', 'getPortal', '门户管理', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/getPortal.action', '1', '2');
INSERT INTO `as_function` VALUES ('7', 'showReport', '报表管理', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/showReport.action', '1', '3');
INSERT INTO `as_function` VALUES ('8', 'financial', '财务管理', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/financial.action', '1', '4');
INSERT INTO `as_function` VALUES ('9', 'rolema', '角色管理', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/rolema.action', '1', '4');
INSERT INTO `as_function` VALUES ('10', 'roleau', '角色权限管理', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/roleau.action', '1', '4');
INSERT INTO `as_function` VALUES ('11', 'userma', '用户管理', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/userma.action', '1', '4');
INSERT INTO `as_function` VALUES ('12', 'keywordsCheck', '关键词审核', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/keywordsCheck.action', '1', '4');
INSERT INTO `as_function` VALUES ('13', 'financialType', '财务类型', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/financialType.action', '1', '5');
INSERT INTO `as_function` VALUES ('14', 'serviceType', '服务类型', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/serviceType.action', '1', '5');
INSERT INTO `as_function` VALUES ('15', 'serviceTime', '服务年限', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/serviceTime.action', '1', '5');
INSERT INTO `as_function` VALUES ('16', 'appAddress', 'app地址', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/appAddress.action', '1', '5');
INSERT INTO `as_function` VALUES ('17', 'clientType', '客户类型', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/clientType.action', '1', '5');
INSERT INTO `as_function` VALUES ('18', 'credentialsType', '证件类型', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/credentialsType.action', '1', '5');
INSERT INTO `as_function` VALUES ('19', 'preferentialType', '优惠类型', '2017-04-14 23:41:24', 'admin', '2017-04-14 23:41:24', '/preferentialType.action', '1', '5');
