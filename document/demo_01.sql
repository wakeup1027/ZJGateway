/*
Navicat MySQL Data Transfer

Source Server         : aaa
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : jsedu

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2014-08-28 14:40:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `c_id` int(11) NOT NULL auto_increment,
  `c_name` varchar(50) default NULL,
  PRIMARY KEY  (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('1', '软件一班');
INSERT INTO `classes` VALUES ('2', '软件二班');
INSERT INTO `classes` VALUES ('7', '软件测试班');
INSERT INTO `classes` VALUES ('18', 'test2');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL auto_increment,
  `course_name` varchar(50) default NULL,
  PRIMARY KEY  (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '英语');
INSERT INTO `course` VALUES ('2', '高等数学');
INSERT INTO `course` VALUES ('3', '离散数学');
INSERT INTO `course` VALUES ('4', '微积分');
INSERT INTO `course` VALUES ('5', '汇编');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `s_id` int(11) NOT NULL,
  `c_id` int(11) default NULL,
  `s_num` varchar(20) default NULL,
  `s_name` varchar(20) default NULL,
  `s_pwd` varchar(50) default NULL,
  `s_sex` tinyint(1) default NULL,
  PRIMARY KEY  (`s_id`),
  KEY `FK_r_1` (`c_id`),
  CONSTRAINT `FK_r_1` FOREIGN KEY (`c_id`) REFERENCES `classes` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1', '20124206025', '杨春蓉', '123', '1');
INSERT INTO `student` VALUES ('2', '1', '20124206026', '周柱良', '123', '1');
INSERT INTO `student` VALUES ('3', '1', '20124206034', '周津津', '456', '1');
INSERT INTO `student` VALUES ('4', '1', '20124206037', '吉蔚恺', 'asdf', '1');
INSERT INTO `student` VALUES ('5', '1', '20124206041', '康惠', '123', '1');
INSERT INTO `student` VALUES ('6', '1', '20124206049', '廖洁瑕', '123', '1');
INSERT INTO `student` VALUES ('7', '1', '20124206050', '邱凌俊', '123', '1');
INSERT INTO `student` VALUES ('8', '1', '20124206053', '彭磊', '123', '1');
INSERT INTO `student` VALUES ('9', '1', '20124206058', '龚回', '123', '1');
INSERT INTO `student` VALUES ('10', '1', '20124206065', '枚凯', '123', '1');
INSERT INTO `student` VALUES ('11', '1', '20124206069', '罗灿', '123', '1');
INSERT INTO `student` VALUES ('12', '1', '20124206074', '杨柳', '123', '1');
INSERT INTO `student` VALUES ('13', '1', '20124206077', '马杏', '123', '1');
INSERT INTO `student` VALUES ('14', '1', '20124206081', '杨颂', '123', '1');
INSERT INTO `student` VALUES ('15', '1', '20124206082', '曹佳燕', '123', '1');
INSERT INTO `student` VALUES ('16', '1', '20124206086', '周金', '123', '1');
INSERT INTO `student` VALUES ('17', '1', '20124206089', '宁施汝', '123', '1');
INSERT INTO `student` VALUES ('18', '1', '20124206090', '孙卫友', '123', '1');
INSERT INTO `student` VALUES ('19', '1', '20124206094', '周志杨', '123', '1');
INSERT INTO `student` VALUES ('20', '1', '20124206097', '何鑫奇', '123', '1');
INSERT INTO `student` VALUES ('21', '1', '20124206098', '肖坤林', '123', '1');
INSERT INTO `student` VALUES ('22', '1', '20124206106', '郑明仁', '123', '1');
INSERT INTO `student` VALUES ('23', '1', '20124206109', '王乐容', '123', '1');
INSERT INTO `student` VALUES ('24', '1', '20124206113', '李琴琴', '123', '1');
INSERT INTO `student` VALUES ('25', '1', '20124206117', '杨娟', '123', '1');
INSERT INTO `student` VALUES ('26', '1', '20124206121', '朱庭桂', '123', '1');
INSERT INTO `student` VALUES ('27', '1', '20124206122', '肖媛', '123', '1');
INSERT INTO `student` VALUES ('28', '1', '20124206125', '阳玲玲', '123', '1');

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `s_id` int(11) default NULL,
  `course_id` int(11) default NULL,
  KEY `s_id` (`s_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `student_course_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`),
  CONSTRAINT `student_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES ('1', '1');
INSERT INTO `student_course` VALUES ('1', '2');
INSERT INTO `student_course` VALUES ('1', '3');
INSERT INTO `student_course` VALUES ('2', '1');
INSERT INTO `student_course` VALUES ('2', '4');
INSERT INTO `student_course` VALUES ('2', '5');
INSERT INTO `student_course` VALUES ('1', '4');

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `s_id` int(11) NOT NULL,
  `s_tel` varchar(255) default NULL,
  `s_address` varchar(255) default NULL,
  PRIMARY KEY  (`s_id`),
  CONSTRAINT `student_info_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_info
-- ----------------------------
INSERT INTO `student_info` VALUES ('1', '11111', 'sasdfs');
INSERT INTO `student_info` VALUES ('2', '2222222', 'asdfasdfdsfdsf');
