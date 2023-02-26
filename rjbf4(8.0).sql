/*
 Navicat MySQL Data Transfer

 Source Server         : rjbf4
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 175.178.189.140:3306
 Source Schema         : rjbf4

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 14/08/2022 15:20:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_department
-- ----------------------------
DROP TABLE IF EXISTS `m_department`;
CREATE TABLE `m_department`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，部门的唯一标识',
  `partname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名字',
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门地址',
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门描述',
  `parentid` int NULL DEFAULT NULL COMMENT '父部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_department
-- ----------------------------
INSERT INTO `m_department` VALUES (32, '东软学院', '广东省佛山市南海区狮山镇狮山大学城东软学院', NULL, NULL);
INSERT INTO `m_department` VALUES (33, '计算机与软件学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (34, '信息与商务管理学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (35, '数字艺术设计学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (36, '健康医疗科技学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (37, '国际教育学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (38, '马克思主义学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (39, '外国语学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (40, '高等职业技术学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (41, '基础教学学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (42, '创新创业学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (43, '退役军人教育学院', NULL, NULL, 32);
INSERT INTO `m_department` VALUES (44, '华南师范大学', '广东省佛山市南海区狮山镇狮山大学城华南师范大学（南海校区）', NULL, NULL);
INSERT INTO `m_department` VALUES (45, '国际商学院', NULL, NULL, 44);
INSERT INTO `m_department` VALUES (46, '软件学院', NULL, NULL, 44);
INSERT INTO `m_department` VALUES (47, '职业教育学院', NULL, NULL, 44);
INSERT INTO `m_department` VALUES (48, '国际联合学院', NULL, NULL, 44);
INSERT INTO `m_department` VALUES (49, '南海学院', NULL, NULL, 44);
INSERT INTO `m_department` VALUES (50, '工学部', NULL, NULL, 44);
INSERT INTO `m_department` VALUES (51, '北斗研究院', NULL, NULL, 44);
INSERT INTO `m_department` VALUES (52, '阿伯丁数据科学与人工智能学院', NULL, NULL, 44);
INSERT INTO `m_department` VALUES (53, '广东轻工职业技术学院', '广东省佛山市南海区狮山镇狮山大学城广东轻工职业技术学院（南海校区）', NULL, NULL);
INSERT INTO `m_department` VALUES (54, '信息技术学院', NULL, NULL, 53);
INSERT INTO `m_department` VALUES (55, '软件技术', NULL, NULL, 54);
INSERT INTO `m_department` VALUES (56, '软件201', NULL, NULL, 55);
INSERT INTO `m_department` VALUES (57, '软件202', NULL, NULL, 55);
INSERT INTO `m_department` VALUES (58, '软件203', NULL, NULL, 55);
INSERT INTO `m_department` VALUES (59, '软件204', NULL, NULL, 55);
INSERT INTO `m_department` VALUES (60, '软件205', NULL, NULL, 55);
INSERT INTO `m_department` VALUES (61, '数字媒体技术', NULL, NULL, 53);
INSERT INTO `m_department` VALUES (62, '数媒201', NULL, NULL, 61);
INSERT INTO `m_department` VALUES (63, '数媒202', NULL, NULL, 61);
INSERT INTO `m_department` VALUES (64, '数媒203', NULL, NULL, 61);
INSERT INTO `m_department` VALUES (65, '人工智能技术应用', NULL, NULL, 54);
INSERT INTO `m_department` VALUES (66, '智能201', NULL, NULL, 65);
INSERT INTO `m_department` VALUES (67, '机电技术学院', NULL, NULL, 53);
INSERT INTO `m_department` VALUES (68, '工业机器人', NULL, NULL, 67);
INSERT INTO `m_department` VALUES (69, '机器人201', NULL, NULL, 68);
INSERT INTO `m_department` VALUES (70, '机器人202', NULL, NULL, 68);
INSERT INTO `m_department` VALUES (71, '电气自动化技术', NULL, NULL, 67);
INSERT INTO `m_department` VALUES (72, '电气201', NULL, NULL, 71);
INSERT INTO `m_department` VALUES (73, '艺术设计学院', NULL, NULL, 53);
INSERT INTO `m_department` VALUES (74, '生态技术学院', NULL, '名字没变好像', 53);
INSERT INTO `m_department` VALUES (77, '创新201', NULL, NULL, 76);
INSERT INTO `m_department` VALUES (80, '信息技术学院', NULL, NULL, 79);

-- ----------------------------
-- Table structure for m_facility
-- ----------------------------
DROP TABLE IF EXISTS `m_facility`;
CREATE TABLE `m_facility`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，设备的唯一标识',
  `facility_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `facility_state` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '空闲' COMMENT '设备状态',
  `buy_time` datetime NULL DEFAULT NULL COMMENT '设备购入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_facility
-- ----------------------------
INSERT INTO `m_facility` VALUES (1, '实训楼闸机1', '空闲', '2022-06-23 00:59:18');
INSERT INTO `m_facility` VALUES (2, '实训楼闸机2', '空闲', '2022-06-23 00:59:22');
INSERT INTO `m_facility` VALUES (3, '实训楼闸机3', '工作中', '2022-06-23 00:59:25');
INSERT INTO `m_facility` VALUES (4, '教学楼闸机1', '空闲', '2022-06-23 01:21:01');
INSERT INTO `m_facility` VALUES (5, '教学楼闸机2', '工作中', '2022-06-23 01:21:03');
INSERT INTO `m_facility` VALUES (6, '教学楼闸机3', '空闲', '2022-06-23 01:21:07');
INSERT INTO `m_facility` VALUES (7, '实训楼闸机4', '空闲', '2022-06-23 01:20:54');

-- ----------------------------
-- Table structure for m_facility_room
-- ----------------------------
DROP TABLE IF EXISTS `m_facility_room`;
CREATE TABLE `m_facility_room`  (
  `facilityid` int NOT NULL COMMENT '闸机id',
  `roomid` int NOT NULL COMMENT '会议室id',
  INDEX `facilityid`(`facilityid`) USING BTREE,
  INDEX `roomid`(`roomid`) USING BTREE,
  CONSTRAINT `m_facility_room_ibfk_1` FOREIGN KEY (`facilityid`) REFERENCES `m_facility` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `m_facility_room_ibfk_2` FOREIGN KEY (`roomid`) REFERENCES `m_room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_facility_room
-- ----------------------------
INSERT INTO `m_facility_room` VALUES (1, 2);

-- ----------------------------
-- Table structure for m_meeting
-- ----------------------------
DROP TABLE IF EXISTS `m_meeting`;
CREATE TABLE `m_meeting`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增,会议标号标识',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '会议创建时间',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会议名',
  `link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会议链接',
  `introduce` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会议介绍',
  `update_time` datetime NULL DEFAULT NULL COMMENT '会议更新时间',
  `meeting_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会议时间段',
  `sign_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会议签到时间，默认为会议开始时间',
  `sign_number` int NULL DEFAULT NULL COMMENT '签到人数',
  `user_number` int NULL DEFAULT NULL COMMENT '到会人数',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会议信息',
  `online` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否为线上会议',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_meeting
-- ----------------------------
INSERT INTO `m_meeting` VALUES (83, '2022-07-05 20:58:37', '易起记录', 'http://www.baidu.com', '读书是通往梦想的一个途径，读一本好书，让我们得以明净如水，开阔视野，丰富阅历，益于人生。人一生就是一条路，在这条路上的跋涉痕迹成为我们每个人一生的轨迹，此路不可能走第二次，而在人生的道路上，我们所见的风景是有限的。书籍就是望远镜，书籍就是一盏明灯，让我们看得更远、更清晰。', '2022-07-05 20:58:37', '2022-07-05 19:45-22:00', '2022-07-05 20:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (84, '2022-07-05 21:04:58', '软件203主题班会', 'http://www.baidu.com', '', '2022-07-05 21:04:58', '2022-07-06 10:30-13:00', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (85, '2022-07-05 21:05:45', '软件202主题班会', 'http://www.baidu.com', '', '2022-07-05 21:05:45', '2022-07-07 17:00-22:00', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (86, '2022-07-05 21:06:37', '软件201主题班会', 'http://www.baidu.com', '', '2022-07-05 21:06:37', '2022-07-09 15:00-18:00', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (87, '2022-07-05 21:07:18', '数媒203主题班会', 'http://www.baidu.com', '', '2022-07-05 21:07:18', '2022-07-08 07:00-11:00', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (88, '2022-07-05 21:09:04', '果蔬识别项目讲解', 'http://www.baidu.com', '', '2022-07-05 21:09:04', '2022-07-10 08:00-10:00', '', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (95, '2022-07-06 01:19:40', '产品研发会', 'http://www.baidu.com', '明确产品研发方向，加速产品研发效率，提高产品研发品质。', '2022-07-06 01:19:40', '2022-07-06 08:30-10:30', '2022-07-06 08:00', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (98, '2022-07-07 17:09:39', '软件204暑期安全教育', 'http://www.baidu.com', '', '2022-07-07 17:09:39', '2022-07-07 15:30-17:30', '2022-07-07 15:30', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (99, '2022-07-07 23:15:05', '学习时代的“功勋”', 'http://www.baidu.com', '这个单元主要讲述的是屠呦呦研发青蒿素的故事，从相关国家寻求中国帮助开始，一直到青蒿素研发成功。', '2022-07-07 23:15:05', '2022-07-11 10:30-11:30', '2022-07-11 10:00', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (100, '2022-07-07 23:15:19', '书法协会书画比赛展览', 'http://www.baidu.com', '今年恰逢建党一百周年，为了让同学们以更好地面貌迎接我们伟大祖国“两个一百年”的第一个一百年，鼓励学习党史，让每一位新时代青年积极弘扬和践行社会主义核心价值观，让青春奋斗在美好新时代上。特举行本次书画比赛征集作品并展览。', '2022-07-07 23:15:19', '2022-07-12 13:00-15:30', '2022-07-12 12:00', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (101, '2022-07-07 23:15:36', '阅读分享会', 'http://www.baidu.com', '“以书在会友”', '2022-07-07 23:15:36', '2022-07-13 14:30-17:30', '2022-07-13 13:30', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (102, '2022-07-07 23:26:29', '每日一书，经典导读', 'http://www.baidu.com', '', '2022-07-07 23:26:29', '2022-07-14 08:30-11:30', '', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (103, '2022-07-07 23:27:01', '红色教育主题', 'http://www.baidu.com', '发扬党史，弘扬红色革命精神', '2022-07-07 23:27:01', '2022-07-15 14:45-17:30', '', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (104, '2022-07-07 23:29:26', '仲夏篇越·观仲夏话剧', 'http://www.baidu.com', '永远年轻！永远热泪盈眶！感受话剧魅力。', '2022-07-07 23:29:26', '2022-07-16 13:00-16:00', '', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (105, '2022-07-08 10:44:33', '422', 'http://www.baidu.com', '2542333', '2022-07-08 10:44:33', '2022-07-08 01:15-01:45', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (106, '2022-07-08 11:48:02', '软件204暑期安全教育', 'http://www.baidu.com', '', '2022-07-08 11:48:02', '2022-07-07 15:30-17:30', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (107, '2022-07-08 11:53:57', '学习屈原精神，弘扬爱国精神', 'http://www.baidu.com', '开展向先烈学习爱国精神活动，引领共青团员树立爱国精神，薪火相传爱国精神血脉，主动投入爱国实际运动中去，无论何时何地，带着爱国情怀，不负国家不负人民；把爱国之情转化为报国之志，时时想到国家，处处想到人民。', '2022-07-08 11:53:57', '2022-07-07 02:30-05:30', '2022-07-07 02:30', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (108, '2022-07-27 17:21:29', '毛概研练课', 'http://www.baidu.com', '2022学年第一期', '2022-07-27 17:21:29', '2022-07-27 05:00-08:30', '2022-07-27 04:30', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (109, '2022-07-31 02:50:57', '软件204暑期实践会', 'http://www.baidu.com', '本次会议由实践委员主持', '2022-07-31 02:50:57', '2022-07-31 00:45-01:45', '2022-07-31 00:15', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (111, '2022-07-31 16:41:19', '实践会补充', 'http://www.baidu.com', '', '2022-07-31 16:41:19', '2022-07-31 01:45-02:30', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (115, '2022-07-31 23:12:54', '软件杯预赛', 'http://www.baidu.com', '软件杯预赛，测试项目', '2022-07-31 23:12:54', '2022-07-31 12:00-14:00', '2022-07-31 11:30', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (116, '2022-08-01 17:25:36', '民间艺术我来说', 'http://www.baidu.com', '通过演讲的方式，不仅让同学们更加深入地了解中国传统的民间艺术，而且可以让更多人学习民间艺术，更好地传承发扬民间艺术。', '2022-08-01 17:25:36', '2022-08-01 08:00-10:30', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (117, '2022-08-01 17:48:26', '图书科普活动', 'http://www.baidu.com', '参与活动的同学须自带一本书籍', '2022-08-01 17:48:26', '2022-08-01 14:00-15:45', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (128, '2022-08-02 09:40:11', '绘心中地球，做生态守护者', 'http://www.baidu.com', '世界地球日是个为世界环境保护而设立的节日，与我们的环境工程技术专业息息相关。为了提高同学们对于现有环境问题的认识，宣传环境保护等理念，在这个意义重大的节日，拟举办本次活动。', '2022-08-02 09:40:11', '2022-07-10 08:30-10:30', '', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (145, '2022-08-11 02:56:24', '软件204主题班会', '', '返校前的注意事项', '2022-08-11 02:56:24', '2022-08-11 03:00-03:15', '2022-08-11 03:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (148, '2022-08-11 19:17:41', '决赛预赛', '', '', '2022-08-11 19:17:41', '2022-08-11 20:00-21:00', '2022-08-11 19:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (149, '2022-08-11 20:41:57', '绘心中地球，做生态守护者', '', '世界地球日是个为世界环境保护而设立的节日，与我们的环境工程技术专业息息相关。为了提高同学们对于现有环境问题的认识，宣传环境保护等理念，在这个意义重大的节日，拟举办本次活动。', '2022-08-11 20:41:57', '2022-08-11 21:00-23:30', '2022-08-11 20:30', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (150, '2022-08-11 20:43:14', '民间艺术我来说', '', '通过演讲的方式，不仅让同学们更加深入地了解中国传统的民间艺术，而且可以让更多人学习民间艺术，更好地传承发扬民间艺术。', '2022-08-11 20:43:14', '2022-08-11 20:00-23:45', '2022-08-11 20:00', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (151, '2022-08-11 20:44:27', '	 图书科普活动', '', '参与活动的同学须自带一本书籍', '2022-08-11 20:44:27', '2022-08-11 20:00-23:45', '2022-08-11 20:00', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (152, '2022-08-11 20:56:28', '软件204主题班会', '', '', '2022-08-11 20:56:28', '2022-08-11 20:45-23:45', '2022-08-11 20:45', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (153, '2022-08-11 21:25:46', '软件204主题班会', '', '', '2022-08-11 21:25:46', '2022-08-11 20:00-23:45', '2022-08-11 19:30', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (154, '2022-08-11 21:32:50', '软件204', '', '', '2022-08-11 21:32:50', '2022-08-11 05:15-21:15', '2022-08-11 05:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (155, '2022-08-11 21:39:35', '软件204', '', '', '2022-08-11 21:39:35', '2022-08-11 12:45-23:45', '2022-08-11 12:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (156, '2022-08-11 22:15:38', 'qqqqqqq', '', '', '2022-08-11 22:15:38', '2022-08-11 05:00-17:00', '2022-08-11 05:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (157, '2022-08-11 22:16:34', 'sdasdad', '', '', '2022-08-11 22:16:34', '2022-08-11 00:15-03:45', '2022-08-11 00:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (158, '2022-08-12 14:26:33', '软件204', '', '', '2022-08-12 14:26:33', '2022-08-12 00:15-22:00', '2022-08-12 00:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (159, '2022-08-12 14:58:56', '软件204主题班会', '', '', '2022-08-12 14:58:56', '2022-08-12 05:30-23:45', '2022-08-12 05:30', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (160, '2022-08-12 15:12:04', '11111111', '', '', '2022-08-12 15:12:04', '2022-08-12 04:15-09:15', '2022-08-12 04:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (161, '2022-08-12 15:13:35', '哇大大大', '', '', '2022-08-12 15:13:35', '2022-08-12 00:15-06:00', '2022-08-12 00:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (162, '2022-08-12 15:16:01', '啊实打实大大', '', '', '2022-08-12 15:16:01', '2022-08-12 01:15-06:15', '2022-08-12 01:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (163, '2022-08-12 15:18:32', '疫情防控主题班会', '', '', '2022-08-12 15:18:32', '2022-08-12 03:30-20:30', '2022-08-12 03:30', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (164, '2022-08-12 15:22:07', '软件204主题班会', '', '', '2022-08-12 15:22:07', '2022-08-12 11:45-22:30', '2022-08-12 11:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (165, '2022-08-12 15:25:56', '软件204主题班会', '', '', '2022-08-12 15:25:56', '2022-08-12 08:00-18:45', '2022-08-12 07:30', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (166, '2022-08-12 16:53:38', 'aaa', '', '', '2022-08-12 16:53:38', '2022-08-12 00:00-00:15', '2022-08-12 00:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (167, '2022-08-12 22:36:39', '123', '', '', '2022-08-12 22:36:39', '2022-08-12 00:30-01:45', '2022-08-12 00:30', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (168, '2022-08-12 23:47:06', '333333', '', '', '2022-08-12 23:47:06', '2022-08-12 05:00-13:15', '2022-08-12 05:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (169, '2022-08-12 23:47:32', '311111', '', '', '2022-08-12 23:47:32', '2022-08-12 03:00-14:30', '2022-08-12 03:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (170, '2022-08-12 23:59:57', '33333', '', '', '2022-08-12 23:59:57', '2022-08-12 00:00-00:30', '2022-08-12 00:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (171, '2022-08-13 00:00:16', '111111', '', '', '2022-08-13 00:00:16', '2022-08-12 00:00-00:30', '2022-08-12 00:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (172, '2022-08-13 00:02:02', '2222', '', '', '2022-08-13 00:02:02', '2022-08-13 00:00-00:30', '2022-08-13 00:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (173, '2022-08-13 00:02:31', '5555', '', '', '2022-08-13 00:02:31', '2022-08-13 00:00-00:30', '2022-08-13 00:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (174, '2022-08-13 00:03:01', '8888', '', '', '2022-08-13 00:03:01', '2022-08-13 00:00-00:30', '2022-08-13 00:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (175, '2022-08-13 00:03:27', '6+465', '', '', '2022-08-13 00:03:27', '2022-08-13 00:00-00:30', '2022-08-13 00:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (176, '2022-08-13 17:06:15', '软件204', '', '', '2022-08-13 17:06:15', '2022-08-13 00:00-23:45', '2022-08-13 00:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (177, '2022-08-13 21:45:00', '软件204疫情防控主题班会', '', '', '2022-08-13 21:45:00', '2022-08-13 20:45-23:30', '2022-08-13 20:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (178, '2022-08-13 22:18:14', '软件204主题班会', '', '', '2022-08-13 22:18:14', '2022-08-13 11:30-23:45', '2022-08-13 11:00', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (179, '2022-08-13 22:23:41', '软件204主题班会', '', '', '2022-08-13 22:23:41', '2022-08-13 14:45-23:45', '2022-08-13 13:45', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (180, '2022-08-13 22:44:12', '软件204主题班会', '', '', '2022-08-13 22:44:12', '2022-08-13 11:00-23:45', '2022-08-13 11:00', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (181, '2022-08-14 08:57:26', '疫情防控', '', '', '2022-08-14 08:57:26', '2022-08-14 00:15-22:15', '2022-08-14 00:15', NULL, NULL, NULL, 0, 0);
INSERT INTO `m_meeting` VALUES (182, '2022-08-14 09:08:02', '测试', '', '', '2022-08-14 09:08:02', '2022-08-14 01:45-22:00', '2022-08-14 01:15', NULL, NULL, NULL, 0, 1);
INSERT INTO `m_meeting` VALUES (183, '2022-08-14 11:41:58', '软件', '', '', '2022-08-14 11:41:58', '2022-08-14 10:30-18:15', '2022-08-14 10:30', NULL, NULL, NULL, 0, 1);

-- ----------------------------
-- Table structure for m_meeting_room
-- ----------------------------
DROP TABLE IF EXISTS `m_meeting_room`;
CREATE TABLE `m_meeting_room`  (
  `meetingid` int NOT NULL COMMENT '会议id',
  `roomid` int NOT NULL COMMENT '会议室id',
  INDEX `roomid`(`roomid`) USING BTREE,
  INDEX `meetingid`(`meetingid`) USING BTREE,
  CONSTRAINT `m_meeting_room_ibfk_2` FOREIGN KEY (`roomid`) REFERENCES `m_room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `m_meeting_room_ibfk_3` FOREIGN KEY (`meetingid`) REFERENCES `m_meeting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_meeting_room
-- ----------------------------
INSERT INTO `m_meeting_room` VALUES (84, 3);
INSERT INTO `m_meeting_room` VALUES (85, 1);
INSERT INTO `m_meeting_room` VALUES (86, 5);
INSERT INTO `m_meeting_room` VALUES (87, 2);
INSERT INTO `m_meeting_room` VALUES (102, 1);
INSERT INTO `m_meeting_room` VALUES (104, 1);
INSERT INTO `m_meeting_room` VALUES (88, 1);
INSERT INTO `m_meeting_room` VALUES (103, 1);
INSERT INTO `m_meeting_room` VALUES (105, 1);
INSERT INTO `m_meeting_room` VALUES (106, 1);
INSERT INTO `m_meeting_room` VALUES (83, 1);
INSERT INTO `m_meeting_room` VALUES (111, 1);
INSERT INTO `m_meeting_room` VALUES (116, 1);
INSERT INTO `m_meeting_room` VALUES (117, 1);
INSERT INTO `m_meeting_room` VALUES (128, 1);
INSERT INTO `m_meeting_room` VALUES (148, 1);
INSERT INTO `m_meeting_room` VALUES (145, 1);
INSERT INTO `m_meeting_room` VALUES (150, 2);
INSERT INTO `m_meeting_room` VALUES (151, 16);
INSERT INTO `m_meeting_room` VALUES (152, 4);
INSERT INTO `m_meeting_room` VALUES (153, 14);
INSERT INTO `m_meeting_room` VALUES (154, 13);
INSERT INTO `m_meeting_room` VALUES (155, 7);
INSERT INTO `m_meeting_room` VALUES (156, 1);
INSERT INTO `m_meeting_room` VALUES (157, 1);
INSERT INTO `m_meeting_room` VALUES (98, 1);
INSERT INTO `m_meeting_room` VALUES (99, 7);
INSERT INTO `m_meeting_room` VALUES (100, 16);
INSERT INTO `m_meeting_room` VALUES (101, 6);
INSERT INTO `m_meeting_room` VALUES (107, 3);
INSERT INTO `m_meeting_room` VALUES (108, 3);
INSERT INTO `m_meeting_room` VALUES (109, 1);
INSERT INTO `m_meeting_room` VALUES (115, 2);
INSERT INTO `m_meeting_room` VALUES (149, 1);
INSERT INTO `m_meeting_room` VALUES (95, 1);
INSERT INTO `m_meeting_room` VALUES (158, 1);
INSERT INTO `m_meeting_room` VALUES (159, 15);
INSERT INTO `m_meeting_room` VALUES (160, 22);
INSERT INTO `m_meeting_room` VALUES (161, 16);
INSERT INTO `m_meeting_room` VALUES (162, 5);
INSERT INTO `m_meeting_room` VALUES (163, 1);
INSERT INTO `m_meeting_room` VALUES (164, 22);
INSERT INTO `m_meeting_room` VALUES (165, 22);
INSERT INTO `m_meeting_room` VALUES (166, 1);
INSERT INTO `m_meeting_room` VALUES (167, 23);
INSERT INTO `m_meeting_room` VALUES (168, 23);
INSERT INTO `m_meeting_room` VALUES (169, 23);
INSERT INTO `m_meeting_room` VALUES (170, 23);
INSERT INTO `m_meeting_room` VALUES (171, 1);
INSERT INTO `m_meeting_room` VALUES (172, 23);
INSERT INTO `m_meeting_room` VALUES (173, 1);
INSERT INTO `m_meeting_room` VALUES (174, 23);
INSERT INTO `m_meeting_room` VALUES (175, 23);
INSERT INTO `m_meeting_room` VALUES (176, 1);
INSERT INTO `m_meeting_room` VALUES (177, 1);
INSERT INTO `m_meeting_room` VALUES (179, 16);
INSERT INTO `m_meeting_room` VALUES (180, 1);
INSERT INTO `m_meeting_room` VALUES (181, 23);
INSERT INTO `m_meeting_room` VALUES (182, 23);
INSERT INTO `m_meeting_room` VALUES (183, 1);

-- ----------------------------
-- Table structure for m_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_menu`;
CREATE TABLE `m_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单编号标识',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `path` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `parent_id` int NULL DEFAULT NULL COMMENT '父菜单id',
  `icon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `introduce` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `m_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `m_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_menu
-- ----------------------------
INSERT INTO `m_menu` VALUES (1, '我的会议', '/myMeeting', NULL, 'icon-me', NULL);
INSERT INTO `m_menu` VALUES (2, '快速预定', '/fastMeeting', NULL, 'icon-table-report', NULL);
INSERT INTO `m_menu` VALUES (3, '预定会议', '/createMeeting', NULL, 'icon-add-picture', NULL);
INSERT INTO `m_menu` VALUES (4, '会议管理', '/meeting/index', NULL, 'icon-notepad', NULL);
INSERT INTO `m_menu` VALUES (5, '会议室管理', '/meetingRoom', NULL, 'icon-city', NULL);
INSERT INTO `m_menu` VALUES (6, '系统管理', '/system', NULL, 'icon-setting-two', '管理员权限才能开启');
INSERT INTO `m_menu` VALUES (7, '用户管理', '/system/user', 6, 'icon-people-search', NULL);
INSERT INTO `m_menu` VALUES (8, '角色管理', '/system/role', 6, 'icon-data-user', NULL);
INSERT INTO `m_menu` VALUES (9, '菜单管理', '/system/menu', 6, 'icon-notebook-one', NULL);
INSERT INTO `m_menu` VALUES (10, '个人中心', '/personal', 9, 'icon-personal-privacy', NULL);

-- ----------------------------
-- Table structure for m_power
-- ----------------------------
DROP TABLE IF EXISTS `m_power`;
CREATE TABLE `m_power`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，表的唯一标识',
  `power` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '普通用户，管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_power
-- ----------------------------
INSERT INTO `m_power` VALUES (1, '普通用户');
INSERT INTO `m_power` VALUES (2, '管理员');

-- ----------------------------
-- Table structure for m_power_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_power_menu`;
CREATE TABLE `m_power_menu`  (
  `power_id` int NOT NULL COMMENT '权限表id',
  `menu_id` int NOT NULL COMMENT '角色表id',
  INDEX `power_id`(`power_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `m_power_menu_ibfk_1` FOREIGN KEY (`power_id`) REFERENCES `m_power` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `m_power_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `m_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_power_menu
-- ----------------------------
INSERT INTO `m_power_menu` VALUES (1, 1);
INSERT INTO `m_power_menu` VALUES (1, 2);
INSERT INTO `m_power_menu` VALUES (1, 3);
INSERT INTO `m_power_menu` VALUES (1, 4);
INSERT INTO `m_power_menu` VALUES (1, 5);
INSERT INTO `m_power_menu` VALUES (1, 10);
INSERT INTO `m_power_menu` VALUES (2, 1);
INSERT INTO `m_power_menu` VALUES (2, 2);
INSERT INTO `m_power_menu` VALUES (2, 3);
INSERT INTO `m_power_menu` VALUES (2, 4);
INSERT INTO `m_power_menu` VALUES (2, 5);
INSERT INTO `m_power_menu` VALUES (2, 6);
INSERT INTO `m_power_menu` VALUES (2, 10);

-- ----------------------------
-- Table structure for m_role
-- ----------------------------
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE `m_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，普通用户id的外键,角色编号',
  `power` int NULL DEFAULT 1 COMMENT '权限等级,默认值为1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_role
-- ----------------------------
INSERT INTO `m_role` VALUES (1, 1);
INSERT INTO `m_role` VALUES (2, 2);
INSERT INTO `m_role` VALUES (3, 3);

-- ----------------------------
-- Table structure for m_room
-- ----------------------------
DROP TABLE IF EXISTS `m_room`;
CREATE TABLE `m_room`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增,会议室标识',
  `room_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会议室名',
  `room_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会议室地址',
  `peoples` int NOT NULL COMMENT '容纳人数',
  `meetroom_state` int NULL DEFAULT 1 COMMENT '会议室状态，默认1为可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_room
-- ----------------------------
INSERT INTO `m_room` VALUES (1, '实训楼B407', '第四工业实训楼', 50, 1);
INSERT INTO `m_room` VALUES (2, '实训楼B409', '第四工业实训楼', 100, 1);
INSERT INTO `m_room` VALUES (3, '实训楼B411-412', '第四工业实训楼', 150, 1);
INSERT INTO `m_room` VALUES (4, '实训楼B501', '第四工业实训楼', 80, 1);
INSERT INTO `m_room` VALUES (5, '实训楼B502', '第四工业实训楼', 80, 1);
INSERT INTO `m_room` VALUES (6, '实训楼B505', '第四工业实训楼', 90, 0);
INSERT INTO `m_room` VALUES (7, '教学楼1108', '鲤鱼池旁', 50, 1);
INSERT INTO `m_room` VALUES (9, '教学楼1109', '鲤鱼池旁', 50, 1);
INSERT INTO `m_room` VALUES (10, '教学楼2101', '鲤鱼池旁', 50, 1);
INSERT INTO `m_room` VALUES (13, '教学楼2103', '鲤鱼池旁', 40, 1);
INSERT INTO `m_room` VALUES (14, '教学楼2105', '一楼小卖部上层', 60, 1);
INSERT INTO `m_room` VALUES (15, '教学楼2107', '一楼小卖部上层', 60, 1);
INSERT INTO `m_room` VALUES (16, '图书馆现刊阅览室', '图书馆一楼大门左侧', 200, 1);
INSERT INTO `m_room` VALUES (22, '实训楼C509', '实训楼C509', 100, 1);
INSERT INTO `m_room` VALUES (23, '云会议室', '云端会议室', 1000, 1);

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，用户的唯一描述',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qq邮箱',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `power` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '普通用户' COMMENT '用户权限',
  `nickname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注名',
  `sex` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  `face_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '人脸照片存放地址，图片命名：邮箱_名称.jpg',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/images/head/default.jpg' COMMENT '头像照片存放地址',
  `introduce` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户描述',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 371 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES (1, '2105584602@qq.com', '184ba9bc8cef24b070795957bc64add7', '郑运航', '管理员', 'B.M', '男', 18, '13411068357', '/images/face/2105584602@qq.com_郑运航.jpg', '/images/head/2105584602@qq.com_郑运航.jpg', '', '218.13.27.109');
INSERT INTO `m_user` VALUES (11, '2608301182@qq.com', '184ba9bc8cef24b070795957bc64add7', '林照杰', '管理员', 'lzj', '男', 20, '15218371917', '/images/face/2608301182@qq.com_林照杰.jpg', '/images/head/null_林照杰.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (14, '1020504303@qq.com', '184ba9bc8cef24b070795957bc64add7', '陈佳鹏', '普通用户', NULL, '男', 20, '18100271374', '/images/face/1020504303@qq.com_陈佳鹏.jpg', '/images/head/1020504303@qq.com_陈佳鹏.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (16, '1020504335@qq.com', '39dab449a6049bc0649322da9cb0c92a', '张敬文', '普通用户', NULL, '男', 21, '13059355211', '/images/face/1020504335@qq.com_张敬文.jpg', '/images/head/1020504335@qq.com_张敬文.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (17, '25365675621@qq.com', '184ba9bc8cef24b070795957bc64add7', '郭泽邦', '普通用户', NULL, '男', 21, NULL, '/images/face/25365675621@qq.com_郭泽邦.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (18, '13204@qq.com', '39dab449a6049bc0649322da9cb0c92a', '秦玉芹', '普通用户', NULL, '女', 19, NULL, '/images/face/13204@qq.com_秦玉芹.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (19, '2023610205043@qq.com', '184ba9bc8cef24b070795957bc64add7', '黄晓斌', '普通用户', '软件204黄晓斌', '男', 30, NULL, '/images/face/2023610205043@qq.com_黄晓斌.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (20, '1020504309@qq.com', '184ba9bc8cef24b070795957bc64add7', '黄泽天', '普通用户', NULL, '男', 20, NULL, '/images/face/1020504309@qq.com_黄泽天.jpg', '/images/head/1020504309@qq.com_黄泽天.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (22, '1545522767@qq.com', 'b3bbc2771f5aa08f7f038f6ad5c3f7c6', '丘丹丹', '普通用户', NULL, '女', 18, NULL, '/images/face/1545522767@qq.com_丘丹丹.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (23, '1020504312@qq.com', '39dab449a6049bc0649322da9cb0c92a', '李芷欣', '普通用户', NULL, '女', 19, NULL, '/images/face/1020504312@qq.com_李芷欣.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (24, '1020504313@qq.com', '39dab449a6049bc0649322da9cb0c92a', '梁颖怡', '普通用户', NULL, '女', 18, NULL, '/images/face/1020504313@qq.com_梁颖怡.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (25, '1020504318@qq.com', '0b53f76ab90417a7a07aadc9924201b7', '刘晓杰', '普通用户', NULL, '男', 21, NULL, '/images/face/1020504318@qq.com_刘晓杰.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (26, '1020504315@qq.com', '0c728c954c9f3cf53c6f26c16626e9aa', '林蒋平', '普通用户', NULL, '男', 21, NULL, '/images/face/1020504315@qq.com_林蒋平.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (30, '1020504319@qq.com', 'dbcdce5c64a122a266f9e60aa5d331a1', '卢玮桐', '普通用户', NULL, '男', 22, NULL, '/images/face/1020504319@qq.com_卢玮桐.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (31, '1020504321@qq.com', '517c93e3f553f8cce898da27d27b72bd', '彭舒宝', '普通用户', NULL, '男', 21, '13828611546', '/images/face/1020504321@qq.com_彭舒宝.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (32, '1020504322@qq.com', '4ce4e65c04ad170d374673e40215d7b9', '彭伟峰', '普通用户', NULL, '男', 19, '15975734202', '/images/face/1020504322@qq.com_彭伟峰.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (35, '1020504325@qq.com', '0b53f76ab90417a7a07aadc9924201b7', '覃美凤', '普通用户', NULL, '女', 17, '17846888706', '/images/face/1020504325@qq.com_覃美凤.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (36, '1020504326@qq.com', '0b53f76ab90417a7a07aadc9924201b7', '王彬', '普通用户', NULL, '男', 20, '18026000455', '/images/face/1020504326@qq.com_王彬.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (37, '1020504327@qq.com', '231654a2ad9679660d751371db5bede1', '王锴鸿', '普通用户', NULL, '男', 21, '13580190438', '/images/face/1020504327@qq.com_王锴鸿.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (38, '1020504328@qq.com', '264a07a8dfc80f6f988b256bfea76602', '王幸聪', '普通用户', NULL, '男', 22, '14718158646', '/images/face/1020504328@qq.com_王幸聪.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (39, '1020504329@qq.com', '0b53f76ab90417a7a07aadc9924201b7', '王振权', '普通用户', NULL, '男', 21, '15816106282', '/images/face/1020504329@qq.com_王振权.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (41, '1020504332@qq.com', 'bb3a3a69ed5940fa3c8b5886769e2d55', '徐少丽', '普通用户', NULL, '女', 19, '15814941884', '/images/face/1020504332@qq.com_徐少丽.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (43, '1020504334@qq.com', '9724f18eeb1f492b0670170a650a33cc', '许可滢', '普通用户', NULL, '女', 18, NULL, '/images/face/1020504334@qq.com_许可滢.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (45, '1020504336@qq.com', '7536abd58960ef076d91b2d2677065cb', '张壮壮', '普通用户', NULL, '男', 21, NULL, '/images/face/1020504336@qq.com_张壮壮.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (46, '1020504337@qq.com', '27e7bcc28698a57982cb576b2ab01231', '郑雁钿', '普通用户', NULL, '男', 20, NULL, '/images/face/1020504337@qq.com_郑雁钿.jpg', '/images/head/default.jpg', NULL, NULL);
INSERT INTO `m_user` VALUES (152, '1020504307@qq.com', '066639993e04fca88c40ecb06da5b1da', '胡丹敏', '普通用户', NULL, '女', 18, '17875119323', '/images/face/1020504307@qq.com_胡丹敏.jpg', '/images/head/default.jpg', NULL, NULL);

-- ----------------------------
-- Table structure for m_user_department
-- ----------------------------
DROP TABLE IF EXISTS `m_user_department`;
CREATE TABLE `m_user_department`  (
  `userid` int NOT NULL COMMENT '用户id',
  `departmentid` int NOT NULL COMMENT '部门id',
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `departmentid`(`departmentid`) USING BTREE,
  CONSTRAINT `m_user_department_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `m_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `m_user_department_ibfk_2` FOREIGN KEY (`departmentid`) REFERENCES `m_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_user_department
-- ----------------------------
INSERT INTO `m_user_department` VALUES (11, 59);
INSERT INTO `m_user_department` VALUES (14, 59);
INSERT INTO `m_user_department` VALUES (16, 59);
INSERT INTO `m_user_department` VALUES (17, 59);
INSERT INTO `m_user_department` VALUES (18, 59);
INSERT INTO `m_user_department` VALUES (19, 59);
INSERT INTO `m_user_department` VALUES (20, 59);
INSERT INTO `m_user_department` VALUES (22, 59);
INSERT INTO `m_user_department` VALUES (23, 59);
INSERT INTO `m_user_department` VALUES (24, 59);
INSERT INTO `m_user_department` VALUES (25, 59);
INSERT INTO `m_user_department` VALUES (26, 59);
INSERT INTO `m_user_department` VALUES (30, 59);
INSERT INTO `m_user_department` VALUES (31, 59);
INSERT INTO `m_user_department` VALUES (32, 59);
INSERT INTO `m_user_department` VALUES (35, 59);
INSERT INTO `m_user_department` VALUES (45, 59);
INSERT INTO `m_user_department` VALUES (1, 59);

-- ----------------------------
-- Table structure for m_user_meeting
-- ----------------------------
DROP TABLE IF EXISTS `m_user_meeting`;
CREATE TABLE `m_user_meeting`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，会议数据标识',
  `um_power` int NOT NULL DEFAULT 1 COMMENT '用户在本会议的权限',
  `create_time` datetime NULL DEFAULT NULL COMMENT '会议数据创建时间',
  `user_id` int NOT NULL COMMENT '非空，外键，关联用户id',
  `meeting_id` int NOT NULL COMMENT '非空，外键，关联会议id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '会议数据更新时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '签到或进入会议时间	',
  `state` int NULL DEFAULT 0 COMMENT '签到状态,默认0未签到，1为刷脸签到，2为代签',
  `end_time` datetime NULL DEFAULT NULL COMMENT '签退或离开会议时间	',
  `deleted` int UNSIGNED NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_user`(`user_id`) USING BTREE,
  INDEX `metting_id_metting`(`meeting_id`) USING BTREE,
  CONSTRAINT `metting_id_metting` FOREIGN KEY (`meeting_id`) REFERENCES `m_meeting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id_user` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1970 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_user_meeting
-- ----------------------------
INSERT INTO `m_user_meeting` VALUES (364, 1, '2022-07-05 21:28:19', 1, 84, '2022-07-05 21:28:19', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (367, 1, '2022-07-05 21:28:19', 11, 84, '2022-07-05 21:28:19', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (369, 1, '2022-07-05 21:28:19', 19, 84, '2022-07-05 21:28:19', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (370, 1, '2022-07-05 21:28:19', 20, 84, '2022-07-05 21:28:19', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (372, 1, '2022-07-05 21:28:19', 22, 84, '2022-07-05 21:28:19', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (373, 1, '2022-07-05 21:28:19', 23, 84, '2022-07-05 21:28:19', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (374, 1, '2022-07-05 21:28:19', 24, 84, '2022-07-05 21:28:19', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (375, 1, '2022-07-05 21:28:19', 25, 84, '2022-07-05 21:28:19', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (376, 1, '2022-07-05 21:28:19', 26, 84, '2022-07-05 21:28:19', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (384, 3, '2022-07-06 01:19:40', 11, 95, '2022-07-06 01:19:40', '2022-08-10 12:58:06', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (385, 1, '2022-07-06 01:19:40', 1, 95, '2022-07-06 01:19:40', '2022-08-10 12:58:13', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (389, 1, '2022-07-06 01:19:40', 19, 95, '2022-07-06 01:19:40', '2022-08-11 11:32:19', 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (401, 3, '2022-07-07 17:09:39', 11, 98, '2022-07-07 17:09:39', '2022-07-07 20:32:19', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (471, 1, '2022-07-07 17:51:33', 1, 98, '2022-07-07 17:51:33', '2022-07-07 20:32:22', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (474, 1, '2022-07-07 17:51:33', 14, 98, '2022-07-07 17:51:33', '2022-08-10 00:24:25', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (477, 1, '2022-07-07 17:51:33', 39, 98, '2022-07-07 17:51:33', '2022-08-10 00:18:04', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (480, 1, '2022-07-07 17:51:33', 36, 98, '2022-07-07 17:51:33', '2022-07-08 12:04:01', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (483, 3, '2022-07-07 23:15:05', 11, 99, '2022-07-07 23:15:05', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (484, 3, '2022-07-07 23:15:19', 11, 100, '2022-07-07 23:15:19', '2022-08-01 02:25:06', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (485, 3, '2022-07-07 23:15:36', 11, 101, '2022-07-07 23:15:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (494, 3, '2022-07-08 10:44:33', 11, 105, '2022-07-08 10:44:33', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (495, 3, '2022-07-08 11:48:02', 11, 106, '2022-07-08 11:48:02', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (496, 1, '2022-07-08 11:48:02', 1, 106, '2022-07-08 11:48:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (500, 1, '2022-07-08 11:48:02', 14, 106, '2022-07-08 11:48:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (502, 1, '2022-07-08 11:48:02', 39, 106, '2022-07-08 11:48:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (506, 1, '2022-07-08 11:48:02', 35, 106, '2022-07-08 11:48:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (507, 1, '2022-07-08 11:48:02', 36, 106, '2022-07-08 11:48:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (508, 1, '2022-07-08 11:48:02', 23, 106, '2022-07-08 11:48:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (509, 1, '2022-07-08 11:48:02', 24, 106, '2022-07-08 11:48:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (513, 3, '2022-07-08 11:53:57', 11, 107, '2022-07-08 11:53:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (519, 1, '2022-07-27 15:32:30', 1, 83, '2022-07-27 15:32:30', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (521, 1, '2022-07-27 15:32:30', 11, 83, '2022-07-27 15:32:30', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (523, 1, '2022-07-27 15:32:30', 19, 83, '2022-07-27 15:32:30', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (524, 3, '2022-07-27 17:21:29', 11, 108, '2022-07-27 17:21:29', '2022-07-27 17:32:52', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (525, 1, '2022-07-27 17:21:29', 20, 108, '2022-07-27 17:21:29', '2022-07-27 17:33:07', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (598, 3, '2022-07-31 02:50:58', 11, 109, '2022-07-31 02:50:58', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (610, 3, '2022-07-31 16:41:19', 11, 111, '2022-07-31 16:41:19', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (622, 3, '2022-07-31 23:12:54', 11, 115, '2022-07-31 23:12:54', '2022-08-11 00:57:44', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (624, 1, '2022-07-31 23:12:54', 1, 115, '2022-07-31 23:12:54', '2022-08-11 00:59:26', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (638, 1, '2022-08-01 01:06:40', 30, 107, '2022-08-01 01:06:40', '2022-08-01 03:08:49', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (660, 1, '2022-08-01 01:08:50', 1, 109, '2022-08-01 01:08:50', '2022-08-10 12:59:19', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (670, 3, '2022-08-01 17:25:36', 11, 116, '2022-08-01 17:25:36', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (671, 3, '2022-08-01 17:48:26', 11, 117, '2022-08-01 17:48:26', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (812, 3, '2022-08-02 09:40:11', 1, 128, '2022-08-02 09:40:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1084, 3, '2022-08-11 02:56:24', 11, 145, '2022-08-11 02:56:24', '2022-08-11 20:14:13', 2, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1150, 3, '2022-08-11 19:17:41', 11, 148, '2022-08-11 19:17:41', '2022-08-11 19:26:23', 1, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1152, 1, '2022-08-11 19:17:41', 14, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1153, 1, '2022-08-11 19:17:41', 16, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1154, 1, '2022-08-11 19:17:41', 17, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1155, 1, '2022-08-11 19:17:41', 18, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1156, 1, '2022-08-11 19:17:41', 19, 148, '2022-08-11 19:17:41', '2022-08-11 19:44:45', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1157, 1, '2022-08-11 19:17:41', 20, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1158, 1, '2022-08-11 19:17:41', 22, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1159, 1, '2022-08-11 19:17:41', 23, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1160, 1, '2022-08-11 19:17:41', 24, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1161, 1, '2022-08-11 19:17:41', 25, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1162, 1, '2022-08-11 19:17:41', 26, 148, '2022-08-11 19:17:41', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1163, 1, '2022-08-11 19:17:42', 30, 148, '2022-08-11 19:17:42', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1164, 1, '2022-08-11 19:17:42', 31, 148, '2022-08-11 19:17:42', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1165, 1, '2022-08-11 19:17:42', 32, 148, '2022-08-11 19:17:42', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1166, 1, '2022-08-11 19:17:42', 35, 148, '2022-08-11 19:17:42', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1168, 1, '2022-08-11 19:17:42', 45, 148, '2022-08-11 19:17:42', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1169, 1, '2022-08-11 19:17:42', 1, 148, '2022-08-11 19:17:42', '2022-08-11 19:48:33', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1172, 1, '2022-08-11 19:58:36', 1, 145, '2022-08-11 19:58:36', '2022-08-11 20:09:39', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1174, 1, '2022-08-11 19:58:36', 14, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1175, 1, '2022-08-11 19:58:36', 16, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1176, 1, '2022-08-11 19:58:36', 17, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1177, 1, '2022-08-11 19:58:36', 18, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1178, 1, '2022-08-11 19:58:36', 19, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1179, 1, '2022-08-11 19:58:36', 20, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1180, 1, '2022-08-11 19:58:36', 22, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1181, 1, '2022-08-11 19:58:36', 23, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1182, 1, '2022-08-11 19:58:36', 24, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1183, 1, '2022-08-11 19:58:36', 25, 145, '2022-08-11 19:58:36', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1184, 1, '2022-08-11 19:58:37', 26, 145, '2022-08-11 19:58:37', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1185, 1, '2022-08-11 19:58:37', 30, 145, '2022-08-11 19:58:37', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1186, 1, '2022-08-11 19:58:37', 31, 145, '2022-08-11 19:58:37', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1187, 1, '2022-08-11 19:58:37', 32, 145, '2022-08-11 19:58:37', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1188, 1, '2022-08-11 19:58:37', 35, 145, '2022-08-11 19:58:37', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1190, 1, '2022-08-11 19:58:37', 45, 145, '2022-08-11 19:58:37', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1193, 3, '2022-08-11 20:41:57', 11, 149, '2022-08-11 20:41:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1215, 3, '2022-08-11 20:43:14', 11, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1217, 1, '2022-08-11 20:43:14', 14, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1218, 1, '2022-08-11 20:43:14', 16, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1219, 1, '2022-08-11 20:43:14', 17, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1220, 1, '2022-08-11 20:43:14', 18, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1221, 1, '2022-08-11 20:43:14', 19, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1222, 1, '2022-08-11 20:43:14', 20, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1223, 1, '2022-08-11 20:43:14', 22, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1224, 1, '2022-08-11 20:43:14', 23, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1225, 1, '2022-08-11 20:43:14', 24, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1226, 1, '2022-08-11 20:43:14', 25, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1227, 1, '2022-08-11 20:43:14', 26, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1228, 1, '2022-08-11 20:43:14', 30, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1229, 1, '2022-08-11 20:43:14', 31, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1230, 1, '2022-08-11 20:43:14', 32, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1231, 1, '2022-08-11 20:43:14', 35, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1233, 1, '2022-08-11 20:43:14', 45, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1234, 1, '2022-08-11 20:43:14', 1, 150, '2022-08-11 20:43:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1237, 3, '2022-08-11 20:44:27', 11, 151, '2022-08-11 20:44:27', '2022-08-11 23:01:01', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1239, 1, '2022-08-11 20:44:27', 14, 151, '2022-08-11 20:44:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1240, 1, '2022-08-11 20:44:27', 16, 151, '2022-08-11 20:44:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1241, 1, '2022-08-11 20:44:27', 17, 151, '2022-08-11 20:44:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1242, 1, '2022-08-11 20:44:27', 18, 151, '2022-08-11 20:44:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1243, 1, '2022-08-11 20:44:28', 19, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1244, 1, '2022-08-11 20:44:28', 20, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1245, 1, '2022-08-11 20:44:28', 22, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1246, 1, '2022-08-11 20:44:28', 23, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1247, 1, '2022-08-11 20:44:28', 24, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1248, 1, '2022-08-11 20:44:28', 25, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1249, 1, '2022-08-11 20:44:28', 26, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1250, 1, '2022-08-11 20:44:28', 30, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1251, 1, '2022-08-11 20:44:28', 31, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1252, 1, '2022-08-11 20:44:28', 32, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1253, 1, '2022-08-11 20:44:28', 35, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1255, 1, '2022-08-11 20:44:28', 45, 151, '2022-08-11 20:44:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1256, 1, '2022-08-11 20:44:28', 1, 151, '2022-08-11 20:44:28', '2022-08-11 22:40:45', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1260, 1, '2022-08-11 20:56:28', 11, 152, '2022-08-11 20:56:28', '2022-08-11 21:08:06', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1268, 3, '2022-08-11 21:25:46', 11, 153, '2022-08-11 21:25:46', '2022-08-11 23:04:26', 1, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1296, 1, '2022-08-11 21:26:04', 1, 153, '2022-08-11 21:26:04', '2022-08-11 23:01:52', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1298, 1, '2022-08-11 21:26:04', 14, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1299, 1, '2022-08-11 21:26:04', 16, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1300, 1, '2022-08-11 21:26:04', 17, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1301, 1, '2022-08-11 21:26:04', 18, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1302, 1, '2022-08-11 21:26:04', 19, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1303, 1, '2022-08-11 21:26:04', 20, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1304, 1, '2022-08-11 21:26:04', 22, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1305, 1, '2022-08-11 21:26:04', 23, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1306, 1, '2022-08-11 21:26:04', 24, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1307, 1, '2022-08-11 21:26:04', 25, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1308, 1, '2022-08-11 21:26:04', 26, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1309, 1, '2022-08-11 21:26:04', 30, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1310, 1, '2022-08-11 21:26:04', 31, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1311, 1, '2022-08-11 21:26:04', 32, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1312, 1, '2022-08-11 21:26:04', 35, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1313, 1, '2022-08-11 21:26:04', 45, 153, '2022-08-11 21:26:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1316, 3, '2022-08-11 21:32:51', 11, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1318, 1, '2022-08-11 21:32:51', 14, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1319, 1, '2022-08-11 21:32:51', 16, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1320, 1, '2022-08-11 21:32:51', 17, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1321, 1, '2022-08-11 21:32:51', 18, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1322, 1, '2022-08-11 21:32:51', 19, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1323, 1, '2022-08-11 21:32:51', 20, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1324, 1, '2022-08-11 21:32:51', 22, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1325, 1, '2022-08-11 21:32:51', 23, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1326, 1, '2022-08-11 21:32:51', 24, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1327, 1, '2022-08-11 21:32:51', 25, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1328, 1, '2022-08-11 21:32:51', 26, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1329, 1, '2022-08-11 21:32:51', 30, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1330, 1, '2022-08-11 21:32:51', 31, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1331, 1, '2022-08-11 21:32:51', 32, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1332, 1, '2022-08-11 21:32:51', 35, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1333, 1, '2022-08-11 21:32:51', 45, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1334, 1, '2022-08-11 21:32:51', 1, 154, '2022-08-11 21:32:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1337, 3, '2022-08-11 21:39:35', 11, 155, '2022-08-11 21:39:35', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1365, 1, '2022-08-11 21:39:51', 1, 155, '2022-08-11 21:39:51', '2022-08-11 21:41:08', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1367, 1, '2022-08-11 21:39:51', 14, 155, '2022-08-11 21:39:51', '2022-08-11 21:44:25', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1368, 1, '2022-08-11 21:39:52', 16, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1369, 1, '2022-08-11 21:39:52', 17, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1370, 1, '2022-08-11 21:39:52', 18, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1371, 1, '2022-08-11 21:39:52', 19, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1372, 1, '2022-08-11 21:39:52', 20, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1373, 1, '2022-08-11 21:39:52', 22, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1374, 1, '2022-08-11 21:39:52', 23, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1375, 1, '2022-08-11 21:39:52', 24, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1376, 1, '2022-08-11 21:39:52', 25, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1377, 1, '2022-08-11 21:39:52', 26, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1378, 1, '2022-08-11 21:39:52', 30, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1379, 1, '2022-08-11 21:39:52', 31, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1380, 1, '2022-08-11 21:39:52', 32, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1381, 1, '2022-08-11 21:39:52', 35, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1382, 1, '2022-08-11 21:39:52', 36, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1383, 1, '2022-08-11 21:39:52', 37, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1384, 1, '2022-08-11 21:39:52', 38, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1385, 1, '2022-08-11 21:39:52', 39, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1386, 1, '2022-08-11 21:39:52', 41, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1387, 1, '2022-08-11 21:39:52', 43, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1388, 1, '2022-08-11 21:39:52', 45, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1389, 1, '2022-08-11 21:39:52', 46, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1391, 1, '2022-08-11 21:39:52', 152, 155, '2022-08-11 21:39:52', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1401, 3, '2022-08-11 22:15:38', 11, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1403, 1, '2022-08-11 22:15:38', 14, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1404, 1, '2022-08-11 22:15:38', 16, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1405, 1, '2022-08-11 22:15:38', 17, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1406, 1, '2022-08-11 22:15:38', 18, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1407, 1, '2022-08-11 22:15:38', 19, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1408, 1, '2022-08-11 22:15:38', 20, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1409, 1, '2022-08-11 22:15:38', 22, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1410, 1, '2022-08-11 22:15:38', 23, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1411, 1, '2022-08-11 22:15:38', 24, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1412, 1, '2022-08-11 22:15:38', 25, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1413, 1, '2022-08-11 22:15:38', 26, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1414, 1, '2022-08-11 22:15:38', 30, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1415, 1, '2022-08-11 22:15:38', 31, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1416, 1, '2022-08-11 22:15:38', 32, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1417, 1, '2022-08-11 22:15:38', 35, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1418, 1, '2022-08-11 22:15:38', 45, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1419, 1, '2022-08-11 22:15:38', 1, 156, '2022-08-11 22:15:38', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1422, 3, '2022-08-11 22:16:34', 11, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1424, 1, '2022-08-11 22:16:34', 14, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1425, 1, '2022-08-11 22:16:34', 16, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1426, 1, '2022-08-11 22:16:34', 17, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1427, 1, '2022-08-11 22:16:34', 18, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1428, 1, '2022-08-11 22:16:34', 19, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1429, 1, '2022-08-11 22:16:34', 20, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1430, 1, '2022-08-11 22:16:34', 22, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1431, 1, '2022-08-11 22:16:34', 23, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1432, 1, '2022-08-11 22:16:34', 24, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1433, 1, '2022-08-11 22:16:34', 25, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1434, 1, '2022-08-11 22:16:34', 26, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1435, 1, '2022-08-11 22:16:34', 30, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1436, 1, '2022-08-11 22:16:34', 31, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1437, 1, '2022-08-11 22:16:34', 32, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1438, 1, '2022-08-11 22:16:34', 35, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1439, 1, '2022-08-11 22:16:34', 45, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1440, 1, '2022-08-11 22:16:34', 1, 157, '2022-08-11 22:16:34', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1442, 1, '2022-08-11 22:30:26', 23, 98, '2022-08-11 22:30:26', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1443, 1, '2022-08-11 22:30:26', 24, 98, '2022-08-11 22:30:26', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1444, 1, '2022-08-11 22:30:26', 35, 98, '2022-08-11 22:30:26', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1445, 1, '2022-08-11 22:30:54', 1, 107, '2022-08-11 22:30:54', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1446, 1, '2022-08-11 22:30:54', 31, 107, '2022-08-11 22:30:54', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1447, 1, '2022-08-11 22:30:54', 32, 107, '2022-08-11 22:30:54', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1448, 1, '2022-08-11 22:30:59', 1, 108, '2022-08-11 22:30:59', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1450, 1, '2022-08-11 22:30:59', 14, 108, '2022-08-11 22:30:59', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1451, 1, '2022-08-11 22:30:59', 18, 108, '2022-08-11 22:30:59', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1452, 1, '2022-08-11 22:30:59', 19, 108, '2022-08-11 22:30:59', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1453, 1, '2022-08-11 22:30:59', 22, 108, '2022-08-11 22:30:59', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1454, 1, '2022-08-11 22:31:00', 23, 108, '2022-08-11 22:31:00', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1455, 1, '2022-08-11 22:31:00', 24, 108, '2022-08-11 22:31:00', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1456, 1, '2022-08-11 22:31:00', 25, 108, '2022-08-11 22:31:00', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1457, 1, '2022-08-11 22:31:00', 26, 108, '2022-08-11 22:31:00', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1458, 1, '2022-08-11 22:31:00', 35, 108, '2022-08-11 22:31:00', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1459, 1, '2022-08-11 22:31:00', 36, 108, '2022-08-11 22:31:00', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1460, 1, '2022-08-11 22:31:00', 39, 108, '2022-08-11 22:31:00', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1461, 1, '2022-08-11 22:31:06', 45, 109, '2022-08-11 22:31:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1462, 1, '2022-08-11 22:31:10', 14, 115, '2022-08-11 22:31:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1464, 1, '2022-08-11 22:31:10', 152, 115, '2022-08-11 22:31:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1465, 1, '2022-08-11 22:31:15', 1, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1467, 1, '2022-08-11 22:31:15', 14, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1468, 1, '2022-08-11 22:31:15', 16, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1469, 1, '2022-08-11 22:31:15', 17, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1470, 1, '2022-08-11 22:31:15', 18, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1471, 1, '2022-08-11 22:31:15', 19, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1472, 1, '2022-08-11 22:31:15', 20, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1473, 1, '2022-08-11 22:31:15', 22, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1474, 1, '2022-08-11 22:31:15', 23, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1475, 1, '2022-08-11 22:31:15', 24, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1476, 1, '2022-08-11 22:31:15', 25, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1477, 1, '2022-08-11 22:31:15', 26, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1478, 1, '2022-08-11 22:31:15', 30, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1479, 1, '2022-08-11 22:31:15', 31, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1480, 1, '2022-08-11 22:31:15', 32, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1481, 1, '2022-08-11 22:31:15', 35, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1482, 1, '2022-08-11 22:31:15', 45, 149, '2022-08-11 22:31:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1486, 1, '2022-08-12 12:06:35', 14, 95, '2022-08-12 12:06:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1487, 1, '2022-08-12 12:06:35', 16, 95, '2022-08-12 12:06:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1488, 1, '2022-08-12 12:06:35', 18, 95, '2022-08-12 12:06:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1489, 1, '2022-08-12 12:06:35', 20, 95, '2022-08-12 12:06:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1490, 3, '2022-08-12 14:26:33', 11, 158, '2022-08-12 14:26:33', '2022-08-12 14:52:18', 1, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1491, 1, '2022-08-12 14:26:33', 14, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1492, 1, '2022-08-12 14:26:33', 16, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1493, 1, '2022-08-12 14:26:33', 17, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1494, 1, '2022-08-12 14:26:33', 18, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1495, 1, '2022-08-12 14:26:33', 19, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1496, 1, '2022-08-12 14:26:33', 20, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1497, 1, '2022-08-12 14:26:33', 22, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1498, 1, '2022-08-12 14:26:33', 23, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1499, 1, '2022-08-12 14:26:33', 24, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1500, 1, '2022-08-12 14:26:33', 25, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1501, 1, '2022-08-12 14:26:33', 26, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1502, 1, '2022-08-12 14:26:33', 30, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1503, 1, '2022-08-12 14:26:33', 31, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1504, 1, '2022-08-12 14:26:33', 32, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1505, 1, '2022-08-12 14:26:33', 35, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1506, 1, '2022-08-12 14:26:33', 45, 158, '2022-08-12 14:26:33', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1507, 1, '2022-08-12 14:26:33', 1, 158, '2022-08-12 14:26:33', '2022-08-12 14:52:12', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1509, 3, '2022-08-12 14:58:56', 11, 159, '2022-08-12 14:58:56', '2022-08-12 15:00:06', 1, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1535, 1, '2022-08-12 14:59:08', 1, 159, '2022-08-12 14:59:08', '2022-08-12 14:59:41', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1536, 1, '2022-08-12 14:59:08', 14, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1537, 1, '2022-08-12 14:59:08', 16, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1538, 1, '2022-08-12 14:59:08', 17, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1539, 1, '2022-08-12 14:59:08', 18, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1540, 1, '2022-08-12 14:59:08', 19, 159, '2022-08-12 14:59:08', '2022-08-12 15:04:18', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1541, 1, '2022-08-12 14:59:08', 20, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1542, 1, '2022-08-12 14:59:08', 22, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1543, 1, '2022-08-12 14:59:08', 23, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1544, 1, '2022-08-12 14:59:08', 24, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1545, 1, '2022-08-12 14:59:08', 25, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1546, 1, '2022-08-12 14:59:08', 26, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1547, 1, '2022-08-12 14:59:08', 30, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1548, 1, '2022-08-12 14:59:08', 31, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1549, 1, '2022-08-12 14:59:08', 32, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1550, 1, '2022-08-12 14:59:08', 35, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1551, 1, '2022-08-12 14:59:08', 45, 159, '2022-08-12 14:59:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1553, 3, '2022-08-12 15:12:04', 11, 160, '2022-08-12 15:12:04', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1554, 1, '2022-08-12 15:12:04', 14, 160, '2022-08-12 15:12:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1555, 1, '2022-08-12 15:12:04', 16, 160, '2022-08-12 15:12:04', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1559, 3, '2022-08-12 15:13:35', 11, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1560, 1, '2022-08-12 15:13:35', 14, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1561, 1, '2022-08-12 15:13:35', 16, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1562, 1, '2022-08-12 15:13:35', 17, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1563, 1, '2022-08-12 15:13:35', 18, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1564, 1, '2022-08-12 15:13:35', 19, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1565, 1, '2022-08-12 15:13:35', 20, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1566, 1, '2022-08-12 15:13:35', 22, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1567, 1, '2022-08-12 15:13:35', 23, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1568, 1, '2022-08-12 15:13:35', 24, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1569, 1, '2022-08-12 15:13:35', 25, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1570, 1, '2022-08-12 15:13:35', 26, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1571, 1, '2022-08-12 15:13:35', 30, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1572, 1, '2022-08-12 15:13:35', 31, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1573, 1, '2022-08-12 15:13:35', 32, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1574, 1, '2022-08-12 15:13:35', 35, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1575, 1, '2022-08-12 15:13:35', 45, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1576, 1, '2022-08-12 15:13:35', 1, 161, '2022-08-12 15:13:35', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1585, 3, '2022-08-12 15:16:01', 11, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1586, 1, '2022-08-12 15:16:01', 14, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1587, 1, '2022-08-12 15:16:01', 16, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1588, 1, '2022-08-12 15:16:01', 17, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1589, 1, '2022-08-12 15:16:01', 18, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1590, 1, '2022-08-12 15:16:01', 19, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1591, 1, '2022-08-12 15:16:01', 20, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1592, 1, '2022-08-12 15:16:01', 22, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1593, 1, '2022-08-12 15:16:01', 23, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1594, 1, '2022-08-12 15:16:01', 24, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1595, 1, '2022-08-12 15:16:01', 25, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1596, 1, '2022-08-12 15:16:01', 26, 162, '2022-08-12 15:16:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1597, 1, '2022-08-12 15:16:02', 30, 162, '2022-08-12 15:16:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1598, 1, '2022-08-12 15:16:02', 31, 162, '2022-08-12 15:16:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1599, 1, '2022-08-12 15:16:02', 32, 162, '2022-08-12 15:16:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1600, 1, '2022-08-12 15:16:03', 35, 162, '2022-08-12 15:16:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1601, 1, '2022-08-12 15:16:03', 45, 162, '2022-08-12 15:16:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1602, 1, '2022-08-12 15:16:03', 1, 162, '2022-08-12 15:16:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1611, 3, '2022-08-12 15:18:32', 11, 163, '2022-08-12 15:18:32', '2022-08-12 15:19:44', 1, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1630, 1, '2022-08-12 15:19:18', 1, 163, '2022-08-12 15:19:18', '2022-08-12 15:19:33', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1631, 1, '2022-08-12 15:19:18', 14, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1632, 1, '2022-08-12 15:19:18', 16, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1633, 1, '2022-08-12 15:19:18', 17, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1634, 1, '2022-08-12 15:19:18', 18, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1635, 1, '2022-08-12 15:19:18', 19, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1636, 1, '2022-08-12 15:19:18', 20, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1637, 1, '2022-08-12 15:19:18', 22, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1638, 1, '2022-08-12 15:19:18', 23, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1639, 1, '2022-08-12 15:19:18', 24, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1640, 1, '2022-08-12 15:19:18', 25, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1641, 1, '2022-08-12 15:19:18', 26, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1642, 1, '2022-08-12 15:19:18', 30, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1643, 1, '2022-08-12 15:19:18', 31, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1644, 1, '2022-08-12 15:19:18', 32, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1645, 1, '2022-08-12 15:19:18', 35, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1646, 1, '2022-08-12 15:19:18', 45, 163, '2022-08-12 15:19:18', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1648, 3, '2022-08-12 15:22:07', 11, 164, '2022-08-12 15:22:07', '2022-08-12 15:22:49', 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1649, 1, '2022-08-12 15:22:07', 14, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1650, 1, '2022-08-12 15:22:07', 16, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1651, 1, '2022-08-12 15:22:07', 17, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1652, 1, '2022-08-12 15:22:07', 18, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1653, 1, '2022-08-12 15:22:07', 19, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1654, 1, '2022-08-12 15:22:07', 20, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1655, 1, '2022-08-12 15:22:07', 22, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1656, 1, '2022-08-12 15:22:07', 23, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1657, 1, '2022-08-12 15:22:07', 24, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1658, 1, '2022-08-12 15:22:07', 25, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1659, 1, '2022-08-12 15:22:07', 26, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1660, 1, '2022-08-12 15:22:07', 30, 164, '2022-08-12 15:22:07', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1661, 1, '2022-08-12 15:22:08', 31, 164, '2022-08-12 15:22:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1662, 1, '2022-08-12 15:22:08', 32, 164, '2022-08-12 15:22:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1663, 1, '2022-08-12 15:22:08', 35, 164, '2022-08-12 15:22:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1664, 1, '2022-08-12 15:22:08', 45, 164, '2022-08-12 15:22:08', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1665, 1, '2022-08-12 15:22:08', 1, 164, '2022-08-12 15:22:08', '2022-08-12 15:22:44', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1674, 3, '2022-08-12 15:25:56', 11, 165, '2022-08-12 15:25:56', '2022-08-12 15:26:50', 1, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1675, 1, '2022-08-12 15:25:56', 14, 165, '2022-08-12 15:25:56', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1676, 1, '2022-08-12 15:25:56', 16, 165, '2022-08-12 15:25:56', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1677, 1, '2022-08-12 15:25:56', 17, 165, '2022-08-12 15:25:56', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1678, 1, '2022-08-12 15:25:56', 18, 165, '2022-08-12 15:25:56', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1679, 1, '2022-08-12 15:25:56', 19, 165, '2022-08-12 15:25:56', '2022-08-12 15:34:45', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1680, 1, '2022-08-12 15:25:57', 20, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1681, 1, '2022-08-12 15:25:57', 22, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1682, 1, '2022-08-12 15:25:57', 23, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1683, 1, '2022-08-12 15:25:57', 24, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1684, 1, '2022-08-12 15:25:57', 25, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1685, 1, '2022-08-12 15:25:57', 26, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1686, 1, '2022-08-12 15:25:57', 30, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1687, 1, '2022-08-12 15:25:57', 31, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1688, 1, '2022-08-12 15:25:57', 32, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1689, 1, '2022-08-12 15:25:57', 35, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1690, 1, '2022-08-12 15:25:57', 45, 165, '2022-08-12 15:25:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1691, 1, '2022-08-12 15:25:57', 1, 165, '2022-08-12 15:25:57', '2022-08-12 15:26:32', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1700, 3, '2022-08-12 16:53:38', 11, 166, '2022-08-12 16:53:38', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1702, 3, '2022-08-12 22:36:39', 1, 167, '2022-08-12 22:36:39', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1703, 1, '2022-08-12 22:37:01', 11, 167, '2022-08-12 22:37:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1704, 1, '2022-08-12 22:37:01', 14, 167, '2022-08-12 22:37:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1705, 1, '2022-08-12 22:37:01', 16, 167, '2022-08-12 22:37:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1706, 1, '2022-08-12 22:37:01', 18, 167, '2022-08-12 22:37:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1707, 3, '2022-08-12 23:47:06', 11, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1708, 1, '2022-08-12 23:47:06', 14, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1709, 1, '2022-08-12 23:47:06', 16, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1710, 1, '2022-08-12 23:47:06', 17, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1711, 1, '2022-08-12 23:47:06', 18, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1712, 1, '2022-08-12 23:47:06', 19, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1713, 1, '2022-08-12 23:47:06', 20, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1714, 1, '2022-08-12 23:47:06', 22, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1715, 1, '2022-08-12 23:47:06', 23, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1716, 1, '2022-08-12 23:47:06', 24, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1717, 1, '2022-08-12 23:47:06', 25, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1718, 1, '2022-08-12 23:47:06', 26, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1719, 1, '2022-08-12 23:47:06', 30, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1720, 1, '2022-08-12 23:47:06', 31, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1721, 1, '2022-08-12 23:47:06', 32, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1722, 1, '2022-08-12 23:47:06', 35, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1723, 1, '2022-08-12 23:47:06', 45, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1724, 1, '2022-08-12 23:47:06', 1, 168, '2022-08-12 23:47:06', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1726, 3, '2022-08-12 23:47:32', 11, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1727, 1, '2022-08-12 23:47:32', 14, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1728, 1, '2022-08-12 23:47:32', 16, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1729, 1, '2022-08-12 23:47:32', 17, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1730, 1, '2022-08-12 23:47:32', 18, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1731, 1, '2022-08-12 23:47:32', 19, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1732, 1, '2022-08-12 23:47:32', 20, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1733, 1, '2022-08-12 23:47:32', 22, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1734, 1, '2022-08-12 23:47:32', 23, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1735, 1, '2022-08-12 23:47:32', 24, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1736, 1, '2022-08-12 23:47:32', 25, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1737, 1, '2022-08-12 23:47:32', 26, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1738, 1, '2022-08-12 23:47:32', 30, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1739, 1, '2022-08-12 23:47:32', 31, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1740, 1, '2022-08-12 23:47:32', 32, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1741, 1, '2022-08-12 23:47:32', 35, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1742, 1, '2022-08-12 23:47:32', 45, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1743, 1, '2022-08-12 23:47:32', 1, 169, '2022-08-12 23:47:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1745, 3, '2022-08-12 23:59:57', 11, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1746, 1, '2022-08-12 23:59:57', 14, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1747, 1, '2022-08-12 23:59:57', 16, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1748, 1, '2022-08-12 23:59:57', 17, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1749, 1, '2022-08-12 23:59:57', 18, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1750, 1, '2022-08-12 23:59:57', 19, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1751, 1, '2022-08-12 23:59:57', 20, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1752, 1, '2022-08-12 23:59:57', 22, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1753, 1, '2022-08-12 23:59:57', 23, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1754, 1, '2022-08-12 23:59:57', 24, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1755, 1, '2022-08-12 23:59:57', 25, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1756, 1, '2022-08-12 23:59:57', 26, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1757, 1, '2022-08-12 23:59:57', 30, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1758, 1, '2022-08-12 23:59:57', 31, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1759, 1, '2022-08-12 23:59:57', 32, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1760, 1, '2022-08-12 23:59:57', 35, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1761, 1, '2022-08-12 23:59:57', 45, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1762, 1, '2022-08-12 23:59:57', 1, 170, '2022-08-12 23:59:57', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1764, 3, '2022-08-13 00:00:16', 11, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1765, 1, '2022-08-13 00:00:16', 14, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1766, 1, '2022-08-13 00:00:16', 16, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1767, 1, '2022-08-13 00:00:16', 17, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1768, 1, '2022-08-13 00:00:16', 18, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1769, 1, '2022-08-13 00:00:16', 19, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1770, 1, '2022-08-13 00:00:16', 20, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1771, 1, '2022-08-13 00:00:16', 22, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1772, 1, '2022-08-13 00:00:16', 23, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1773, 1, '2022-08-13 00:00:16', 24, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1774, 1, '2022-08-13 00:00:16', 25, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1775, 1, '2022-08-13 00:00:16', 26, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1776, 1, '2022-08-13 00:00:16', 30, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1777, 1, '2022-08-13 00:00:16', 31, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1778, 1, '2022-08-13 00:00:16', 32, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1779, 1, '2022-08-13 00:00:16', 35, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1780, 1, '2022-08-13 00:00:16', 45, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1781, 1, '2022-08-13 00:00:16', 1, 171, '2022-08-13 00:00:16', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1783, 3, '2022-08-13 00:02:02', 11, 172, '2022-08-13 00:02:02', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1784, 1, '2022-08-13 00:02:02', 14, 172, '2022-08-13 00:02:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1785, 1, '2022-08-13 00:02:02', 16, 172, '2022-08-13 00:02:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1786, 1, '2022-08-13 00:02:02', 17, 172, '2022-08-13 00:02:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1787, 1, '2022-08-13 00:02:02', 18, 172, '2022-08-13 00:02:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1788, 1, '2022-08-13 00:02:02', 19, 172, '2022-08-13 00:02:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1789, 1, '2022-08-13 00:02:02', 20, 172, '2022-08-13 00:02:02', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1790, 1, '2022-08-13 00:02:03', 22, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1791, 1, '2022-08-13 00:02:03', 23, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1792, 1, '2022-08-13 00:02:03', 24, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1793, 1, '2022-08-13 00:02:03', 25, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1794, 1, '2022-08-13 00:02:03', 26, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1795, 1, '2022-08-13 00:02:03', 30, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1796, 1, '2022-08-13 00:02:03', 31, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1797, 1, '2022-08-13 00:02:03', 32, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1798, 1, '2022-08-13 00:02:03', 35, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1799, 1, '2022-08-13 00:02:03', 45, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1800, 1, '2022-08-13 00:02:03', 1, 172, '2022-08-13 00:02:03', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1802, 3, '2022-08-13 00:02:31', 11, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1803, 1, '2022-08-13 00:02:31', 14, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1804, 1, '2022-08-13 00:02:31', 16, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1805, 1, '2022-08-13 00:02:31', 17, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1806, 1, '2022-08-13 00:02:31', 18, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1807, 1, '2022-08-13 00:02:31', 19, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1808, 1, '2022-08-13 00:02:31', 20, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1809, 1, '2022-08-13 00:02:31', 22, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1810, 1, '2022-08-13 00:02:31', 23, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1811, 1, '2022-08-13 00:02:31', 24, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1812, 1, '2022-08-13 00:02:31', 25, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1813, 1, '2022-08-13 00:02:31', 26, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1814, 1, '2022-08-13 00:02:31', 30, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1815, 1, '2022-08-13 00:02:31', 31, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1816, 1, '2022-08-13 00:02:31', 32, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1817, 1, '2022-08-13 00:02:31', 35, 173, '2022-08-13 00:02:31', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1818, 1, '2022-08-13 00:02:32', 45, 173, '2022-08-13 00:02:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1819, 1, '2022-08-13 00:02:32', 1, 173, '2022-08-13 00:02:32', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1821, 3, '2022-08-13 00:03:01', 11, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1822, 1, '2022-08-13 00:03:01', 14, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1823, 1, '2022-08-13 00:03:01', 16, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1824, 1, '2022-08-13 00:03:01', 17, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1825, 1, '2022-08-13 00:03:01', 18, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1826, 1, '2022-08-13 00:03:01', 19, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1827, 1, '2022-08-13 00:03:01', 20, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1828, 1, '2022-08-13 00:03:01', 22, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1829, 1, '2022-08-13 00:03:01', 23, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1830, 1, '2022-08-13 00:03:01', 24, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1831, 1, '2022-08-13 00:03:01', 25, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1832, 1, '2022-08-13 00:03:01', 26, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1833, 1, '2022-08-13 00:03:01', 30, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1834, 1, '2022-08-13 00:03:01', 31, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1835, 1, '2022-08-13 00:03:01', 32, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1836, 1, '2022-08-13 00:03:01', 35, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1837, 1, '2022-08-13 00:03:01', 45, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1838, 1, '2022-08-13 00:03:01', 1, 174, '2022-08-13 00:03:01', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1840, 3, '2022-08-13 00:03:27', 11, 175, '2022-08-13 00:03:27', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1841, 1, '2022-08-13 00:03:27', 14, 175, '2022-08-13 00:03:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1842, 1, '2022-08-13 00:03:27', 16, 175, '2022-08-13 00:03:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1843, 1, '2022-08-13 00:03:27', 17, 175, '2022-08-13 00:03:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1844, 1, '2022-08-13 00:03:27', 18, 175, '2022-08-13 00:03:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1845, 1, '2022-08-13 00:03:27', 19, 175, '2022-08-13 00:03:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1846, 1, '2022-08-13 00:03:27', 20, 175, '2022-08-13 00:03:27', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1847, 1, '2022-08-13 00:03:28', 22, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1848, 1, '2022-08-13 00:03:28', 23, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1849, 1, '2022-08-13 00:03:28', 24, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1850, 1, '2022-08-13 00:03:28', 25, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1851, 1, '2022-08-13 00:03:28', 26, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1852, 1, '2022-08-13 00:03:28', 30, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1853, 1, '2022-08-13 00:03:28', 31, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1854, 1, '2022-08-13 00:03:28', 32, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1855, 1, '2022-08-13 00:03:28', 35, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1856, 1, '2022-08-13 00:03:28', 45, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1857, 1, '2022-08-13 00:03:28', 1, 175, '2022-08-13 00:03:28', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1859, 3, '2022-08-13 17:06:15', 11, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (1860, 1, '2022-08-13 17:06:15', 14, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1861, 1, '2022-08-13 17:06:15', 16, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1862, 1, '2022-08-13 17:06:15', 17, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1863, 1, '2022-08-13 17:06:15', 18, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1864, 1, '2022-08-13 17:06:15', 19, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1865, 1, '2022-08-13 17:06:15', 20, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1866, 1, '2022-08-13 17:06:15', 22, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1867, 1, '2022-08-13 17:06:15', 23, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1868, 1, '2022-08-13 17:06:15', 24, 176, '2022-08-13 17:06:15', '2022-08-13 17:17:14', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1869, 1, '2022-08-13 17:06:15', 25, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1870, 1, '2022-08-13 17:06:15', 26, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1871, 1, '2022-08-13 17:06:15', 30, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1872, 1, '2022-08-13 17:06:15', 31, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1873, 1, '2022-08-13 17:06:15', 32, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1874, 1, '2022-08-13 17:06:15', 35, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1875, 1, '2022-08-13 17:06:15', 45, 176, '2022-08-13 17:06:15', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1876, 1, '2022-08-13 17:06:15', 1, 176, '2022-08-13 17:06:15', '2022-08-13 21:09:00', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1878, 3, '2022-08-13 21:45:00', 11, 177, '2022-08-13 21:45:00', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1904, 1, '2022-08-13 21:45:10', 1, 177, '2022-08-13 21:45:10', '2022-08-13 21:51:04', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1909, 1, '2022-08-13 21:45:10', 19, 177, '2022-08-13 21:45:10', '2022-08-13 21:48:10', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1929, 3, '2022-08-13 22:18:14', 11, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1930, 1, '2022-08-13 22:18:14', 14, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1931, 1, '2022-08-13 22:18:14', 16, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1932, 1, '2022-08-13 22:18:14', 17, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1933, 1, '2022-08-13 22:18:14', 18, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1934, 1, '2022-08-13 22:18:14', 19, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1935, 1, '2022-08-13 22:18:14', 20, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1936, 1, '2022-08-13 22:18:14', 22, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1937, 1, '2022-08-13 22:18:14', 23, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1938, 1, '2022-08-13 22:18:14', 24, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1939, 1, '2022-08-13 22:18:14', 25, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1940, 1, '2022-08-13 22:18:14', 26, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1941, 1, '2022-08-13 22:18:14', 30, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1942, 1, '2022-08-13 22:18:14', 31, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1943, 1, '2022-08-13 22:18:14', 32, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1944, 1, '2022-08-13 22:18:14', 35, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1945, 1, '2022-08-13 22:18:14', 45, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1946, 1, '2022-08-13 22:18:14', 1, 178, '2022-08-13 22:18:14', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1955, 1, '2022-08-13 22:18:29', 14, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1956, 1, '2022-08-13 22:18:29', 16, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1957, 1, '2022-08-13 22:18:29', 17, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1958, 1, '2022-08-13 22:18:29', 18, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1959, 1, '2022-08-13 22:18:29', 20, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1960, 1, '2022-08-13 22:18:29', 22, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1961, 1, '2022-08-13 22:18:29', 23, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1962, 1, '2022-08-13 22:18:29', 24, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1963, 1, '2022-08-13 22:18:29', 25, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1964, 1, '2022-08-13 22:18:29', 26, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1965, 1, '2022-08-13 22:18:29', 30, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1966, 1, '2022-08-13 22:18:29', 31, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1967, 1, '2022-08-13 22:18:29', 32, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1968, 1, '2022-08-13 22:18:29', 35, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1969, 1, '2022-08-13 22:18:29', 45, 177, '2022-08-13 22:18:29', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1970, 3, '2022-08-13 22:23:41', 11, 179, '2022-08-13 22:23:41', '2022-08-13 22:28:27', 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1990, 1, '2022-08-13 22:23:51', 1, 179, '2022-08-13 22:23:51', '2022-08-13 22:37:47', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1991, 1, '2022-08-13 22:23:51', 14, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1992, 1, '2022-08-13 22:23:51', 16, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1993, 1, '2022-08-13 22:23:51', 17, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1994, 1, '2022-08-13 22:23:51', 18, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1995, 1, '2022-08-13 22:23:51', 19, 179, '2022-08-13 22:23:51', '2022-08-13 22:29:22', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1996, 1, '2022-08-13 22:23:51', 20, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1997, 1, '2022-08-13 22:23:51', 22, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1998, 1, '2022-08-13 22:23:51', 23, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (1999, 1, '2022-08-13 22:23:51', 24, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2000, 1, '2022-08-13 22:23:51', 25, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2001, 1, '2022-08-13 22:23:51', 26, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2002, 1, '2022-08-13 22:23:51', 30, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2003, 1, '2022-08-13 22:23:51', 31, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2004, 1, '2022-08-13 22:23:51', 32, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2005, 1, '2022-08-13 22:23:51', 35, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2006, 1, '2022-08-13 22:23:51', 45, 179, '2022-08-13 22:23:51', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2009, 3, '2022-08-13 22:44:12', 11, 180, '2022-08-13 22:44:12', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (2031, 1, '2022-08-13 22:44:21', 1, 180, '2022-08-13 22:44:21', '2022-08-13 22:49:42', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2032, 1, '2022-08-13 22:44:21', 14, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2033, 1, '2022-08-13 22:44:21', 16, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2034, 1, '2022-08-13 22:44:21', 17, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2035, 1, '2022-08-13 22:44:21', 18, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2036, 1, '2022-08-13 22:44:21', 19, 180, '2022-08-13 22:44:21', '2022-08-13 22:45:33', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2037, 1, '2022-08-13 22:44:21', 20, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2038, 1, '2022-08-13 22:44:21', 22, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2039, 1, '2022-08-13 22:44:21', 23, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2040, 1, '2022-08-13 22:44:21', 24, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2041, 1, '2022-08-13 22:44:21', 25, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2042, 1, '2022-08-13 22:44:21', 26, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2043, 1, '2022-08-13 22:44:21', 30, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2044, 1, '2022-08-13 22:44:21', 31, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2045, 1, '2022-08-13 22:44:21', 32, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2046, 1, '2022-08-13 22:44:21', 35, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2047, 1, '2022-08-13 22:44:21', 45, 180, '2022-08-13 22:44:21', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2052, 3, '2022-08-14 08:57:26', 11, 181, '2022-08-14 08:57:26', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2069, 1, '2022-08-14 08:57:26', 1, 181, '2022-08-14 08:57:26', '2022-08-14 11:16:57', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2070, 1, '2022-08-14 09:04:10', 14, 181, '2022-08-14 09:04:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2071, 1, '2022-08-14 09:04:10', 16, 181, '2022-08-14 09:04:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2072, 1, '2022-08-14 09:04:10', 17, 181, '2022-08-14 09:04:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2073, 1, '2022-08-14 09:04:10', 18, 181, '2022-08-14 09:04:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2074, 1, '2022-08-14 09:04:10', 19, 181, '2022-08-14 09:04:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2075, 1, '2022-08-14 09:04:11', 20, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2076, 1, '2022-08-14 09:04:11', 22, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2077, 1, '2022-08-14 09:04:11', 23, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2078, 1, '2022-08-14 09:04:11', 24, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2079, 1, '2022-08-14 09:04:11', 25, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2080, 1, '2022-08-14 09:04:11', 26, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2081, 1, '2022-08-14 09:04:11', 30, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2082, 1, '2022-08-14 09:04:11', 31, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2083, 1, '2022-08-14 09:04:11', 32, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2084, 1, '2022-08-14 09:04:11', 35, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2085, 1, '2022-08-14 09:04:11', 45, 181, '2022-08-14 09:04:11', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2086, 3, '2022-08-14 09:08:02', 11, 182, '2022-08-14 09:08:02', NULL, 0, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (2112, 1, '2022-08-14 09:08:10', 1, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2113, 1, '2022-08-14 09:08:10', 14, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2114, 1, '2022-08-14 09:08:10', 16, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2115, 1, '2022-08-14 09:08:10', 17, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2116, 1, '2022-08-14 09:08:10', 18, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2117, 1, '2022-08-14 09:08:10', 19, 182, '2022-08-14 09:08:10', '2022-08-14 09:08:39', 2, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2118, 1, '2022-08-14 09:08:10', 20, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2119, 1, '2022-08-14 09:08:10', 22, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2120, 1, '2022-08-14 09:08:10', 23, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2121, 1, '2022-08-14 09:08:10', 24, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2122, 1, '2022-08-14 09:08:10', 25, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2123, 1, '2022-08-14 09:08:10', 26, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2124, 1, '2022-08-14 09:08:10', 30, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2125, 1, '2022-08-14 09:08:10', 31, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2126, 1, '2022-08-14 09:08:10', 32, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2127, 1, '2022-08-14 09:08:10', 35, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2128, 1, '2022-08-14 09:08:10', 45, 182, '2022-08-14 09:08:10', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2131, 3, '2022-08-14 11:41:58', 11, 183, '2022-08-14 11:41:58', '2022-08-14 14:32:41', 1, NULL, 1);
INSERT INTO `m_user_meeting` VALUES (2157, 1, '2022-08-14 11:42:53', 1, 183, '2022-08-14 11:42:53', '2022-08-14 11:43:14', 1, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2158, 1, '2022-08-14 11:42:53', 14, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2159, 1, '2022-08-14 11:42:53', 16, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2160, 1, '2022-08-14 11:42:53', 17, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2161, 1, '2022-08-14 11:42:53', 18, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2162, 1, '2022-08-14 11:42:53', 19, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2163, 1, '2022-08-14 11:42:53', 20, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2164, 1, '2022-08-14 11:42:53', 22, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2165, 1, '2022-08-14 11:42:53', 23, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2166, 1, '2022-08-14 11:42:53', 24, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2167, 1, '2022-08-14 11:42:53', 25, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2168, 1, '2022-08-14 11:42:53', 26, 183, '2022-08-14 11:42:53', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2169, 1, '2022-08-14 11:42:54', 30, 183, '2022-08-14 11:42:54', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2170, 1, '2022-08-14 11:42:54', 31, 183, '2022-08-14 11:42:54', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2171, 1, '2022-08-14 11:42:54', 32, 183, '2022-08-14 11:42:54', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2172, 1, '2022-08-14 11:42:54', 35, 183, '2022-08-14 11:42:54', NULL, 0, NULL, 0);
INSERT INTO `m_user_meeting` VALUES (2173, 1, '2022-08-14 11:42:54', 45, 183, '2022-08-14 11:42:54', NULL, 0, NULL, 0);

-- ----------------------------
-- Table structure for m_user_role
-- ----------------------------
DROP TABLE IF EXISTS `m_user_role`;
CREATE TABLE `m_user_role`  (
  `user_id` int NOT NULL COMMENT '用户表id',
  `role_id` int NOT NULL COMMENT '角色表id',
  INDEX `role_id_userrole`(`role_id`) USING BTREE,
  INDEX `user_id_userrole`(`user_id`) USING BTREE,
  CONSTRAINT `role_id_userrole` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id_userrole` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_user_role
-- ----------------------------
INSERT INTO `m_user_role` VALUES (1, 1);
INSERT INTO `m_user_role` VALUES (11, 1);
INSERT INTO `m_user_role` VALUES (14, 1);
INSERT INTO `m_user_role` VALUES (16, 1);
INSERT INTO `m_user_role` VALUES (17, 1);
INSERT INTO `m_user_role` VALUES (18, 1);
INSERT INTO `m_user_role` VALUES (19, 1);
INSERT INTO `m_user_role` VALUES (20, 1);
INSERT INTO `m_user_role` VALUES (22, 1);
INSERT INTO `m_user_role` VALUES (23, 1);
INSERT INTO `m_user_role` VALUES (24, 1);
INSERT INTO `m_user_role` VALUES (25, 1);
INSERT INTO `m_user_role` VALUES (26, 1);
INSERT INTO `m_user_role` VALUES (30, 1);
INSERT INTO `m_user_role` VALUES (31, 1);
INSERT INTO `m_user_role` VALUES (32, 1);
INSERT INTO `m_user_role` VALUES (35, 1);
INSERT INTO `m_user_role` VALUES (36, 1);
INSERT INTO `m_user_role` VALUES (37, 1);
INSERT INTO `m_user_role` VALUES (38, 1);
INSERT INTO `m_user_role` VALUES (39, 1);
INSERT INTO `m_user_role` VALUES (41, 1);
INSERT INTO `m_user_role` VALUES (43, 1);
INSERT INTO `m_user_role` VALUES (45, 1);
INSERT INTO `m_user_role` VALUES (46, 1);
INSERT INTO `m_user_role` VALUES (152, 1);

SET FOREIGN_KEY_CHECKS = 1;
