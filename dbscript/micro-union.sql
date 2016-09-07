/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : micro-union

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-21 16:43:25
*/

SET FOREIGN_KEY_CHECKS=0;

drop database if exists micro_union;
create database micro_union character set utf8;
use micro_union;

-- ----------------------------
-- Table structure for detects
-- ----------------------------
DROP TABLE IF EXISTS `detects`;
CREATE TABLE `detects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_id` int(11) DEFAULT NULL COMMENT '标本ID（关联主标本表）',
  `sample_type_id` int(11) DEFAULT NULL COMMENT '标本类型ID（关联标本类型表）',
  `detect_type_id` int(11) DEFAULT NULL COMMENT '检测类型ID（关联检测类型表）',
  `print_time` datetime DEFAULT NULL COMMENT '处理开始时间（打印条码开始）',
  `print_user_id` int(11) DEFAULT NULL COMMENT '打印条码用户ID',
  `code_no` varchar(50) DEFAULT NULL COMMENT '条码编号',
  `deal_time` datetime DEFAULT NULL COMMENT '处理结束时间',
  `deal_user_id` int(11) DEFAULT NULL COMMENT '处理结果用户ID',
  `status` varchar(50) DEFAULT NULL COMMENT '状态（条码生成、镜检完成	）',
  `child_id` int(10) unsigned zerofill DEFAULT NULL COMMENT '后续处理ID（自关联，如没有默认值0）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detects
-- ----------------------------

-- ----------------------------
-- Table structure for detect_result
-- ----------------------------
DROP TABLE IF EXISTS `detect_result`;
CREATE TABLE `detect_result` (
  `id` int(11) NOT NULL,
  `detect_type_id` int(11) DEFAULT NULL COMMENT '检测类型ID',
  `content` varchar(100) DEFAULT NULL COMMENT '检测结果内容',
  `index` int(11) DEFAULT NULL COMMENT 'Index排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detect_result
-- ----------------------------

-- ----------------------------
-- Table structure for detect_result_rel
-- ----------------------------
DROP TABLE IF EXISTS `detect_result_rel`;
CREATE TABLE `detect_result_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detect_id` int(11) DEFAULT NULL COMMENT '标本处理事件ID',
  `detect_result_id` int(11) DEFAULT NULL COMMENT '检测结果ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detect_result_rel
-- ----------------------------

-- ----------------------------
-- Table structure for detect_type
-- ----------------------------
DROP TABLE IF EXISTS `detect_type`;
CREATE TABLE `detect_type` (
  `id` int(11) NOT NULL,
  `sample_type_id` int(11) DEFAULT NULL COMMENT '标本类型ID（血液标本、呼吸道标本、尿液标本等）',
  `detect_method` varchar(50) DEFAULT NULL COMMENT '标本检测大类型（染色镜检、转种平板）',
  `detect_type` varchar(50) DEFAULT NULL COMMENT '检测类型（具体的涂片类型如一般细菌涂片、真菌涂片或者平板类型BA、CA）',
  `print_prefix` varchar(50) DEFAULT NULL COMMENT '打印前缀（根据检测类型来区分不同的前缀）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detect_type
-- ----------------------------

-- ----------------------------
-- Table structure for remarks
-- ----------------------------
DROP TABLE IF EXISTS `remarks`;
CREATE TABLE `remarks` (
  `id` int(11) NOT NULL,
  `sample_type_id` int(11) DEFAULT NULL COMMENT '标本类型ID ',
  `content` varchar(100) DEFAULT NULL COMMENT '备注内容',
  `index` int(11) DEFAULT NULL COMMENT 'Index排序号',
  `type` tinyint(3) unsigned zerofill DEFAULT NULL COMMENT '备注类型,0：红色 1：黄色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of remarks
-- ----------------------------

-- ----------------------------
-- Table structure for samples
-- ----------------------------
DROP TABLE IF EXISTS `samples`;
CREATE TABLE `samples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_code` varchar(100) DEFAULT NULL COMMENT '扫描条码（医院条码）',
  `bottle_code` varchar(100) DEFAULT NULL COMMENT '瓶身条码(血，脑，体才有)',
  `sample_type` int(11) DEFAULT NULL COMMENT '标本类型（血液标本、呼吸道标本、尿液标本）',
  `patient_info` varchar(255) DEFAULT NULL COMMENT '标本人信息（病人名称、性别、年龄、病情描述）',
  `receive_time` datetime DEFAULT NULL COMMENT '标本接收时间（医院条码扫码时间）',
  `status` varchar(50) DEFAULT NULL COMMENT '当前状态（录入，处理中，处理完成）',
  `userid` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of samples
-- ----------------------------

-- ----------------------------
-- Table structure for sample_remark_rel
-- ----------------------------
DROP TABLE IF EXISTS `sample_remark_rel`;
CREATE TABLE `sample_remark_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_id` int(11) DEFAULT NULL COMMENT '标本ID',
  `remark_id` int(11) DEFAULT NULL COMMENT '备注ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sample_remark_rel
-- ----------------------------

-- ----------------------------
-- Table structure for sample_type
-- ----------------------------
DROP TABLE IF EXISTS `sample_type`;
CREATE TABLE `sample_type` (
  `id` int(11) NOT NULL,
  `sample_type` varchar(50) DEFAULT NULL COMMENT '标本类型名称（血液标本、呼吸道标本、尿液标本等）',
  `if_bottomcode` tinyint(3) unsigned zerofill DEFAULT NULL COMMENT '是否扫描瓶身条码,0：不扫描 1：扫描',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sample_type
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `hospital` varchar(100) DEFAULT NULL COMMENT '医院名称',
  `department` varchar(50) DEFAULT NULL COMMENT '部门',
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `number` varchar(50) DEFAULT NULL COMMENT '编号（医院编号）',
  `username` varchar(50) NOT NULL COMMENT '登录名称',
  `password` varchar(50) NOT NULL COMMENT '登录密码',
  `isdelete` tinyint(1) unsigned zerofill DEFAULT NULL COMMENT '是否删除 0为正常，1为删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for user_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_id` int(11) DEFAULT NULL COMMENT '主标本ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `option` varchar(255) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_logs
-- ----------------------------
