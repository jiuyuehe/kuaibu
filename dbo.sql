/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50716
Source Host           : localhost:33060
Source Database       : dbo

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-29 17:54:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for advers
-- ----------------------------
DROP TABLE IF EXISTS `advers`;
CREATE TABLE `advers` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(255) DEFAULT NULL COMMENT '计费Id',
  `status` int(20) DEFAULT NULL COMMENT '状态',
  `ad_group` int(20) DEFAULT NULL COMMENT '所在分组',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `ad_infoid` int(20) DEFAULT NULL,
  `ad_userid` int(20) DEFAULT NULL COMMENT '占用用户信息',
  PRIMARY KEY (`id`),
  KEY `adver_userid` (`ad_userid`),
  KEY `adver_infoid` (`ad_infoid`),
  CONSTRAINT `adver_infoid` FOREIGN KEY (`ad_infoid`) REFERENCES `adver_info` (`id`),
  CONSTRAINT `adver_userid` FOREIGN KEY (`ad_userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advers
-- ----------------------------

-- ----------------------------
-- Table structure for adver_info
-- ----------------------------
DROP TABLE IF EXISTS `adver_info`;
CREATE TABLE `adver_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ad_id` int(20) DEFAULT NULL COMMENT '业务ID,发数据的时候用',
  `ad_name` varchar(255) DEFAULT NULL,
  `ad_title` varchar(255) DEFAULT NULL,
  `ad_url` varchar(255) DEFAULT NULL,
  `ad_price_type` varchar(255) DEFAULT NULL,
  `ad_price` int(20) DEFAULT NULL,
  `ad_price_num` int(20) DEFAULT NULL,
  `ad_settlement` varchar(255) DEFAULT NULL,
  `ad_content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `auto` int(20) DEFAULT NULL,
  `group` int(20) DEFAULT NULL COMMENT '业务分组',
  `tip` varchar(255) DEFAULT NULL COMMENT '开业务时候的提示',
  `template` varchar(255) DEFAULT NULL COMMENT '绑定的模板(yewu01)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adver_info
-- ----------------------------

-- ----------------------------
-- Table structure for ipplugs
-- ----------------------------
DROP TABLE IF EXISTS `ipplugs`;
CREATE TABLE `ipplugs` (
  `id` int(20) NOT NULL,
  `status` int(20) DEFAULT NULL COMMENT '选择性参数',
  `content` varchar(255) DEFAULT NULL COMMENT '文本型参数',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `ipplug_userid` int(20) DEFAULT NULL,
  `ipplug_adid` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ipplug_userid` (`ipplug_userid`),
  KEY `ipplug_adid` (`ipplug_adid`),
  CONSTRAINT `ipplug_adid` FOREIGN KEY (`ipplug_adid`) REFERENCES `advers` (`id`),
  CONSTRAINT `ipplug_userid` FOREIGN KEY (`ipplug_userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ipplugs
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '用户有操作业务的时候,告诉客服',
  `id_from` int(20) DEFAULT NULL,
  `id_to` int(20) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_to` (`id_to`),
  CONSTRAINT `id_to` FOREIGN KEY (`id_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for money_out
-- ----------------------------
DROP TABLE IF EXISTS `money_out`;
CREATE TABLE `money_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(30) DEFAULT NULL,
  `bank_card` varchar(40) DEFAULT NULL,
  `bank_address` varchar(40) DEFAULT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `money_total` double(20,0) DEFAULT NULL,
  `money_userid` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `money_userid` (`money_userid`),
  CONSTRAINT `money_userid` FOREIGN KEY (`money_userid`) REFERENCES `users` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of money_out
-- ----------------------------

-- ----------------------------
-- Table structure for money_user
-- ----------------------------
DROP TABLE IF EXISTS `money_user`;
CREATE TABLE `money_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ad_id` int(20) NOT NULL,
  `num` int(20) NOT NULL,
  `ad_price` double(20,0) NOT NULL,
  `money` double(20,0) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `user_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_id` (`ad_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ad_id` FOREIGN KEY (`ad_id`) REFERENCES `advers` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of money_user
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `title_n` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `news_userid` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_userid` (`news_userid`),
  CONSTRAINT `news_userid` FOREIGN KEY (`news_userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for systemplugs
-- ----------------------------
DROP TABLE IF EXISTS `systemplugs`;
CREATE TABLE `systemplugs` (
  `id` int(20) NOT NULL,
  `status` int(20) DEFAULT NULL COMMENT '选择性参数',
  `content` varchar(255) DEFAULT NULL COMMENT '文本型参数',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `systemplug_userid` int(20) DEFAULT NULL,
  `systemplug_infoid` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `systemplug_userid` (`systemplug_userid`),
  KEY `systemplug_infoid` (`systemplug_infoid`),
  CONSTRAINT `systemplug_infoid` FOREIGN KEY (`systemplug_infoid`) REFERENCES `systemplug_info` (`id`),
  CONSTRAINT `systemplug_userid` FOREIGN KEY (`systemplug_userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemplugs
-- ----------------------------

-- ----------------------------
-- Table structure for systemplug_info
-- ----------------------------
DROP TABLE IF EXISTS `systemplug_info`;
CREATE TABLE `systemplug_info` (
  `id` int(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(20) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `sort` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemplug_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_role` int(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `par_id` int(20) DEFAULT NULL,
  `master_id` int(20) DEFAULT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `userinfo_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pri_master` (`master_id`),
  KEY `pri_userinfo` (`userinfo_id`),
  KEY `par_id` (`par_id`),
  CONSTRAINT `par_id` FOREIGN KEY (`par_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pri_master` FOREIGN KEY (`master_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pri_userinfo` FOREIGN KEY (`userinfo_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('18', '99', 'jiayuan', '贾元', '$2a$10$IkojfkGepsKxTVJLeYe3h.QnCnctjlR4KfqvprBtpfh4NukqfycP6', '0', null, null, null, '2016-12-27 13:36:20', '2016-12-27 13:36:20', '20');
INSERT INTO `users` VALUES ('19', '99', 'gecaihong', '葛彩虹', '$2a$10$PGN/Ay1HvWJy5VMfJ5FKK.4TnOK.YigyToV5vNYFEHQzoHz0IuVk2', '0', null, null, null, '2016-12-27 13:36:21', '2016-12-27 13:36:21', '21');
INSERT INTO `users` VALUES ('20', '100', 'kbzjl', '张吉梁', '$2a$10$BrNqhx1d60P5nhzhhNHhuurPHKrxSd.sfhkM94wIeUSIWnZ/VUn7O', '0', null, null, null, '2016-12-27 13:36:21', '2016-12-27 13:36:21', '22');
INSERT INTO `users` VALUES ('21', '99', '42541547', '阿顺', '$2a$10$1/0tYfNPVbKEoilgMeQDxePUdsa728VB.eq36rTzSbE81y9nz5C0W', '0', null, null, null, '2016-12-27 13:36:22', '2016-12-27 13:36:22', '23');
INSERT INTO `users` VALUES ('22', '99', 'kxjh123', '0', '$2a$10$sRg9Hl0db19zbbd4tYrNyOTZsITLOVsSG7NMEu9KuiFkyae6AFIGO', '0', null, null, null, '2016-12-27 13:36:22', '2016-12-27 13:36:22', '24');
INSERT INTO `users` VALUES ('23', '0', 'ddkjzjl', '张先森', '$2a$10$Fg/1rgzA81T8b.wlajgCCONqOXDZjdJARp1FIc86CFeiX1dMTq1bO', '0', null, null, null, '2016-12-27 14:34:19', '2016-12-27 14:34:19', '25');
INSERT INTO `users` VALUES ('24', '88', 'alice02', '秦晓娟', '$2a$10$Rvxgs0Nm6.057tvXZ.LCO.VlRGKFPVysueWQfRHHrnB7QMVxZUqIu', '0', null, null, null, '2016-12-27 18:00:35', '2016-12-27 18:00:35', '26');
INSERT INTO `users` VALUES ('25', '88', '029pd', '苗勇杰', '$2a$10$FvY8PqCRM9jPMXCVTXIohuWjWC.G.kuxm/3.7Yqz64u/KdzeFDw1O', '0', null, null, null, '2016-12-27 18:00:36', '2016-12-27 18:00:36', '27');
INSERT INTO `users` VALUES ('26', '99', 'subyu', '朱申位', '$2a$10$xsRQsLkjVOsN0VjMw7fPF.wyo4ShVqdOvhtVj4GJwGnLSbSb1X35K', '0', null, null, null, '2016-12-27 18:00:36', '2016-12-27 18:00:36', '28');
INSERT INTO `users` VALUES ('27', '88', 'nini123', '李艳妮', '$2a$10$K3kzqQtdOPCiFKVBdcXq9uwZa/E.h5DWmHKEmcAStbH1CAOoQbKuW', '0', null, null, null, '2016-12-27 18:00:36', '2016-12-27 18:00:36', '29');
INSERT INTO `users` VALUES ('28', '88', 'gangge', '李堂刚', '$2a$10$ajxjDWTJwMoOUsfGAq22Buy0jtyyWVTo81PWkroaulfi2D3OhVNIm', '0', null, null, null, '2016-12-27 18:00:37', '2016-12-27 18:00:37', '30');
INSERT INTO `users` VALUES ('29', '88', 'kbgame', '官方管理员', '$2a$10$57/PCah7WPpZuyG0sc4UR.jmBWIWfHQHcxMMdfRFOLhiqBUjmswgC', '0', null, null, null, '2016-12-27 18:00:37', '2016-12-27 18:00:37', '31');
INSERT INTO `users` VALUES ('30', '88', 'moonuser0', '刘昕', '$2a$10$ERRTOVt1q3JPnY06Je0BBOtOGBPXLl/bWbQqJar6vq3kR7dXIs7w2', '0', null, null, null, '2016-12-27 18:00:38', '2016-12-27 18:00:38', '32');
INSERT INTO `users` VALUES ('31', '88', 'xkeer', '薛雪峰', '$2a$10$zJLo7RgdmIeq/F/Af8.YKe0AP5e6oM5jia4LWL1OHlpy.uQtjTwvS', '0', null, null, null, '2016-12-27 18:00:38', '2016-12-27 18:00:38', '33');
INSERT INTO `users` VALUES ('32', '88', 'userno', '不结算用户', '$2a$10$qlUOd1GuwYl3D2XaEVE1O.klyI2qkMzMedGJl.C7txNB09etyDvvC', '0', null, null, null, '2016-12-27 18:00:38', '2016-12-27 18:00:38', '34');
INSERT INTO `users` VALUES ('33', '88', 'gangge1', '李堂刚', '$2a$10$mUJjdxGWi7sfWAlM.WQaOeoXvswhrmp0viOGrO/Jn0ndmrnlF1322', '0', null, null, null, '2016-12-27 18:00:39', '2016-12-27 18:00:39', '35');
INSERT INTO `users` VALUES ('34', '88', 'yeqian', '耶倩', '$2a$10$JNtUk8Pv3qCRCMSxcTr84OICU053cobrTI5uZhUWzWuIEo0nQrr.m', '0', null, null, null, '2016-12-27 18:00:39', '2016-12-27 18:00:39', '36');
INSERT INTO `users` VALUES ('35', '88', 'liuhaiyan', '刘海燕', '$2a$10$P/NFZt7iAkVioEFX1TjFAOquPu5eQeNvTkI1aN6YPsqSB/ql6xnEi', '0', null, null, null, '2016-12-27 18:00:40', '2016-12-27 18:00:40', '37');
INSERT INTO `users` VALUES ('36', '0', 'hengxin1', '王伟', '$2a$10$0uoMA6dlJe1iQShwmWArAOox4QPV2HcqIibJNFw3CIeVl2RXtSFX.', '0', null, '27', null, '2016-12-29 16:48:48', '2016-12-29 16:48:48', '38');
INSERT INTO `users` VALUES ('37', '0', 'gzxynet', '吴绍楷', '$2a$10$vSDaTZrv7QfqPesH/JcP5.6PZItVe6s7fzyQgOmvH2a3I2hWH.j4O', '0', null, '27', null, '2016-12-29 16:48:49', '2016-12-29 16:48:49', '39');
INSERT INTO `users` VALUES ('38', '0', 'barlient', '李剑平', '$2a$10$jzPm1iXGzdfxUoJ9mbLnI.4vOyXcDRnROCpvmLe1MEmO15gqtHjue', '0', null, '27', null, '2016-12-29 16:48:49', '2016-12-29 16:48:49', '40');
INSERT INTO `users` VALUES ('39', '0', '972821700', '孙向伟', '$2a$10$yQUrW6o1KYl1lY9TLALzZ.hXaiDG2PmxGMJnDPDxnwJKXaJ6XCU2W', '0', null, '27', null, '2016-12-29 16:48:49', '2016-12-29 16:48:49', '41');
INSERT INTO `users` VALUES ('40', '0', 'xidada1', '戚林海', '$2a$10$w9PJ6nJNdMOPz/.GxgpYdeIaO5ndyrYKDK/.PbPHNIkjEoDiESbHG', '0', null, '27', null, '2016-12-29 16:48:50', '2016-12-29 16:48:50', '42');
INSERT INTO `users` VALUES ('41', '0', 'fyldj', '范玉林', '$2a$10$lnW0LsHPDZ.W6DNclkfiZuIx1MhY/xYGAYdVWdkfOY6RSZbWv9uHS', '0', null, '27', null, '2016-12-29 16:48:50', '2016-12-29 16:48:50', '43');
INSERT INTO `users` VALUES ('42', '0', 'bulesky', '吴小炜', '$2a$10$jhNcy5Uy3asqVdaU4s2nye1IRiLplpjTUJwwxSljnTSIM6Np.DWAa', '0', null, '27', null, '2016-12-29 16:48:50', '2016-12-29 16:48:50', '44');
INSERT INTO `users` VALUES ('43', '0', 'eywoo', '姜华', '$2a$10$Vo7R9iL8i4HMhW5rs5tkmesBlYikXoZwZjBASkZGqlnNpVgSMZmWO', '0', null, '27', null, '2016-12-29 16:48:51', '2016-12-29 16:48:51', '45');
INSERT INTO `users` VALUES ('44', '0', 'ceomusic', '刘精斌', '$2a$10$PFCduPBhL9kR/9qqUUsFnu2f7Y.jf4i4KYmeaqPpUIYCRgDqw0v0y', '0', null, '27', null, '2016-12-29 16:48:51', '2016-12-29 16:48:51', '46');
INSERT INTO `users` VALUES ('45', '0', 's3000s', '陈良珊', '$2a$10$JkIGWgex.FH5PCUmksdsIuosoHXAoWVPUGtKLI4hCZrynTDsYSv..', '0', null, '27', null, '2016-12-29 16:48:51', '2016-12-29 16:48:51', '47');
INSERT INTO `users` VALUES ('46', '0', 'lyl6015', '廖玉龙', '$2a$10$MzckeQcrtHPlXfs1dZxXj.K3P2KbBBOHguPk7/AUcMDEwaMHsS1j2', '0', null, '27', null, '2016-12-29 16:48:52', '2016-12-29 16:48:52', '48');
INSERT INTO `users` VALUES ('47', '0', 'zynet', '', '$2a$10$w0Xum.lvAwbwROvCp4oPD.DaHX4lJvsT.DDXKFdmEDg.dVJot2Ul.', '0', null, '27', null, '2016-12-29 16:48:52', '2016-12-29 16:48:52', '49');
INSERT INTO `users` VALUES ('48', '0', 'gttaozi', '林为桃', '$2a$10$oiArXmxJO3SbZsNyO48qhuzSi/Ki73VLJWxOEGy.w4IhqjtlESkam', '0', null, '27', null, '2016-12-29 16:48:52', '2016-12-29 16:48:52', '50');
INSERT INTO `users` VALUES ('49', '0', '359076747', '狄虎', '$2a$10$IxOfTT0zk.kPTMSCH245J.5KfomhSz1sGSka97XDEKX5qiyuPXw56', '0', null, '27', null, '2016-12-29 16:48:53', '2016-12-29 16:48:53', '51');
INSERT INTO `users` VALUES ('50', '0', 'wxtxttx', '王学同', '$2a$10$PB6wpx60rkXXop3VrIDlme8efwoqQFGGvZ7uGy7TfANCxNk3Lzs0m', '0', null, '27', null, '2016-12-29 16:48:53', '2016-12-29 16:48:53', '52');
INSERT INTO `users` VALUES ('51', '0', 'qhxnwb', '谈晓龙', '$2a$10$BDY3Lf.wWPHIBYaBkmru3ewIYxCE4apc3sQNNmmcMcHoZmVgyHQWa', '0', null, '27', null, '2016-12-29 16:48:53', '2016-12-29 16:48:53', '53');
INSERT INTO `users` VALUES ('52', '0', 'wsably', '王柯涵', '$2a$10$ch3VMGHp5/wjuDtXCFNyZ.E9YnCsrW7SL82.YUTXnSbKBWzjwQMaq', '0', null, '27', null, '2016-12-29 16:48:54', '2016-12-29 16:48:54', '54');
INSERT INTO `users` VALUES ('53', '0', 'hintdiska', '蒋祖意', '$2a$10$CECrEcVfkvZ4XhUNpwTVCeq9OO.GggTIdqj8Zb6PskfD1clursXcW', '0', null, '27', null, '2016-12-29 16:48:54', '2016-12-29 16:48:54', '55');
INSERT INTO `users` VALUES ('54', '0', 'qq65139', '王佳俊', '$2a$10$iBjAJPqEdKGcKhc2iL/tfOClAD7TcgMacS5nFFICD90rLOpy0GHwu', '0', null, '27', null, '2016-12-29 16:48:54', '2016-12-29 16:48:54', '56');
INSERT INTO `users` VALUES ('55', '0', '335302011', '陈帮培', '$2a$10$p8bZ0ZBjBdc.O6roZeMdn.VjHsXxriIUJP4/1YjYBdvmfrHwiOjnG', '0', null, '27', null, '2016-12-29 16:48:55', '2016-12-29 16:48:55', '57');
INSERT INTO `users` VALUES ('56', '0', 'woshidt', '向书玖', '$2a$10$BrbRmSwTo16HHE/frzT3XOzQT.7/bKa271asiP5VybsEcXV3/rjqS', '0', null, '27', null, '2016-12-29 16:48:55', '2016-12-29 16:48:55', '58');
INSERT INTO `users` VALUES ('57', '0', 'qq506133', '吴文权', '$2a$10$I/Zvv0LoDmsltL.ZAgHrrOntEx73nRJOiq3yy6z7NiPf7kga8GdbG', '0', null, '27', null, '2016-12-29 16:48:55', '2016-12-29 16:48:55', '59');
INSERT INTO `users` VALUES ('58', '0', 'lachasi', '江海', '$2a$10$ZYjvLM4MMURa8P08xIa0ZOiXSLohDFTGLiJqjA64O2TXRJVMClBRG', '0', null, '27', null, '2016-12-29 16:48:56', '2016-12-29 16:48:56', '60');
INSERT INTO `users` VALUES ('59', '0', '276499452', '黄嘉俊', '$2a$10$wKxYqpJdrGGc/HLdkOnjPe8AiFSEkVzt.gv.krKbf5nt3ou1ZHXG6', '0', null, '27', null, '2016-12-29 16:48:56', '2016-12-29 16:48:56', '61');
INSERT INTO `users` VALUES ('60', '0', 'lyp516103', '郭徽', '$2a$10$xFkdOB1BjY3U7bLVg5tfBOnqtA3P5rdmxwDqRuJ.on6EMzM4XHFP.', '0', null, '27', null, '2016-12-29 16:48:56', '2016-12-29 16:48:56', '62');
INSERT INTO `users` VALUES ('61', '0', 'wnscl27', '孙长龙', '$2a$10$zBtki9MC7PdXJCd4YKzsAebcOzF/63orw4f3vm/cmTkfCMkcLZcE2', '0', null, '27', null, '2016-12-29 16:48:57', '2016-12-29 16:48:57', '63');
INSERT INTO `users` VALUES ('62', '0', 'qq5354414', '金华伟', '$2a$10$1PC9J4EbqmOmcSiOV93xuu/E/C2Tegk.XdlEGr17BXWvmrjI/hEfG', '0', null, '27', null, '2016-12-29 16:48:57', '2016-12-29 16:48:57', '64');
INSERT INTO `users` VALUES ('63', '0', '5335681', '张日芳', '$2a$10$NsW5c81BbTk33fsvwg1ujug6SgSoLNvQDbgMqUZsoY3lRl9SMwYmC', '0', null, '27', null, '2016-12-29 16:48:57', '2016-12-29 16:48:57', '65');
INSERT INTO `users` VALUES ('64', '0', '94797248', '黄晓丹', '$2a$10$/hYZNIrJuYySw3InjzIJFeM2p32hH27auGsSnd2oHNGc1Z3AVx7vC', '0', null, '27', null, '2016-12-29 16:48:58', '2016-12-29 16:48:58', '66');
INSERT INTO `users` VALUES ('65', '0', 'z132231', '张世斌', '$2a$10$W3Po06pvPbcBR1vy5wZKF.9LpN22QDbBJQD5js8WAemL5uacuzEJ2', '0', null, '27', null, '2016-12-29 16:48:58', '2016-12-29 16:48:58', '67');
INSERT INTO `users` VALUES ('66', '0', 'kadhzf', '韩朝峰', '$2a$10$htg6cDQ4jMmQ6sPn7UGwd.hz5E1oEe0LQuZ.YWY7AszPqn5O5TfL6', '0', null, '27', null, '2016-12-29 16:48:59', '2016-12-29 16:48:59', '68');
INSERT INTO `users` VALUES ('67', '0', 'neitewb', '陈海荣', '$2a$10$nt7zVlR2aEkvCBeZpsR1le47BEv5ob8mY./qU0yA6NjijbqrxHnke', '0', null, '27', null, '2016-12-29 16:48:59', '2016-12-29 16:48:59', '69');
INSERT INTO `users` VALUES ('68', '0', 'xiang6180', '袁东操', '$2a$10$ZU2As/cWtnCu14t.sh7pbOX8Lqg0bZs679fRtZaOacMItXFaUheaK', '0', null, '27', null, '2016-12-29 16:48:59', '2016-12-29 16:48:59', '70');
INSERT INTO `users` VALUES ('69', '0', 'q89485656', '尚旋旋', '$2a$10$5JfiehFnyAo9vZbEfdDkauBVo0H7inopZ.GYMEzY.qsCucOvjTGYW', '0', null, '27', null, '2016-12-29 16:49:00', '2016-12-29 16:49:00', '71');
INSERT INTO `users` VALUES ('70', '0', 'lxf1027', '李晓锋', '$2a$10$fSQPzAivn5A6lh1dD7okDOYP3eGmLWSGChw2b1P1q66YMk.TmcTBi', '0', null, '27', null, '2016-12-29 16:49:00', '2016-12-29 16:49:00', '72');
INSERT INTO `users` VALUES ('71', '0', 'majiajia', '', '$2a$10$jigOOO3Gk1kZVLU/XchK9uNOBoa2i0HLbxDIXAh5UJKaQKxllz/vG', '0', null, '27', null, '2016-12-29 16:49:00', '2016-12-29 16:49:00', '73');
INSERT INTO `users` VALUES ('72', '0', '737146150', '杨奉红', '$2a$10$DeMNukL/e4H1GXgLnSVol.C9kcXDIcwjh7VkTNw3AeI/3HVbngMvO', '0', null, '27', null, '2016-12-29 16:49:01', '2016-12-29 16:49:01', '74');
INSERT INTO `users` VALUES ('73', '0', 'a44432', '李俊', '$2a$10$F1RAwA20Vv2Es.BBv2yUh.7AyG5LOxLPoVVVUXuCv2c0TNDAXu552', '0', null, '27', null, '2016-12-29 16:49:01', '2016-12-29 16:49:01', '75');
INSERT INTO `users` VALUES ('74', '0', 'hepp995', '贺占亮', '$2a$10$uPyIPALgHAVo96UicBtHYuGcVlz5XpPMUpmfL1DkcbQ/809pEK9FO', '0', null, '27', null, '2016-12-29 16:49:01', '2016-12-29 16:49:01', '76');
INSERT INTO `users` VALUES ('75', '0', 'a96392914', '杨泷', '$2a$10$3FZO24DE9LcbwBUKFPcqm.SmRVZtggxRZICHz8/lTzVp3jDlIwFKi', '0', null, '27', null, '2016-12-29 16:49:02', '2016-12-29 16:49:02', '77');
INSERT INTO `users` VALUES ('76', '0', 'goodlove', '杨泷3', '$2a$10$2WNKtENnJ7dVGRYaKvHzoOMYCl9J5iGXrM3wpU3TTv0EGGqZiMoj6', '0', null, '27', null, '2016-12-29 16:49:02', '2016-12-29 16:49:02', '78');
INSERT INTO `users` VALUES ('77', '0', '584250550', '肖红春', '$2a$10$TRnTJMjAyzYaFxpHFHA4tuemcFowvliixbcmXZ.IUqKLpbIu5qoYy', '0', null, '27', null, '2016-12-29 16:49:14', '2016-12-29 16:49:14', '79');
INSERT INTO `users` VALUES ('78', '0', 'wulehua', '吴乐华', '$2a$10$BRnCnfl/WpB7H23NXiEcBOinSpd0BcGWu2147gYBoXLDlAuspgATK', '0', null, '27', null, '2016-12-29 16:49:14', '2016-12-29 16:49:14', '80');
INSERT INTO `users` VALUES ('79', '0', 'wujue8706', '吴觉', '$2a$10$MYDP6C8Y7XEgJ/PYWnVble7Vwz9rRu3znd5LUDo3n275dl/myoxpy', '0', null, '27', null, '2016-12-29 16:49:15', '2016-12-29 16:49:15', '81');
INSERT INTO `users` VALUES ('80', '0', 'longzhang', '张龙', '$2a$10$bXQyM1i9H42p576AoFa3XO/LsF1.se6Q6anUSTYbGchnYKzyGSgga', '0', null, '27', null, '2016-12-29 16:49:15', '2016-12-29 16:49:15', '82');
INSERT INTO `users` VALUES ('81', '0', 'taotaotv', '陈涛', '$2a$10$9O4q4fThBFBiSQDY019S6.UJ8L20lLlJuNa4z5h9BFNIig3d/ST5m', '0', null, '27', null, '2016-12-29 16:49:16', '2016-12-29 16:49:16', '83');
INSERT INTO `users` VALUES ('82', '0', 'szp2sky', '石志鹏', '$2a$10$HMGZebsUPEszvXpXAZAnq..2YMx.8XqNRWGEeHrNlPk756Wnk7D1O', '0', null, '27', null, '2016-12-29 16:49:16', '2016-12-29 16:49:16', '84');
INSERT INTO `users` VALUES ('83', '0', 'yuyanwei', '林学威', '$2a$10$RiQXoAFnlOrPhrGcenRrmO0fReVGHMOwvojpAy67ExAixyPe5zbtu', '0', null, '27', null, '2016-12-29 16:49:16', '2016-12-29 16:49:16', '85');
INSERT INTO `users` VALUES ('84', '0', '409903420', '谭涛涛', '$2a$10$KUjrBo/j2aQdzSDdn367u.kqmLV8D74GOB3tGUHBeZJMp/gZmJf9W', '0', null, '27', null, '2016-12-29 16:49:17', '2016-12-29 16:49:17', '86');
INSERT INTO `users` VALUES ('85', '0', 'wsxqaz', '郭振彪', '$2a$10$z/PNdaqi2zNLNShLSL.ayu6CDHA7g47Gu8W6b9H.rhEiFoxrqKLri', '0', null, '27', null, '2016-12-29 16:49:17', '2016-12-29 16:49:17', '87');
INSERT INTO `users` VALUES ('86', '0', 'zwg115', '翟玮刚', '$2a$10$Yj5aIYV7R6Hjy8z5Psuire2M0n4JOoZxfoq2C1SfyIzBcZnBQ8owi', '0', null, '27', null, '2016-12-29 16:49:17', '2016-12-29 16:49:17', '88');
INSERT INTO `users` VALUES ('87', '0', 'lietou318', '井永光', '$2a$10$PUFDiOKjjVORJ4RSQnDQ7uQnVqUu7CgBKhRFiv9PNEKNmWV4YIsKK', '0', null, '27', null, '2016-12-29 16:49:18', '2016-12-29 16:49:18', '89');
INSERT INTO `users` VALUES ('88', '0', 'mwb9999', '穆渭滨', '$2a$10$/ShSA4J.0YPnNk7fY6eP5OxpAd6IIvJLB6JeDuupKOKDfNcOK93Mi', '0', null, '27', null, '2016-12-29 16:49:18', '2016-12-29 16:49:18', '90');
INSERT INTO `users` VALUES ('89', '0', 'weizhibin', '魏志兵', '$2a$10$on4fzMFVJPI0Z9YmD5ZzAOBg3uDofatvCD0N048pcGpOwofOkm3Aq', '0', null, '27', null, '2016-12-29 16:49:18', '2016-12-29 16:49:18', '91');
INSERT INTO `users` VALUES ('90', '0', 'nxluoye', '宁旭', '$2a$10$SmxHCLXmtW1EfuWa8JHVBuGyBNx8D7efzOXi/lYWM7hieA06cbMmm', '0', null, '27', null, '2016-12-29 16:49:19', '2016-12-29 16:49:19', '92');
INSERT INTO `users` VALUES ('91', '0', '907563', '赵海旭', '$2a$10$kg5aGrkhAmZtWIU4WkN83uDsWq11xieDk0dABFwixEICCvTZAo7v6', '0', null, '27', null, '2016-12-29 16:49:19', '2016-12-29 16:49:19', '93');
INSERT INTO `users` VALUES ('92', '0', 'aiai312', '张波波', '$2a$10$tN.WbwV9nVwoCe3ZSVYu8O2Flbuk8SQJW5f5k0MwqzeVafhB6O6ZO', '0', null, '27', null, '2016-12-29 16:49:19', '2016-12-29 16:49:19', '94');
INSERT INTO `users` VALUES ('93', '0', '8048105', '王圣坤', '$2a$10$sFrZubzILrmmKPGIH2iSq.TaRy5mFRRTS.wtFM1zhiM9UftOkPZjy', '0', null, '27', null, '2016-12-29 16:49:20', '2016-12-29 16:49:20', '95');
INSERT INTO `users` VALUES ('94', '0', 'waynelee', '李超', '$2a$10$oX9ioypX7aaCtGAEGlndduFX0dwicsXebGL9aNPSpMa1nYrdJn/zC', '0', null, '27', null, '2016-12-29 16:49:20', '2016-12-29 16:49:20', '96');
INSERT INTO `users` VALUES ('95', '0', 'xuanfeng', '王永健', '$2a$10$UpFdb29iECliPpZgDQZLguOYvG0a8/oW0VqODkE7MqHsEGdjRUlBm', '0', null, '27', null, '2016-12-29 16:49:21', '2016-12-29 16:49:21', '97');
INSERT INTO `users` VALUES ('96', '0', 'chinachen', '李巧玉', '$2a$10$.R1RnGDy2DNp92BQcLgP4OxTzf0EWt1T5rSPS2nydHC.ebU55dowi', '0', null, '27', null, '2016-12-29 16:49:21', '2016-12-29 16:49:21', '98');
INSERT INTO `users` VALUES ('97', '0', 'zhnt01', '陈海荣', '$2a$10$rqkvMIlJNA/2XZPvdfqUl.TPhP6kNqT0GCNWRmNW72gvaSAOCHHWG', '0', null, '27', null, '2016-12-29 16:49:21', '2016-12-29 16:49:21', '99');
INSERT INTO `users` VALUES ('98', '0', 'audiodg', '俞碧胜', '$2a$10$MzBAmf69oyJwhqd/CXIwbeLvrd.n7J2PpY1uFKR0xYUzhhRGuMMC2', '0', null, '27', null, '2016-12-29 16:49:22', '2016-12-29 16:49:22', '100');
INSERT INTO `users` VALUES ('99', '0', 'netzone', '王亚鹏', '$2a$10$7QA/k3oygR9w3VF3pFwT..L3Eu9Gg3SrcQcQ06seoafltA1xCO01i', '0', null, '27', null, '2016-12-29 16:49:22', '2016-12-29 16:49:22', '101');
INSERT INTO `users` VALUES ('100', '0', '263742542', '刘守府', '$2a$10$p6rVVdljB4VMitZbUH.1mu5Ayelh7lw.34Pa90bYdW3nm.lmFMM5K', '0', null, '27', null, '2016-12-29 16:49:22', '2016-12-29 16:49:22', '102');
INSERT INTO `users` VALUES ('101', '0', 'toos2015', '谢双双', '$2a$10$1nTa5YxTGj1OY3XD6.NI5eUN9XtRyEfLdoj7MT79LWPi/mY6.l2su', '0', null, '27', null, '2016-12-29 16:49:23', '2016-12-29 16:49:23', '103');
INSERT INTO `users` VALUES ('102', '0', 'wzxtwangl', '张辉', '$2a$10$LhkBdSS/k62jNp4jmUHbTuBeY.LGiDuU5zjJ/nylZPOFKDZxZ6RUe', '0', null, '27', null, '2016-12-29 16:49:23', '2016-12-29 16:49:23', '104');
INSERT INTO `users` VALUES ('103', '0', 'dongdong', '董东东', '$2a$10$tVeupDNs9MouLXYFrxltceIVwgqlla9uQl2CL2.QWo9CDlABASm4m', '0', null, '27', null, '2016-12-29 16:49:23', '2016-12-29 16:49:23', '105');
INSERT INTO `users` VALUES ('104', '0', 'htaicc99', '梁家好', '$2a$10$IgEWdQwiKEMuGu7Fs1q1juPkzHtPqsxl2QtTHcVAAU60NsWZBbx1O', '0', null, '27', null, '2016-12-29 16:49:24', '2016-12-29 16:49:24', '106');
INSERT INTO `users` VALUES ('105', '0', 'z56593377', '郭喜涛', '$2a$10$Tz9eUbxuyM4213oMt558gOHWTmryKoSTYVinil1y2dYGrGQymh7by', '0', null, '27', null, '2016-12-29 16:49:24', '2016-12-29 16:49:24', '107');
INSERT INTO `users` VALUES ('106', '0', 'c85433425', '陈飞洪', '$2a$10$CvaAhTP1uLShs4f/2p5Kke.osF2MQRQM3JGlAwvktILdZzzQfO.vu', '0', null, '27', null, '2016-12-29 16:49:24', '2016-12-29 16:49:24', '108');
INSERT INTO `users` VALUES ('107', '0', 'wireshark', '李小记', '$2a$10$lD/H9atRw6AfbVY.00o0WO/sogxq4LiCMVE3kLfkB95fqvOgyYRyu', '0', null, '27', null, '2016-12-29 16:49:25', '2016-12-29 16:49:25', '109');
INSERT INTO `users` VALUES ('108', '0', 'lesliy', '刘朝荣', '$2a$10$N5gX23XyaNRPVGtjIpc9bepBg/15IKYR7E.ADoFCcS0kTTj6Rcsse', '0', null, '27', null, '2016-12-29 16:49:25', '2016-12-29 16:49:25', '110');
INSERT INTO `users` VALUES ('109', '0', 'vc123', '王伟忠', '$2a$10$g3BoHSnV4coE3MdwIcy4Kex1YJmMlkT0/007K7e6vTBwN5F3pasNe', '0', null, '27', null, '2016-12-29 16:49:25', '2016-12-29 16:49:25', '111');
INSERT INTO `users` VALUES ('110', '0', 'yxwlkj', '王浩', '$2a$10$cG4i8rahlOCMRGTDZzwGHul8MzQkrnPdwqltqltyg2WtC6joyctrC', '0', null, '27', null, '2016-12-29 16:49:26', '2016-12-29 16:49:26', '112');
INSERT INTO `users` VALUES ('111', '0', 'kb10179', '闵安', '$2a$10$1Duf3e4dGMXfMTUAzrG80.nav7TrSmmggJ5mU8Y3UviLxLb0LL8ey', '0', null, '27', null, '2016-12-29 16:49:26', '2016-12-29 16:49:26', '113');
INSERT INTO `users` VALUES ('112', '0', 'xhnin', '陈林', '$2a$10$vgC4eq8frRBl7zItFW5tKuAePLQNrf7U0DjQt6jdcIBm5pSZe/5sK', '0', null, '27', null, '2016-12-29 16:49:27', '2016-12-29 16:49:27', '114');
INSERT INTO `users` VALUES ('113', '0', 'esc200', '陈欣', '$2a$10$p6m75Mr7fFb/BEmV2EcOSOm9ImYauQpYdHFaXGAhAcrQQX28LB6CS', '0', null, '27', null, '2016-12-29 16:49:27', '2016-12-29 16:49:27', '115');
INSERT INTO `users` VALUES ('114', '0', 'esc2000', '陈欣', '$2a$10$nBT6GWjaQTiMBhxwPgPu1uHNyLR5uEs2cAMsCsgIr4S3PrzFg1Nm6', '0', null, '27', null, '2016-12-29 16:49:27', '2016-12-29 16:49:27', '116');
INSERT INTO `users` VALUES ('115', '0', 'mxw5719', '毛信旺', '$2a$10$nSMGslZbRCWBwMyWpFsuiehgL3giKKDlGl11.Q/rV9xuI3pX0cW9S', '0', null, '27', null, '2016-12-29 16:49:28', '2016-12-29 16:49:28', '117');
INSERT INTO `users` VALUES ('116', '0', 'menghuanc', '陈利军', '$2a$10$AcK9Wd90/T.OFmObJvz4HeSiMmdXZbZzc6l7xjH0znpfuTkAP.i26', '0', null, '27', null, '2016-12-29 16:49:28', '2016-12-29 16:49:28', '118');
INSERT INTO `users` VALUES ('117', '0', 'jikai318', '钟继开', '$2a$10$I002HTWJdCxA87QcCg1aMOEeMg3ePgsPssV241e7LItW06VDO9ife', '0', null, '27', null, '2016-12-29 16:49:28', '2016-12-29 16:49:28', '119');
INSERT INTO `users` VALUES ('118', '0', 'gdszwan', '万旭发', '$2a$10$WERHV2KVIdfMf2dv4e5TEe/O8xFfzMk9tFVUdwfwPP/DovZRKhjW2', '0', null, '27', null, '2016-12-29 16:49:29', '2016-12-29 16:49:29', '120');
INSERT INTO `users` VALUES ('119', '0', 'deyabin', '德亚斌', '$2a$10$pH1I5XyP9GIGog7LYe8a7.NXpb2vRhoYxiJd4fsdRHPlqIy57je/K', '0', null, '27', null, '2016-12-29 16:49:29', '2016-12-29 16:49:29', '121');
INSERT INTO `users` VALUES ('120', '0', 'cosmos', '肖刚', '$2a$10$RQB9dWd7G/rW28lfvW5tpuyHMMhz7JR.KysoNOSi/KoA35NDwjvNO', '0', null, '27', null, '2016-12-29 16:49:29', '2016-12-29 16:49:29', '122');
INSERT INTO `users` VALUES ('121', '0', 'pscpscvip', '高健', '$2a$10$UQefa9.GZjmyTahM3j1bMuEmfRnsfIOIPN7yjvBRngdQIabP.vM8W', '0', null, '27', null, '2016-12-29 16:49:30', '2016-12-29 16:49:30', '123');
INSERT INTO `users` VALUES ('122', '0', 'smtpcn', '马丽', '$2a$10$RfgJg05Srs8tb7f67otc/OsDiwCfPAvW.Xr6gZY/lI8kgdXHi1E0O', '0', null, '27', null, '2016-12-29 16:49:30', '2016-12-29 16:49:30', '124');
INSERT INTO `users` VALUES ('123', '0', 'badlegion', '孙先知', '$2a$10$eOErGtJPMMGn86smRE2hVuO3epKwEJRr3Eor/1bOPaTb48Ci0wsr6', '0', null, '27', null, '2016-12-29 16:49:30', '2016-12-29 16:49:30', '125');
INSERT INTO `users` VALUES ('124', '0', 'wuhuawm', '黄龙平', '$2a$10$pXCq1hvf/vTnfUHKk29Pl.puXo6CNr1uuMX9xK9Ke4KsWwFn7tnre', '0', null, '27', null, '2016-12-29 16:49:31', '2016-12-29 16:49:31', '126');
INSERT INTO `users` VALUES ('125', '0', 'xxyg2009', '吕广竟', '$2a$10$SPJBvVk6zm8V/oDYbWQkdumwVT8VFxhcUPZEquHw8h9TPf.rMwhGy', '0', null, '27', null, '2016-12-29 16:49:31', '2016-12-29 16:49:31', '127');
INSERT INTO `users` VALUES ('126', '0', 'hy1018126', '贺芳云', '$2a$10$qqquO8pu5xmE7wUbvtiyyumK3sCFU48M893Azb8/cwzl1TMh2s4NK', '0', null, '27', null, '2016-12-29 16:49:31', '2016-12-29 16:49:31', '128');
INSERT INTO `users` VALUES ('127', '0', 'xsbar', '朱永刚', '$2a$10$H4AGYeeExjuAfXEr/ncBIOAZcoz2x/YbgRCTqbkoPUJP2wpUF3CpC', '0', null, '27', null, '2016-12-29 16:49:32', '2016-12-29 16:49:32', '129');
INSERT INTO `users` VALUES ('128', '0', 'tyonline', '黄建斌', '$2a$10$DdpHq6mVT832OuR37tE3d.eDChjHkYemOhbIN8qqjDu9qD9CAXMRq', '0', null, '27', null, '2016-12-29 16:49:32', '2016-12-29 16:49:32', '130');
INSERT INTO `users` VALUES ('129', '0', 'daishenwe', '戴沈伟', '$2a$10$ZPKBQIFuM7dt8W74DDaOzeCnbJaojJsBw6YbsMSHyr.Q08HtsaDPe', '0', null, '27', null, '2016-12-29 16:49:32', '2016-12-29 16:49:32', '131');
INSERT INTO `users` VALUES ('130', '0', 'zhangwei', '孟范艳', '$2a$10$Owv1zcZKCw/eNcCJM0FYgOKUCI8mBb0k5GULZHWEYhEjjGjo6l1PG', '0', null, '27', null, '2016-12-29 16:49:33', '2016-12-29 16:49:33', '132');
INSERT INTO `users` VALUES ('131', '0', 'a44432790', '李俊', '$2a$10$ptzbkXli9OZD2VDQreupDONS7llT.qCHVUDHOdW3diqYuVJNB6CX6', '0', null, '27', null, '2016-12-29 16:49:33', '2016-12-29 16:49:33', '133');
INSERT INTO `users` VALUES ('132', '0', 'zwzwb', '张龙', '$2a$10$oIbPRzKs0m3a5QpOQBxt.O4zWDsHqfRZIKDpcncw5Ale6tizQaxjW', '0', null, '27', null, '2016-12-29 16:49:33', '2016-12-29 16:49:33', '134');
INSERT INTO `users` VALUES ('133', '0', 'rwygame', '陶成云', '$2a$10$FXdwcPIc9op/XaIxL5uSqunxun1VbDM3s4KYiNHMDoo8T5rcuwIbK', '0', null, '27', null, '2016-12-29 16:49:34', '2016-12-29 16:49:34', '135');
INSERT INTO `users` VALUES ('134', '0', '234749063', '林嘉城', '$2a$10$KoA8wCzGsHNS9sXLlPPmmONqfShxzUnyeHzuvrao2.h.14Qd9oqUW', '0', null, '27', null, '2016-12-29 16:49:34', '2016-12-29 16:49:34', '136');
INSERT INTO `users` VALUES ('135', '0', '35361172', '张凯', '$2a$10$5UXqolsMUxETRlpeQPFIMOFmbmHef.om/9kENzZL8jMlvsvwzFSLa', '0', null, '27', null, '2016-12-29 16:49:35', '2016-12-29 16:49:35', '137');
INSERT INTO `users` VALUES ('136', '0', 'zx930325', '宫兆鑫', '$2a$10$wRcSOw0dPS/ng9KeJPa4BevspJoW.WWuHKEIDK1NFVM4Ep6o0Nfmm', '0', null, '27', null, '2016-12-29 16:49:35', '2016-12-29 16:49:35', '138');
INSERT INTO `users` VALUES ('137', '0', 'xin2956', '张斌斌', '$2a$10$hstEBvGEG9meseplqqk2JethaedvG1RQ/VZgTJ2WHtDXtFTS5zYzm', '0', null, '27', null, '2016-12-29 16:49:35', '2016-12-29 16:49:35', '139');
INSERT INTO `users` VALUES ('138', '0', '186794', '李军', '$2a$10$aMnfIE4hgWJa.ieAstqwauipXvkPXVjrKQF7RS.IADDJRfzY81CTa', '0', null, '27', null, '2016-12-29 16:49:36', '2016-12-29 16:49:36', '140');
INSERT INTO `users` VALUES ('139', '0', 'xxjsmud', '张永庆', '$2a$10$zwDo3IqDLgbS.ZwNmi0fA.rujC7xS2wlpNd2wMg1Dm9alRgpSGnxy', '0', null, '27', null, '2016-12-29 16:49:36', '2016-12-29 16:49:36', '141');
INSERT INTO `users` VALUES ('140', '0', 'kpygl', '余国良', '$2a$10$JtDUxQjMFxxXTnxOeATm8ed.33SsKF7CJpv5h.jflq5ri2hqP3rSu', '0', null, '27', null, '2016-12-29 16:49:36', '2016-12-29 16:49:36', '142');
INSERT INTO `users` VALUES ('141', '0', 'lghshiyan', '李广慧', '$2a$10$8N/GkJpM9KyS7AMsCk/KL.SGyv2x.B/7O5bN5gMExGOwogo8rCXhW', '0', null, '27', null, '2016-12-29 16:49:37', '2016-12-29 16:49:37', '143');
INSERT INTO `users` VALUES ('142', '0', '291048486', '宫兆鑫', '$2a$10$0khGgN.OtvWKu4IF7jkj8ejtnYZsnDaSOzSDQ3KsIaVaTuInb5WJW', '0', null, '27', null, '2016-12-29 16:49:37', '2016-12-29 16:49:37', '144');
INSERT INTO `users` VALUES ('143', '0', 'abc2432', '石文卿', '$2a$10$gvo7xiOv/vH73ZrOgC.2G.EJR65bQIplJJUQ.RmYh8K6KSmVG6I22', '0', null, '27', null, '2016-12-29 16:49:37', '2016-12-29 16:49:37', '145');
INSERT INTO `users` VALUES ('144', '0', 'xyclient', '蒋祖意', '$2a$10$yZnZcN9z5RWH07PUsvkPn.MRoG/JtC9pCD/Eh7uMdk5AUkns99JLW', '0', null, '27', null, '2016-12-29 16:49:38', '2016-12-29 16:49:38', '146');
INSERT INTO `users` VALUES ('145', '0', 'dong14425', '许冬冬', '$2a$10$yCqRveXqxabwsqYOQ3HxFOvDtH9LL7BnLAXfGitrPcY.9fvP6hpLe', '0', null, '27', null, '2016-12-29 16:49:38', '2016-12-29 16:49:38', '147');
INSERT INTO `users` VALUES ('146', '0', 'smmss', '许冬冬', '$2a$10$MiCHTr3V8Wq/EXMuiZMnUubPS7LZTcFMsyc8R3wjB1FTmv4vAzd5.', '0', null, '27', null, '2016-12-29 16:49:38', '2016-12-29 16:49:38', '148');
INSERT INTO `users` VALUES ('147', '0', 'xinyuan', '张斌斌', '$2a$10$QwQqH7UWLEbKKDrmOtbDseXUq/iroayRhCTxF7VNUPVMB9JvFd/Tm', '0', null, '27', null, '2016-12-29 16:49:39', '2016-12-29 16:49:39', '149');
INSERT INTO `users` VALUES ('148', '0', 'lmt2015', '王剑波', '$2a$10$vejyVwK2QLdM7k7W3z6FYuzdYRIyCwFB030edIMeEEpRCxmuxZ9JO', '0', null, '27', null, '2016-12-29 16:49:39', '2016-12-29 16:49:39', '150');
INSERT INTO `users` VALUES ('149', '0', 'gslz43235', '连寂羽', '$2a$10$rVnVGYZTu02dCjAfBDekMeHyyMuFnOyYO7mQwGMhfpeifsNoe.pNi', '0', null, '27', null, '2016-12-29 16:49:39', '2016-12-29 16:49:39', '151');
INSERT INTO `users` VALUES ('150', '0', 'yajiu', '林俊君', '$2a$10$reMcnTs.rwTjUsvaKFk.behEEsOccn.mDmww7148D1eTJAFWvSyhK', '0', null, '27', null, '2016-12-29 16:49:40', '2016-12-29 16:49:40', '152');
INSERT INTO `users` VALUES ('151', '0', 'suwenqiao', '苏文乔', '$2a$10$cZR1vnTJ5BeNsC3aJvV.6eBl5jQuFD9bvjVF6oyUKarpRyrIw3miG', '0', null, '27', null, '2016-12-29 16:49:40', '2016-12-29 16:49:40', '153');
INSERT INTO `users` VALUES ('152', '0', '379921850', '张志全', '$2a$10$VieBU8k2Tmb.G8G8qWuoBOQtGYfE6OdN6I/Q0ZfpvnR5DONyOB9/C', '0', null, '27', null, '2016-12-29 16:49:40', '2016-12-29 16:49:40', '154');
INSERT INTO `users` VALUES ('153', '0', 'czxtd', '马益香', '$2a$10$aTUkkuBcsNvFt0D91UGEZeWjh0Cvk8lcbcsUY6or5Jb4UkP4Vb402', '0', null, '27', null, '2016-12-29 16:49:41', '2016-12-29 16:49:41', '155');
INSERT INTO `users` VALUES ('154', '0', 'bydcdb', '赵文丞', '$2a$10$pFHwGaKinNM1BOnlnNtGEOLN4V6Ns11R3XtThJ/gfzllaEPx5h5yC', '0', null, '27', null, '2016-12-29 16:49:41', '2016-12-29 16:49:41', '156');
INSERT INTO `users` VALUES ('155', '0', 'bydcdn', '赵文丞', '$2a$10$7oP5SesE0j0D0L33VMeMm.QCjm2b/MDC4G7s/j2MRCWlo./8hRk9y', '0', null, '27', null, '2016-12-29 16:49:41', '2016-12-29 16:49:41', '157');
INSERT INTO `users` VALUES ('156', '0', 'xunjue', '李时永', '$2a$10$SwukzfuoAs8y16id1QOo9Ot8b/EHOzRbXwqvAZfbxtc9M8.qbcidi', '0', null, '27', null, '2016-12-29 16:49:42', '2016-12-29 16:49:42', '158');
INSERT INTO `users` VALUES ('157', '0', 'sougou123', '吉新海', '$2a$10$t74rAQRgmUe3quk9MlzXeeQvpF3LSUIWZkJUMijDmyoZ4JYUVdgQi', '0', null, '27', null, '2016-12-29 16:49:42', '2016-12-29 16:49:42', '159');
INSERT INTO `users` VALUES ('158', '0', 'coolan', '熊哲学', '$2a$10$wp9qm.XlQK23hWuKt8pVJeMsVK57HCo8jcHJQU4WxkYOuL/BHDBBC', '0', null, '27', null, '2016-12-29 16:49:43', '2016-12-29 16:49:43', '160');
INSERT INTO `users` VALUES ('159', '0', 'sinewtecl', '李俊', '$2a$10$EJywe.lpZJDoF6Skf0kGHON52pVYGpml94h8YY1Jlj9hd5M1NhytG', '0', null, '27', null, '2016-12-29 16:49:43', '2016-12-29 16:49:43', '161');
INSERT INTO `users` VALUES ('160', '0', '5399101', '岳贯永', '$2a$10$Zp5YKzdidli1h8hNi2xUWu60ol21USpLxBq/xsWtwDo3Dy5iXm4ta', '0', null, '27', null, '2016-12-29 16:49:43', '2016-12-29 16:49:43', '162');
INSERT INTO `users` VALUES ('161', '0', 'miki002', '魏晨', '$2a$10$oF2.InbqsBIjxFz9LzccieYIJyiJ8eWWV9LuCnMU8/yIxLdp7IKny', '0', null, '27', null, '2016-12-29 16:49:44', '2016-12-29 16:49:44', '163');
INSERT INTO `users` VALUES ('162', '0', 'feng8jing', '平志国', '$2a$10$mSVVoWg/TVzaoNFPst7OVuWF626zQXzlw1XcG.JzE/4KFu4Njf2L.', '0', null, '27', null, '2016-12-29 16:49:44', '2016-12-29 16:49:44', '164');
INSERT INTO `users` VALUES ('163', '0', 'stntscom', '陈刚', '$2a$10$wHMuPK7Hw57uPlCm5xzm0erWYB9KKp44BHrPmjwF2sTvUebmpCLzu', '0', null, '27', null, '2016-12-29 16:49:44', '2016-12-29 16:49:44', '165');
INSERT INTO `users` VALUES ('164', '0', 'jzy8038', '蒋祖意', '$2a$10$NHDS76tHWROMx4j4q18qQ.nJ2eAyDw7py9MOdoip8wpVmgiPOH9vG', '0', null, '27', null, '2016-12-29 16:49:45', '2016-12-29 16:49:45', '166');
INSERT INTO `users` VALUES ('165', '0', 'mymkwl', '王涛', '$2a$10$U7SNCmqr8ycw0gRMkioym.2nkivgVeI1g0SXSYhNbiE0ThQdPccae', '0', null, '27', null, '2016-12-29 16:49:45', '2016-12-29 16:49:45', '167');
INSERT INTO `users` VALUES ('166', '0', 'wslyz640', '刘洪成', '$2a$10$NVdmQHsQwertPVAlxwGxkOA.teOIJ0mGTgF5x19CAQ5UWIJ5L/fUS', '0', null, '27', null, '2016-12-29 16:49:45', '2016-12-29 16:49:45', '168');
INSERT INTO `users` VALUES ('167', '0', 'rednetip', '刘志', '$2a$10$SGnLsSfGAe5X/xoQ/AbGZ.ye/vf5eaHqYPofXLY1w9ed7OKmXE69O', '0', null, '27', null, '2016-12-29 16:49:46', '2016-12-29 16:49:46', '169');
INSERT INTO `users` VALUES ('168', '0', 'a289793', '张敏', '$2a$10$3Xkorbj5RpIu0Wtnv5/XueuRhib5m4d4EMlxSTJcB6b1FDati4YBS', '0', null, '27', null, '2016-12-29 16:49:46', '2016-12-29 16:49:46', '170');
INSERT INTO `users` VALUES ('169', '0', 'xbd16888', '高平', '$2a$10$ilaP0ovQGzUi5cobYybTZOPhR/Hjm9j4I1w7d50mlDLG9xrq0o29m', '0', null, '27', null, '2016-12-29 16:49:46', '2016-12-29 16:49:46', '171');
INSERT INTO `users` VALUES ('170', '0', '289793', '吴向阳', '$2a$10$rQRXbLsI.CmFJJnZnXG9Bud6CW13KRFQY0OyqPn23yAGQqfzZIedW', '0', null, '27', null, '2016-12-29 16:49:47', '2016-12-29 16:49:47', '172');
INSERT INTO `users` VALUES ('171', '0', 'ssh806', '石勇', '$2a$10$YlMfYfF98ZJDlgAY8G2KTOuwItmgVMfCEFv6.UdCzvXeV2aYari/y', '0', null, '27', null, '2016-12-29 16:49:47', '2016-12-29 16:49:47', '173');
INSERT INTO `users` VALUES ('172', '0', '414319055', '孙宏振', '$2a$10$sNZiwNiFSHUl8z2OCKJ6c.EhlSlrC11wFHBvOgRxx2p3CY.tzoIlS', '0', null, '27', null, '2016-12-29 16:49:47', '2016-12-29 16:49:47', '174');
INSERT INTO `users` VALUES ('173', '0', 'wen982', '王伯文', '$2a$10$AMUPZ8QdRhcdFUUH6R3hMekeHGEvrUprvIXXdvFUPeX7Ad.M1bgVK', '0', null, '27', null, '2016-12-29 16:49:48', '2016-12-29 16:49:48', '175');
INSERT INTO `users` VALUES ('174', '0', 'a66952453', '董友新', '$2a$10$GvFUepdzX3UZPMDNok/oduFTCC5Vj00Vre995wMmbO/syO34PykG2', '0', null, '27', null, '2016-12-29 16:49:48', '2016-12-29 16:49:48', '176');
INSERT INTO `users` VALUES ('175', '0', 'kulozaki', '刘超', '$2a$10$6NJHwfn2c0eQirHNu819UumrzDxQ6.xAQVnc8g7Mi3eeSsWV.SuK6', '0', null, '27', null, '2016-12-29 16:49:48', '2016-12-29 16:49:48', '177');
INSERT INTO `users` VALUES ('176', '0', 'xiangjian', '项建', '$2a$10$MrrXsmcOgQe5b5EWPa18ZORy9bqr9.G6ULJeIwHyK6OkS3dAvg87S', '0', null, '27', null, '2016-12-29 16:49:49', '2016-12-29 16:49:49', '178');
INSERT INTO `users` VALUES ('177', '0', '458115010', '项建', '$2a$10$ZYfIJa/5qZTaXswC4H6tuuixyIXGol/1leswKQsUuZOTPC4sWt4A6', '0', null, '27', null, '2016-12-29 16:49:49', '2016-12-29 16:49:49', '179');
INSERT INTO `users` VALUES ('178', '0', 'ght6688', '陈泽龙', '$2a$10$zuPyj5GKKFQ0uqyKmDLQOeMs34oHFOPScnTv/yZl9bpjWZmuInas6', '0', null, '27', null, '2016-12-29 16:49:50', '2016-12-29 16:49:50', '180');
INSERT INTO `users` VALUES ('179', '0', 'aiyouad', '郑伟', '$2a$10$okXANlmPR3hK/ooMKuG4YOzocJLkNuO4QEI./cA.u0PAsboFqTHHy', '0', null, '27', null, '2016-12-29 16:49:50', '2016-12-29 16:49:50', '181');
INSERT INTO `users` VALUES ('180', '0', 'zj520', '郑静', '$2a$10$bWBnj9lRJ9wl45JEw0QOKe5XZj3t4ZUSsGO/LpS5bRQtnA7c/l/Ye', '0', null, '27', null, '2016-12-29 16:49:50', '2016-12-29 16:49:50', '182');
INSERT INTO `users` VALUES ('181', '0', 'hs0001', '龚威', '$2a$10$RWgmdMvfQqLzwrWWGc1zV.GKyl3MGNIlWLjCFzzfX0N1HCZAyXf.S', '0', null, '27', null, '2016-12-29 16:49:51', '2016-12-29 16:49:51', '183');
INSERT INTO `users` VALUES ('182', '0', 'qqe168', '吴旭海', '$2a$10$BvESiFCLOl.2SvIdSNwRcuT3gA9mKiq76IcUOY2G6pxsdieMhv27u', '0', null, '27', null, '2016-12-29 16:49:51', '2016-12-29 16:49:51', '184');
INSERT INTO `users` VALUES ('183', '0', 'qynhcy', '李军', '$2a$10$E45ZImUDa8FPxjBZNZEsouVwTP2O2hez0OLvpH59tkL6Pg9DC1eTq', '0', null, '27', null, '2016-12-29 16:49:51', '2016-12-29 16:49:51', '185');
INSERT INTO `users` VALUES ('184', '0', 'disonlee', '李德成', '$2a$10$rXnXAPBmI/.C4geCVbRZ5uYv0OnIwZWHck/NQhGpMvh.O1gMg3LzS', '0', null, '27', null, '2016-12-29 16:49:52', '2016-12-29 16:49:52', '186');
INSERT INTO `users` VALUES ('185', '0', 'ytmfcu', '潘权', '$2a$10$cz64E4EFZ6Etuff5LZJWT.OqziH4kbT4MECQMFAUM/vBPimeNuVIa', '0', null, '27', null, '2016-12-29 16:49:52', '2016-12-29 16:49:52', '187');
INSERT INTO `users` VALUES ('186', '0', 'tsrj001', '王浩', '$2a$10$aZ9oE/P0LEzWRCkRtHUHg.HfiyTZWleNc5E5P.gxtGBQ3I2XBFjlK', '0', null, '27', null, '2016-12-29 16:49:52', '2016-12-29 16:49:52', '188');
INSERT INTO `users` VALUES ('187', '0', 'xinyuwang', '', '$2a$10$Lv6VsswQeqanRHACZUBoyOK7kyX6sMnz.1JcUz/Ey9atAb8AM0Kbm', '0', null, '27', null, '2016-12-29 16:49:53', '2016-12-29 16:49:53', '189');
INSERT INTO `users` VALUES ('188', '0', 'taiji', '何亮', '$2a$10$Osv25gPWaCvU1UE14PYdgutrt7pz.uZxTAbEBmQ53zuCIwnv1Bw0C', '0', null, '27', null, '2016-12-29 16:49:53', '2016-12-29 16:49:53', '190');
INSERT INTO `users` VALUES ('189', '0', 's3001s', '陈良珊', '$2a$10$b5rPiY/VjzogLTCLsHDGuuqOSVOlprIsL9s2TIh1yFuhGvwCT4m.a', '0', null, '27', null, '2016-12-29 16:49:53', '2016-12-29 16:49:53', '191');
INSERT INTO `users` VALUES ('190', '0', '541782104', '袁燕龙', '$2a$10$XhavAib.sgZM5LY69emxmOuTDrq2IFuDg8lE3MKLA4AUCVrmOK602', '0', null, '27', null, '2016-12-29 16:49:54', '2016-12-29 16:49:54', '192');
INSERT INTO `users` VALUES ('191', '0', 'maomao', '刘兴贵', '$2a$10$9FDDigArfHgplUQ9XkTt3OkXFb34tEGFa/AgR/g5JtVja0vV/hAUG', '0', null, '27', null, '2016-12-29 16:49:54', '2016-12-29 16:49:54', '193');
INSERT INTO `users` VALUES ('192', '0', 'gu_yihao', '顾逸豪', '$2a$10$nqReColILXqeLJFoLfTCoOInamtPO.ygtD8ywws1wUbrS4dm8R41S', '0', null, '27', null, '2016-12-29 16:49:55', '2016-12-29 16:49:55', '194');
INSERT INTO `users` VALUES ('193', '0', 'jxsicent', '曹佐伟', '$2a$10$qW8zIQEHf59vJBcyspm.QeF2Z1dJdlHYhKYZnFZun8NpHF0d1NwMO', '0', null, '27', null, '2016-12-29 16:49:56', '2016-12-29 16:49:56', '195');
INSERT INTO `users` VALUES ('194', '0', 'sxhzd3', '郭磊', '$2a$10$59X3LGwcu2glsRzXlnYy3eyX6Z92xLAFVklR0fEz1KRBAXhn92eRu', '0', null, '27', null, '2016-12-29 16:49:56', '2016-12-29 16:49:56', '196');
INSERT INTO `users` VALUES ('195', '0', 'jxymcd', '曹佐伟', '$2a$10$12J/orCj1pG5Qn3zt296FesicSsUBt.5teyK75yWhL6LqMYAkjoeK', '0', null, '27', null, '2016-12-29 16:49:57', '2016-12-29 16:49:57', '197');
INSERT INTO `users` VALUES ('196', '0', 'huihui199', '王馨慧', '$2a$10$hJK6NJy5G8Y1AvfDxikfTuNTV4r4qZSTUXZEPSfWfrB4i6MJ.T.nS', '0', null, '27', null, '2016-12-29 16:49:57', '2016-12-29 16:49:57', '198');
INSERT INTO `users` VALUES ('197', '0', 'awp880113', '张昊', '$2a$10$y021w5sFVdYSzv/IGGDEgOvRsVvxMb76q2t7UsB9tRTf/Zr8dATCm', '0', null, '27', null, '2016-12-29 16:49:57', '2016-12-29 16:49:57', '199');
INSERT INTO `users` VALUES ('198', '0', 'rlwl2016', '姚明', '$2a$10$LeiFix5wCxvwpmyL5x2P2.QkcmcOAgevWHhYB/.icDbHkfi3xIU6e', '0', null, '27', null, '2016-12-29 16:49:58', '2016-12-29 16:49:58', '200');
INSERT INTO `users` VALUES ('199', '0', 'swinforpt', '曹佐伟', '$2a$10$wefvyrjQ628I86J7pkVqGO2b/KoCG40virahojXG5IgHj3ZTX5R5q', '0', null, '27', null, '2016-12-29 16:49:58', '2016-12-29 16:49:58', '201');
INSERT INTO `users` VALUES ('200', '0', 'bayuelian', '徐建涛', '$2a$10$4z/RZWZ4rlGsg0wn/YQi3OAdoTQwwAO84a0rRaXBBq6XqKl6DzdUu', '0', null, '27', null, '2016-12-29 16:49:58', '2016-12-29 16:49:58', '202');
INSERT INTO `users` VALUES ('201', '0', 'chkau', '程锎', '$2a$10$RJK5lVw/26smZ17mpjg2.uX9sZQgL8vbTWEpvmlCqU4tk14Aw6chO', '0', null, '27', null, '2016-12-29 16:49:59', '2016-12-29 16:49:59', '203');
INSERT INTO `users` VALUES ('202', '0', 'sea100', '姚佰川', '$2a$10$bv..CKFTosNQdx/oiCKTMuwu.mOGLoyGmYms46oprJ2FMbSx6bMpO', '0', null, '27', null, '2016-12-29 16:49:59', '2016-12-29 16:49:59', '204');
INSERT INTO `users` VALUES ('203', '0', 'liuhao624', '张涛', '$2a$10$mVbM5BFoX0c.WUb1Vo5Dneyv494MrjVfY8eRe5aOIIgOuYewhOamO', '0', null, '27', null, '2016-12-29 16:49:59', '2016-12-29 16:49:59', '205');
INSERT INTO `users` VALUES ('204', '0', 'sppsvc', '张涛', '$2a$10$Jias4KHeQv7bBgFY5qvECOyUAAH1vmIOJhqSuiK1kDP08fj2ZZCjO', '0', null, '27', null, '2016-12-29 16:50:00', '2016-12-29 16:50:00', '206');
INSERT INTO `users` VALUES ('205', '0', 'rzxnet', '胡海', '$2a$10$9CbS3GBGuR9VgXQJ7MuZweiDTlizgDrZOIMM1BQ6fZ9tW3Jca3gmK', '0', null, '27', null, '2016-12-29 16:50:00', '2016-12-29 16:50:00', '207');
INSERT INTO `users` VALUES ('206', '0', 'snfan1983', '杨泽灿', '$2a$10$qCV5TemXcPOSYynIw1/0fOJd3ufzb7fa/y0T.UaFK6vfAJOIeScx.', '0', null, '27', null, '2016-12-29 16:50:00', '2016-12-29 16:50:00', '208');
INSERT INTO `users` VALUES ('207', '0', 'lcrwkj', '马宏刚', '$2a$10$D4K3G/88TRF02r2hVmb.iu89F3EbCpK7vLbWeZmU0PMm.2.adyHy2', '0', null, '27', null, '2016-12-29 16:50:01', '2016-12-29 16:50:01', '209');
INSERT INTO `users` VALUES ('208', '0', 'zgwwj', '陈小勇', '$2a$10$/9H6zw5hA8UQV01sRO2uWuGiGm0cpW8WG1.UZsrZ.yOxgECh64OCi', '0', null, '27', null, '2016-12-29 16:50:01', '2016-12-29 16:50:01', '210');
INSERT INTO `users` VALUES ('209', '0', '55824910', '张国斌', '$2a$10$2gkSkN2lRXUmuHvThJrzBOSv9a4058z5yp6nSQHR/Q2BSBpg.sDtm', '0', null, '27', null, '2016-12-29 16:50:01', '2016-12-29 16:50:01', '211');
INSERT INTO `users` VALUES ('210', '0', 'yunng', '刘思雨', '$2a$10$AQVlrJqdQGQUQhFIwTtJQ.WMifIRwAnOKl6PxkC22paQFF3AdFx7m', '0', null, '27', null, '2016-12-29 16:50:02', '2016-12-29 16:50:02', '212');
INSERT INTO `users` VALUES ('211', '0', 'sam285407', '丛向明', '$2a$10$AC.ln546mS0RYUtLfzNrRuRWPoKwmXZyTUCL5jrt7u7n578B3u.9C', '0', null, '27', null, '2016-12-29 16:50:02', '2016-12-29 16:50:02', '213');
INSERT INTO `users` VALUES ('212', '0', 'pkniuer', '刘平', '$2a$10$jBuORpcKSYWvXvSf/afmZ.eQzZ1oGpsBnJnLEW73E9pjXCUND1gQ2', '0', null, '27', null, '2016-12-29 16:50:02', '2016-12-29 16:50:02', '214');
INSERT INTO `users` VALUES ('213', '0', 'aamwang', '王涛', '$2a$10$klVmTHN/aIvY6dVDxDmkae4HOBtcQWIClWOfLuQkUIYwMNVaG/QuS', '0', null, '27', null, '2016-12-29 16:50:03', '2016-12-29 16:50:03', '215');
INSERT INTO `users` VALUES ('214', '0', 'lp1502', '杨军', '$2a$10$6GEjPH00/vqny0phbkx9OupYoRd1RFk0S1JHUhmzCvdc0Bn0X5.Re', '0', null, '27', null, '2016-12-29 16:50:03', '2016-12-29 16:50:03', '216');
INSERT INTO `users` VALUES ('215', '0', 'windy20', '桂利锋', '$2a$10$14dyWMK/huPcqfDkzX1HH.rzYwD8WlCRmSeotM1nkAYP6vLnw6i8a', '0', null, '27', null, '2016-12-29 16:50:03', '2016-12-29 16:50:03', '217');
INSERT INTO `users` VALUES ('216', '0', 'njwmkj', '张索峰', '$2a$10$75eNdWJJM7d0vknZYrOzneSnbyfIKe92myyA4IkaBXkVt0VhfoMnm', '0', null, '27', null, '2016-12-29 16:50:04', '2016-12-29 16:50:04', '218');
INSERT INTO `users` VALUES ('217', '0', 'icafe', '李军', '$2a$10$sjS7OzbHPTRlyrYuke0.UOuHX887X8GRXtJyWLiHjD9DJVsOxzNJm', '0', null, '27', null, '2016-12-29 16:50:04', '2016-12-29 16:50:04', '219');
INSERT INTO `users` VALUES ('218', '0', 'wyshuia', '涂日辉', '$2a$10$8ZfJH6.aaBNq1LkRabyC..5F9wXglfYtOfakt0Hyk/PRXEx3mSllG', '0', null, '27', null, '2016-12-29 16:50:04', '2016-12-29 16:50:04', '220');
INSERT INTO `users` VALUES ('219', '0', '81569310', '叶明森', '$2a$10$QuV7QALLxrsyGH/TZArSUe1ilJKirD/cR6mFF5qvlOMMTTeZB17bC', '0', null, '27', null, '2016-12-29 16:50:05', '2016-12-29 16:50:05', '221');
INSERT INTO `users` VALUES ('220', '0', 'liu112', '刘金龙', '$2a$10$m15TRXMwjv0GdNKL/fBFWurD/xYEEx2iH8CY9hC3PLul3tIa0TDtm', '0', null, '27', null, '2016-12-29 16:50:05', '2016-12-29 16:50:05', '222');
INSERT INTO `users` VALUES ('221', '0', 'wwwadmin', '梁胜伟', '$2a$10$uSeTmllS1AfH20/Q/YrtVenw/dmah0kEecUzvZ3owuRCh3c3ExuQ2', '0', null, '27', null, '2016-12-29 16:50:06', '2016-12-29 16:50:06', '223');
INSERT INTO `users` VALUES ('222', '0', 'mwkj2016', '白鹤君', '$2a$10$3YiybOYevWxJbjxpH/NCS.smm.1A1uTwpNQL4dmWy2C2VBveSTcTq', '0', null, '27', null, '2016-12-29 16:50:06', '2016-12-29 16:50:06', '224');
INSERT INTO `users` VALUES ('223', '0', 'lpwang103', '王磊', '$2a$10$DEkU2RWdm3ST5B/MlHKBx.2wbRolDeOWGxu3LYsR29S5GZm7SBrNq', '0', null, '27', null, '2016-12-29 16:50:06', '2016-12-29 16:50:06', '225');
INSERT INTO `users` VALUES ('224', '0', 'mabaoyun', '马保云', '$2a$10$X3l47s9PltL7cffe1I6xdOASYXvKFUwiQsW5LYvUGFbmuAwWLhAX2', '0', null, '27', null, '2016-12-29 16:50:07', '2016-12-29 16:50:07', '226');
INSERT INTO `users` VALUES ('225', '0', 'sdqdwyb', '吴玉波', '$2a$10$YHrOtTSKUlSgXovu5fT0J.kEqrmK0tfWnXjI5EYBO2e.dJo2EUryO', '0', null, '27', null, '2016-12-29 16:50:07', '2016-12-29 16:50:07', '227');
INSERT INTO `users` VALUES ('226', '0', 'huisen', '张会森', '$2a$10$djKDtDVTa6tfSNRKTwagiOB/XPf4sz8NzYwngCGgpk1B5KuKQ3SHa', '0', null, '27', null, '2016-12-29 16:50:07', '2016-12-29 16:50:07', '228');
INSERT INTO `users` VALUES ('227', '0', 'adadmin', '伍本波', '$2a$10$YmZSzhLL8Xqc1grTrniYmugB80rEbXOdRfWQ1sisXxI7lZZEO4FYe', '0', null, '27', null, '2016-12-29 16:50:08', '2016-12-29 16:50:08', '229');
INSERT INTO `users` VALUES ('228', '0', 'zydt016', '陈松', '$2a$10$Qf7rJAgHXlLMyyZJoa8eP.k2Zcb0sPPIlMf4kYeJQy.4xzo9dw8VO', '0', null, '27', null, '2016-12-29 16:50:08', '2016-12-29 16:50:08', '230');
INSERT INTO `users` VALUES ('229', '0', 'xxwl2016', '祁学财', '$2a$10$VTX6hqYubnANOvwLTjgYjud/W4j6nl2sWZMBivJ4iZakUuMHp0YBu', '0', null, '27', null, '2016-12-29 16:50:08', '2016-12-29 16:50:08', '231');
INSERT INTO `users` VALUES ('230', '0', 'aosheng', '宁鑫', '$2a$10$Q.y.aQdqJAZ7Xl80ombZfuqA0q2fwnquxCiG8v2fXUbwVLj4NN1EO', '0', null, '27', null, '2016-12-29 16:50:09', '2016-12-29 16:50:09', '232');
INSERT INTO `users` VALUES ('231', '0', 'pf12154', '张朋飞', '$2a$10$CeW.HvAobOIl18NCdUUQkuMMZTAoMthShjzFz5x0cKutZUW7ObyKu', '0', null, '27', null, '2016-12-29 16:50:09', '2016-12-29 16:50:09', '233');
INSERT INTO `users` VALUES ('232', '0', 'classfree', '朱重霖', '$2a$10$RQuxA5zfM7q5mIqQMJDxwuzjLmiA7i3zn5nEv1ih619ICYZ3eWOsO', '0', null, '27', null, '2016-12-29 16:50:09', '2016-12-29 16:50:09', '234');
INSERT INTO `users` VALUES ('233', '0', 'cqbxfast', '朱重霖', '$2a$10$9DU4ZH3ZkhISWjlde5KtR.uooH3DEjIoYavzcPGhkQkEOIGhDS.dO', '0', null, '27', null, '2016-12-29 16:50:10', '2016-12-29 16:50:10', '235');
INSERT INTO `users` VALUES ('234', '0', 'coolan1', '熊哲学', '$2a$10$MS.1QOOtjEA4r/t018IrhOh90eFX6rfttfsjFMTIPIPlQ2Fwl/tUa', '0', null, '27', null, '2016-12-29 16:50:10', '2016-12-29 16:50:10', '236');
INSERT INTO `users` VALUES ('235', '0', 'sjy203061', '孙建勇', '$2a$10$9KcwX1mN.eRY4Zw.xCAWSOv5HyLbD1oMhwUPthvQRRYYN3XR9t7CK', '0', null, '27', null, '2016-12-29 16:50:10', '2016-12-29 16:50:10', '237');
INSERT INTO `users` VALUES ('236', '0', 'pubsafe', '刘猛猛', '$2a$10$0FPdnPQNdNGVPNPEQJZy2.F6UQ8eiIoJa6mAPph6i.Y4Frlmiu7yK', '0', null, '27', null, '2016-12-29 16:50:11', '2016-12-29 16:50:11', '238');
INSERT INTO `users` VALUES ('237', '0', 'wiwishi', '田山峰', '$2a$10$0LztNYHcKch9WYSYb4GupO8JLBeiXoTmCHK6cGxcdog/SaAzVZFGq', '0', null, '27', null, '2016-12-29 16:50:11', '2016-12-29 16:50:11', '239');
INSERT INTO `users` VALUES ('238', '0', 'hnzxs', '朱小松', '$2a$10$yyGwz9b1iAPusGn4ms44h.LriyfGVVX5ASxkSIsrwXVhsEeM.aDMm', '0', null, '27', null, '2016-12-29 16:50:11', '2016-12-29 16:50:11', '240');
INSERT INTO `users` VALUES ('239', '0', 'wb666', '田山峰', '$2a$10$fqetFBfO91rEFVOIK2aQG.BlBQolVCrJfoMU7IA.cRAA9XRMi9Kl2', '0', null, '27', null, '2016-12-29 16:50:12', '2016-12-29 16:50:12', '241');
INSERT INTO `users` VALUES ('240', '0', 'myadsl', '王坤', '$2a$10$pOM8L4kgqMJ/4YZNScdTMea22tFpzBS8sS14IHYFy8qnKrWzvbTb6', '0', null, '27', null, '2016-12-29 16:50:12', '2016-12-29 16:50:12', '242');
INSERT INTO `users` VALUES ('241', '0', 'jzwlkj', '张绍浒', '$2a$10$l39YA4j3nUhUBPeqXqwcXeQo7gmzo3sjpLACvUS.ZozsXti4RB5gS', '0', null, '27', null, '2016-12-29 16:50:12', '2016-12-29 16:50:12', '243');
INSERT INTO `users` VALUES ('242', '0', 'tqzlkj', '张子华', '$2a$10$0q6DfxqGiX5y726JRRiBlO6vKbQFYpjjJksMJwpVULeRuUlu6rniG', '0', null, '27', null, '2016-12-29 16:50:13', '2016-12-29 16:50:13', '244');
INSERT INTO `users` VALUES ('243', '0', '185985566', '吴玉波', '$2a$10$GVCIEHt3lU/ChEcQMC.g7ePOMvLIybi.gbZJP24YWFth6Mw.JKbAu', '0', null, '27', null, '2016-12-29 16:50:13', '2016-12-29 16:50:13', '245');
INSERT INTO `users` VALUES ('244', '0', 'ynwsyhwl', '孙万超', '$2a$10$8Zw4/7nURrG/HuuhI4YrlOQRYFO5y3nAQPA/PFhVgQ5MR3X2coqZu', '0', null, '27', null, '2016-12-29 16:50:13', '2016-12-29 16:50:13', '246');
INSERT INTO `users` VALUES ('245', '0', 'zjsyyul', '姚云龙', '$2a$10$xGZShWZk9P2oVTGyv6haTugtSBJqGGDkffV0v3.8hhhPQbPbmGJDG', '0', null, '27', null, '2016-12-29 16:50:14', '2016-12-29 16:50:14', '247');
INSERT INTO `users` VALUES ('246', '0', 'fansenjin', '吴聪', '$2a$10$KLRMpEJMVouRc79TKD4/de/vYROaLjCGQ8BHvTZCtM7PVP.RbrDEq', '0', null, '27', null, '2016-12-29 16:50:14', '2016-12-29 16:50:14', '248');
INSERT INTO `users` VALUES ('247', '0', 'jxswkj', '戴天龙', '$2a$10$gaKo49u4E.T3FlpPGTM8pOUTnAK48mz1Wm69GNB1nQC4dUnMlD41.', '0', null, '27', null, '2016-12-29 16:50:14', '2016-12-29 16:50:14', '249');
INSERT INTO `users` VALUES ('248', '0', 'jhtzz', '熊梅', '$2a$10$44vrYmXlR5Dabn8iidW3LOeAj/DjdwveeBdA7m6xHy46e67ubZ8y2', '0', null, '27', null, '2016-12-29 16:50:15', '2016-12-29 16:50:15', '250');
INSERT INTO `users` VALUES ('249', '0', 'benniao', '姜颖', '$2a$10$u0vr4ZG1zvc8UpjzT0tav.rp2/dt7OOvhUzq82NlhEeOuvogmU2.K', '0', null, '27', null, '2016-12-29 16:50:15', '2016-12-29 16:50:15', '251');
INSERT INTO `users` VALUES ('250', '0', 'flashxke', '梁辉辉', '$2a$10$bgGxp8uoJVyS9pZPmXS0e.7uTn78TgQwR7CdaVEHO/CmqYccY1l8S', '0', null, '27', null, '2016-12-29 16:50:15', '2016-12-29 16:50:15', '252');
INSERT INTO `users` VALUES ('251', '0', 'ufw119', '凌水木', '$2a$10$zmvln8c7QExkE46LiGXcZ.BoB8nhi3riYicfURaU2XyYz85uTkIqO', '0', null, '27', null, '2016-12-29 16:50:16', '2016-12-29 16:50:16', '253');
INSERT INTO `users` VALUES ('252', '0', 'xdf209', '熊小东', '$2a$10$.AEQ9TsslIX90VEjRRNS.ubYrpIG2oA1ox4VbEG/yHfEKrxVoGyRO', '0', null, '27', null, '2016-12-29 16:50:16', '2016-12-29 16:50:16', '254');
INSERT INTO `users` VALUES ('253', '0', 'cool8', '快叫爸爸', '$2a$10$PkjtydyD2hwVWGjgd3DpEOlwG2xxFvvJ8flqO2iVrJ.rNW45P4nUy', '0', null, '27', null, '2016-12-29 16:50:16', '2016-12-29 16:50:16', '255');
INSERT INTO `users` VALUES ('254', '0', 'zhangmin', '张敏', '$2a$10$.sc8ooa/TYcQLjNZcCHlPOjejSHaPDK/ls4Gx2gWNClI4V1JS.Cdq', '0', null, '27', null, '2016-12-29 16:50:17', '2016-12-29 16:50:17', '256');
INSERT INTO `users` VALUES ('255', '0', 'l24432736', '曾凡林', '$2a$10$QuJuf0sjcUNtiVB28pnX3.kTvGNIQI2L1yoMg9hbdoW5TElcArnHO', '0', null, '27', null, '2016-12-29 16:50:17', '2016-12-29 16:50:17', '257');
INSERT INTO `users` VALUES ('256', '0', 'bayyww', '刘昕', '$2a$10$EtTQNnE88N.QpEIRk8nDQOHXLV2O3cmaHc1JD4yNPLPoH.hxAjveW', '0', null, '27', null, '2016-12-29 16:50:18', '2016-12-29 16:50:18', '258');
INSERT INTO `users` VALUES ('257', '0', 'janker031', '徐文涛', '$2a$10$4rCtkrE8RTw6fAbZIiiWmu79OUiC9odihywbjuJHgzHhDkjFyIc6e', '0', null, '27', null, '2016-12-29 16:50:18', '2016-12-29 16:50:18', '259');
INSERT INTO `users` VALUES ('258', '0', 'rjwl01', '张云成', '$2a$10$lV8BMLGwv0yeRdkI4ixAfuk6rWiNYzua3JfDuLxFm5O5RU.PaAWCO', '0', null, '27', null, '2016-12-29 16:50:18', '2016-12-29 16:50:18', '260');
INSERT INTO `users` VALUES ('259', '0', '49666684', '江翌', '$2a$10$Jz9fzF83w5j63wdRe8pa/.1hMXqMAYCeskctafZaZsnFnPTXpq.b2', '0', null, '27', null, '2016-12-29 16:50:19', '2016-12-29 16:50:19', '261');
INSERT INTO `users` VALUES ('260', '0', 'jy110', '喻建新', '$2a$10$OIg2m0v2cO2mdQKFXfxYMu7JSM8BfBveWxGRiYiBsd3qO7wEfyEzC', '0', null, '27', null, '2016-12-29 16:50:19', '2016-12-29 16:50:19', '262');
INSERT INTO `users` VALUES ('261', '0', '68449040', '张兆阳', '$2a$10$snn8znc6NtwT4kxw1gVTTeN2xdbsnMiiRnzi0nohCeB1QoWOcfOuG', '0', null, '27', null, '2016-12-29 16:50:19', '2016-12-29 16:50:19', '263');
INSERT INTO `users` VALUES ('262', '0', 'xiedefu', '谢德付', '$2a$10$INg7YKl1TRPaFMj7YwwIJOlx0E.Uu53gqMLA/uTVN7y8yXn0GId06', '0', null, '27', null, '2016-12-29 16:50:20', '2016-12-29 16:50:20', '264');
INSERT INTO `users` VALUES ('263', '0', 'zwd0718', '甄文达', '$2a$10$IMHmIQuTWcFOqhnKZ6uaLO3MEgsrfli3waK0mytLLQ4DTcUHvryau', '0', null, '27', null, '2016-12-29 16:50:20', '2016-12-29 16:50:20', '265');
INSERT INTO `users` VALUES ('264', '0', 'anqfsh', '吴帅', '$2a$10$wcPloIR/VlwwH96jlrGTTeLOZuRIaE51mSdLWQ2TH/BTXiXhB3ieK', '0', null, '27', null, '2016-12-29 16:50:20', '2016-12-29 16:50:20', '266');
INSERT INTO `users` VALUES ('265', '0', '8233000', '潘凯', '$2a$10$ou.ebkVh25Jy54PMKNM6cuavjFhxamnEC41rjFjD5/Oh2njg/R/a.', '0', null, '27', null, '2016-12-29 16:50:21', '2016-12-29 16:50:21', '267');
INSERT INTO `users` VALUES ('266', '0', 'wtywl', '李远东', '$2a$10$DaqqUcVNF.ke4ebVkV55Nuir5WquQVI7GRMAJT/NWDJJZqGP9iqmq', '0', null, '27', null, '2016-12-29 16:50:21', '2016-12-29 16:50:21', '268');
INSERT INTO `users` VALUES ('267', '0', 'jamanxin', '辛伟', '$2a$10$y7R5IQ6XxiJcHyZmKAmspuQdvKpUq7ve8Jg7Tcr/laAZbFUN.tfyi', '0', null, '27', null, '2016-12-29 16:50:21', '2016-12-29 16:50:21', '269');
INSERT INTO `users` VALUES ('268', '0', 'wwp520', '王伟平', '$2a$10$irZuKjf.uGWzyXntDGbcNuC/x6400FSdO/BiGHrxEvfRLpP5CFG5.', '0', null, '27', null, '2016-12-29 16:50:22', '2016-12-29 16:50:22', '270');
INSERT INTO `users` VALUES ('269', '0', 'wuchinane', '武钢', '$2a$10$ghiOeY5yMHnWq58hgnVVmutphcsIqOyVnyAPFyLZ4hCGQcqAWZTtm', '0', null, '27', null, '2016-12-29 16:50:22', '2016-12-29 16:50:22', '271');
INSERT INTO `users` VALUES ('270', '0', 'mmk210', '陈先生', '$2a$10$/I4a8TfmjHanxiQ/gUxbMewGdeGBqwzjgEdnMhEh9iLGoDt3Qu1kK', '0', null, '27', null, '2016-12-29 16:50:22', '2016-12-29 16:50:22', '272');
INSERT INTO `users` VALUES ('271', '0', 'xgnetwork', '胡鸿俊', '$2a$10$xLDuo84SldPCa41ssiLgLOkSkTNadXHlY/MpP1mRd37F6D1.FxYne', '0', null, '27', null, '2016-12-29 16:50:23', '2016-12-29 16:50:23', '273');
INSERT INTO `users` VALUES ('272', '0', 'luotong', '罗通', '$2a$10$gCI5N1/xn3PhZh7FJMHKEOlSb4VjdRPX/K6gLLz14BwzqGCjtGLRC', '0', null, '27', null, '2016-12-29 16:50:23', '2016-12-29 16:50:23', '274');
INSERT INTO `users` VALUES ('273', '0', 'jzwl82330', '潘凯', '$2a$10$3fN9ful7gn6KdntGcaYYYuVs973.P7Yp5.r6uhpblQlOj72R8AKLK', '0', null, '27', null, '2016-12-29 16:50:23', '2016-12-29 16:50:23', '275');
INSERT INTO `users` VALUES ('274', '0', 'gaozhi114', '高智', '$2a$10$8CuNwL1S.EIF8GKVhn3a5O68ngZ1HZw76t7.Fgvwl/4woFV/6gc.S', '0', null, '27', null, '2016-12-29 16:50:24', '2016-12-29 16:50:24', '276');
INSERT INTO `users` VALUES ('275', '0', 'qswanwei', '刘昕', '$2a$10$y9H5Th7xxvuNk3xtdRjrPeVFzFB28hgx3BQjhBPzcEhFpKizw1COW', '0', null, '27', null, '2016-12-29 16:50:24', '2016-12-29 16:50:24', '277');
INSERT INTO `users` VALUES ('276', '0', 'sheen123', '蒋光辉', '$2a$10$iMQ5ramPoIP5.2blAzvY5.hMmmD1CwMuJ2pPheB2D3q4I4bAmpl1e', '0', null, '27', null, '2016-12-29 16:50:24', '2016-12-29 16:50:24', '278');
INSERT INTO `users` VALUES ('277', '0', 'qyxchenha', '陈昊', '$2a$10$US1O6cxUNLTJfYCQ2D7MR..XN7Vwva0BMK8hWahySRAE8nqF5dvKe', '0', null, '27', null, '2016-12-29 16:50:25', '2016-12-29 16:50:25', '279');
INSERT INTO `users` VALUES ('278', '0', 'moonuser', '刘昕', '$2a$10$iNOfeA7vrxi2kgFhnwxuf.RNwc2ZVhm1qLqOc./jVWyPIL8KEz6ZS', '0', null, '27', null, '2016-12-29 16:50:25', '2016-12-29 16:50:25', '280');
INSERT INTO `users` VALUES ('279', '0', '379716111', '思锋', '$2a$10$Gyu0Lsk64abD.dvBPuX0C.WINxOTNgaKqy9zlUh99MDIJCuCa.gei', '0', null, '27', null, '2016-12-29 16:50:25', '2016-12-29 16:50:25', '281');
INSERT INTO `users` VALUES ('280', '0', 'client58', '', '$2a$10$WEUtq2pxfARLV3u4stD1luwh/zccl93DNhr81q1pEkU0wAtHPPDBC', '0', null, '27', null, '2016-12-29 16:50:26', '2016-12-29 16:50:26', '282');
INSERT INTO `users` VALUES ('281', '0', 'qzhangmin', '张敏', '$2a$10$FOWMVbmm8LAr0epTF6JMBeUqwaO99len/YnBk/0nNiIi1.AF99Qqi', '0', null, '27', null, '2016-12-29 16:50:26', '2016-12-29 16:50:26', '283');
INSERT INTO `users` VALUES ('282', '0', 'netcrewow', '吴军', '$2a$10$CBSlmY.YsJ8fWvw.GfctfuhSmT.7IiMs80fjeGh/CLmq0gXdZNaaC', '0', null, '27', null, '2016-12-29 16:50:26', '2016-12-29 16:50:26', '284');
INSERT INTO `users` VALUES ('283', '0', 'alx5210', '李伟', '$2a$10$CGah1He5EA9G2xYa60orXOQiz6oa6fFMIlS.B0z0.Jg2EcrPslL16', '0', null, '27', null, '2016-12-29 16:50:27', '2016-12-29 16:50:27', '285');
INSERT INTO `users` VALUES ('284', '0', 'xcwhkj', '马秋生', '$2a$10$ub8YLHk45LPaQqxqewsJ7OJ/f5590RlPpHyrbTnesF9o8SUQwZGvi', '0', null, '27', null, '2016-12-29 16:50:27', '2016-12-29 16:50:27', '286');
INSERT INTO `users` VALUES ('285', '0', 'cdclient', '乐伟', '$2a$10$C2VewQLDNm/eaRWVt5AB4uXlPMfgs/NSlBiGvojORoG6zUc9XQSjW', '0', null, '27', null, '2016-12-29 16:50:27', '2016-12-29 16:50:27', '287');
INSERT INTO `users` VALUES ('286', '0', 'tt9199', '刘刘', '$2a$10$ax.gU7d0BxAvPzfIDg0qF.dVSZ.jarm98cO6FpH5kVeBtBjcwAfoS', '0', null, '27', null, '2016-12-29 16:50:28', '2016-12-29 16:50:28', '288');
INSERT INTO `users` VALUES ('287', '0', 'fast15', '王伟', '$2a$10$ghwRVD0cTqorn9maZpx2TOzV68zGYuDJifSNlqeuRBSbrHaVNMJBy', '0', null, '27', null, '2016-12-29 16:50:28', '2016-12-29 16:50:28', '289');
INSERT INTO `users` VALUES ('288', '0', 'lihw110', '李浩威', '$2a$10$/I9uH80kHzo3hg/Wwqf8ZunQNsbX2KN8HpdYgPVPhfvceLy6ea.IW', '0', null, '27', null, '2016-12-29 16:50:29', '2016-12-29 16:50:29', '290');
INSERT INTO `users` VALUES ('289', '0', 'gzsywl', '聂彬', '$2a$10$PNFZzW/grC9R3Ob5Y6v7IO0ok4egXwj6W2nXpOLtoyZAyNtiTek6q', '0', null, '27', null, '2016-12-29 16:50:29', '2016-12-29 16:50:29', '291');
INSERT INTO `users` VALUES ('290', '0', 'cxbg8866', '曹健程', '$2a$10$ga4TBfUgTKIzLwhoLaUYzuYwVndwPMaP14ysa0BtLyLuaK/ENYbdW', '0', null, '27', null, '2016-12-29 16:50:29', '2016-12-29 16:50:29', '292');
INSERT INTO `users` VALUES ('291', '0', 'xxhaishix', '徐鑫', '$2a$10$W8vy.dzATJ96QGWmpIk6VuvSUs8PsxvdB/FtAtK.84s3TbmIUNvH6', '0', null, '27', null, '2016-12-29 16:50:30', '2016-12-29 16:50:30', '293');
INSERT INTO `users` VALUES ('292', '0', 'gyd709960', '高应登', '$2a$10$3jP1P1dIqixjUaio.poi6O8wlVuH1gcg/yLSBJAsdyHfLCoEn/TKW', '0', null, '27', null, '2016-12-29 16:50:30', '2016-12-29 16:50:30', '294');
INSERT INTO `users` VALUES ('293', '0', '709960812', '高应登', '$2a$10$LWtxGO8hrbsrHFQSG5dZUexBROUBm7mPo09FP7bzOlOwlZBXBxVv.', '0', null, '27', null, '2016-12-29 16:50:30', '2016-12-29 16:50:30', '295');
INSERT INTO `users` VALUES ('294', '0', 'feiyue', '张辉', '$2a$10$rDyeuq/7gbzG11Jrw5k7AefPGDJEZN6EtLU25cbspYApCXlyxLmb2', '0', null, '27', null, '2016-12-29 16:50:31', '2016-12-29 16:50:31', '296');
INSERT INTO `users` VALUES ('295', '0', '0888wb', '罗从云', '$2a$10$sR1HHWPVkKj/.V/lr3IdF.mAJEgjWiDv8HhxsPn1Lwz2UigBUSBN6', '0', null, '27', null, '2016-12-29 16:50:31', '2016-12-29 16:50:31', '297');
INSERT INTO `users` VALUES ('296', '0', 'wamyhtm', '加鸽', '$2a$10$.eDOborAU3WocXoHbhK9AeCe9NI/vUE8AhOZCVKWG/9ckmpp2Spo2', '0', null, '27', null, '2016-12-29 16:50:31', '2016-12-29 16:50:31', '298');
INSERT INTO `users` VALUES ('297', '0', 'tyds2mb', '徐鑫', '$2a$10$MDqGSOVcAYHm3tlcv/8h..NL4LZxyAWIsxT5aqc7Pm.WGRv4BM1Um', '0', null, '27', null, '2016-12-29 16:50:32', '2016-12-29 16:50:32', '299');
INSERT INTO `users` VALUES ('298', '0', 'tyds2web', '徐鑫', '$2a$10$fdg6xLmQ5mXuDYYlRcrVTuDxqJDT562YLpBg4xeG3iAYVy7e8GoW6', '0', null, '27', null, '2016-12-29 16:50:32', '2016-12-29 16:50:32', '300');
INSERT INTO `users` VALUES ('299', '0', 'root024', '郑伟', '$2a$10$fnz/7b2X5SuyTem1pL.HDe5X5hYUOgjyM7ZIjT8i5Oc9G/SXvTh3K', '0', null, '27', null, '2016-12-29 16:50:32', '2016-12-29 16:50:32', '301');
INSERT INTO `users` VALUES ('300', '0', 'jjcsj520', '黄朝国', '$2a$10$DqpTq.sFrPBC7FlMgX39KeyUiyKE9zeRsGEhC.Awbd9h0Noj/Usfy', '0', null, '27', null, '2016-12-29 16:50:33', '2016-12-29 16:50:33', '302');
INSERT INTO `users` VALUES ('301', '0', 'qibeibei', '祁贝贝', '$2a$10$n0LFn36yYfCytaeQErpNa.XA2eOFBDQ9QDAp.8PaHbZhbVHUErVPS', '0', null, '27', null, '2016-12-29 16:50:33', '2016-12-29 16:50:33', '303');
INSERT INTO `users` VALUES ('302', '0', 'netbarhf', '何峰', '$2a$10$udDEi9k4jE3kNDbcr/jx/eNMpfuceqOGHP5TOsdjT/61oacwG85fW', '0', null, '27', null, '2016-12-29 16:50:33', '2016-12-29 16:50:33', '304');
INSERT INTO `users` VALUES ('303', '0', 'svchosts', '宋先义', '$2a$10$QP1p09FarEllMj/rH1pGyegfVJZn2LYLhPgCN5KmmH47nFznJ3o2i', '0', null, '27', null, '2016-12-29 16:50:34', '2016-12-29 16:50:34', '305');
INSERT INTO `users` VALUES ('304', '0', '380282979', '试试看', '$2a$10$0hu8EEEmgL41PGWbF6Q10OZIRaces06TFMyVoZRlnloyhbI2.VWj2', '0', null, '27', null, '2016-12-29 16:50:34', '2016-12-29 16:50:34', '306');
INSERT INTO `users` VALUES ('305', '0', 'zytsww', '罗林', '$2a$10$52cDRh7lPu.fTJf7L1cGVO8LdZm3sjiuunvco5SMHDWFf2mTRDwAK', '0', null, '27', null, '2016-12-29 16:50:34', '2016-12-29 16:50:34', '307');
INSERT INTO `users` VALUES ('306', '0', 'peiliqin', '裴建华', '$2a$10$EPsoCIXu.J.BXhC6rG4jvObYGiuHPRBzC/mrO.IjiB1m3Q0WgEfLW', '0', null, '27', null, '2016-12-29 16:50:35', '2016-12-29 16:50:35', '308');
INSERT INTO `users` VALUES ('307', '0', 'yang90081', '杨先生', '$2a$10$cdHwTpvenY.5q1wj/T7NNuHfKTchte7onXFo1mdIGcSDQeA8UEWCW', '0', null, '27', null, '2016-12-29 16:50:35', '2016-12-29 16:50:35', '309');
INSERT INTO `users` VALUES ('308', '0', 'makliu', '刘刚', '$2a$10$WHi5VKiqXHK.3FTCDXN5nupCiUXkLqIpC90xXKrAFqo6Sd1hcWDX.', '0', null, '27', null, '2016-12-29 16:50:35', '2016-12-29 16:50:35', '310');
INSERT INTO `users` VALUES ('309', '0', 'kaixin995', '盛涛', '$2a$10$ZhZjggCoMzRXXstLAfGQ3.r/y4u2I32gLngnHIdfhUJOSY/20Y5ri', '0', null, '27', null, '2016-12-29 16:50:36', '2016-12-29 16:50:36', '311');
INSERT INTO `users` VALUES ('310', '0', 'kaneboy', '牛阳', '$2a$10$MlxA8SigPUh9ZL7vsvYKEODyg8Qg8amJeMmYeb61ZR9j/pKik4X56', '0', null, '27', null, '2016-12-29 16:50:36', '2016-12-29 16:50:36', '312');
INSERT INTO `users` VALUES ('311', '0', 'angels', '艾兵根', '$2a$10$/oU2kEV2BTF7JN7VvX7IhO4h0FADl0KaY4r20AEOS1inFJGWfgQXi', '0', null, '27', null, '2016-12-29 16:50:37', '2016-12-29 16:50:37', '313');
INSERT INTO `users` VALUES ('312', '0', 'xuaiguo86', '许爱国', '$2a$10$KoiP4W/A3gqTdKroOcy12umR/1jeqU7tig5ppuDEbMzwTNgtZFioS', '0', null, '27', null, '2016-12-29 16:50:37', '2016-12-29 16:50:37', '314');
INSERT INTO `users` VALUES ('313', '0', 'kingpeng6', '张玲玲', '$2a$10$QUX4QZsr/DrPGIP.0ECNzuxsQ9X/1TQa23ARMPYUf/YD6s22kDHui', '0', null, '27', null, '2016-12-29 16:50:37', '2016-12-29 16:50:37', '315');
INSERT INTO `users` VALUES ('314', '0', 'dtsoft', '符劲松', '$2a$10$n85MntPtqs0ModZixZXnoug6EKforL.QpesR9HNPVJRTjsb5XAOvS', '0', null, '27', null, '2016-12-29 16:50:38', '2016-12-29 16:50:38', '316');
INSERT INTO `users` VALUES ('315', '0', 'gaonan', '周妮', '$2a$10$9PEcijRF9jC0HejNcZgPJO79uD2b8oIFmxQT.s7UXxzwHNP/sKR3O', '0', null, '27', null, '2016-12-29 16:50:38', '2016-12-29 16:50:38', '317');
INSERT INTO `users` VALUES ('316', '0', '8233000jz', '潘凯', '$2a$10$ya21yp21f8rJpnsxnRf8J.sNq9X1tan8yNYH89gZoeMDbDmlFsba6', '0', null, '27', null, '2016-12-29 16:50:38', '2016-12-29 16:50:38', '318');
INSERT INTO `users` VALUES ('317', '0', 'yidoedo', '张艳', '$2a$10$benhYUUcy/JsGnbDnY5/Muq5ebxrnTqAmTRMEjaWXWrrEc4UReoBO', '0', null, '27', null, '2016-12-29 16:50:39', '2016-12-29 16:50:39', '319');
INSERT INTO `users` VALUES ('318', '0', 'wskoman', '何为', '$2a$10$tA20qaumVOCjsklj1QDTvuren7KcQUH/0N.rWIsq799HYz1XSoivK', '0', null, '27', null, '2016-12-29 16:50:39', '2016-12-29 16:50:39', '320');
INSERT INTO `users` VALUES ('319', '0', 'gsjywl', '李强', '$2a$10$99WIGGpCvSYUF/EojrYkleBTKu/eqR/9FMSV/u1HEMBpdIUv5rX9W', '0', null, '27', null, '2016-12-29 16:50:39', '2016-12-29 16:50:39', '321');
INSERT INTO `users` VALUES ('320', '0', 'sfxx315', '郭磊', '$2a$10$nnzdFmxi7ke9AzGuDFFI0OiIHejslS4.89clVuK9kjmzqu4wWp5oG', '0', null, '27', null, '2016-12-29 16:50:40', '2016-12-29 16:50:40', '322');
INSERT INTO `users` VALUES ('321', '0', 'immapeng', '马军', '$2a$10$bnaI2OVTZG1ifMTe2vnnP.8g1BDnBVqbV4DWjYb6ojDCYonTSgh3i', '0', null, '27', null, '2016-12-29 16:50:40', '2016-12-29 16:50:40', '323');
INSERT INTO `users` VALUES ('322', '0', 'index5188', '吴宁宁', '$2a$10$E9GwPJpYebLa5INhds2zqObYcKxyRlSIyEM2KLPhJ9sAn8U9UQfbi', '0', null, '27', null, '2016-12-29 16:50:40', '2016-12-29 16:50:40', '324');
INSERT INTO `users` VALUES ('323', '0', 'pubwin', '袁贵晓', '$2a$10$ly8U9J0BHkWj6NW38Oc0puv3fu2Pw6R5pt.HCtoYc70/xqs8fZsXS', '0', null, '27', null, '2016-12-29 16:50:41', '2016-12-29 16:50:41', '325');
INSERT INTO `users` VALUES ('324', '0', 'hu8321821', '胡晋', '$2a$10$1P.hAmOB0K8sVHuBcUGuUOFJB/iCRuCSRCNRsX.x2PgpssHtB5Xxm', '0', null, '27', null, '2016-12-29 16:50:41', '2016-12-29 16:50:41', '326');
INSERT INTO `users` VALUES ('325', '0', 'foaju', '柯广才', '$2a$10$4hSWIznqbOTKLs0Y1oXQdeEdZh1j3E/shMozwUqJ.HAqzEYhG2nbu', '0', null, '27', null, '2016-12-29 16:50:41', '2016-12-29 16:50:41', '327');
INSERT INTO `users` VALUES ('326', '0', 'slxy0914', '李杰', '$2a$10$jMBFhMWxGRzRO1Yx9WRAaeqKTPRQkpLA5KlBtS1HG/BJPg3V/WAJm', '0', null, '27', null, '2016-12-29 16:50:42', '2016-12-29 16:50:42', '328');
INSERT INTO `users` VALUES ('327', '0', '122209787', '太雪波', '$2a$10$jUN7lXoe2p..SYN/sTOnduOm7IU2f2hpcCgKqGp/9HwzJMQZTWMMm', '0', null, '27', null, '2016-12-29 16:50:42', '2016-12-29 16:50:42', '329');
INSERT INTO `users` VALUES ('328', '0', 'taixuebo', '太雪波', '$2a$10$ppGbHgfmQ8RZdBIMxt8J.uFeZ5Sutj/MfvZ1k5s9u5oroF0/Sa.Iu', '0', null, '27', null, '2016-12-29 16:50:42', '2016-12-29 16:50:42', '330');
INSERT INTO `users` VALUES ('329', '0', 'zmzy1', '周明', '$2a$10$ywCvMMQRk/FxspX9WW3EUeuDn8BD1L2l9kSvl7IGR8Y/r6Tn3EDUS', '0', null, '27', null, '2016-12-29 16:50:43', '2016-12-29 16:50:43', '331');
INSERT INTO `users` VALUES ('330', '0', 'law1020', '袁健', '$2a$10$aU92PkaJ8G4USXIY6OC8ruoN3W8iqIYTery9mOvgAGR54gzzTdn/u', '0', null, '27', null, '2016-12-29 16:50:43', '2016-12-29 16:50:43', '332');
INSERT INTO `users` VALUES ('331', '0', 'zhangbin1', '张彬', '$2a$10$fF35hr8hhF7oqIjWtfgYcuCo7D3DRNUF0xQM6XEBmg9/hnUPu212e', '0', null, '27', null, '2016-12-29 16:50:43', '2016-12-29 16:50:43', '333');
INSERT INTO `users` VALUES ('332', '0', '287398456', '王玉石', '$2a$10$suXaBVOOV9btx8pqgJOTAOSFa.iBMH5x.g74vvKZpqiBNvoEG8OX.', '0', null, '27', null, '2016-12-29 16:50:44', '2016-12-29 16:50:44', '334');
INSERT INTO `users` VALUES ('333', '0', 'ynsno8', '杨俊', '$2a$10$WiDlr9/bUEfzFFqkBfnAiOJdp7r6zqed6oPdaY4/XQs47n9LKejGO', '0', null, '27', null, '2016-12-29 16:50:44', '2016-12-29 16:50:44', '335');
INSERT INTO `users` VALUES ('334', '0', 'aytgd', '田国栋', '$2a$10$H6SwxhfWNUzz91nKCsnIW.Dmsm1QuZlAVHlebZLkv3ZhSsPkNiQDG', '0', null, '27', null, '2016-12-29 16:50:45', '2016-12-29 16:50:45', '336');
INSERT INTO `users` VALUES ('335', '0', 'ncbaidu', '黄平平', '$2a$10$vsH7oDFnHLTs4yznvl7tH.ZqQmKa4VKILYRfabpJUVt7L6Hy7WINq', '0', null, '27', null, '2016-12-29 16:50:45', '2016-12-29 16:50:45', '337');
INSERT INTO `users` VALUES ('336', '0', 'soto2016', '李晓伟', '$2a$10$F1IZJJeZi.gt2ZhePNyLlO8ePG7axXwHHQgnVCNx6aKZv9wDV3eDW', '0', null, '27', null, '2016-12-29 16:50:45', '2016-12-29 16:50:45', '338');
INSERT INTO `users` VALUES ('337', '0', 'yyleygg', '尹光', '$2a$10$CgkCRG56RglT7JKb4I9hEePUnZ/R48lSi.b4MpmYYZk728W7RuUWi', '0', null, '27', null, '2016-12-29 16:50:46', '2016-12-29 16:50:46', '339');
INSERT INTO `users` VALUES ('338', '0', 'h2oxp', '赵冬雪', '$2a$10$yMRx20IBFDJf4RzwIDpzY.oRJcOgW3zobNguBCX/MdKGGkqBaKWvi', '0', null, '27', null, '2016-12-29 16:50:46', '2016-12-29 16:50:46', '340');
INSERT INTO `users` VALUES ('339', '0', 'seerain', '张欣', '$2a$10$tgapW6Q8jiWOS0WfvjQTDOECuFAN7uHMKzwYdbRhFWSaoRye0.CRG', '0', null, '27', null, '2016-12-29 16:50:46', '2016-12-29 16:50:46', '341');
INSERT INTO `users` VALUES ('340', '0', 'zhonglian', '王保录', '$2a$10$dUO1j7FiovfmST/4zDJ5xOetDfDKRTcpvLBT.KornMCq4qzG146k2', '0', null, '27', null, '2016-12-29 16:50:47', '2016-12-29 16:50:47', '342');
INSERT INTO `users` VALUES ('341', '0', 'xy123', '张一鸣', '$2a$10$FVVEDczELM5agm1oOKVr5OfkxzRqrAz2sWQFeeQL8xLDGJ8O79FF2', '0', null, '27', null, '2016-12-29 16:50:47', '2016-12-29 16:50:47', '343');
INSERT INTO `users` VALUES ('342', '0', 'wiwishi01', '田山峰', '$2a$10$KjBWKf1X5/0PyHOjNVWVMOTPGqMkj51uBudoNYcQulySghemxPNf6', '0', null, '27', null, '2016-12-29 16:50:47', '2016-12-29 16:50:47', '344');
INSERT INTO `users` VALUES ('343', '0', 'wiwishi02', '田山峰', '$2a$10$d5fOFJGm1cZ4rbKItviiLe9uaYcx61oGnFEhPRgDW755ErbKk7kAa', '0', null, '27', null, '2016-12-29 16:50:48', '2016-12-29 16:50:48', '345');
INSERT INTO `users` VALUES ('344', '0', '3105676', '吕振浩', '$2a$10$7pnhO8/tkynUqNsN5iif0eiwmwnmwjS/WBIIMpsUIY.UYE90sL.2G', '0', null, '27', null, '2016-12-29 16:50:48', '2016-12-29 16:50:48', '346');
INSERT INTO `users` VALUES ('345', '0', 'wb66601', '田山峰', '$2a$10$bFzhzbqLZQ9SPBYGh62kKeC/ocem9MzU31SJBFlWLUgYxKy8xxY5a', '0', null, '27', null, '2016-12-29 16:50:48', '2016-12-29 16:50:48', '347');
INSERT INTO `users` VALUES ('346', '0', 'wb66602', '田山峰', '$2a$10$bEmayOkcB5gnCNc9Mv1Fz.BCyYhnUVQEzWgFoeAq14u4FA88AI4ai', '0', null, '27', null, '2016-12-29 16:50:49', '2016-12-29 16:50:49', '348');
INSERT INTO `users` VALUES ('347', '0', 'hnlsww', '韩彦波', '$2a$10$0v1FylJOczTs6bNLwUKt0ejEJ4QdKQShzZ6eDXJ5Mcv4yGv8T4pLO', '0', null, '27', null, '2016-12-29 16:50:49', '2016-12-29 16:50:49', '349');
INSERT INTO `users` VALUES ('348', '0', 'chtc1982', '陈建明', '$2a$10$PLg2N0fMNoH/KQ.ulvWy9ee1A2QH2ZN1koW38dStUWtajf7OuOqBu', '0', null, '27', null, '2016-12-29 16:50:49', '2016-12-29 16:50:49', '350');
INSERT INTO `users` VALUES ('349', '0', 'yongling', '高永领', '$2a$10$dEzNIYq9PVbacCCjHpj9Aew66jDKsYOeZ.5i1f.KcyzWOnyYWUxgi', '0', null, '27', null, '2016-12-29 16:50:50', '2016-12-29 16:50:50', '351');
INSERT INTO `users` VALUES ('350', '0', 'lqtwb', '王文', '$2a$10$2tvwnsjnlUKEkvYYyeNsBulO2oG3mHL.CXVFzmSZGhX9iD1W5DPY.', '0', null, '27', null, '2016-12-29 16:50:50', '2016-12-29 16:50:50', '352');
INSERT INTO `users` VALUES ('351', '0', '751788884', '张恒才', '$2a$10$8jiQq/U9wr2t87ejn0AdgOyk5OnUm83DnFj0wMlhkqUwMOJHW0g.G', '0', null, '27', null, '2016-12-29 16:50:50', '2016-12-29 16:50:50', '353');
INSERT INTO `users` VALUES ('352', '0', 'cz365', '黄志齐', '$2a$10$sRk4RTAoc09kMJwDgP9wO.iwvE5ojw0b3Ji8Zf0vG19TU8kZ5oIV2', '0', null, '27', null, '2016-12-29 16:50:51', '2016-12-29 16:50:51', '354');
INSERT INTO `users` VALUES ('353', '0', 'jweye', '金旺', '$2a$10$l.ch2F3Hokp2db42bqDDbeKND835PAmSvBS791Qhgil/wCnWugaki', '0', null, '27', null, '2016-12-29 16:50:51', '2016-12-29 16:50:51', '355');
INSERT INTO `users` VALUES ('354', '0', '976251234', '吕振浩', '$2a$10$HzeULxtjlUZo.qe9j8dyjuf7oHuM0KZbMytI52stuVDDAwx0BvNcW', '0', null, '27', null, '2016-12-29 16:50:51', '2016-12-29 16:50:51', '356');
INSERT INTO `users` VALUES ('355', '0', 'legend', '郑程', '$2a$10$SiAWSmUnoHY8nJYMmdXlg.xjVRp32ub/lDi4bvmQyutf.OeeTy/lO', '0', null, '27', null, '2016-12-29 16:50:52', '2016-12-29 16:50:52', '357');
INSERT INTO `users` VALUES ('356', '0', 'vvvokok', '李北林', '$2a$10$Y90J8a73wzl7sInSbm4rmuXIlXo.vOUAc9reNtsKhm/X1Nl.fp0fC', '0', null, '27', null, '2016-12-29 16:50:52', '2016-12-29 16:50:52', '358');
INSERT INTO `users` VALUES ('357', '0', 'lsasss', '高海平', '$2a$10$KMV8vPz7Vwy8PiCD8LQmW.LdBCzat9c7fqEmoNjAiWTV.ZlT8FfMK', '0', null, '27', null, '2016-12-29 16:50:52', '2016-12-29 16:50:52', '359');
INSERT INTO `users` VALUES ('358', '0', 'xsjtxymsy', '徐强', '$2a$10$zh/EHdPFPOa3pPf.AmNUm.lzH6pof2ML9p.x9.jRQTMGQFzFaFFSS', '0', null, '27', null, '2016-12-29 16:50:53', '2016-12-29 16:50:53', '360');
INSERT INTO `users` VALUES ('359', '0', 'yileyoo', '高永领', '$2a$10$ctQLvIa..BEdC4bS14Yjz.E7avlYGK8iPeN.X8aaJeLK1gPaBBFdi', '0', null, '27', null, '2016-12-29 16:50:53', '2016-12-29 16:50:53', '361');
INSERT INTO `users` VALUES ('360', '0', '37134156', '张思邈', '$2a$10$8WD8PBAFNpA9y3rh/3QOae/zaJldXm6bqMhHQbBH.BPsd4QykMrN2', '0', null, '27', null, '2016-12-29 16:50:53', '2016-12-29 16:50:53', '362');
INSERT INTO `users` VALUES ('361', '0', '453529902', '苏建龙', '$2a$10$a5iOpzAs.LCWJe6NlAI2ieVa0TnSbmJgoC1DN.2fzJF.y3W2/z5y2', '0', null, '27', null, '2016-12-29 16:50:54', '2016-12-29 16:50:54', '363');
INSERT INTO `users` VALUES ('362', '0', 'qq2412008', '王小威', '$2a$10$9Ryc1YGtCf9ucCB.vTrVUe.t7cm95KjA1755iz1SDG0L/VoibMRue', '0', null, '27', null, '2016-12-29 16:50:54', '2016-12-29 16:50:54', '364');
INSERT INTO `users` VALUES ('363', '0', 'hero_lxj', '刘小军', '$2a$10$2SUqS6rZhBVRg1mKR7dHsePa6pI7F0/dE253Iy2gyIaKuoIKOJMj.', '0', null, '27', null, '2016-12-29 16:50:55', '2016-12-29 16:50:55', '365');
INSERT INTO `users` VALUES ('364', '0', 'jjcsj234', '吴鹏', '$2a$10$GkmSa7pEG0tD8alOoEsQSe9MhrR6CL7ynB84tBOdZTR8yxqiwyHpO', '0', null, '27', null, '2016-12-29 16:50:55', '2016-12-29 16:50:55', '366');
INSERT INTO `users` VALUES ('365', '0', 'chuse', '陈腾飞', '$2a$10$/nxptreRnGuXtFdZkk4umO3CaSyvCgFyfPAy/BeVexjG/j2xV6gHW', '0', null, '27', null, '2016-12-29 16:50:55', '2016-12-29 16:50:55', '367');
INSERT INTO `users` VALUES ('366', '0', 'goest', '魏鹏奇', '$2a$10$fMwXQg3XMc9EgIB69ePltO51BiOm.Zic4CVXVBp.dY4mo.PXex0w6', '0', null, '27', null, '2016-12-29 16:50:56', '2016-12-29 16:50:56', '368');
INSERT INTO `users` VALUES ('367', '0', '232155777', '魏林', '$2a$10$XCvqPLNnWuqNbDA0NjVKueoUKoybtdF.JIKtsHmkTY3IRuO2w8wHy', '0', null, '27', null, '2016-12-29 16:50:56', '2016-12-29 16:50:56', '369');
INSERT INTO `users` VALUES ('368', '0', 'wxws123', '陈树林', '$2a$10$8ZWenlpPv6wRbrnfNu.ITuhStwW9IdchOdEgvD22pHJ.cJJVL71Q2', '0', null, '27', null, '2016-12-29 16:50:56', '2016-12-29 16:50:56', '370');
INSERT INTO `users` VALUES ('369', '0', 'yz8488758', '王国峰', '$2a$10$0azIfC3EKOAB8c4lIr9Sou6zSF.nFrV/UC8LPNpOZcENdGIAvC.Wa', '0', null, '27', null, '2016-12-29 16:50:57', '2016-12-29 16:50:57', '371');
INSERT INTO `users` VALUES ('370', '0', 'boyawlkj', '刘瑞廷', '$2a$10$88UGPsIwJrHA79hylqIlhu0.ND.3QHX0QSCx/ub9U1V5G5oUZpPdW', '0', null, '27', null, '2016-12-29 16:50:57', '2016-12-29 16:50:57', '372');
INSERT INTO `users` VALUES ('371', '0', 'wjwxwl', '李永昌', '$2a$10$BbRXi8B.wZO.H7SqDf2AKOw3xKDWBV8EWEOy/iN7AMsQnT6Er5QDe', '0', null, '27', null, '2016-12-29 16:50:57', '2016-12-29 16:50:57', '373');
INSERT INTO `users` VALUES ('372', '0', 'a83655101', '朱桂练', '$2a$10$1scaukx5zEXzsfgPjsGdn.7a9p0ScLcG4z3mM/qMckeSW9OP7cK7y', '0', null, '27', null, '2016-12-29 16:50:58', '2016-12-29 16:50:58', '374');
INSERT INTO `users` VALUES ('373', '0', 'cy982998', '陈云', '$2a$10$E6jzA0Ek/sZ03xeNhoJ5a.rFmYgZHXs4ihlYXqQh3SicaH2176w86', '0', null, '27', null, '2016-12-29 16:50:58', '2016-12-29 16:50:58', '375');
INSERT INTO `users` VALUES ('374', '0', 'cdjxwt', '张洪伟', '$2a$10$xdluw3lMR1UjclJOKV8L1OKjtWR2CGgaPb4f9PFQfRHN9BkDNjTCu', '0', null, '27', null, '2016-12-29 16:50:58', '2016-12-29 16:50:58', '376');
INSERT INTO `users` VALUES ('375', '0', 'iphone9', '覃锶', '$2a$10$wqNf8Kfyf3xGX5tmJYLQiedZNvahIoAVbaXSLC00Y7P39SwVRwBkC', '0', null, '27', null, '2016-12-29 16:50:59', '2016-12-29 16:50:59', '377');
INSERT INTO `users` VALUES ('376', '0', '134045566', '张楠', '$2a$10$0VT1NDjVIi4pntgBaI6awemdsRIylBkpG7ATKU5afzoGJcQwl8lJK', '0', null, '27', null, '2016-12-29 16:50:59', '2016-12-29 16:50:59', '378');
INSERT INTO `users` VALUES ('377', '0', 'yujie', '余杰', '$2a$10$gFr3/CLh2myyIjThEq.LNuoEHqlk7IWxaR923cnxRCETBtxknhdCu', '0', null, '27', null, '2016-12-29 16:50:59', '2016-12-29 16:50:59', '379');
INSERT INTO `users` VALUES ('378', '0', '68269123', '卜海洋', '$2a$10$jTXoyKbmnIplI8Vrb1/k0.uOWdGDBnBcml9y/4eYjZBniQu0XnzaG', '0', null, '27', null, '2016-12-29 16:51:00', '2016-12-29 16:51:00', '380');
INSERT INTO `users` VALUES ('379', '0', '1993aotu', '高勇', '$2a$10$soxwj4TwDJFnXDmtgEhjLeOxA82FpvMLjkVwzn51sxtIAS2Ypm/sm', '0', null, '27', null, '2016-12-29 16:51:00', '2016-12-29 16:51:00', '381');
INSERT INTO `users` VALUES ('380', '0', 'bishan', '宋亚红', '$2a$10$kaXLR7uKtBeD28sZKXFFq.Bqf25VKr.U.9.u27lBCtPFbmyqOU2H.', '0', null, '27', null, '2016-12-29 16:51:00', '2016-12-29 16:51:00', '382');
INSERT INTO `users` VALUES ('381', '0', 'zhuxuemin', '朱学民', '$2a$10$SxJUJ5pbDCECv01WqF9JfeThMr8lHHCeZGeNqDxWPSoM9MoY6wL2W', '0', null, '27', null, '2016-12-29 16:51:01', '2016-12-29 16:51:01', '383');
INSERT INTO `users` VALUES ('382', '0', 'ljgaids', '冷晋光', '$2a$10$KvD.ZT7VM4CqV2lje7RE5uyVXcFf17RDV3RP7xRa5rlJJx0ZB8IRS', '0', null, '27', null, '2016-12-29 16:51:01', '2016-12-29 16:51:01', '384');
INSERT INTO `users` VALUES ('383', '0', 'szdbc', '余杰', '$2a$10$pITIr1td.ivjdIzx8VAhaOZYFBKXbPw5hryy0MIR1t8ZQbBXl2HJi', '0', null, '27', null, '2016-12-29 16:51:01', '2016-12-29 16:51:01', '385');
INSERT INTO `users` VALUES ('384', '0', 'linjj1020', '林俊佳', '$2a$10$qiJKdW7/yecsKR6N53ix1eGx4duUV//Iiv.nTGpAAk5gKjDd4SrJO', '0', null, '27', null, '2016-12-29 16:51:02', '2016-12-29 16:51:02', '386');
INSERT INTO `users` VALUES ('385', '0', 'npjwmy', '马汉英', '$2a$10$52v.t9fF09k60hOgI8PbD.lzDlnURFfUU1tynCWhbjR3ffjZ3jYVy', '0', null, '27', null, '2016-12-29 16:51:02', '2016-12-29 16:51:02', '387');
INSERT INTO `users` VALUES ('386', '0', 'jxwblm', '陈飞', '$2a$10$y.hDnVJ4AqtD4fvZSx3pZ.7vQ5i9snhHiqiDisG8Mb9IfkIdcwz86', '0', null, '27', null, '2016-12-29 16:51:02', '2016-12-29 16:51:02', '388');
INSERT INTO `users` VALUES ('387', '0', 'zhangmin9', '张敏', '$2a$10$mD554tzT8L7dYTTXFOyne.x0wvZ9GIczurniFXTSYIfCBstKhRAwa', '0', null, '27', null, '2016-12-29 16:51:03', '2016-12-29 16:51:03', '389');
INSERT INTO `users` VALUES ('388', '0', 'icafe1', '肖楠', '$2a$10$lMpJW6bQConI2jOZKxaJcu63HEJJ3TLBZMUgm4Bl4Lau6rDy2yT2.', '0', null, '27', null, '2016-12-29 16:51:03', '2016-12-29 16:51:03', '390');
INSERT INTO `users` VALUES ('389', '0', 'stars', '黄敏辉', '$2a$10$vHB17IFoXBphQPbO3pU2LOuur/UZDmSXJfpCvQC2iKKuDbA8tUAJi', '0', null, '27', null, '2016-12-29 16:51:03', '2016-12-29 16:51:03', '391');
INSERT INTO `users` VALUES ('390', '0', 'lbzhangya', '张洋', '$2a$10$TVfrZJHqoP0RG9kUQczxeedV9HsO7WWmaHTJlQWKrM2Uip3ssHM/G', '0', null, '27', null, '2016-12-29 16:51:04', '2016-12-29 16:51:04', '392');
INSERT INTO `users` VALUES ('391', '0', 'gb2311', '冯肖良', '$2a$10$vW/kfUxcSSkp4y3vQwIVmewgvL8D/bvd0jSmVE/amhZ25AFD23axa', '0', null, '27', null, '2016-12-29 16:51:04', '2016-12-29 16:51:04', '393');
INSERT INTO `users` VALUES ('392', '0', 'aqjlww', '罗传胜', '$2a$10$g6XpYyD6E2RENjOJ51dNfOqwXkF2gO0RvmIg/0YLH4F7UHIG2lvxm', '0', null, '27', null, '2016-12-29 16:51:04', '2016-12-29 16:51:04', '394');
INSERT INTO `users` VALUES ('393', '0', 'za121212', '林云鹏', '$2a$10$45btMoLUkXc/up9h0YebA.y5.e6glcMg3jrLrrPrAjnoyA6xgjuOO', '0', null, '27', null, '2016-12-29 16:51:05', '2016-12-29 16:51:05', '395');
INSERT INTO `users` VALUES ('394', '0', 'wuhaokb', '武浩', '$2a$10$hnv6o8jk2wFz25cPLXvKxe1pK/X0beCMJsbPXz/dPgOPGlktIUNi6', '0', null, '27', null, '2016-12-29 16:51:05', '2016-12-29 16:51:05', '396');
INSERT INTO `users` VALUES ('395', '0', 'sxwbwh', '田小领', '$2a$10$hrooxWZeEKP.MkAYdG1UcuqXjnNJMx7ss.cU4wrTG3jlu0AdxPf6e', '0', null, '27', null, '2016-12-29 16:51:05', '2016-12-29 16:51:05', '397');
INSERT INTO `users` VALUES ('396', '0', '31518253', '王卫平', '$2a$10$Gs2cLDJZBHm147V8B9ADDOiNgWyI7mG0cgUwcwXWRl66NzMnAImbW', '0', null, '27', null, '2016-12-29 16:51:06', '2016-12-29 16:51:06', '398');
INSERT INTO `users` VALUES ('397', '0', 'gzxswl', '陈银雷', '$2a$10$V95pIcnxHWcZRAFfC4pYiejq6TG5QGmICYY3PPdBUHktX.74KiogO', '0', null, '27', null, '2016-12-29 16:51:06', '2016-12-29 16:51:06', '399');
INSERT INTO `users` VALUES ('398', '0', '38711054', '郭江', '$2a$10$48r.d0.FPe3ZjM2/GpOqGuyLIBCW1KQykfzCdWFxdjOUXhCp/I0se', '0', null, '27', null, '2016-12-29 16:51:07', '2016-12-29 16:51:07', '400');
INSERT INTO `users` VALUES ('399', '0', 'msxta', '吴德旺', '$2a$10$epMoaeXO58T3sFtJ3eusPOLK5rrbnOn9ow43yHK3XOuvby5bRTCyS', '0', null, '27', null, '2016-12-29 16:51:07', '2016-12-29 16:51:07', '401');

-- ----------------------------
-- Table structure for user_data
-- ----------------------------
DROP TABLE IF EXISTS `user_data`;
CREATE TABLE `user_data` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `wip` int(20) DEFAULT NULL,
  `mac` int(20) DEFAULT NULL,
  `ope` int(20) DEFAULT NULL,
  `user_id` int(20) NOT NULL,
  `ad_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `data_ad_id` (`ad_id`),
  KEY `data_user_id` (`user_id`),
  CONSTRAINT `data_ad_id` FOREIGN KEY (`ad_id`) REFERENCES `advers` (`id`),
  CONSTRAINT `data_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_data
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `bank_card` varchar(40) DEFAULT NULL,
  `bank_address` varchar(40) DEFAULT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `money_usable` double(20,0) DEFAULT NULL,
  `money_unusable` double(20,0) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('20', '18092536750', '59584028', '', '', '支付宝', '', '', '', '0', '0', '2016-12-27 13:36:20', '2016-12-27 13:36:20');
INSERT INTO `user_info` VALUES ('21', '18092170828', '2851536525', '', '', '农业银行', '', '', '', '0', '0', '2016-12-27 13:36:21', '2016-12-27 13:36:21');
INSERT INTO `user_info` VALUES ('22', '18182421361', '2850433747', '', '', '支付宝', '', '', '张吉梁', '0', '0', '2016-12-27 13:36:21', '2016-12-27 13:36:21');
INSERT INTO `user_info` VALUES ('23', '18691610000', '42541547', '', '', '农业银行', '', '', '', '0', '0', '2016-12-27 13:36:22', '2016-12-27 13:36:22');
INSERT INTO `user_info` VALUES ('24', '0', '0', '', '', '支付宝', '0', '0', '0', '0', '0', '2016-12-27 13:36:22', '2016-12-27 13:36:22');
INSERT INTO `user_info` VALUES ('25', '18182421361', '676251363', '676251363@qq.com', '', '农业银行', '', '', '', '0', '0', '2016-12-27 14:34:19', '2016-12-27 14:34:19');
INSERT INTO `user_info` VALUES ('26', '18291876121', '447438102', '', '', '工商银行', '6212263700006531042', '西安市莲湖区', '', '0', '0', '2016-12-27 18:00:35', '2016-12-27 18:00:35');
INSERT INTO `user_info` VALUES ('27', '13571948171', '3924260', '', '', '工商银行', '6222083700004869201', '西安工行雁塔路支行', '苗勇杰', '0', '0', '2016-12-27 18:00:36', '2016-12-27 18:00:36');
INSERT INTO `user_info` VALUES ('28', '18009186651', '804054184', '', '', '支付宝', '18629312573', '空', '朱申位', '0', '0', '2016-12-27 18:00:36', '2016-12-27 18:00:36');
INSERT INTO `user_info` VALUES ('29', '18049636769', '2892589867', '', '', '支付宝', '4554564231', '空', '李艳妮', '0', '0', '2016-12-27 18:00:36', '2016-12-27 18:00:36');
INSERT INTO `user_info` VALUES ('30', '18971188663', '348799502', '', '', '招商银行', '6225 8827 1109 7573', '', '蔡艳琼', '0', '0', '2016-12-27 18:00:37', '2016-12-27 18:00:37');
INSERT INTO `user_info` VALUES ('31', '18691610000', '2851536522', '', '', '支付宝', 'wzashun@126.com', '', '吴连顺', '0', '0', '2016-12-27 18:00:37', '2016-12-27 18:00:37');
INSERT INTO `user_info` VALUES ('32', '18845679995', '5376377', '', '', '工商银行', '621559  0913  000 929487', '', '刘昕', '0', '0', '2016-12-27 18:00:38', '2016-12-27 18:00:38');
INSERT INTO `user_info` VALUES ('33', '18392357857', '1652488204', '', '', '中国银行', '6216603600000978902', '高新支行', '薛雪峰', '0', '0', '2016-12-27 18:00:38', '2016-12-27 18:00:38');
INSERT INTO `user_info` VALUES ('34', '', '', '', '', '', '', '', '', '0', '0', '2016-12-27 18:00:38', '2016-12-27 18:00:38');
INSERT INTO `user_info` VALUES ('35', '18971188663', '348799502', '', '', '农业银行', '', '', '', '0', '0', '2016-12-27 18:00:39', '2016-12-27 18:00:39');
INSERT INTO `user_info` VALUES ('36', '18991833443', '1873611501', '', '', '农业银行', '6228480211202731611', '西安市东木头市分行', '耶倩', '0', '0', '2016-12-27 18:00:39', '2016-12-27 18:00:39');
INSERT INTO `user_info` VALUES ('37', '', '', '', '', '', '', '', '', '0', '0', '2016-12-27 18:00:40', '2016-12-27 18:00:40');
INSERT INTO `user_info` VALUES ('38', '18092976408', '420153655', '', '', '招商银行', '6225882904500276', '', '王伟', '0', '0', '2016-12-29 16:48:48', '2016-12-29 16:48:48');
INSERT INTO `user_info` VALUES ('39', '18933989211', '318701028', '', '', '支付宝', 'gabbyman@163.com', '空', '吴绍楷', '0', '0', '2016-12-29 16:48:49', '2016-12-29 16:48:49');
INSERT INTO `user_info` VALUES ('40', '13970318118', '64459363', '', '', '工商银行', '6222021512002049529', '江西省上饶县工行支行营业部', '李剑平', '0', '0', '2016-12-29 16:48:49', '2016-12-29 16:48:49');
INSERT INTO `user_info` VALUES ('41', '18833252233', '972821700', '', '', '支付宝', '6222800148511007503', '空', '孙向伟', '0', '0', '2016-12-29 16:48:49', '2016-12-29 16:48:49');
INSERT INTO `user_info` VALUES ('42', '13140071592', '59993330', '', '', '支付宝', 'qilinhai@qq.com', '空', '戚林海', '0', '0', '2016-12-29 16:48:50', '2016-12-29 16:48:50');
INSERT INTO `user_info` VALUES ('43', '15879208437', '83019850', '', '', '工商银行', '6222021507000107089', '空', '范玉林', '0', '0', '2016-12-29 16:48:50', '2016-12-29 16:48:50');
INSERT INTO `user_info` VALUES ('44', '15067868089', '20754727', '', '', '工商银行', '6222021203025087387', '中国工商银行瑞安市支行兴隆分理处', '吴小炜', '0', '0', '2016-12-29 16:48:50', '2016-12-29 16:48:50');
INSERT INTO `user_info` VALUES ('45', '13835120715', '20175646', '', '', '支付宝', '20175646@qq.com', '空', '姜华', '0', '0', '2016-12-29 16:48:51', '2016-12-29 16:48:51');
INSERT INTO `user_info` VALUES ('46', '18093855699', '5092131', '', '', '工商银行', '6222082706000259397', '解放路支行', '刘精斌', '0', '0', '2016-12-29 16:48:51', '2016-12-29 16:48:51');
INSERT INTO `user_info` VALUES ('47', '18996685388', '308546387', '', '', '中国银行', '6013823200037199245', '空', '陈良珊', '0', '0', '2016-12-29 16:48:51', '2016-12-29 16:48:51');
INSERT INTO `user_info` VALUES ('48', '13319819565', '172367777', '', '', '工商银行', '6222083002005028832', '新疆解放路', '廖玉龙', '0', '0', '2016-12-29 16:48:52', '2016-12-29 16:48:52');
INSERT INTO `user_info` VALUES ('49', '13673602045', '6490170', '', '', '建设银行', '6227002556480286311', '空', '李帅都', '0', '0', '2016-12-29 16:48:52', '2016-12-29 16:48:52');
INSERT INTO `user_info` VALUES ('50', '13338208301', '342887017', '', '', '支付宝', '342887017@qq.com', '空', '林为桃', '0', '0', '2016-12-29 16:48:52', '2016-12-29 16:48:52');
INSERT INTO `user_info` VALUES ('51', '18992527321', '359076747', '', '', '工商银行', '6222022607000062430', '汉滨区巴山东路支行', '狄虎', '0', '0', '2016-12-29 16:48:53', '2016-12-29 16:48:53');
INSERT INTO `user_info` VALUES ('52', '15505304599', '82623956', '', '', '支付宝', 'wangxuetong2006@126.com', '空', '王学同', '0', '0', '2016-12-29 16:48:53', '2016-12-29 16:48:53');
INSERT INTO `user_info` VALUES ('53', '13709780616', '372868779', '', '', '农业银行', '6228481948088678072', '青海省西宁市城西区胜利路支行', '谈晓龙', '0', '0', '2016-12-29 16:48:53', '2016-12-29 16:48:53');
INSERT INTO `user_info` VALUES ('54', '15592716970', '76145576', '', '', '支付宝', 'wsawell@qq.com', '空', '王柯涵', '0', '0', '2016-12-29 16:48:54', '2016-12-29 16:48:54');
INSERT INTO `user_info` VALUES ('55', '18974046444', '984658223', '', '', '工商银行', '6222021907005539015', '空', '蒋祖意', '0', '0', '2016-12-29 16:48:54', '2016-12-29 16:48:54');
INSERT INTO `user_info` VALUES ('56', '13850412782', '651396889', '', '', '支付宝', '13850412782', '空', '王佳俊', '0', '0', '2016-12-29 16:48:54', '2016-12-29 16:48:54');
INSERT INTO `user_info` VALUES ('57', '18069835021', '335302011', '', '', '支付宝', '15058141352@qq.com', '空', '陈帮培', '0', '0', '2016-12-29 16:48:55', '2016-12-29 16:48:55');
INSERT INTO `user_info` VALUES ('58', '13762875071', '635831595', '', '', '支付宝', '635831595@qq.com', '空', '向书玖', '0', '0', '2016-12-29 16:48:55', '2016-12-29 16:48:55');
INSERT INTO `user_info` VALUES ('59', '15160753555', '506133', '', '', '支付宝', 'bsjd120@163.com', '空', '吴文权', '0', '0', '2016-12-29 16:48:55', '2016-12-29 16:48:55');
INSERT INTO `user_info` VALUES ('60', '18902348560', '85353512', '', '', '支付宝', 'yes889@21cn.com', '空', '江海', '0', '0', '2016-12-29 16:48:56', '2016-12-29 16:48:56');
INSERT INTO `user_info` VALUES ('61', '13823968886', '276499452', '', '', '支付宝', 'goldfishlen@hotmail.com', '空', '黄嘉俊', '0', '0', '2016-12-29 16:48:56', '2016-12-29 16:48:56');
INSERT INTO `user_info` VALUES ('62', '15515359374', '790196598', '', '', '支付宝', 'lyp765630@163.com', '空', '郭徽', '0', '0', '2016-12-29 16:48:56', '2016-12-29 16:48:56');
INSERT INTO `user_info` VALUES ('63', '13625179833', '314509968', '', '', '支付宝', 'xxxx365@gmail.com', '空', '孙长龙', '0', '0', '2016-12-29 16:48:57', '2016-12-29 16:48:57');
INSERT INTO `user_info` VALUES ('64', '18972271501', '510422702', '', '', '支付宝', 'nihuaojin53@tom.com', '空', '金华伟', '0', '0', '2016-12-29 16:48:57', '2016-12-29 16:48:57');
INSERT INTO `user_info` VALUES ('65', '18926712321', '799934043', '', '', '邮政储蓄', '622185923003500674', '广东省茂名市电白县', '张日芳', '0', '0', '2016-12-29 16:48:57', '2016-12-29 16:48:57');
INSERT INTO `user_info` VALUES ('66', '13925680189', '94797248', '', '', '支付宝', 'dan94797248@163.com', '空', '黄晓丹', '0', '0', '2016-12-29 16:48:58', '2016-12-29 16:48:58');
INSERT INTO `user_info` VALUES ('67', '18648944984', '292300484', '', '', '支付宝', '03032023@163.com', '空', '张世斌', '0', '0', '2016-12-29 16:48:58', '2016-12-29 16:48:58');
INSERT INTO `user_info` VALUES ('68', '13939852569', '289402599', '', '', '建设银行', '6217002540000427515', '河南省三门峡市渑池县', '韩朝峰', '0', '0', '2016-12-29 16:48:59', '2016-12-29 16:48:59');
INSERT INTO `user_info` VALUES ('69', '18666998105', '81717929', '', '', '支付宝', 'xymc@zhntwb.com', '空', '陈海荣', '0', '0', '2016-12-29 16:48:59', '2016-12-29 16:48:59');
INSERT INTO `user_info` VALUES ('70', '15990210324', '188625995', '', '', '支付宝', 'bingxiang618@126.com', '空', '袁东操', '0', '0', '2016-12-29 16:48:59', '2016-12-29 16:48:59');
INSERT INTO `user_info` VALUES ('71', '13258047612', '894856569', '', '', '支付宝', '13258047612', '空', '尚旋旋', '0', '0', '2016-12-29 16:49:00', '2016-12-29 16:49:00');
INSERT INTO `user_info` VALUES ('72', '14730305300', '454957566', '', '', '支付宝', 'lixiaofeng1027@sina.com', '空', '李晓锋', '0', '0', '2016-12-29 16:49:00', '2016-12-29 16:49:00');
INSERT INTO `user_info` VALUES ('73', '18736080321', '382304621', '', '', '支付宝', '18736080321', '空', '马佳', '0', '0', '2016-12-29 16:49:00', '2016-12-29 16:49:00');
INSERT INTO `user_info` VALUES ('74', '15320229732', '737146150', '', '', '农业银行', '6225758325165032', '空', '杨奉红', '0', '0', '2016-12-29 16:49:01', '2016-12-29 16:49:01');
INSERT INTO `user_info` VALUES ('75', '15921502867', '444327905', '', '', '建设银行', '6217001210020565535', '上海市五莲路支行', '李俊', '0', '0', '2016-12-29 16:49:01', '2016-12-29 16:49:01');
INSERT INTO `user_info` VALUES ('76', '15993099450', '149603952', '', '', '支付宝', '15993099450', '空', '贺占亮', '0', '0', '2016-12-29 16:49:01', '2016-12-29 16:49:01');
INSERT INTO `user_info` VALUES ('77', '17783130763', '963929145', '', '', '支付宝', '17783130763', '空', '杨泷', '0', '0', '2016-12-29 16:49:02', '2016-12-29 16:49:02');
INSERT INTO `user_info` VALUES ('78', '17783130763', '963929145', '', '', '支付宝', '17783130763', '空', '杨泷3', '0', '0', '2016-12-29 16:49:02', '2016-12-29 16:49:02');
INSERT INTO `user_info` VALUES ('79', '18931117787', '584250550', '', '', '支付宝', '584250550@qq.com', '空', '肖红春', '0', '0', '2016-12-29 16:49:14', '2016-12-29 16:49:14');
INSERT INTO `user_info` VALUES ('80', '13780117054', '1239684794', '', '', '支付宝', '1239684794@qq.com', '空', '吴乐华', '0', '0', '2016-12-29 16:49:14', '2016-12-29 16:49:14');
INSERT INTO `user_info` VALUES ('81', '13622233124', '541531897', '', '', '农业银行', '6228480088493257476', '空', '吴觉', '0', '0', '2016-12-29 16:49:15', '2016-12-29 16:49:15');
INSERT INTO `user_info` VALUES ('82', '18672328792', '417733523', '', '', '支付宝', '18672328792', '空', '张龙', '0', '0', '2016-12-29 16:49:15', '2016-12-29 16:49:15');
INSERT INTO `user_info` VALUES ('83', '13098681791', '974308884', '', '', '支付宝', '974308884@qq.com', '空', '陈涛', '0', '0', '2016-12-29 16:49:16', '2016-12-29 16:49:16');
INSERT INTO `user_info` VALUES ('84', '18716826360', '506072237', '', '', '支付宝', '541013082@qq.com', '空', '石志鹏', '0', '0', '2016-12-29 16:49:16', '2016-12-29 16:49:16');
INSERT INTO `user_info` VALUES ('85', '18805602586', '522766010', '', '', '支付宝', 'mr.yuyanwei@hotmail.com', '空', '林学威', '0', '0', '2016-12-29 16:49:16', '2016-12-29 16:49:16');
INSERT INTO `user_info` VALUES ('86', '17775827377', '409903420', '', '', '建设银行', '6227002920620274332', '空', '谭涛涛', '0', '0', '2016-12-29 16:49:17', '2016-12-29 16:49:17');
INSERT INTO `user_info` VALUES ('87', '13939228286', '1079322581', '', '', '支付宝', '13939228286', '空', '郭振彪', '0', '0', '2016-12-29 16:49:17', '2016-12-29 16:49:17');
INSERT INTO `user_info` VALUES ('88', '18672340669', '104567684', '', '', '支付宝', '18672340669', '空', '翟玮刚', '0', '0', '2016-12-29 16:49:17', '2016-12-29 16:49:17');
INSERT INTO `user_info` VALUES ('89', '15975467681', '375080009', '', '', '支付宝', '375080009@qq.com', '空', '井永光', '0', '0', '2016-12-29 16:49:18', '2016-12-29 16:49:18');
INSERT INTO `user_info` VALUES ('90', '13572566318', '360814302', '', '', '建设银行', '4367424221600164635', '空', '穆渭滨', '0', '0', '2016-12-29 16:49:18', '2016-12-29 16:49:18');
INSERT INTO `user_info` VALUES ('91', '18719059998', '5422413', '', '', '支付宝', '15889377779', '空', '魏志兵', '0', '0', '2016-12-29 16:49:18', '2016-12-29 16:49:18');
INSERT INTO `user_info` VALUES ('92', '18056723480', '292723587', '', '', '支付宝', '292723587@qq.com', '空', '宁旭', '0', '0', '2016-12-29 16:49:19', '2016-12-29 16:49:19');
INSERT INTO `user_info` VALUES ('93', '18691077720', '907563', '', '', '支付宝', '907563@qq.com', '空', '赵海旭', '0', '0', '2016-12-29 16:49:19', '2016-12-29 16:49:19');
INSERT INTO `user_info` VALUES ('94', '15539252675', '120825678', '', '', '支付宝', 'aiai312@126.com', '空', '张波波', '0', '0', '2016-12-29 16:49:19', '2016-12-29 16:49:19');
INSERT INTO `user_info` VALUES ('95', '18769843873', '8048105', '', '', '支付宝', 'xiaoyaowsk@163.com', '空', '王圣坤', '0', '0', '2016-12-29 16:49:20', '2016-12-29 16:49:20');
INSERT INTO `user_info` VALUES ('96', '15586652222', '173979385', '', '', '支付宝', 'waynelee@163.com', '空', '李超', '0', '0', '2016-12-29 16:49:20', '2016-12-29 16:49:20');
INSERT INTO `user_info` VALUES ('97', '15588916857', '93246611', '', '', '支付宝', '15588916857', '空', '王永健', '0', '0', '2016-12-29 16:49:21', '2016-12-29 16:49:21');
INSERT INTO `user_info` VALUES ('98', '15537539984', '1971060089', '', '', '支付宝', '2056303056@qq.com', '空', '李巧玉', '0', '0', '2016-12-29 16:49:21', '2016-12-29 16:49:21');
INSERT INTO `user_info` VALUES ('99', '18666998105', '81717929', '', '', '支付宝', 'xymc@zhntwb.com', '空', '陈海荣', '0', '0', '2016-12-29 16:49:21', '2016-12-29 16:49:21');
INSERT INTO `user_info` VALUES ('100', '13357110170', '263025503', '', '', '支付宝', '13357110170', '空', '俞碧胜', '0', '0', '2016-12-29 16:49:22', '2016-12-29 16:49:22');
INSERT INTO `user_info` VALUES ('101', '13012860521', '653330313', '', '', '支付宝', '653330313@qq.com', '空', '王亚鹏', '0', '0', '2016-12-29 16:49:22', '2016-12-29 16:49:22');
INSERT INTO `user_info` VALUES ('102', '13398497558', '263742542', '', '', '支付宝', '13398497558', '', '刘守府', '0', '0', '2016-12-29 16:49:22', '2016-12-29 16:49:22');
INSERT INTO `user_info` VALUES ('103', '15576718000', '505757564', '', '', '工商银行', '6222021905004389366', '湖南省衡阳耒阳市', '谢双双', '0', '0', '2016-12-29 16:49:23', '2016-12-29 16:49:23');
INSERT INTO `user_info` VALUES ('104', '18906657578', '283506991', '', '', '支付宝', '123', '', '张辉', '0', '0', '2016-12-29 16:49:23', '2016-12-29 16:49:23');
INSERT INTO `user_info` VALUES ('105', '13838521563', '1023773477', '', '', '支付宝', '1023773477@qq.com', '', '董东东', '0', '0', '2016-12-29 16:49:23', '2016-12-29 16:49:23');
INSERT INTO `user_info` VALUES ('106', '15913936852', '26816413', '', '', '支付宝', '15913936852', '', '梁家好', '0', '0', '2016-12-29 16:49:24', '2016-12-29 16:49:24');
INSERT INTO `user_info` VALUES ('107', '15113815155', '632387108', '', '', '支付宝', 'guoxitaosj@sohu.com', '', '郭喜涛', '0', '0', '2016-12-29 16:49:24', '2016-12-29 16:49:24');
INSERT INTO `user_info` VALUES ('108', '18584521354', '854334255', '', '', '支付宝', '18584521354', '', '陈飞洪', '0', '0', '2016-12-29 16:49:24', '2016-12-29 16:49:24');
INSERT INTO `user_info` VALUES ('109', '15337227538', '1353651743', '', '', '支付宝', 'lxjvsxq@163.com', '', '李小记', '0', '0', '2016-12-29 16:49:25', '2016-12-29 16:49:25');
INSERT INTO `user_info` VALUES ('110', '13580233563', '1078610804', '', '', '支付宝', 'wangxin19921012@163.com', '', '罗伟', '0', '0', '2016-12-29 16:49:25', '2016-12-29 16:49:25');
INSERT INTO `user_info` VALUES ('111', '18069907890', '550992999', '', '', '支付宝', '550992999@qq.com', '', '王伟忠', '0', '0', '2016-12-29 16:49:25', '2016-12-29 16:49:25');
INSERT INTO `user_info` VALUES ('112', '18539210397', '578369951', '', '', '中国银行', '6217858000043239323', '鹤壁市淇滨大道支行', '王浩', '0', '0', '2016-12-29 16:49:26', '2016-12-29 16:49:26');
INSERT INTO `user_info` VALUES ('113', '15818737482', '2848810179', '', '', '农业银行', '6228480978150437371', '农行河南省南阳市镇平县玉都区支行', '闵安', '0', '0', '2016-12-29 16:49:26', '2016-12-29 16:49:26');
INSERT INTO `user_info` VALUES ('114', '13208106045', '564285331', '', '', '工商银行', '6215594402000146835', '成都双流府河音乐花园支行', '陈林', '0', '0', '2016-12-29 16:49:27', '2016-12-29 16:49:27');
INSERT INTO `user_info` VALUES ('115', '13110326216', '12460594', '', '', '支付宝', 'aijia030@126.com', '', '陈欣', '0', '0', '2016-12-29 16:49:27', '2016-12-29 16:49:27');
INSERT INTO `user_info` VALUES ('116', '13110326216', '12460594', '', '', '支付宝', 'aijia030@126.com', '秦正华府', '陈欣', '0', '0', '2016-12-29 16:49:27', '2016-12-29 16:49:27');
INSERT INTO `user_info` VALUES ('117', '15905990597', '514357339', '', '', '支付宝', 'mxw1987@126.com', '', '毛信旺', '0', '0', '2016-12-29 16:49:28', '2016-12-29 16:49:28');
INSERT INTO `user_info` VALUES ('118', '18247333336', '1181189977', '', '', '中国银行', '6217888400000161169', '中国银行乌海市鄂尔多斯支行', '陈利军', '0', '0', '2016-12-29 16:49:28', '2016-12-29 16:49:28');
INSERT INTO `user_info` VALUES ('119', '13533948680', '762485223', '', '', '支付宝', '223065150@qq.com', '', '钟继开', '0', '0', '2016-12-29 16:49:28', '2016-12-29 16:49:28');
INSERT INTO `user_info` VALUES ('120', '18317032816', '89577769', '', '', '支付宝', '18317032816', '', '万旭发', '0', '0', '2016-12-29 16:49:29', '2016-12-29 16:49:29');
INSERT INTO `user_info` VALUES ('121', '13920513302', '1146720929', '', '', '中国银行', '6231039901000833813', '天津市东丽区金桥街', '德亚斌', '0', '0', '2016-12-29 16:49:29', '2016-12-29 16:49:29');
INSERT INTO `user_info` VALUES ('122', '18781132492', '498908335', '', '', '支付宝', 'xgaiag@qq.com', '', '肖刚', '0', '0', '2016-12-29 16:49:29', '2016-12-29 16:49:29');
INSERT INTO `user_info` VALUES ('123', '18672797879', '359317368', '', '', '支付宝', '18672797879', '', '高健', '0', '0', '2016-12-29 16:49:30', '2016-12-29 16:49:30');
INSERT INTO `user_info` VALUES ('124', '18671626912', '700397', '', '', '支付宝', 'cncomnet@vip.qq.com', '', '马丽', '0', '0', '2016-12-29 16:49:30', '2016-12-29 16:49:30');
INSERT INTO `user_info` VALUES ('125', '18647222255', '732495', '', '', '支付宝', 'badlegion@163.com', '', '孙先知', '0', '0', '2016-12-29 16:49:30', '2016-12-29 16:49:30');
INSERT INTO `user_info` VALUES ('126', '13727608161', '269836327', '', '', '支付宝', '269836327@qq.com', '', '黄龙平', '0', '0', '2016-12-29 16:49:31', '2016-12-29 16:49:31');
INSERT INTO `user_info` VALUES ('127', '15201526267', '281848982', '', '', '农业银行', '6228480018357423971', '北京丰台区角门农行营业厅', '吕广竟', '0', '0', '2016-12-29 16:49:31', '2016-12-29 16:49:31');
INSERT INTO `user_info` VALUES ('128', '13571944538', '535775600', '', '', '支付宝', '13571944538', '', '贺芳云', '0', '0', '2016-12-29 16:49:31', '2016-12-29 16:49:31');
INSERT INTO `user_info` VALUES ('129', '13523541889', '47158258', '', '', '工商银行', '6215581702000173589', '河南郑州南阳路支行', '朱永刚', '0', '0', '2016-12-29 16:49:32', '2016-12-29 16:49:32');
INSERT INTO `user_info` VALUES ('130', '18960000008', '18960000008', '', '', '支付宝', '18960000008', '', '黄建斌', '0', '0', '2016-12-29 16:49:32', '2016-12-29 16:49:32');
INSERT INTO `user_info` VALUES ('131', '13355534327', '19161715', '', '', '工商银行', '6222021307000534717', '安徽省芜湖市滨江支行', '戴沈伟', '0', '0', '2016-12-29 16:49:32', '2016-12-29 16:49:32');
INSERT INTO `user_info` VALUES ('132', '15045809098', '2900761592', '', '', '邮政储蓄', '6217992610051610194', '邮政储蓄', '孟范艳', '0', '0', '2016-12-29 16:49:33', '2016-12-29 16:49:33');
INSERT INTO `user_info` VALUES ('133', '15921502867', '444327905', '', '', '建设银行', '6217001210020565535', '上海市浦东新区五莲路支行', '李俊', '0', '0', '2016-12-29 16:49:33', '2016-12-29 16:49:33');
INSERT INTO `user_info` VALUES ('134', '18672328792', '417733523', '', '', '支付宝', '18672328792', '支付宝', '张龙', '0', '0', '2016-12-29 16:49:33', '2016-12-29 16:49:33');
INSERT INTO `user_info` VALUES ('135', '15378082788', '9323470', '', '', '支付宝', '9323470@qq.com', '', '陶成云', '0', '0', '2016-12-29 16:49:34', '2016-12-29 16:49:34');
INSERT INTO `user_info` VALUES ('136', '15088074748', '234749063', '', '', '支付宝', '15088074748', '', '林嘉城', '0', '0', '2016-12-29 16:49:34', '2016-12-29 16:49:34');
INSERT INTO `user_info` VALUES ('137', '15004766113', '414134025', '', '', '农业银行', '6228481896260960968', '内蒙古赤峰市', '张凯', '0', '0', '2016-12-29 16:49:35', '2016-12-29 16:49:35');
INSERT INTO `user_info` VALUES ('138', '15154574246', '2332651918', '', '', '支付宝', '15154574246', '', '宫兆鑫', '0', '0', '2016-12-29 16:49:35', '2016-12-29 16:49:35');
INSERT INTO `user_info` VALUES ('139', '18907087831', '2976981253', '', '', '支付宝', '295697906@qq.com', '', '张斌斌', '0', '0', '2016-12-29 16:49:35', '2016-12-29 16:49:35');
INSERT INTO `user_info` VALUES ('140', '13997089069', '186794', '', '', '建设银行', '6227004402300005706', '西宁市南关街支行', '李军', '0', '0', '2016-12-29 16:49:36', '2016-12-29 16:49:36');
INSERT INTO `user_info` VALUES ('141', '13088937483', '26936059', '', '', '中国银行', '6217853600004959143', '陕西宝鸡中山东路', '张永庆', '0', '0', '2016-12-29 16:49:36', '2016-12-29 16:49:36');
INSERT INTO `user_info` VALUES ('142', '15813660929', '986076697', '', '', '支付宝', 'cgi6672@21cn.com', '', '余国良', '0', '0', '2016-12-29 16:49:36', '2016-12-29 16:49:36');
INSERT INTO `user_info` VALUES ('143', '13149245236', '289793900', '', '', '支付宝', 'lghshiyan@163.com', '', '李广慧', '0', '0', '2016-12-29 16:49:37', '2016-12-29 16:49:37');
INSERT INTO `user_info` VALUES ('144', '15154574246', '2332651918', '', '', '支付宝', '15154574246', '', '宫兆鑫', '0', '0', '2016-12-29 16:49:37', '2016-12-29 16:49:37');
INSERT INTO `user_info` VALUES ('145', '18693215455', '18693215455', '', '', '支付宝', '18693215455', '', '石文卿', '0', '0', '2016-12-29 16:49:37', '2016-12-29 16:49:37');
INSERT INTO `user_info` VALUES ('146', '18974046444', '66799474', '', '', '农业银行', '6228481378792173071', '湖南省分行', '蒋祖意', '0', '0', '2016-12-29 16:49:38', '2016-12-29 16:49:38');
INSERT INTO `user_info` VALUES ('147', '13632356500', '31949049', '', '', '工商银行', '6222023602074165465', '广州天河棠德支行', '许冬冬', '0', '0', '2016-12-29 16:49:38', '2016-12-29 16:49:38');
INSERT INTO `user_info` VALUES ('148', '13632356500', '31949049', '', '', '工商银行', '6212263602086360310', '广东广州天河棠德支行', '许冬冬', '0', '0', '2016-12-29 16:49:38', '2016-12-29 16:49:38');
INSERT INTO `user_info` VALUES ('149', '18870074636', '2976981253', '', '', '支付宝', '295697906@qq.com', '', '张斌斌', '0', '0', '2016-12-29 16:49:39', '2016-12-29 16:49:39');
INSERT INTO `user_info` VALUES ('150', '18986000108', '12397255', '', '', '支付宝', '12397255@qq.com', '', '王剑波', '0', '0', '2016-12-29 16:49:39', '2016-12-29 16:49:39');
INSERT INTO `user_info` VALUES ('151', '13519788825', '432350', '', '', '建设银行', '6227004402110200851', '西宁城北支行', '连寂羽', '0', '0', '2016-12-29 16:49:39', '2016-12-29 16:49:39');
INSERT INTO `user_info` VALUES ('152', '18938380253', '7176216', '', '', '支付宝', 'dog99@21cn.com', '', '林俊君', '0', '0', '2016-12-29 16:49:40', '2016-12-29 16:49:40');
INSERT INTO `user_info` VALUES ('153', '15802550295', '11120138', '', '', '支付宝', '11120138@qq.com', '', '苏文乔', '0', '0', '2016-12-29 16:49:40', '2016-12-29 16:49:40');
INSERT INTO `user_info` VALUES ('154', '13774177521', '379921850', '', '', '建设银行', '6217002670003819796', '湖北省襄阳市樊城区大庆东路分行', '张志全', '0', '0', '2016-12-29 16:49:40', '2016-12-29 16:49:40');
INSERT INTO `user_info` VALUES ('155', '1388888888', '489578805', '', '', '工商银行', '6212263602086360310', '广州天河棠德支行', '许冬冬', '0', '0', '2016-12-29 16:49:41', '2016-12-29 16:49:41');
INSERT INTO `user_info` VALUES ('156', '17703976418', '398559476', '', '', '中国银行', '6217568000081545855', '', '赵文丞', '0', '0', '2016-12-29 16:49:41', '2016-12-29 16:49:41');
INSERT INTO `user_info` VALUES ('157', '17703976418', '398559476', '', '', '中国银行', '6217568000081545855', '', '赵文丞', '0', '0', '2016-12-29 16:49:41', '2016-12-29 16:49:41');
INSERT INTO `user_info` VALUES ('158', '13893132944', '63162748', '', '', '支付宝', '63162748@qq.com', '', '李时永', '0', '0', '2016-12-29 16:49:42', '2016-12-29 16:49:42');
INSERT INTO `user_info` VALUES ('159', '18633420770', '54754456', '', '', '支付宝', '18633420770', '', '吉新海', '0', '0', '2016-12-29 16:49:42', '2016-12-29 16:49:42');
INSERT INTO `user_info` VALUES ('160', '13974224400', '274446', '', '', '建设银行', '6217003000103664869', '', '熊哲学', '0', '0', '2016-12-29 16:49:43', '2016-12-29 16:49:43');
INSERT INTO `user_info` VALUES ('161', '15921502867', '444327905', '', '', '建设银行', '6210001210020565535', '上海市浦东新区五莲路支行', '李俊', '0', '0', '2016-12-29 16:49:43', '2016-12-29 16:49:43');
INSERT INTO `user_info` VALUES ('162', '15630927210', '86546431', '', '', '工商银行', '6222020406007596488', '河北宁晋支行', '岳贯永', '0', '0', '2016-12-29 16:49:43', '2016-12-29 16:49:43');
INSERT INTO `user_info` VALUES ('163', '15909271555', '382677665', '', '', '支付宝', '382677665@qq.com', '', '魏晨', '0', '0', '2016-12-29 16:49:44', '2016-12-29 16:49:44');
INSERT INTO `user_info` VALUES ('164', '13893818978', '121104124', '', '', '建设银行', '6217004310003440545', '中国建设银行天水大中路支行', '平志国', '0', '0', '2016-12-29 16:49:44', '2016-12-29 16:49:44');
INSERT INTO `user_info` VALUES ('165', '18953382919', '52900510', '', '', '支付宝', '7155385@qq.com', '', '陈刚', '0', '0', '2016-12-29 16:49:44', '2016-12-29 16:49:44');
INSERT INTO `user_info` VALUES ('166', '18974046444', '984658223', '', '', '工商银行', '6222021907005539015', '', '蒋祖意', '0', '0', '2016-12-29 16:49:45', '2016-12-29 16:49:45');
INSERT INTO `user_info` VALUES ('167', '13699601211', '275332458', '', '', '支付宝', '13699601211', '', '王涛', '0', '0', '2016-12-29 16:49:45', '2016-12-29 16:49:45');
INSERT INTO `user_info` VALUES ('168', '13550168197', '1911672542', '', '', '支付宝', 'wsliuyizhi@163.com', '', '刘洪成', '0', '0', '2016-12-29 16:49:45', '2016-12-29 16:49:45');
INSERT INTO `user_info` VALUES ('169', '13981923920', '64068924', '', '', '工商银行', '6212264402025671482', '', '牛小波', '0', '0', '2016-12-29 16:49:46', '2016-12-29 16:49:46');
INSERT INTO `user_info` VALUES ('170', '13149245232', '475440455', '', '', '建设银行', '6217004400008503858', '青海  西宁', '张敏', '0', '0', '2016-12-29 16:49:46', '2016-12-29 16:49:46');
INSERT INTO `user_info` VALUES ('171', '18087418660', '5077085', '', '', '建设银行', '6236683890000517476', '中国建设银行曲靖南宁东路分理处', '高平', '0', '0', '2016-12-29 16:49:46', '2016-12-29 16:49:46');
INSERT INTO `user_info` VALUES ('172', '13149245233', '475440455', '', '', '建设银行', '6217995200058571917', '河南郑州', '吴向阳', '0', '0', '2016-12-29 16:49:47', '2016-12-29 16:49:47');
INSERT INTO `user_info` VALUES ('173', '18727008900', '501720924', '', '', '支付宝', 'meiyuege@126.com', '', '石勇', '0', '0', '2016-12-29 16:49:47', '2016-12-29 16:49:47');
INSERT INTO `user_info` VALUES ('174', '15842367744', '414319055', '', '', '农业银行', '6228480468532069175', '锦江支行', '孙宏振', '0', '0', '2016-12-29 16:49:47', '2016-12-29 16:49:47');
INSERT INTO `user_info` VALUES ('175', '18348941726', '3350763151', '', '', '支付宝', '18348941726', '', '王伯文', '0', '0', '2016-12-29 16:49:48', '2016-12-29 16:49:48');
INSERT INTO `user_info` VALUES ('176', '13166665948', '13166665948', '', '', '工商银行', '6212263301015597841', '沈阳大东区二台子支行', '董友新', '0', '0', '2016-12-29 16:49:48', '2016-12-29 16:49:48');
INSERT INTO `user_info` VALUES ('177', '13560438712', '1832625508', '', '', '工商银行', '6212260403009704012', '工行河北唐山分行古冶林西支行', '刘超', '0', '0', '2016-12-29 16:49:48', '2016-12-29 16:49:48');
INSERT INTO `user_info` VALUES ('178', '1345696111', '458115010', '', '', '支付宝', '2277599935@qq.com', '', '项建', '0', '0', '2016-12-29 16:49:49', '2016-12-29 16:49:49');
INSERT INTO `user_info` VALUES ('179', '145696131', '48115010', '', '', '支付宝', '2277599935@qq.com', '', '项建', '0', '0', '2016-12-29 16:49:49', '2016-12-29 16:49:49');
INSERT INTO `user_info` VALUES ('180', '13202203392', '2863071377', '', '', '支付宝', '13202203392', '', '陈泽龙', '0', '0', '2016-12-29 16:49:50', '2016-12-29 16:49:50');
INSERT INTO `user_info` VALUES ('181', '17716645213', '359084240', '', '', '建设银行', '4367427110610314677', '', '郑伟', '0', '0', '2016-12-29 16:49:50', '2016-12-29 16:49:50');
INSERT INTO `user_info` VALUES ('182', '13108271301', '903984635', '', '', '支付宝', 'safari723787@vip.qq.com', '', '郑静', '0', '0', '2016-12-29 16:49:50', '2016-12-29 16:49:50');
INSERT INTO `user_info` VALUES ('183', '18207301772', '84870503', '', '', '支付宝', 'xiaobb218@vip.qq.com', '', '龚威', '0', '0', '2016-12-29 16:49:51', '2016-12-29 16:49:51');
INSERT INTO `user_info` VALUES ('184', '13549192902', '234512151', '', '', '支付宝', 'qqe168@126.com', '', '吴旭海', '0', '0', '2016-12-29 16:49:51', '2016-12-29 16:49:51');
INSERT INTO `user_info` VALUES ('185', '13997089069', '186794', '', '', '建设银行', '6227004402300005706', '西宁市南关街支行', '李军', '0', '0', '2016-12-29 16:49:51', '2016-12-29 16:49:51');
INSERT INTO `user_info` VALUES ('186', '13570358250', '350679491', '', '', '兴业银行', '622908391106057711', '广州番禺', '李德成', '0', '0', '2016-12-29 16:49:52', '2016-12-29 16:49:52');
INSERT INTO `user_info` VALUES ('187', '18002851998', '116397274', '', '', '支付宝', '18002851998', '', '潘权', '0', '0', '2016-12-29 16:49:52', '2016-12-29 16:49:52');
INSERT INTO `user_info` VALUES ('188', '13926505118', '254244325', '', '', '支付宝', '254244325@qq.com', '', '王浩', '0', '0', '2016-12-29 16:49:52', '2016-12-29 16:49:52');
INSERT INTO `user_info` VALUES ('189', '18539210397', '578369951', '', '', '支付宝', '18539210397', '', '', '0', '0', '2016-12-29 16:49:53', '2016-12-29 16:49:53');
INSERT INTO `user_info` VALUES ('190', '18983858868', '273156586', '', '', '支付宝', '273156586@qq.com', '', '何亮', '0', '0', '2016-12-29 16:49:53', '2016-12-29 16:49:53');
INSERT INTO `user_info` VALUES ('191', '18996685388', '308546387', '', '', '中国银行', '6013823200037199245', '无', '陈良珊', '0', '0', '2016-12-29 16:49:53', '2016-12-29 16:49:53');
INSERT INTO `user_info` VALUES ('192', '15844906888', '541782104', '', '', '支付宝', '8904425@163.com', '', '袁燕龙', '0', '0', '2016-12-29 16:49:54', '2016-12-29 16:49:54');
INSERT INTO `user_info` VALUES ('193', '13639768561', '815161618', '', '', '建设银行', '6227 0044 0223 0046 044', '', '刘兴贵', '0', '0', '2016-12-29 16:49:54', '2016-12-29 16:49:54');
INSERT INTO `user_info` VALUES ('194', '13912489599', '78222538', '', '', '支付宝', 'gu_yihao@qq.com', '', '顾逸豪', '0', '0', '2016-12-29 16:49:55', '2016-12-29 16:49:55');
INSERT INTO `user_info` VALUES ('195', '13766347332', '554814748', '', '', '支付宝', '18679737316', '', '曹佐伟', '0', '0', '2016-12-29 16:49:56', '2016-12-29 16:49:56');
INSERT INTO `user_info` VALUES ('196', '18609168824', '258302061', '', '', '支付宝', 'sxhzgl@126.com', '支付宝', '郭磊', '0', '0', '2016-12-29 16:49:56', '2016-12-29 16:49:56');
INSERT INTO `user_info` VALUES ('197', '13766347332', '554814748', '', '', '支付宝', 'admin@0797.us', '', '曹佐伟', '0', '0', '2016-12-29 16:49:57', '2016-12-29 16:49:57');
INSERT INTO `user_info` VALUES ('198', '18241487573', '641368094', '', '', '工商银行', '6222023400022175218', '本溪市平山区建工分行', '王馨慧', '0', '0', '2016-12-29 16:49:57', '2016-12-29 16:49:57');
INSERT INTO `user_info` VALUES ('199', '18797113550', '406110111', '', '', '中国银行', '6217858700000940926', '青海省西宁市胜利路', '张昊', '0', '0', '2016-12-29 16:49:57', '2016-12-29 16:49:57');
INSERT INTO `user_info` VALUES ('200', '13338975305', '403607316', '', '', '农业银行', 'xzym@163.com', '', '姚明', '0', '0', '2016-12-29 16:49:58', '2016-12-29 16:49:58');
INSERT INTO `user_info` VALUES ('201', '13766347332', '554814748', '', '', '支付宝', '18679737316', '', '曹佐伟', '0', '0', '2016-12-29 16:49:58', '2016-12-29 16:49:58');
INSERT INTO `user_info` VALUES ('202', '13403791516', '273151670', '', '', '中国银行', '6217858000004031446', '', '徐建涛', '0', '0', '2016-12-29 16:49:58', '2016-12-29 16:49:58');
INSERT INTO `user_info` VALUES ('203', '13320228000', '4105672', '', '', '工商银行', '6212263100023555522', '重庆市长寿区', '程锎', '0', '0', '2016-12-29 16:49:59', '2016-12-29 16:49:59');
INSERT INTO `user_info` VALUES ('204', '13519125323', '19187810', '', '', '支付宝', '46453318@qq.com', '', '姚佰川', '0', '0', '2016-12-29 16:49:59', '2016-12-29 16:49:59');
INSERT INTO `user_info` VALUES ('205', '15826978600', '46119418', '', '', '支付宝', 'xtidtrichie@21cn.com', '', '张涛', '0', '0', '2016-12-29 16:49:59', '2016-12-29 16:49:59');
INSERT INTO `user_info` VALUES ('206', '15826978600', '46119418', '', '', '建设银行', '6217 0026 4000 1254 445', '', '张涛', '0', '0', '2016-12-29 16:50:00', '2016-12-29 16:50:00');
INSERT INTO `user_info` VALUES ('207', '18802911955', '99967889', '', '', '招商银行', '6225881291068665', '雁塔路支行', '胡海', '0', '0', '2016-12-29 16:50:00', '2016-12-29 16:50:00');
INSERT INTO `user_info` VALUES ('208', '13153323714', '6612626', '', '', '工商银行', '6222081605000955957', '', '杨泽灿', '0', '0', '2016-12-29 16:50:00', '2016-12-29 16:50:00');
INSERT INTO `user_info` VALUES ('209', '13306351113', '285937308', '', '', '中国银行', '6013826008001894270', '聊城市闸口支行', '马宏刚', '0', '0', '2016-12-29 16:50:01', '2016-12-29 16:50:01');
INSERT INTO `user_info` VALUES ('210', '18008133888', '14408781', '', '', '农业银行', '6228480501508166318', '', '陈小勇', '0', '0', '2016-12-29 16:50:01', '2016-12-29 16:50:01');
INSERT INTO `user_info` VALUES ('211', '', '', '', '', '建设银行', '6227004402300005706', '', '李军', '0', '0', '2016-12-29 16:50:01', '2016-12-29 16:50:01');
INSERT INTO `user_info` VALUES ('212', '13657912769', '604279542', '', '', '支付宝', '13657912769', '', '刘思雨', '0', '0', '2016-12-29 16:50:02', '2016-12-29 16:50:02');
INSERT INTO `user_info` VALUES ('213', '15666301007', '285407', '', '', '工商银行', '6222021614006537119', '山东省威海市环翠区城里支行', '丛向明', '0', '0', '2016-12-29 16:50:02', '2016-12-29 16:50:02');
INSERT INTO `user_info` VALUES ('214', '13540987134', '93982853', '', '', '农业银行', '6228482102801440910', '四川省泸州市叙永县农业银行支行', '刘平', '0', '0', '2016-12-29 16:50:02', '2016-12-29 16:50:02');
INSERT INTO `user_info` VALUES ('215', '18956082343', '657851502', '', '', '建设银行', '6217001630014106279', '安徽省合肥市城西支行', '王涛', '0', '0', '2016-12-29 16:50:03', '2016-12-29 16:50:03');
INSERT INTO `user_info` VALUES ('216', '13574389166', '297208506', '', '', '建设银行', '6217003040100107470', '湖南省吉首市', '杨军', '0', '0', '2016-12-29 16:50:03', '2016-12-29 16:50:03');
INSERT INTO `user_info` VALUES ('217', '13807003733', '262482063', '', '', '建设银行', '6217002020027845163', '中国建设银行南昌市北京西路支行', '桂利锋', '0', '0', '2016-12-29 16:50:03', '2016-12-29 16:50:03');
INSERT INTO `user_info` VALUES ('218', '18105172258', '34301999', '', '', '支付宝', '18105172258', '', '张索峰', '0', '0', '2016-12-29 16:50:04', '2016-12-29 16:50:04');
INSERT INTO `user_info` VALUES ('219', '13997089069', '186794', '', '', '建设银行', '6227004402300005706', '西宁市南关街支行', '李军', '0', '0', '2016-12-29 16:50:04', '2016-12-29 16:50:04');
INSERT INTO `user_info` VALUES ('220', '18905090720', '25866081', '', '', '工商银行', '6212261406001866712', '南纺支行', '涂日辉', '0', '0', '2016-12-29 16:50:04', '2016-12-29 16:50:04');
INSERT INTO `user_info` VALUES ('221', '18659121177', '1193516664', '', '', '支付宝', '481273@qq.com', '', '叶明森', '0', '0', '2016-12-29 16:50:05', '2016-12-29 16:50:05');
INSERT INTO `user_info` VALUES ('222', '18988927000', '99965783', '', '', '支付宝', 'liujin112@21cn.com', '', '刘金龙', '0', '0', '2016-12-29 16:50:05', '2016-12-29 16:50:05');
INSERT INTO `user_info` VALUES ('223', '15639740002', '377356350', '', '', '支付宝', '15639740002', '', '梁胜伟', '0', '0', '2016-12-29 16:50:06', '2016-12-29 16:50:06');
INSERT INTO `user_info` VALUES ('224', '18647867228', '123514783', '', '', '农业银行', '6228481910796883212', '内蒙古巴彦淖尔市胜利支行', '白鹤君', '0', '0', '2016-12-29 16:50:06', '2016-12-29 16:50:06');
INSERT INTO `user_info` VALUES ('225', '13429865962', '2631318573', '', '', '支付宝', '6124031258971325', '', '王磊', '0', '0', '2016-12-29 16:50:06', '2016-12-29 16:50:06');
INSERT INTO `user_info` VALUES ('226', '15309511413', '137579095', '', '', '建设银行', '6217004470015041333', '建设银行', '马保云', '0', '0', '2016-12-29 16:50:07', '2016-12-29 16:50:07');
INSERT INTO `user_info` VALUES ('227', '15953241777', '188122791', '', '', '支付宝', '15953241777', '', '吴玉波', '0', '0', '2016-12-29 16:50:07', '2016-12-29 16:50:07');
INSERT INTO `user_info` VALUES ('228', '13464408008', '117118694', '', '', '建设银行', '4367420675550212914', '', '张会森', '0', '0', '2016-12-29 16:50:07', '2016-12-29 16:50:07');
INSERT INTO `user_info` VALUES ('229', '18308616364', '79850604', '', '', '支付宝', 'wbb870319@163.com', '', '伍本波', '0', '0', '2016-12-29 16:50:08', '2016-12-29 16:50:08');
INSERT INTO `user_info` VALUES ('230', '13885221603', '272728120', '', '', '建设银行', '6227007110760152358', '建行贵州分行遵义汇川支行', '陈松', '0', '0', '2016-12-29 16:50:08', '2016-12-29 16:50:08');
INSERT INTO `user_info` VALUES ('231', '18997272901', '312888407', '', '', '中国银行', '6217858700001558842', '', '祁学财', '0', '0', '2016-12-29 16:50:08', '2016-12-29 16:50:08');
INSERT INTO `user_info` VALUES ('232', '18991108878', '86464026', '', '', '支付宝', '86464026@qq.com', '', '宁鑫', '0', '0', '2016-12-29 16:50:09', '2016-12-29 16:50:09');
INSERT INTO `user_info` VALUES ('233', '18509232068', '100850398', '', '', '支付宝', '100850398@qq.com', '', '张朋飞', '0', '0', '2016-12-29 16:50:09', '2016-12-29 16:50:09');
INSERT INTO `user_info` VALUES ('234', '18623433651', '5420894', '', '', '工商银行', '9558 8231 0000 6780598', '中国工商银行璧山支行', '朱重霖', '0', '0', '2016-12-29 16:50:09', '2016-12-29 16:50:09');
INSERT INTO `user_info` VALUES ('235', '18623433651', '5420894', '', '', '支付宝', 'deityfox@126.com', '', '朱重霖', '0', '0', '2016-12-29 16:50:10', '2016-12-29 16:50:10');
INSERT INTO `user_info` VALUES ('236', '13974224400', '274446', '', '', '支付宝', '274446@qq.com', '', '熊哲学', '0', '0', '2016-12-29 16:50:10', '2016-12-29 16:50:10');
INSERT INTO `user_info` VALUES ('237', '18981200911', '631484676', '', '', '农业银行', '6228482869598713671', '中国农业银行广元惠丰分理处', '孙建勇', '0', '0', '2016-12-29 16:50:10', '2016-12-29 16:50:10');
INSERT INTO `user_info` VALUES ('238', '18061928808', '3490559', '', '', '支付宝', '18061928808', '', '刘猛猛', '0', '0', '2016-12-29 16:50:11', '2016-12-29 16:50:11');
INSERT INTO `user_info` VALUES ('239', '18176767675', '50476654', '', '', '建设银行', '6217002530003616776', '河南省濮阳市人民路建设银行支行', '田山峰', '0', '0', '2016-12-29 16:50:11', '2016-12-29 16:50:11');
INSERT INTO `user_info` VALUES ('240', '18684636189', '616766232', '', '', '支付宝', '616766232@qq.com', '', '朱小松', '0', '0', '2016-12-29 16:50:11', '2016-12-29 16:50:11');
INSERT INTO `user_info` VALUES ('241', '18176767675', '50476654', '', '', '建设银行', '6217002530003616776', '河南省濮阳市人民路建设支行', '田山峰', '0', '0', '2016-12-29 16:50:12', '2016-12-29 16:50:12');
INSERT INTO `user_info` VALUES ('242', '13778050937', '1152036965', '', '', '建设银行', '6227003612110068899', '', '王坤', '0', '0', '2016-12-29 16:50:12', '2016-12-29 16:50:12');
INSERT INTO `user_info` VALUES ('243', '13985889555', '609584470', '', '', '建设银行', '6236687140000114767', '建设银行毕节分行百花支行', '张绍浒', '0', '0', '2016-12-29 16:50:12', '2016-12-29 16:50:12');
INSERT INTO `user_info` VALUES ('244', '13721741789', '4817246', '', '', '建设银行', '6230942530004287144', '建设银行台前县支行', '张子华', '0', '0', '2016-12-29 16:50:13', '2016-12-29 16:50:13');
INSERT INTO `user_info` VALUES ('245', '15953241777', '188122791', '', '', '支付宝', '15954861777', '', '邵立洲', '0', '0', '2016-12-29 16:50:13', '2016-12-29 16:50:13');
INSERT INTO `user_info` VALUES ('246', '18908766893', '709960812', '', '', '农业银行', '6227003920050019784', '云南省文山市', '孙万超', '0', '0', '2016-12-29 16:50:13', '2016-12-29 16:50:13');
INSERT INTO `user_info` VALUES ('247', '13587352313', '304111282', '', '', '工商银行', '6222021211016636153', '绍兴上虞凤鸣路支行', '姚云龙', '0', '0', '2016-12-29 16:50:14', '2016-12-29 16:50:14');
INSERT INTO `user_info` VALUES ('248', '18767132685', '79919629', '', '', '支付宝', '18767132685', '', '吴聪', '0', '0', '2016-12-29 16:50:14', '2016-12-29 16:50:14');
INSERT INTO `user_info` VALUES ('249', '15979123407', '15979123407', '', '', '农业银行', '622848 0928008321673', '', '戴天龙', '0', '0', '2016-12-29 16:50:14', '2016-12-29 16:50:14');
INSERT INTO `user_info` VALUES ('250', '13087820092', '1252790557', '', '', '工商银行', '6212 2624 0200 7693 076', '中华路支行', '熊梅', '0', '0', '2016-12-29 16:50:15', '2016-12-29 16:50:15');
INSERT INTO `user_info` VALUES ('251', '13885198181', '63242', '', '', '工商银行', '6222 0824 0200 1793762', '中国工商银行贵州分行甲秀支行', '姜颖', '0', '0', '2016-12-29 16:50:15', '2016-12-29 16:50:15');
INSERT INTO `user_info` VALUES ('252', '13571169022', '278999699', '', '', '支付宝', 'goodxmorning@126.com', '', '梁辉辉', '0', '0', '2016-12-29 16:50:15', '2016-12-29 16:50:15');
INSERT INTO `user_info` VALUES ('253', '13378605208', '215651338', '', '', '支付宝', 'ufw120@163.com', '', '凌水木', '0', '0', '2016-12-29 16:50:16', '2016-12-29 16:50:16');
INSERT INTO `user_info` VALUES ('254', '13317180699', '30464536', '', '', '支付宝', '30464536@qq.com', '', '熊小东', '0', '0', '2016-12-29 16:50:16', '2016-12-29 16:50:16');
INSERT INTO `user_info` VALUES ('255', '13814454144', '100091858', '', '', '支付宝', '100091858@qq.com', '', '快叫爸爸', '0', '0', '2016-12-29 16:50:16', '2016-12-29 16:50:16');
INSERT INTO `user_info` VALUES ('256', '17709713488', '83768616', '', '', '农业银行', '876220235@qq.com', '', '张敏', '0', '0', '2016-12-29 16:50:17', '2016-12-29 16:50:17');
INSERT INTO `user_info` VALUES ('257', '13786146530', '450143335', '', '', '招商银行', '6214837310230119', '湖南省长沙市招商银行晓园支行', '曾凡林', '0', '0', '2016-12-29 16:50:17', '2016-12-29 16:50:17');
INSERT INTO `user_info` VALUES ('258', '13089768139', '5376377', '', '', '工商银行', '621559  0913  000 929487', '', '刘昕', '0', '0', '2016-12-29 16:50:18', '2016-12-29 16:50:18');
INSERT INTO `user_info` VALUES ('259', '13593934409', '25831588', '', '', '建设银行', '6227002661000402222', '中国建设银行仙桃市支行', '徐文涛', '0', '0', '2016-12-29 16:50:18', '2016-12-29 16:50:18');
INSERT INTO `user_info` VALUES ('260', '15834799555', '9714802', '', '', '工商银行', '6222080808000737034', '中国工商银行延边珲春支行营业部', '张云成', '0', '0', '2016-12-29 16:50:18', '2016-12-29 16:50:18');
INSERT INTO `user_info` VALUES ('261', '13373612141', '49666684', '', '', '建设银行', '6217 0012 4000 4584 830', '江苏无锡', '江翌', '0', '0', '2016-12-29 16:50:19', '2016-12-29 16:50:19');
INSERT INTO `user_info` VALUES ('262', '18771133392', '1105990071', '', '', '招商银行', '6214830270431702', '武汉市青山区红钢城', '喻建新', '0', '0', '2016-12-29 16:50:19', '2016-12-29 16:50:19');
INSERT INTO `user_info` VALUES ('263', '13945606651', '68449040', '', '', '支付宝', '68449040@qq.com', '', '张兆阳', '0', '0', '2016-12-29 16:50:19', '2016-12-29 16:50:19');
INSERT INTO `user_info` VALUES ('264', '15973520801', '280115790', '', '', '中国银行', '6217857500010537667', '郴州市永兴县中国银行', '谢德付', '0', '0', '2016-12-29 16:50:20', '2016-12-29 16:50:20');
INSERT INTO `user_info` VALUES ('265', '13392098017', '133607889', '', '', '工商银行', '6212262012001868077', '', '甄惠敏', '0', '0', '2016-12-29 16:50:20', '2016-12-29 16:50:20');
INSERT INTO `user_info` VALUES ('266', '15238570333', '531648000', '', '', '农业银行', '6228482381087031011', '河南省商丘市民权县', '吴帅', '0', '0', '2016-12-29 16:50:20', '2016-12-29 16:50:20');
INSERT INTO `user_info` VALUES ('267', '15885888158', '2085594635', '', '', '建设银行', '6227007142020074916', '贵州毕节', '潘凯', '0', '0', '2016-12-29 16:50:21', '2016-12-29 16:50:21');
INSERT INTO `user_info` VALUES ('268', '13850037012', '69437970', '', '', '支付宝', 'lyd1246@163.com', '', '李远东', '0', '0', '2016-12-29 16:50:21', '2016-12-29 16:50:21');
INSERT INTO `user_info` VALUES ('269', '18062003131', '3767886', '', '', '建设银行', '6227002871710252391', '', '辛伟', '0', '0', '2016-12-29 16:50:21', '2016-12-29 16:50:21');
INSERT INTO `user_info` VALUES ('270', '15095700702', '646563498', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:22', '2016-12-29 16:50:22');
INSERT INTO `user_info` VALUES ('271', '18699204445', '8296461', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:22', '2016-12-29 16:50:22');
INSERT INTO `user_info` VALUES ('272', '13710650522', '2470428402', '', '', '支付宝', '844832303@qq.com', 'MTK', '', '0', '0', '2016-12-29 16:50:22', '2016-12-29 16:50:22');
INSERT INTO `user_info` VALUES ('273', '13871890929', '67481670', '', '', '建设银行', '4367422720040046551', '', '胡鸿俊', '0', '0', '2016-12-29 16:50:23', '2016-12-29 16:50:23');
INSERT INTO `user_info` VALUES ('274', '18002355550', '912739', '', '', '支付宝', '18002355550', '', '罗通', '0', '0', '2016-12-29 16:50:23', '2016-12-29 16:50:23');
INSERT INTO `user_info` VALUES ('275', '15885888158', '2085594635', '', '', '建设银行', '6227007142020074916', '贵州毕节', '潘凯', '0', '0', '2016-12-29 16:50:23', '2016-12-29 16:50:23');
INSERT INTO `user_info` VALUES ('276', '13034209052', '276736349', '', '', '建设银行', '6217 0015 4001 5780 040', '建设银行三墩支行', '高智', '0', '0', '2016-12-29 16:50:24', '2016-12-29 16:50:24');
INSERT INTO `user_info` VALUES ('277', '18845679995', '5376377', '', '', '工商银行', '621559  0913  000 929487', '', '刘昕', '0', '0', '2016-12-29 16:50:24', '2016-12-29 16:50:24');
INSERT INTO `user_info` VALUES ('278', '18927179193', '2282115117', '', '', '建设银行', '6227003272070170472', '广东省分行云浮分行', '蒋光辉', '0', '0', '2016-12-29 16:50:24', '2016-12-29 16:50:24');
INSERT INTO `user_info` VALUES ('279', '15282975888', '38705002', '', '', '支付宝', '15282975888', '', '陈昊', '0', '0', '2016-12-29 16:50:25', '2016-12-29 16:50:25');
INSERT INTO `user_info` VALUES ('280', '18845679995', '5376377', '', '', '工商银行', '621559  0913  000 929487', '', '刘昕', '0', '0', '2016-12-29 16:50:25', '2016-12-29 16:50:25');
INSERT INTO `user_info` VALUES ('281', '17084965678', '501238105', '', '', '建设银行', '6217 0044 7000 2706 443', '宁夏银川兴庆区南门南建支行', '思锋', '0', '0', '2016-12-29 16:50:25', '2016-12-29 16:50:25');
INSERT INTO `user_info` VALUES ('282', '17084965678', '501238105', '', '', '建设银行', '6217 0044 7000 2706 443', '宁夏银川兴庆区南门南建支行', '思锋', '0', '0', '2016-12-29 16:50:26', '2016-12-29 16:50:26');
INSERT INTO `user_info` VALUES ('283', '17709713488', '83768616', '', '', '支付宝', '876220235@qq.com', '', '张敏', '0', '0', '2016-12-29 16:50:26', '2016-12-29 16:50:26');
INSERT INTO `user_info` VALUES ('284', '18955878219', '359153843', '', '', '农业银行', '6228482299125258075', '安徽省阜阳市清河东路支行', '吴军', '0', '0', '2016-12-29 16:50:26', '2016-12-29 16:50:26');
INSERT INTO `user_info` VALUES ('285', '15639757758', '8062185', '', '', '支付宝', '15639757758', '', '李伟', '0', '0', '2016-12-29 16:50:27', '2016-12-29 16:50:27');
INSERT INTO `user_info` VALUES ('286', '18728953345', '541929270', '', '', '农业银行', '6228480962452717615', '四川省凉山州西昌市', '马秋生', '0', '0', '2016-12-29 16:50:27', '2016-12-29 16:50:27');
INSERT INTO `user_info` VALUES ('287', '13814454144', '100091858', '', '', '工商银行', '6222021115005979468', '工商银行泰州南通路支行', '乐伟', '0', '0', '2016-12-29 16:50:27', '2016-12-29 16:50:27');
INSERT INTO `user_info` VALUES ('288', '1397791991', '97987797', '', '', '支付宝', '97987797@qq.com', '', '刘刘', '0', '0', '2016-12-29 16:50:28', '2016-12-29 16:50:28');
INSERT INTO `user_info` VALUES ('289', '15005584082', '6701735', '', '', '支付宝', '6701735@qq.com', '', '王伟', '0', '0', '2016-12-29 16:50:28', '2016-12-29 16:50:28');
INSERT INTO `user_info` VALUES ('290', '13939377574', '372994814', '', '', '支付宝', '372994814@qq.com', '', '李浩威', '0', '0', '2016-12-29 16:50:29', '2016-12-29 16:50:29');
INSERT INTO `user_info` VALUES ('291', '18985888444', '10568449', '', '', '建设银行', '6227007142020370942', '贵州省黔西县', '聂彬', '0', '0', '2016-12-29 16:50:29', '2016-12-29 16:50:29');
INSERT INTO `user_info` VALUES ('292', '13988201939', '373072622', '', '', '邮政储蓄', '6221507300006463374', '云南省德宏州芒市', '曹健程', '0', '0', '2016-12-29 16:50:29', '2016-12-29 16:50:29');
INSERT INTO `user_info` VALUES ('293', '17783822224', '34451470', '', '', '工商银行', '6222023100029136186', '', '徐鑫', '0', '0', '2016-12-29 16:50:30', '2016-12-29 16:50:30');
INSERT INTO `user_info` VALUES ('294', '13887679770', '709960812', '', '', '建设银行', '622003920040203084', '文山市', '高应登', '0', '0', '2016-12-29 16:50:30', '2016-12-29 16:50:30');
INSERT INTO `user_info` VALUES ('295', '13887679770', '709960812', '', '', '建设银行', '6227003920040203084', '文山', '高应登', '0', '0', '2016-12-29 16:50:30', '2016-12-29 16:50:30');
INSERT INTO `user_info` VALUES ('296', '18639638099', '66088166', '', '', '建设银行', '6227002578010002307', '建设银行驻马店分行泌阳支行', '张辉', '0', '0', '2016-12-29 16:50:31', '2016-12-29 16:50:31');
INSERT INTO `user_info` VALUES ('297', '13988818753', '119586567', '', '', '支付宝', '119586567@qq.com', '', '罗从云', '0', '0', '2016-12-29 16:50:31', '2016-12-29 16:50:31');
INSERT INTO `user_info` VALUES ('298', '15513596882', '274033577', '', '', '农业银行', '6228483040311460219', '中国农业银行闻喜支行', '加鸽', '0', '0', '2016-12-29 16:50:31', '2016-12-29 16:50:31');
INSERT INTO `user_info` VALUES ('299', '17783822224', '34451470', '', '', '工商银行', '6222023100029136186', '', '徐鑫', '0', '0', '2016-12-29 16:50:32', '2016-12-29 16:50:32');
INSERT INTO `user_info` VALUES ('300', '17783822224', '34451470', '', '', '工商银行', '6222023100029136186', '重庆市江津璧山支行营业室', '徐鑫', '0', '0', '2016-12-29 16:50:32', '2016-12-29 16:50:32');
INSERT INTO `user_info` VALUES ('301', '13985698515', '359084240', '', '', '建设银行', '4367427110610314677', '', '郑伟', '0', '0', '2016-12-29 16:50:32', '2016-12-29 16:50:32');
INSERT INTO `user_info` VALUES ('302', '18379615999', '283099616', '', '', '支付宝', 'kepeiyu520@126.com', '', '黄朝国', '0', '0', '2016-12-29 16:50:33', '2016-12-29 16:50:33');
INSERT INTO `user_info` VALUES ('303', '15837851172', '286607002', '', '', '支付宝', 'qibeibei@qq.com', '', '祁贝贝', '0', '0', '2016-12-29 16:50:33', '2016-12-29 16:50:33');
INSERT INTO `user_info` VALUES ('304', '18982205949', '263659020', '', '', '建设银行', '6222803812341000025', '成都崇州支行', '何峰', '0', '0', '2016-12-29 16:50:33', '2016-12-29 16:50:33');
INSERT INTO `user_info` VALUES ('305', '13985759844', '450030460', '', '', '工商银行', '9558822405000270426', '贵州省都匀市桥城支行', '宋先义', '0', '0', '2016-12-29 16:50:34', '2016-12-29 16:50:34');
INSERT INTO `user_info` VALUES ('306', '13903730001', '123456789', '', '', '支付宝', '18603737277', '', '试试看', '0', '0', '2016-12-29 16:50:34', '2016-12-29 16:50:34');
INSERT INTO `user_info` VALUES ('307', '18185249167', '406887896', '', '', '工商银行', '6212262403005949445', '工商银行', '罗林', '0', '0', '2016-12-29 16:50:34', '2016-12-29 16:50:34');
INSERT INTO `user_info` VALUES ('308', '18803731006', '34489585', '', '', '支付宝', '18803731006', '', '裴建华', '0', '0', '2016-12-29 16:50:35', '2016-12-29 16:50:35');
INSERT INTO `user_info` VALUES ('309', '18030520025', '670039257', '', '', '支付宝', '18030520025', '', '财满天下', '0', '0', '2016-12-29 16:50:35', '2016-12-29 16:50:35');
INSERT INTO `user_info` VALUES ('310', '13379688833', '279470735', '', '', '邮政储蓄', '6217997071002371904', '邮政', '刘刚', '0', '0', '2016-12-29 16:50:35', '2016-12-29 16:50:35');
INSERT INTO `user_info` VALUES ('311', '18502710729', '449043795', '', '', '兴业银行', '622909413742060518', '', '盛涛', '0', '0', '2016-12-29 16:50:36', '2016-12-29 16:50:36');
INSERT INTO `user_info` VALUES ('312', '15086959607', '1442400406', '', '', '建设银行', '6217003760014572945', '重庆巫山支行', '牛阳', '0', '0', '2016-12-29 16:50:36', '2016-12-29 16:50:36');
INSERT INTO `user_info` VALUES ('313', '18179003144', '95517864', '', '', '工商银行', '6222021502000994', '江西省南昌市青山湖区南京东路支行', '艾兵根', '0', '0', '2016-12-29 16:50:37', '2016-12-29 16:50:37');
INSERT INTO `user_info` VALUES ('314', '15050649448', '260397629', '', '', '支付宝', 'xu.aiguo@163.com', '', '许爱国', '0', '0', '2016-12-29 16:50:37', '2016-12-29 16:50:37');
INSERT INTO `user_info` VALUES ('315', '13479675008', '2690647907', '', '', '招商银行', '6214832903544877', '西安招商银行枫林绿洲支行', '张玲玲', '0', '0', '2016-12-29 16:50:37', '2016-12-29 16:50:37');
INSERT INTO `user_info` VALUES ('316', '15602495324', '1766931965', '', '', '招商银行', '6214837551567104', '深圳招商银行龙岗支行', '符劲松', '0', '0', '2016-12-29 16:50:38', '2016-12-29 16:50:38');
INSERT INTO `user_info` VALUES ('317', '15113506034', '3158793561', '', '', '工商银行', '6214832903544880', '西安招商银行枫林绿洲支行', '周妮', '0', '0', '2016-12-29 16:50:38', '2016-12-29 16:50:38');
INSERT INTO `user_info` VALUES ('318', '15885888158', '2085594635', '', '', '建设银行', '6227007142020074916', '贵州毕节', '潘凯', '0', '0', '2016-12-29 16:50:38', '2016-12-29 16:50:38');
INSERT INTO `user_info` VALUES ('319', '13632653212', '2939793441', '', '', '招商银行', '6214837822327387', '深圳招商银行新安支行', '张艳', '0', '0', '2016-12-29 16:50:39', '2016-12-29 16:50:39');
INSERT INTO `user_info` VALUES ('320', '13566434755', '2467725', '', '', '支付宝', '2467725@qq.com', '', '何为', '0', '0', '2016-12-29 16:50:39', '2016-12-29 16:50:39');
INSERT INTO `user_info` VALUES ('321', '13839743533', '79378428', '', '', '农业银行', '6228482398460134378', '', '李强', '0', '0', '2016-12-29 16:50:39', '2016-12-29 16:50:39');
INSERT INTO `user_info` VALUES ('322', '18609168824', '258302061', '', '', '支付宝', 'sxhzgl@126.com', '汉中', '郭磊', '0', '0', '2016-12-29 16:50:40', '2016-12-29 16:50:40');
INSERT INTO `user_info` VALUES ('323', '13597690779', '303125253', '', '', '支付宝', '13597690779', '', '马军', '0', '0', '2016-12-29 16:50:40', '2016-12-29 16:50:40');
INSERT INTO `user_info` VALUES ('324', '13877885877', '21811628', '', '', '支付宝', 'wnn210@yeah.net', '', '吴宁宁', '0', '0', '2016-12-29 16:50:40', '2016-12-29 16:50:40');
INSERT INTO `user_info` VALUES ('325', '13368840871', '5065366', '', '', '支付宝', '13368840871', '', '袁贵晓', '0', '0', '2016-12-29 16:50:41', '2016-12-29 16:50:41');
INSERT INTO `user_info` VALUES ('326', '13148481456', '22009799', '', '', '支付宝', '22009799@qq.com', '', '胡晋', '0', '0', '2016-12-29 16:50:41', '2016-12-29 16:50:41');
INSERT INTO `user_info` VALUES ('327', '18127338111', '9970686', '', '', '中国银行', '6217907000013997273', '广东省茂名市化州市', '柯广才', '0', '0', '2016-12-29 16:50:41', '2016-12-29 16:50:41');
INSERT INTO `user_info` VALUES ('328', '18691412288', '5789175', '', '', '工商银行', '6222082608000068663', '', '李杰', '0', '0', '2016-12-29 16:50:42', '2016-12-29 16:50:42');
INSERT INTO `user_info` VALUES ('329', '17787406391', '122209787', '', '', '工商银行', '6212262505004668279', '云南省曲靖市陆良县', '太雪波', '0', '0', '2016-12-29 16:50:42', '2016-12-29 16:50:42');
INSERT INTO `user_info` VALUES ('330', '17787406391', '122209787', '', '', '工商银行', '6212262505004668279', '云南省曲靖市陆良县', '太雪波', '0', '0', '2016-12-29 16:50:42', '2016-12-29 16:50:42');
INSERT INTO `user_info` VALUES ('331', '1366715258', '76226870', '', '', '工商银行', '6222023202019069698', '中国工商银行 湖北省武汉市武大支行', '周明', '0', '0', '2016-12-29 16:50:43', '2016-12-29 16:50:43');
INSERT INTO `user_info` VALUES ('332', '13762612298', '3391263', '', '', '支付宝', 'law1020@126.com', '', '袁健', '0', '0', '2016-12-29 16:50:43', '2016-12-29 16:50:43');
INSERT INTO `user_info` VALUES ('333', '18571991789', '272809257', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:43', '2016-12-29 16:50:43');
INSERT INTO `user_info` VALUES ('334', '15543690015', '287398456', '', '', '建设银行', '6236680940001279197', '吉林省长春市宽城区东莱南街307号', '王玉石', '0', '0', '2016-12-29 16:50:44', '2016-12-29 16:50:44');
INSERT INTO `user_info` VALUES ('335', '13668772772', '8952684', '', '', '支付宝', '13668772772', '', '杨俊', '0', '0', '2016-12-29 16:50:44', '2016-12-29 16:50:44');
INSERT INTO `user_info` VALUES ('336', '13007693520', '380797765', '', '', '农业银行', '6228481352343517714', '中国农业银行安阳市区支行', '田国栋', '0', '0', '2016-12-29 16:50:45', '2016-12-29 16:50:45');
INSERT INTO `user_info` VALUES ('337', '15170025521', '309848009', '', '', '建设银行', '4367422020023226548', '中国建设银行南昌西湖支行', '黄平平', '0', '0', '2016-12-29 16:50:45', '2016-12-29 16:50:45');
INSERT INTO `user_info` VALUES ('338', '18009149111', '231118601', '', '', '工商银行', '6222022608000796225', '中国工商银行商洛市迎宾路支行', '李晓伟', '0', '0', '2016-12-29 16:50:45', '2016-12-29 16:50:45');
INSERT INTO `user_info` VALUES ('339', '13720388228', '2287105409', '', '', '支付宝', '13720388228', '', '尹光', '0', '0', '2016-12-29 16:50:46', '2016-12-29 16:50:46');
INSERT INTO `user_info` VALUES ('340', '13734711521', '337527462', '', '', '农业银行', '6228480870222590818', '呼和浩特市', '赵冬雪', '0', '0', '2016-12-29 16:50:46', '2016-12-29 16:50:46');
INSERT INTO `user_info` VALUES ('341', '18603955671', '910921468', '', '', '支付宝', '18603955671', '', '张欣', '0', '0', '2016-12-29 16:50:46', '2016-12-29 16:50:46');
INSERT INTO `user_info` VALUES ('342', '13569086687', '358356992', '', '', '中国银行', '13569086687', '', '王保录', '0', '0', '2016-12-29 16:50:47', '2016-12-29 16:50:47');
INSERT INTO `user_info` VALUES ('343', '18939251858', '3079669965', '', '', '中国银行', '6222021702037041464', '郑州市黄河路支行', '张一鸣', '0', '0', '2016-12-29 16:50:47', '2016-12-29 16:50:47');
INSERT INTO `user_info` VALUES ('344', '18176767675', '50476654', '', '', '建设银行', '6217002530003616776', '河南省濮阳市人民路建设支行', '田山峰', '0', '0', '2016-12-29 16:50:47', '2016-12-29 16:50:47');
INSERT INTO `user_info` VALUES ('345', '18176767675', '50476654', '', '', '建设银行', '6217002530003616776', '河南省濮阳市人民路建设支行', '田山峰', '0', '0', '2016-12-29 16:50:48', '2016-12-29 16:50:48');
INSERT INTO `user_info` VALUES ('346', '15834888884', '3105676', '', '', '支付宝', '15834888884', '', '吕振浩', '0', '0', '2016-12-29 16:50:48', '2016-12-29 16:50:48');
INSERT INTO `user_info` VALUES ('347', '18176767675', '50476654', '', '', '建设银行', '6217002530003616776', '河南省濮阳市人民路建设支行', '田山峰', '0', '0', '2016-12-29 16:50:48', '2016-12-29 16:50:48');
INSERT INTO `user_info` VALUES ('348', '18176767675', '50476654', '', '', '建设银行', '6217002530003616776', '河南省濮阳市人民路建设支行', '田山峰', '0', '0', '2016-12-29 16:50:49', '2016-12-29 16:50:49');
INSERT INTO `user_info` VALUES ('349', '18637131348', '784170046', '', '', '支付宝', '18637131348', '', '韩彦波', '0', '0', '2016-12-29 16:50:49', '2016-12-29 16:50:49');
INSERT INTO `user_info` VALUES ('350', '13929561229', '30830972', '', '', '工商银行', '6212263602058083221', '广州市海珠区', '陈建明', '0', '0', '2016-12-29 16:50:49', '2016-12-29 16:50:49');
INSERT INTO `user_info` VALUES ('351', '15639383802', '15639383802', '', '', '支付宝', '15639383802', '', '高永领', '0', '0', '2016-12-29 16:50:50', '2016-12-29 16:50:50');
INSERT INTO `user_info` VALUES ('352', '15399182108', '391110594', '', '', '建设银行', '6217004220031260486', '西安市大兴区', '王文', '0', '0', '2016-12-29 16:50:50', '2016-12-29 16:50:50');
INSERT INTO `user_info` VALUES ('353', '18939629945', '751788884', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:50', '2016-12-29 16:50:50');
INSERT INTO `user_info` VALUES ('354', '13513279165', '22122899', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:51', '2016-12-29 16:50:51');
INSERT INTO `user_info` VALUES ('355', '17731692291', '108832914', '', '', '支付宝', '108832914@qq.com', '', '金旺', '0', '0', '2016-12-29 16:50:51', '2016-12-29 16:50:51');
INSERT INTO `user_info` VALUES ('356', '18304462345', '3105676', '', '', '支付宝', '15834888884', '', '吕振浩', '0', '0', '2016-12-29 16:50:51', '2016-12-29 16:50:51');
INSERT INTO `user_info` VALUES ('357', '13908574615', '6710803', '', '', '支付宝', 'starzc168@163.com', '', '郑程', '0', '0', '2016-12-29 16:50:52', '2016-12-29 16:50:52');
INSERT INTO `user_info` VALUES ('358', '13997627781', '67775320', '', '', '支付宝', '13997627781', '', '李北林', '0', '0', '2016-12-29 16:50:52', '2016-12-29 16:50:52');
INSERT INTO `user_info` VALUES ('359', '13305204633', '120638997', '', '', '支付宝', '120638997@qq.com', '', '高海平', '0', '0', '2016-12-29 16:50:52', '2016-12-29 16:50:52');
INSERT INTO `user_info` VALUES ('360', '13688089834', '191148964', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:53', '2016-12-29 16:50:53');
INSERT INTO `user_info` VALUES ('361', '15639383802', '15639383802', '', '', '建设银行', '6217 0025 3000 0009 686', '', '高永领', '0', '0', '2016-12-29 16:50:53', '2016-12-29 16:50:53');
INSERT INTO `user_info` VALUES ('362', '13776820747', '37134156', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:53', '2016-12-29 16:50:53');
INSERT INTO `user_info` VALUES ('363', '13772706670', '453529902', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:54', '2016-12-29 16:50:54');
INSERT INTO `user_info` VALUES ('364', '13907298970', '2412008', '', '', '支付宝', 'wxwdan78@126.com', '', '王小威', '0', '0', '2016-12-29 16:50:54', '2016-12-29 16:50:54');
INSERT INTO `user_info` VALUES ('365', '13359159817', '21629407', '', '', '农业银行', '545665454132321231646', '', '刘小军', '0', '0', '2016-12-29 16:50:55', '2016-12-29 16:50:55');
INSERT INTO `user_info` VALUES ('366', '18607024555', '897102505', '', '', '支付宝', '18607024555', '', '吴鹏', '0', '0', '2016-12-29 16:50:55', '2016-12-29 16:50:55');
INSERT INTO `user_info` VALUES ('367', '18926738801', '3939439', '', '', '支付宝', 'mm0105@126.com', '', '陈腾飞', '0', '0', '2016-12-29 16:50:55', '2016-12-29 16:50:55');
INSERT INTO `user_info` VALUES ('368', '15047507701', '1053357276', '', '', '支付宝', '15047507701', '', '魏鹏奇', '0', '0', '2016-12-29 16:50:56', '2016-12-29 16:50:56');
INSERT INTO `user_info` VALUES ('369', '13069586066', '232155777', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:56', '2016-12-29 16:50:56');
INSERT INTO `user_info` VALUES ('370', '13203823802', '417283000', '', '', '支付宝', '13203823802', '', '陈树林', '0', '0', '2016-12-29 16:50:56', '2016-12-29 16:50:56');
INSERT INTO `user_info` VALUES ('371', '13523743212', '42619729', '', '', '邮政储蓄', '6217995030002502001', '河南省禹州市东商贸支行', '王国峰', '0', '0', '2016-12-29 16:50:57', '2016-12-29 16:50:57');
INSERT INTO `user_info` VALUES ('372', '13848618503', '65261397', '', '', '支付宝', '13848618503', '', '刘瑞廷', '0', '0', '2016-12-29 16:50:57', '2016-12-29 16:50:57');
INSERT INTO `user_info` VALUES ('373', '18912716520', '54899967', '', '', '支付宝', '54899967@qq.com', '', '李永昌', '0', '0', '2016-12-29 16:50:57', '2016-12-29 16:50:57');
INSERT INTO `user_info` VALUES ('374', '13680779944', '83655101', '', '', '工商银行', '6222022008002397595', '广东省惠州市', '朱桂练', '0', '0', '2016-12-29 16:50:58', '2016-12-29 16:50:58');
INSERT INTO `user_info` VALUES ('375', '13578061695', '345650422', '', '', '农业银行', '6228483866050075960', '云南昭通昭阳区南大街支行', '陈云', '0', '0', '2016-12-29 16:50:58', '2016-12-29 16:50:58');
INSERT INTO `user_info` VALUES ('376', '15198223136', '81217954', '', '', '支付宝', '84765691@qq.com', '', '张洪伟', '0', '0', '2016-12-29 16:50:58', '2016-12-29 16:50:58');
INSERT INTO `user_info` VALUES ('377', '15089556635', '277353', '', '', '支付宝', '15706696063', '', '覃锶', '0', '0', '2016-12-29 16:50:59', '2016-12-29 16:50:59');
INSERT INTO `user_info` VALUES ('378', '13404556693', '13404556693', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:50:59', '2016-12-29 16:50:59');
INSERT INTO `user_info` VALUES ('379', '', '', '', '', '', '', '', '', '0', '0', '2016-12-29 16:50:59', '2016-12-29 16:50:59');
INSERT INTO `user_info` VALUES ('380', '15834671666', '68269123', '', '', '建设银行', '6217000880001947109', '中国建设银行白城新华路支行', '卜海洋', '0', '0', '2016-12-29 16:51:00', '2016-12-29 16:51:00');
INSERT INTO `user_info` VALUES ('381', '18235160108', '1031094380', '', '', '支付宝', '1031094380@qq.com', '', '高勇', '0', '0', '2016-12-29 16:51:00', '2016-12-29 16:51:00');
INSERT INTO `user_info` VALUES ('382', '13532208761', '273035504', '', '', '农业银行', '6228480114155276214', '珠海市拱北粤华路108号', '宋亚红', '0', '0', '2016-12-29 16:51:00', '2016-12-29 16:51:00');
INSERT INTO `user_info` VALUES ('383', '17723578755', '307702121', '', '', '建设银行', '6215983760002395141', '重庆市荣昌区建设银行荣昌支行', '朱学民', '0', '0', '2016-12-29 16:51:01', '2016-12-29 16:51:01');
INSERT INTO `user_info` VALUES ('384', '13608251215', '258154789', '', '', '建设银行', '6227003641510040570', '四川省内江市资中县', '冷晋光', '0', '0', '2016-12-29 16:51:01', '2016-12-29 16:51:01');
INSERT INTO `user_info` VALUES ('385', '18107220778', '505822330', '', '', '支付宝', 'szecom@126.com', '', '余杰', '0', '0', '2016-12-29 16:51:01', '2016-12-29 16:51:01');
INSERT INTO `user_info` VALUES ('386', '15915699883', '813168339', '', '', '支付宝', '13184847685', '', '林俊佳', '0', '0', '2016-12-29 16:51:02', '2016-12-29 16:51:02');
INSERT INTO `user_info` VALUES ('387', '18960617733', '619823', '', '', '建设银行', '6227001862550206051', '南平市三元支行', '马汉英', '0', '0', '2016-12-29 16:51:02', '2016-12-29 16:51:02');
INSERT INTO `user_info` VALUES ('388', '18879378888', '236295024', '', '', '农业银行', '6228481778', '上饶县', '陈飞', '0', '0', '2016-12-29 16:51:02', '2016-12-29 16:51:02');
INSERT INTO `user_info` VALUES ('389', '17709713488', '83768616', '', '', '支付宝', '876220235@qq.com', '', '张敏', '0', '0', '2016-12-29 16:51:03', '2016-12-29 16:51:03');
INSERT INTO `user_info` VALUES ('390', '17725268170', '68019967', '', '', '支付宝', '68019967@qq.com', '', '肖楠', '0', '0', '2016-12-29 16:51:03', '2016-12-29 16:51:03');
INSERT INTO `user_info` VALUES ('391', '13553245325', '862525', '', '', '支付宝', 'hystar@21cn.com', '', '黄敏辉', '0', '0', '2016-12-29 16:51:03', '2016-12-29 16:51:03');
INSERT INTO `user_info` VALUES ('392', '18236718888', '1234567', '', '', '支付宝', '18236718828', '', '张洋', '0', '0', '2016-12-29 16:51:04', '2016-12-29 16:51:04');
INSERT INTO `user_info` VALUES ('393', '13939393939', '564564', '', '', '支付宝', 'likeqq@126.com', '在', '冯肖良', '0', '0', '2016-12-29 16:51:04', '2016-12-29 16:51:04');
INSERT INTO `user_info` VALUES ('394', '15855667167', '158714069', '', '', '支付宝', '15855667167', '', '罗传胜', '0', '0', '2016-12-29 16:51:04', '2016-12-29 16:51:04');
INSERT INTO `user_info` VALUES ('395', '15960235662', '20666996', '', '', '支付宝', '613226617@qq.com', '', '林云鹏', '0', '0', '2016-12-29 16:51:05', '2016-12-29 16:51:05');
INSERT INTO `user_info` VALUES ('396', '13332575396', '68401726', '', '', '工商银行', '6222021912005278408', '湖南益阳市海棠分处理', '武浩', '0', '0', '2016-12-29 16:51:05', '2016-12-29 16:51:05');
INSERT INTO `user_info` VALUES ('397', '15319939460', '357994310', '', '', '建设银行', '6217004220004540955', '文景路支行', '田小领', '0', '0', '2016-12-29 16:51:05', '2016-12-29 16:51:05');
INSERT INTO `user_info` VALUES ('398', '15161526813', '31518253', '', '', '农业银行', '', '', '', '0', '0', '2016-12-29 16:51:06', '2016-12-29 16:51:06');
INSERT INTO `user_info` VALUES ('399', '18900862788', '182808351', '', '', '支付宝', 'baiqveddd@163.com', '', '陈银雷', '0', '0', '2016-12-29 16:51:06', '2016-12-29 16:51:06');
INSERT INTO `user_info` VALUES ('400', '18076182258', '38711054', '', '', '支付宝', '18076182258', '', '郭江', '0', '0', '2016-12-29 16:51:07', '2016-12-29 16:51:07');
INSERT INTO `user_info` VALUES ('401', '15279636662', '569840357', '', '', '支付宝', 'ms.xta@163.com', '', '吴德旺', '0', '0', '2016-12-29 16:51:07', '2016-12-29 16:51:07');
