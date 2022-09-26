/*
 Navicat Premium Data Transfer

 Source Server         : mylocalhost
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : online_edu

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 17/02/2021 20:26:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1', '14', '第一章：HTML', 1, '2019-01-01 12:27:40', '2019-01-01 12:55:30');
INSERT INTO `edu_chapter` VALUES ('1228334375613800449', '1228334295938801665', '第一章：JAVA入门', 0, '2020-02-14 23:05:11', '2020-02-14 23:05:11');
INSERT INTO `edu_chapter` VALUES ('1228580087257669633', '1228580023630077954', '第一章：C++入门', 0, '2020-02-15 15:21:33', '2020-02-15 15:21:33');
INSERT INTO `edu_chapter` VALUES ('1229769072860512258', '1', '第一章：JAVA', 0, '2020-02-18 22:06:10', '2020-05-02 16:06:45');
INSERT INTO `edu_chapter` VALUES ('1252605440997232641', '3', '第一章：jvm', 0, '2020-04-21 22:29:44', '2020-04-21 22:29:44');
INSERT INTO `edu_chapter` VALUES ('1261234279746969601', '1261234037542690818', '第一章：C++', 0, '2020-05-15 17:57:40', '2020-05-15 17:57:40');
INSERT INTO `edu_chapter` VALUES ('15', '18', '第一章：Java入门', 1, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('3', '14', '第二章：CSS', 2, '2019-01-01 12:55:35', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('32', '18', '第二章：控制台输入和输出', 2, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('44', '18', '第三章：控制流', 3, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('48', '18', '第四章：类的定义', 4, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('63', '18', '第五章：数组', 5, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('64', '18', '第六章：继承', 6, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('65', '18', '第七章：多态性和抽象类', 7, '2019-01-01 12:27:40', '2019-01-01 12:27:40');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程专业ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Draft' COMMENT '视频状态 Draft未发布  Normal已发布',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程一级id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1', '1261215470193508354', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 70, 1, 'Normal', '2020-02-14 23:04:52', '2020-05-15 18:02:30', '1228322794171572225');
INSERT INTO `edu_course` VALUES ('1228334295938801665', '1', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 5, 1, 'Draft', '2020-02-14 23:04:52', '2020-04-21 22:26:21', '1228322794171572225');
INSERT INTO `edu_course` VALUES ('1228580023630077954', '2', '1228322794247069698', 'C++入门到精通', 10.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 212, 1, 'Normal', '2020-02-15 15:21:18', '2020-04-19 15:30:30', '1228322794171572225');
INSERT INTO `edu_course` VALUES ('1261234037542690818', '1261233545651494914', '1228322794247069698', 'C++入门', 10.00, 10, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/yulan.jpg', 0, 2, 1, 'Normal', '2020-05-15 17:56:42', '2020-05-15 18:02:16', '1228322794171572225');
INSERT INTO `edu_course` VALUES ('2', '1', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 7, 1, 'Normal', '2020-02-14 23:04:52', '2020-04-14 20:13:48', '1228322794171572225');
INSERT INTO `edu_course` VALUES ('3', '1', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 8, 1, 'Normal', '2020-02-14 23:04:52', '2020-05-02 12:18:07', '1228322794171572225');
INSERT INTO `edu_course` VALUES ('4', '10', '1228322794284818434', 'MySql从入门到精通', 0.00, 13, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/f4a6611a-d4d7-4669-bae4-7593ef5943ebyulan.jpg', 0, 1, 1, 'Normal', '2020-02-15 15:12:40', '2020-03-24 23:32:18', '1228322794263846914');
INSERT INTO `edu_course` VALUES ('5', '10', '1228322794284818434', 'MySql从入门到精通', 0.00, 13, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/f4a6611a-d4d7-4669-bae4-7593ef5943ebyulan.jpg', 0, 1, 1, 'Normal', '2020-02-15 15:12:40', '2020-04-10 02:04:19', '1228322794263846914');
INSERT INTO `edu_course` VALUES ('6', '10', '1228322794284818434', 'MySql从入门到精通', 0.00, 13, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/f4a6611a-d4d7-4669-bae4-7593ef5943ebyulan.jpg', 0, 0, 1, 'Normal', '2020-02-15 15:12:40', '2020-02-15 15:20:26', '1228322794263846914');
INSERT INTO `edu_course` VALUES ('7', '2', '1228322794247069698', 'C++入门到精通', 0.00, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 59, 1, 'Normal', '2020-02-15 15:21:18', '2020-04-13 22:09:53', '1228322794171572225');
INSERT INTO `edu_course` VALUES ('8', '2', '1228322794213515265', 'C++入门到精通', 0.00, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 10, 1, 'Normal', '2020-02-15 15:21:18', '2020-04-13 00:49:45', '1228322794171572225');
INSERT INTO `edu_course` VALUES ('9', '2', '1228322794213515265', 'C++入门到精通', 10.00, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 11, 1, 'Normal', '2020-02-15 15:21:18', '2020-05-02 16:16:36', '1228322794171572225');

-- ----------------------------
-- Table structure for edu_course_copy1
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_copy1`;
CREATE TABLE `edu_course_copy1`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程专业ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Draft' COMMENT '视频状态 Draft未发布  Normal已发布',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程一级id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course_copy1
-- ----------------------------
INSERT INTO `edu_course_copy1` VALUES ('1', '1261215470193508354', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 70, 1, 'Normal', '2020-02-14 23:04:52', '2020-05-15 18:02:30', '1228322794171572225');
INSERT INTO `edu_course_copy1` VALUES ('1228334295938801665', '1', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 5, 1, 'Draft', '2020-02-14 23:04:52', '2020-04-21 22:26:21', '1228322794171572225');
INSERT INTO `edu_course_copy1` VALUES ('1228580023630077954', '2', '1228322794247069698', 'C++入门到精通', 10.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 212, 1, 'Normal', '2020-02-15 15:21:18', '2020-04-19 15:30:30', '1228322794171572225');
INSERT INTO `edu_course_copy1` VALUES ('1261234037542690818', '1261233545651494914', '1228322794247069698', 'C++入门', 10.00, 10, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/yulan.jpg', 0, 2, 1, 'Normal', '2020-05-15 17:56:42', '2020-05-15 18:02:16', '1228322794171572225');
INSERT INTO `edu_course_copy1` VALUES ('2', '1', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 7, 1, 'Normal', '2020-02-14 23:04:52', '2020-04-14 20:13:48', '1228322794171572225');
INSERT INTO `edu_course_copy1` VALUES ('3', '1', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 8, 1, 'Normal', '2020-02-14 23:04:52', '2020-05-02 12:18:07', '1228322794171572225');
INSERT INTO `edu_course_copy1` VALUES ('4', '10', '1228322794284818434', 'MySql从入门到精通', 0.00, 13, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/f4a6611a-d4d7-4669-bae4-7593ef5943ebyulan.jpg', 0, 1, 1, 'Normal', '2020-02-15 15:12:40', '2020-03-24 23:32:18', '1228322794263846914');
INSERT INTO `edu_course_copy1` VALUES ('5', '10', '1228322794284818434', 'MySql从入门到精通', 0.00, 13, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/f4a6611a-d4d7-4669-bae4-7593ef5943ebyulan.jpg', 0, 1, 1, 'Normal', '2020-02-15 15:12:40', '2020-04-10 02:04:19', '1228322794263846914');
INSERT INTO `edu_course_copy1` VALUES ('6', '10', '1228322794284818434', 'MySql从入门到精通', 0.00, 13, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/f4a6611a-d4d7-4669-bae4-7593ef5943ebyulan.jpg', 0, 0, 1, 'Normal', '2020-02-15 15:12:40', '2020-02-15 15:20:26', '1228322794263846914');
INSERT INTO `edu_course_copy1` VALUES ('7', '2', '1228322794247069698', 'C++入门到精通', 0.00, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 59, 1, 'Normal', '2020-02-15 15:21:18', '2020-04-13 22:09:53', '1228322794171572225');
INSERT INTO `edu_course_copy1` VALUES ('8', '2', '1228322794213515265', 'C++入门到精通', 0.00, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 10, 1, 'Normal', '2020-02-15 15:21:18', '2020-04-13 00:49:45', '1228322794171572225');
INSERT INTO `edu_course_copy1` VALUES ('9', '2', '1228322794213515265', 'C++入门到精通', 10.00, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 11, 1, 'Normal', '2020-02-15 15:21:18', '2020-05-02 16:16:36', '1228322794171572225');

-- ----------------------------
-- Table structure for edu_course_copy2
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_copy2`;
CREATE TABLE `edu_course_copy2`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程专业ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Draft' COMMENT '视频状态 Draft未发布  Normal已发布',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程一级id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course_copy2
-- ----------------------------
INSERT INTO `edu_course_copy2` VALUES ('1', '1261215470193508354', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 70, 1, 'Normal', '2020-02-14 23:04:52', '2020-05-15 18:02:30', '1228322794171572225');
INSERT INTO `edu_course_copy2` VALUES ('1228334295938801665', '1', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 5, 1, 'Draft', '2020-02-14 23:04:52', '2020-04-21 22:26:21', '1228322794171572225');
INSERT INTO `edu_course_copy2` VALUES ('1228580023630077954', '2', '1228322794247069698', 'C++入门到精通', 10.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 212, 1, 'Normal', '2020-02-15 15:21:18', '2020-04-19 15:30:30', '1228322794171572225');
INSERT INTO `edu_course_copy2` VALUES ('1261234037542690818', '1261233545651494914', '1228322794247069698', 'C++入门', 10.00, 10, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/yulan.jpg', 0, 2, 1, 'Normal', '2020-05-15 17:56:42', '2020-05-15 18:02:16', '1228322794171572225');
INSERT INTO `edu_course_copy2` VALUES ('2', '1', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 7, 1, 'Normal', '2020-02-14 23:04:52', '2020-04-14 20:13:48', '1228322794171572225');
INSERT INTO `edu_course_copy2` VALUES ('3', '1', '1228322794192543746', 'JAVA精品课程', 0.00, 12, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/cover/780a0c3f-9d25-495a-9d1f-a3ae7505258dyulan.jpg', 0, 8, 1, 'Normal', '2020-02-14 23:04:52', '2020-05-02 12:18:07', '1228322794171572225');
INSERT INTO `edu_course_copy2` VALUES ('4', '10', '1228322794284818434', 'MySql从入门到精通', 0.00, 13, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/f4a6611a-d4d7-4669-bae4-7593ef5943ebyulan.jpg', 0, 1, 1, 'Normal', '2020-02-15 15:12:40', '2020-03-24 23:32:18', '1228322794263846914');
INSERT INTO `edu_course_copy2` VALUES ('5', '10', '1228322794284818434', 'MySql从入门到精通', 0.00, 13, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/f4a6611a-d4d7-4669-bae4-7593ef5943ebyulan.jpg', 0, 1, 1, 'Normal', '2020-02-15 15:12:40', '2020-04-10 02:04:19', '1228322794263846914');
INSERT INTO `edu_course_copy2` VALUES ('6', '10', '1228322794284818434', 'MySql从入门到精通', 0.00, 13, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/f4a6611a-d4d7-4669-bae4-7593ef5943ebyulan.jpg', 0, 0, 1, 'Normal', '2020-02-15 15:12:40', '2020-02-15 15:20:26', '1228322794263846914');
INSERT INTO `edu_course_copy2` VALUES ('7', '2', '1228322794247069698', 'C++入门到精通', 0.00, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 59, 1, 'Normal', '2020-02-15 15:21:18', '2020-04-13 22:09:53', '1228322794171572225');
INSERT INTO `edu_course_copy2` VALUES ('8', '2', '1228322794213515265', 'C++入门到精通', 0.00, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 10, 1, 'Normal', '2020-02-15 15:21:18', '2020-04-13 00:49:45', '1228322794171572225');
INSERT INTO `edu_course_copy2` VALUES ('9', '2', '1228322794213515265', 'C++入门到精通', 10.00, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/15/cover/81c7fd7f-e3c7-41cf-9adc-f6a75e743175yulan.jpg', 0, 11, 1, 'Normal', '2020-02-15 15:21:18', '2020-05-02 16:16:36', '1228322794171572225');

-- ----------------------------
-- Table structure for edu_course_copy3
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_copy3`;
CREATE TABLE `edu_course_copy3`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程专业ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Draft' COMMENT '视频状态 Draft未发布  Normal已发布',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程一级id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课程简介',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程简介' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1', '<p>学习JAVA编程，JAVA入门学习<img class=\"wscnph\" src=\"data:image/png;base64,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\" /></p>', '2020-02-14 23:04:52', '2020-05-15 17:55:46');
INSERT INTO `edu_course_description` VALUES ('1228334295938801665', '<p>学习JAVA编程，JAVA入门学习</p>', '2020-02-14 23:04:52', '2020-04-21 22:26:21');
INSERT INTO `edu_course_description` VALUES ('1228580023630077954', '<p>C++入门到精通</p>', '2020-02-15 15:21:18', '2020-02-15 15:31:49');
INSERT INTO `edu_course_description` VALUES ('1261234037542690818', '<p><img class=\"wscnph\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQwAAABkCAYAAABzXA4QAAAACXBIWXMAAB2HAAAdhwGP5fFlAAA7qmlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxMzggNzkuMTU5ODI0LCAyMDE2LzA5LzE0LTAxOjA5OjAxICAgICAgICAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgICAgICAgICAgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIgogICAgICAgICAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIKICAgICAgICAgICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmV4aWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vZXhpZi8xLjAvIj4KICAgICAgICAgPHhtcDpDcmVhdG9yVG9vbD5BZG9iZSBQaG90b3Nob3AgQ0MgMjAxNyAoV2luZG93cyk8L3htcDpDcmVhdG9yVG9vbD4KICAgICAgICAgPHhtcDpDcmVhdGVEYXRlPjIwMjAtMDItMTZUMjM6NDA6MzUrMDg6MDA8L3htcDpDcmVhdGVEYXRlPgogICAgICAgICA8eG1wOk1vZGlmeURhdGU+MjAyMC0wMi0xNlQyMzo0MjozMiswODowMDwveG1wOk1vZGlmeURhdGU+CiAgICAgICAgIDx4bXA6TWV0YWRhdGFEYXRlPjIwMjAtMDItMTZUMjM6NDI6MzIrMDg6MDA8L3htcDpNZXRhZGF0YURhdGU+CiAgICAgICAgIDxkYzpmb3JtYXQ+aW1hZ2UvcG5nPC9kYzpmb3JtYXQ+CiAgICAgICAgIDxwaG90b3Nob3A6Q29sb3JNb2RlPjM8L3Bob3Rvc2hvcDpDb2xvck1vZGU+CiAgICAgICAgIDx4bXBNTTpJbnN0YW5jZUlEPnhtcC5paWQ6ODE1MDAyMzUtODA5My05OTQ2LWE4ODAtOTUyNTg1MzQ2NzMwPC94bXBNTTpJbnN0YW5jZUlEPgogICAgICAgICA8eG1wTU06RG9jdW1lbnRJRD5hZG9iZTpkb2NpZDpwaG90b3Nob3A6ZTZiN2ZlOTQtNTBkMi0xMWVhLWE4MGYtYWM1ZWU5YTVmMGZiPC94bXBNTTpEb2N1bWVudElEPgogICAgICAgICA8eG1wTU06T3JpZ2luYWxEb2N1bWVudElEPnhtcC5kaWQ6YjFkMDgyMzUtNjFlMS1lYTQ4LTk1Y2ItZjRiNmRjZmU3OTJmPC94bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ+CiAgICAgICAgIDx4bXBNTTpIaXN0b3J5PgogICAgICAgICAgICA8cmRmOlNlcT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+Y3JlYXRlZDwvc3RFdnQ6YWN0aW9uPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6aW5zdGFuY2VJRD54bXAuaWlkOmIxZDA4MjM1LTYxZTEtZWE0OC05NWNiLWY0YjZkY2ZlNzkyZjwvc3RFdnQ6aW5zdGFuY2VJRD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OndoZW4+MjAyMC0wMi0xNlQyMzo0MDozNSswODowMDwvc3RFdnQ6d2hlbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OnNvZnR3YXJlQWdlbnQ+QWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKFdpbmRvd3MpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+c2F2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDo3MTljYjdiNS0yM2FkLTRmNDUtODRjOC0wZWRlNDE2YTQ2NWU8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMjAtMDItMTZUMjM6NDI6MzIrMDg6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE3IChXaW5kb3dzKTwvc3RFdnQ6c29mdHdhcmVBZ2VudD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmNoYW5nZWQ+Lzwvc3RFdnQ6Y2hhbmdlZD4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPnNhdmVkPC9zdEV2dDphY3Rpb24+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDppbnN0YW5jZUlEPnhtcC5paWQ6ODE1MDAyMzUtODA5My05OTQ2LWE4ODAtOTUyNTg1MzQ2NzMwPC9zdEV2dDppbnN0YW5jZUlEPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6d2hlbj4yMDIwLTAyLTE2VDIzOjQyOjMyKzA4OjAwPC9zdEV2dDp3aGVuPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6c29mdHdhcmVBZ2VudD5BZG9iZSBQaG90b3Nob3AgQ0MgMjAxNyAoV2luZG93cyk8L3N0RXZ0OnNvZnR3YXJlQWdlbnQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpjaGFuZ2VkPi88L3N0RXZ0OmNoYW5nZWQ+CiAgICAgICAgICAgICAgIDwvcmRmOmxpPgogICAgICAgICAgICA8L3JkZjpTZXE+CiAgICAgICAgIDwveG1wTU06SGlzdG9yeT4KICAgICAgICAgPHRpZmY6T3JpZW50YXRpb24+MTwvdGlmZjpPcmllbnRhdGlvbj4KICAgICAgICAgPHRpZmY6WFJlc29sdXRpb24+MTkyMDAwMC8xMDAwMDwvdGlmZjpYUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6WVJlc29sdXRpb24+MTkyMDAwMC8xMDAwMDwvdGlmZjpZUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6UmVzb2x1dGlvblVuaXQ+MjwvdGlmZjpSZXNvbHV0aW9uVW5pdD4KICAgICAgICAgPGV4aWY6Q29sb3JTcGFjZT42NTUzNTwvZXhpZjpDb2xvclNwYWNlPgogICAgICAgICA8ZXhpZjpQaXhlbFhEaW1lbnNpb24+MjY4PC9leGlmOlBpeGVsWERpbWVuc2lvbj4KICAgICAgICAgPGV4aWY6UGl4ZWxZRGltZW5zaW9uPjEwMDwvZXhpZjpQaXhlbFlEaW1lbnNpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAg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\" /></p>\n<p>视频资料找百度云：www.baidu.com</p>', '2020-05-15 17:56:42', '2020-05-15 17:57:32');
INSERT INTO `edu_course_description` VALUES ('3', '<p>学习JAVA编程，JAVA入门学习</p>', '2020-02-14 23:04:52', '2020-02-14 23:08:53');
INSERT INTO `edu_course_description` VALUES ('4', '<p>学习JAVA编程，JAVA入门学习</p>', '2020-02-14 23:04:52', '2020-02-14 23:08:53');
INSERT INTO `edu_course_description` VALUES ('5', '<p>学习JAVA编程，JAVA入门学习</p>', '2020-02-14 23:04:52', '2020-02-14 23:08:53');
INSERT INTO `edu_course_description` VALUES ('6', '<p>学习JAVA编程，JAVA入门学习</p>', '2020-02-14 23:04:52', '2020-02-14 23:08:53');
INSERT INTO `edu_course_description` VALUES ('7', '<p>学习JAVA编程，JAVA入门学习</p>', '2020-02-14 23:04:52', '2020-02-15 15:35:06');
INSERT INTO `edu_course_description` VALUES ('8', '<p>学习JAVA编程，JAVA入门学习</p>', '2020-02-14 23:04:52', '2020-02-14 23:08:53');
INSERT INTO `edu_course_description` VALUES ('9', '<p>学习JAVA编程，JAVA入门学习</p>', '2020-02-14 23:04:52', '2020-02-14 23:08:53');

-- ----------------------------
-- Table structure for edu_member
-- ----------------------------
DROP TABLE IF EXISTS `edu_member`;
CREATE TABLE `edu_member`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户签名',
  `type` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '用户类型 1 为管理员，2 为 普通会员',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_member
-- ----------------------------
INSERT INTO `edu_member` VALUES ('1230881388586917890', NULL, '13016670916', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', 2, 10, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/04/16/photo\',photo\'/6d7d9f53-c85e-47bb-a61f-4befeb37ee30yulan.jpg', '哈喽~', 2, 0, 0, '2020-04-15 01:15:20', '2020-05-02 11:50:31');
INSERT INTO `edu_member` VALUES ('1251215089300414465', NULL, '13016670916', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', 0, 0, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/default.png', '哈喽~', 1, 0, 0, '2020-04-18 02:24:58', '2020-05-15 17:59:29');

-- ----------------------------
-- Table structure for edu_orders
-- ----------------------------
DROP TABLE IF EXISTS `edu_orders`;
CREATE TABLE `edu_orders`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单id',
  `member_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `out_trade_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商户订单号',
  `trade_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝交易凭证号',
  `trade_status` int(11) NOT NULL DEFAULT 0 COMMENT '交易状态 0:未支付，1已支付',
  `total_amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '总支付金额',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_orders
-- ----------------------------
INSERT INTO `edu_orders` VALUES ('1250032958402506753', '1230881388586917890', '1228580023630077954', '1137cf96c14c4c31a131f12bda9db9c8', '2020041422001467270500808381', 1, '10.00', '2020-04-14 20:07:36', '2020-04-14 20:08:00');
INSERT INTO `edu_orders` VALUES ('1250034081150595074', '1230881388586917890', '1228580023630077954', '227ac3d83d2a419d83dc7f042110c7ed', '2020041422001467270500809108', 1, '10.00', '2020-04-14 20:12:04', '2020-04-14 20:12:21');
INSERT INTO `edu_orders` VALUES ('1250034288319852545', '1230881388586917890', '1228580023630077954', '8dc98c1e7c9642b6a1df4beee81584ac', '2020041422001467270500808792', 1, '10.00', '2020-04-14 20:12:54', '2020-04-14 20:13:20');
INSERT INTO `edu_orders` VALUES ('1251756965812297730', '1230881388586917890', '9', 'c9e1b694cedd4825aeeaa6cea215b82d', NULL, 0, '10.00', '2020-04-19 14:18:12', '2020-04-19 14:18:12');
INSERT INTO `edu_orders` VALUES ('1251775554820825089', '1230881388586917890', '9', '6c52cb96645b429990cfb4536328a08c', NULL, 0, '10.00', '2020-04-19 15:32:04', '2020-04-19 15:32:04');
INSERT INTO `edu_orders` VALUES ('1256436383730147330', '1230881388586917890', '9', '534fa3812ba54add947c7c8c810a5633', NULL, 0, '10.00', '2020-05-02 12:12:32', '2020-05-02 12:12:32');
INSERT INTO `edu_orders` VALUES ('1256497818271289345', '1230881388586917890', '9', '898faa97a75441e09042e0f743b23a3f', NULL, 0, '10.00', '2020-05-02 16:16:39', '2020-05-02 16:16:39');
INSERT INTO `edu_orders` VALUES ('1261224971948830721', '1261219965837279233', '1261216925931569154', '8d3f0d12d6aa45ebb129b0c84b67524b', '2020051522001467270500829619', 1, '10.00', '2020-05-15 17:20:40', '2020-05-15 17:22:43');
INSERT INTO `edu_orders` VALUES ('1261225786365227010', '1261219965837279233', '1261216925931569154', '8c747461a3c24e2da3a5dfa00502c917', NULL, 0, '10.00', '2020-05-15 17:23:55', '2020-05-15 17:23:55');
INSERT INTO `edu_orders` VALUES ('1261225918699712513', '1261219965837279233', '1261216925931569154', 'fcb73773d1dd485c8fbe2edd33c5caff', NULL, 0, '10.00', '2020-05-15 17:24:26', '2020-05-15 17:24:26');
INSERT INTO `edu_orders` VALUES ('1261226162741096449', '1261219965837279233', '1261216925931569154', '4f3f19a3811a4a93a881037c68209af9', '2020051522001467270500829987', 1, '10.00', '2020-05-15 17:25:24', '2020-05-15 17:25:48');
INSERT INTO `edu_orders` VALUES ('1261235215504551938', '1261234817754472449', '1261234037542690818', '576e2edafe524df6be6a5b6a784d03bb', '2020051522001467270500829767', 1, '10.00', '2020-05-15 18:01:23', '2020-05-15 18:02:05');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程科目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1228322794054131713', '前端开发', '0', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794087686145', 'html', '1228322794054131713', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794121240578', 'vue', '1228322794054131713', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794150600706', 'nodejs', '1228322794054131713', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794171572225', '后端开发', '0', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794192543746', 'java', '1228322794171572225', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794213515265', 'php', '1228322794171572225', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794247069698', 'c++', '1228322794171572225', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794263846914', '数据库', '0', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794284818434', 'mysql', '1228322794263846914', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794314178561', 'redis', '1228322794263846914', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794330955777', '大数据', '0', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794351927297', 'Hadoop', '1228322794330955777', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');
INSERT INTO `edu_subject` VALUES ('1228322794377093121', 'hive', '1228322794330955777', 0, '2020-02-14 22:19:10', '2020-02-14 22:19:10');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师姓名',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师资历,一句话说明讲师',
  `career` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '讲师简介',
  `level` int(10) UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师头像',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '讲师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1', '刘德华', '毕业于师范大学数学系，热爱教育事业，执教数学思维6年有余', '具备深厚的数学思维功底、丰富的小学教育经验，授课风格生动活泼，擅长用形象生动的比喻帮助理解、简单易懂的语言讲解难题，深受学生喜欢', 2, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/05/15/photo/77df2296-7a24-4d29-89d4-4464dae038eefile.png', 10, 0, '2018-03-30 17:15:57', '2020-05-15 17:54:17');
INSERT INTO `edu_teacher` VALUES ('10', '唐嫣', '北京师范大学法学院副教授', '北京师范大学法学院副教授、清华大学法学博士。自2004年至今已有9年的司法考试培训经验。长期从事司法考试辅导，深知命题规律，了解解题技巧。内容把握准确，授课重点明确，层次分明，调理清晰，将法条法理与案例有机融合，强调综合，深入浅出。', 1, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/e628a096-22ed-4b00-9686-b583920d72a5file.png', 20, 0, '2018-04-03 14:32:19', '2020-02-14 22:10:04');
INSERT INTO `edu_teacher` VALUES ('1098969411110432769', 'string name', 'string intro', 'string career', 2, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/304ff8ca-9a69-4d40-b27b-52920cf8aec0file.png', 10, 1, '2019-02-22 23:35:00', '2019-02-22 23:35:00');
INSERT INTO `edu_teacher` VALUES ('1098970098250674178', '刘德华1', 'string intro', 'string career', 2, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/304ff8ca-9a69-4d40-b27b-52920cf8aec0file.png', 10, 1, '2019-02-22 23:37:44', '2019-02-22 23:38:30');
INSERT INTO `edu_teacher` VALUES ('1261215470193508354', '刘老师11', '刘老师', '刘老师', 1, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/05/15/photo/a65f0d00-2002-498e-b2aa-1e13e36e7346file.png', 0, 1, '2020-05-15 16:42:55', '2020-05-15 17:45:14');
INSERT INTO `edu_teacher` VALUES ('1261231269427879938', '刘老师', '刘老师', '刘老师', 2, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/05/15/photo/baa69d7e-cb66-4983-9f41-09373e9c1724file.png', 0, 1, '2020-05-15 17:45:42', '2020-05-15 17:45:42');
INSERT INTO `edu_teacher` VALUES ('1261233545651494914', '刘老师', '刘老师', '刘老师', 1, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/05/15/photo/2769c822-11e4-44f6-ad10-414ec58b365cfile.png', 0, 0, '2020-05-15 17:54:45', '2020-05-15 17:54:45');
INSERT INTO `edu_teacher` VALUES ('2', '周润发', '中国人民大学附属中学数学一级教师', '中国科学院数学与系统科学研究院应用数学专业博士，研究方向为数字图像处理，中国工业与应用数学学会会员。参与全国教育科学“十五”规划重点课题“信息化进程中的教育技术发展研究”的子课题“基与课程改革的资源开发与应用”，以及全国“十五”科研规划全国重点项目“掌上型信息技术产品在教学中的运用和开发研究”的子课题“用技术学数学”。', 2, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/304ff8ca-9a69-4d40-b27b-52920cf8aec0file.png', 1, 0, '2018-03-30 18:28:26', '2020-02-14 22:10:15');
INSERT INTO `edu_teacher` VALUES ('3', '钟汉良', '毕业于北京大学数学系', '中教一级职称。讲课极具亲和力。', 1, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/3feca67c-80b1-4491-a610-e062bba6c54ffile.png', 1, 0, '2018-03-31 09:20:46', '2020-02-14 22:10:28');
INSERT INTO `edu_teacher` VALUES ('4', '周杰伦', '长期从事考研政治课讲授和考研命题趋势与应试对策研究。考研辅导新锐派的代表。', '政治学博士、管理学博士后，北京师范大学马克思主义学院副教授。多年来总结出了一套行之有效的应试技巧与答题方法，针对性和实用性极强，能帮助考生在轻松中应考，在激励的竞争中取得高分，脱颖而出。', 1, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/e1fbce29-35a7-40b8-b1f0-2bce013bef1efile.png', 1, 0, '2018-04-03 14:13:51', '2020-02-14 22:10:38');
INSERT INTO `edu_teacher` VALUES ('5', '陈伟霆', '人大附中2009届毕业生', '北京大学数学科学学院2008级本科生，2012年第八届学生五四奖章获得者，在数学领域取得多项国际国内奖项，学术研究成绩突出。曾被两次评为北京大学三好学生、一次评为北京大学三好标兵，获得过北京大学国家奖学金、北京大学廖凯原奖学金、北京大学星光国际一等奖学金、北京大学明德新生奖学金等。', 1, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/eca60748-c495-436f-a1ed-98c2ba21f819file.png', 1, 0, '2018-04-03 14:15:36', '2020-02-14 22:10:50');
INSERT INTO `edu_teacher` VALUES ('6', '姚晨', '华东师范大学数学系硕士生导师，中国数学奥林匹克高级教练', '曾参与北京市及全国多项数学活动的命题和组织工作，多次带领北京队参加高中、初中、小学的各项数学竞赛，均取得优异成绩。教学活而新，能够调动学生的学习兴趣并擅长对学生进行思维点拨，对学生学习习惯的养成和非智力因素培养有独到之处，是一位深受学生喜爱的老师。', 1, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/304ff8ca-9a69-4d40-b27b-52920cf8aec0file.png', 1, 0, '2018-04-01 14:19:28', '2019-02-22 02:01:29');
INSERT INTO `edu_teacher` VALUES ('7', '胡歌', '考研政治辅导实战派专家，全国考研政治命题研究组核心成员。', '法学博士，北京师范大学马克思主义学院副教授，专攻毛泽东思想概论、邓小平理论，长期从事考研辅导。出版著作两部，发表学术论文30余篇，主持国家社会科学基金项目和教育部重大课题子课题各一项，参与中央实施马克思主义理论研究和建设工程项目。', 2, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/304ff8ca-9a69-4d40-b27b-52920cf8aec0file.png', 8, 0, '2018-04-03 14:21:03', '2019-02-22 02:01:30');
INSERT INTO `edu_teacher` VALUES ('8', '旦增尼玛', '上海师范大学法学院副教授', '上海师范大学法学院副教授、清华大学法学博士。自2004年至今已有9年的司法考试培训经验。长期从事司法考试辅导，深知命题规律，了解解题技巧。内容把握准确，授课重点明确，层次分明，调理清晰，将法条法理与案例有机融合，强调综合，深入浅出。', 1, 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/photo/304ff8ca-9a69-4d40-b27b-52920cf8aec0file.png', 9, 1, '2018-04-03 14:23:06', '2019-02-22 02:01:31');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0免费 1收费',
  `video_source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频资源',
  `video_original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频名称',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '视频状态:见阿里云文档',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程视频' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1228334530547195905', '1228334295938801665', '1228334375613800449', '面向对象', 0, 0, 0, 'c835cefab18a4bfc8240ed4d2a806649', '6 - What If I Want to Move Faster.mp4', 0, 'Draft', 0, 1, '2020-02-14 23:05:48', '2020-02-14 23:12:18');
INSERT INTO `edu_video` VALUES ('1228580264278269954', '1228580023630077954', '1228580087257669633', '第一节：C++指针', 0, 0, 0, '57c7a9740c1f4c9c9e4274d2436173bd', '6 - What If I Want to Move Faster.mp4', 0, '', 0, 1, '2020-02-15 15:22:16', '2020-02-15 15:22:16');
INSERT INTO `edu_video` VALUES ('1228581156297678850', '1228580023630077954', '1228580087257669633', '第二节：C++', 0, 0, 0, '2c4935a2df6b4373b3ca6334066cb446', '6 - What If I Want to Move Faster.mp4', 0, '', 0, 1, '2020-02-15 15:25:48', '2020-02-15 15:25:48');
INSERT INTO `edu_video` VALUES ('1229769349021876226', '1', '1229769072860512258', '第一节：面试', 0, 0, 0, 'a109cc276dc542689677df296f5a33b1', '6 - What If I Want to Move Faster.mp4', 0, '', 0, 1, '2020-02-18 22:07:15', '2020-02-18 22:07:15');
INSERT INTO `edu_video` VALUES ('1252605629023686657', '3', '1252605440997232641', '第一节：jvm的内存区域', 0, 0, 0, 'aa9cc2d87a114e8596bcc766d56a8f2f', '6 - What If I Want to Move Faster.mp4', 0, '', 0, 1, '2020-04-21 22:30:29', '2020-04-21 22:30:29');
INSERT INTO `edu_video` VALUES ('1261234416066043905', '1261234037542690818', '1261234279746969601', '第一节：C++', 0, 0, 0, '18ff564e8b5a4e7490dbe5dff79e5780', '6 - What If I Want to Move Faster.mp4', 0, '', 0, 1, '2020-05-15 17:58:12', '2020-05-15 17:58:12');
INSERT INTO `edu_video` VALUES ('17', '18', '15', '第一节：Java简介', 1, 1000, 1, '', NULL, 100, 'Draft', 0, 1, '2019-01-01 13:08:57', '2019-02-21 20:46:08');
INSERT INTO `edu_video` VALUES ('18', '18', '15', '第二节：表达式和赋值语句', 2, 999, 1, '', NULL, 100, 'Draft', 0, 1, '2019-01-01 13:09:02', '2019-02-21 20:46:09');
INSERT INTO `edu_video` VALUES ('19', '18', '15', '第三节：String类', 3, 888, 0, '', NULL, 100, 'Draft', 0, 1, '2019-01-01 13:09:05', '2019-02-21 20:46:10');
INSERT INTO `edu_video` VALUES ('20', '18', '15', '第四节：程序风格', 4, 666, 0, '', NULL, 100, 'Draft', 0, 1, '2019-01-01 13:09:05', '2019-02-21 20:46:10');

-- ----------------------------
-- Table structure for member_course
-- ----------------------------
DROP TABLE IF EXISTS `member_course`;
CREATE TABLE `member_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员课程id',
  `memberid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `courseid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程id',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员课程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_course
-- ----------------------------
INSERT INTO `member_course` VALUES ('1250034399280156673', '1230881388586917890', '1228580023630077954', '2020-04-14 20:13:20', '2020-04-14 20:13:20');
INSERT INTO `member_course` VALUES ('1250034516708085762', '1230881388586917890', '2', '2020-04-14 20:13:48', '2020-04-14 20:13:48');
INSERT INTO `member_course` VALUES ('1250061312363094018', '1230881388586917890', '1250060401842597889', '2020-04-14 22:00:17', '2020-04-14 22:00:17');
INSERT INTO `member_course` VALUES ('1250684866645508098', '1250110399426904065', '1', '2020-04-16 15:18:03', '2020-04-16 15:18:03');
INSERT INTO `member_course` VALUES ('1256434024367071233', '1230881388586917890', '3', '2020-05-02 12:03:09', '2020-05-02 12:03:09');
INSERT INTO `member_course` VALUES ('1256496937798778881', '1230881388586917890', '1', '2020-05-02 16:13:09', '2020-05-02 16:13:09');
INSERT INTO `member_course` VALUES ('1261224862376796162', '1261219965837279233', '1', '2020-05-15 17:20:14', '2020-05-15 17:20:14');
INSERT INTO `member_course` VALUES ('1261226260527063042', '1261219965837279233', '1261216925931569154', '2020-05-15 17:25:48', '2020-05-15 17:25:48');
INSERT INTO `member_course` VALUES ('1261235394374803457', '1261234817754472449', '1261234037542690818', '2020-05-15 18:02:05', '2020-05-15 18:02:05');
INSERT INTO `member_course` VALUES ('1261235498062192642', '1261234817754472449', '1', '2020-05-15 18:02:30', '2020-05-15 18:02:30');

-- ----------------------------
-- Table structure for statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `statistics_daily`;
CREATE TABLE `statistics_daily`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `date_calculated` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计日期',
  `register_num` int(11) NOT NULL COMMENT '注册人数',
  `login_num` int(11) NOT NULL DEFAULT 0 COMMENT '登录人数',
  `video_view_num` int(11) NOT NULL DEFAULT 0 COMMENT '每日播放视频数',
  `course_num` int(11) NOT NULL DEFAULT 0 COMMENT '每日新增课程数',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date_calculated`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of statistics_daily
-- ----------------------------
INSERT INTO `statistics_daily` VALUES ('1078490017163833345', '2018-12-28', 0, 0, 154, 170, '2018-12-28 11:17:12', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1087142127818768386', '2019-01-02', 2, 0, 167, 177, '2019-01-21 08:17:36', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1087198321809457153', '2019-01-01', 1, 0, 130, 189, '2019-01-21 12:00:54', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1087198383973236738', '2019-01-03', 0, 0, 114, 130, '2019-01-21 12:01:09', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1087451681764982785', '2019-01-04', 0, 0, 118, 155, '2019-01-22 04:47:39', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1087455336471785473', '2019-01-05', 0, 0, 184, 186, '2019-01-22 05:02:11', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1105373249744793601', '2019-01-12', 0, 133, 148, 151, '2019-03-12 15:41:34', '2019-03-12 15:41:34');
INSERT INTO `statistics_daily` VALUES ('1105373262457729026', '2019-01-11', 0, 115, 128, 155, '2019-03-12 15:41:37', '2019-03-12 15:41:37');
INSERT INTO `statistics_daily` VALUES ('1105373270691147777', '2019-01-10', 0, 154, 167, 103, '2019-03-12 15:41:39', '2019-03-12 15:41:39');
INSERT INTO `statistics_daily` VALUES ('1105373278219923458', '2019-01-09', 0, 132, 114, 117, '2019-03-12 15:41:41', '2019-03-12 15:41:41');
INSERT INTO `statistics_daily` VALUES ('1105373285555761154', '2019-01-08', 0, 180, 135, 145, '2019-03-12 15:41:43', '2019-03-12 15:41:43');
INSERT INTO `statistics_daily` VALUES ('1105373293512355841', '2019-01-07', 0, 124, 127, 155, '2019-03-12 15:41:45', '2019-03-12 15:41:45');
INSERT INTO `statistics_daily` VALUES ('1105373301842243586', '2019-01-06', 0, 173, 148, 106, '2019-03-12 15:41:47', '2019-03-12 15:41:47');
INSERT INTO `statistics_daily` VALUES ('1165', '2018-01-01', 583, 26, 236, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1166', '2018-01-02', 583, 26, 236, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1167', '2018-01-03', 584, 26, 236, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1168', '2018-01-04', 584, 26, 237, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1169', '2018-01-05', 585, 26, 237, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1170', '2018-01-06', 585, 26, 237, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1171', '2018-01-07', 586, 26, 237, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1172', '2018-01-08', 586, 26, 237, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1173', '2018-01-09', 587, 26, 238, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1174', '2018-01-10', 587, 26, 238, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1175', '2018-01-11', 588, 27, 238, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1176', '2018-01-12', 588, 27, 238, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1177', '2018-01-13', 589, 27, 238, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1178', '2018-01-14', 589, 27, 239, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1179', '2018-01-15', 590, 27, 239, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1180', '2018-01-16', 590, 27, 239, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1181', '2018-01-17', 591, 27, 239, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1182', '2018-01-18', 591, 27, 239, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1183', '2018-01-19', 592, 27, 240, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1184', '2018-01-20', 592, 27, 240, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1185', '2018-01-21', 593, 27, 240, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1186', '2018-01-22', 593, 27, 240, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1187', '2018-01-23', 594, 27, 240, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1188', '2018-01-24', 594, 27, 241, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1189', '2018-01-25', 595, 27, 241, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1190', '2018-01-26', 595, 27, 241, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1191', '2018-01-27', 596, 27, 241, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1192', '2018-01-28', 596, 27, 241, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1193', '2018-01-29', 597, 27, 242, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1194', '2018-01-30', 597, 27, 242, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1195', '2018-01-31', 598, 27, 242, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1196', '2018-02-01', 598, 27, 242, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1197', '2018-02-02', 599, 27, 242, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1198', '2018-02-03', 599, 27, 243, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1199', '2018-02-04', 600, 27, 243, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1200', '2018-02-05', 600, 27, 243, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1201', '2018-02-06', 601, 27, 243, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1202', '2018-02-07', 601, 27, 243, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1203', '2018-02-08', 602, 27, 244, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1204', '2018-02-09', 602, 27, 244, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1205', '2018-02-10', 603, 27, 244, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1206', '2018-02-11', 603, 27, 244, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1207', '2018-02-12', 604, 27, 244, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1208', '2018-02-13', 604, 27, 245, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1209', '2018-02-14', 605, 27, 245, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1210', '2018-02-15', 605, 27, 245, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1211', '2018-02-16', 606, 27, 245, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1212', '2018-02-17', 606, 27, 245, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1213', '2018-02-18', 607, 27, 246, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1214', '2018-02-19', 607, 27, 246, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1215', '2018-02-20', 608, 27, 246, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1216', '2018-02-21', 608, 27, 246, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1217', '2018-02-22', 609, 27, 246, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1218', '2018-02-23', 609, 27, 247, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1219', '2018-02-24', 610, 27, 247, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1220', '2018-02-25', 610, 27, 247, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1221', '2018-02-26', 611, 27, 247, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1222', '2018-02-27', 611, 27, 247, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1223', '2018-02-28', 612, 27, 248, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1224', '2018-03-01', 612, 27, 248, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1225', '2018-03-02', 613, 28, 248, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1226', '2018-03-03', 613, 28, 248, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1227', '2018-03-04', 614, 28, 248, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1228', '2018-03-05', 614, 28, 249, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1229', '2018-03-06', 615, 28, 249, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1230', '2018-03-07', 615, 28, 249, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1231', '2018-03-08', 616, 28, 249, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1232', '2018-03-09', 616, 28, 249, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1233', '2018-03-10', 617, 28, 250, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1234', '2018-03-11', 617, 28, 250, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1235', '2018-03-12', 618, 28, 250, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1236', '2018-03-13', 618, 28, 250, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1237', '2018-03-14', 619, 28, 250, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1238', '2018-03-15', 619, 28, 251, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1239', '2018-03-16', 620, 28, 251, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1240', '2018-03-17', 620, 28, 251, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1241', '2018-03-18', 621, 28, 251, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1242', '2018-03-19', 621, 28, 251, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1243', '2018-03-20', 622, 28, 252, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1244', '2018-03-21', 622, 28, 252, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1245', '2018-03-22', 623, 28, 252, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1246', '2018-03-23', 623, 28, 252, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1247', '2018-03-24', 624, 28, 252, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1248', '2018-03-25', 624, 28, 253, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1249', '2018-03-26', 625, 28, 253, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1250', '2018-03-27', 625, 28, 253, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1251', '2018-03-28', 626, 28, 253, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1252', '2018-03-29', 626, 28, 253, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1253', '2018-03-30', 627, 28, 254, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1254', '2018-03-31', 627, 28, 254, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1255', '2018-04-01', 628, 28, 254, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1256', '2018-04-02', 628, 28, 254, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1257', '2018-04-03', 629, 28, 254, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1258', '2018-04-04', 629, 28, 255, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1259', '2018-04-05', 630, 28, 255, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1260', '2018-04-06', 630, 28, 255, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1261', '2018-04-07', 631, 28, 255, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1262', '2018-04-08', 631, 28, 255, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1263', '2018-04-09', 632, 28, 256, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1264', '2018-04-10', 632, 28, 256, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1265', '2018-04-11', 633, 28, 256, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1266', '2018-04-12', 633, 28, 256, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1267', '2018-04-13', 634, 28, 256, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1268', '2018-04-14', 634, 28, 257, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1269', '2018-04-15', 635, 28, 257, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1270', '2018-04-16', 635, 28, 257, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1271', '2018-04-17', 636, 28, 257, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1272', '2018-04-18', 636, 28, 257, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1273', '2018-04-19', 637, 28, 258, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1274', '2018-04-20', 637, 28, 258, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1275', '2018-04-21', 638, 29, 258, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1276', '2018-04-22', 638, 29, 258, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1277', '2018-04-23', 639, 29, 258, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1278', '2018-04-24', 639, 29, 259, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1279', '2018-04-25', 640, 29, 259, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1280', '2018-04-26', 640, 29, 259, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1281', '2018-04-27', 641, 29, 259, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1282', '2018-04-28', 641, 29, 259, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1283', '2018-04-29', 642, 29, 260, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1284', '2018-04-30', 642, 29, 260, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1285', '2018-05-01', 643, 29, 260, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1286', '2018-05-02', 643, 29, 260, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1287', '2018-05-03', 644, 29, 260, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1288', '2018-05-04', 644, 29, 261, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1289', '2018-05-05', 645, 29, 261, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1290', '2018-05-06', 645, 29, 261, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1291', '2018-05-07', 646, 29, 261, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1292', '2018-05-08', 646, 29, 261, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1293', '2018-05-09', 647, 29, 262, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1294', '2018-05-10', 647, 29, 262, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1295', '2018-05-11', 648, 29, 262, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1296', '2018-05-12', 648, 29, 262, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1297', '2018-05-13', 649, 29, 262, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1298', '2018-05-14', 649, 29, 263, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1299', '2018-05-15', 5, 29, 263, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1300', '2018-05-16', 650, 29, 263, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1301', '2018-05-17', 651, 29, 263, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1302', '2018-05-18', 651, 29, 263, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1303', '2018-05-19', 652, 29, 264, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1304', '2018-05-20', 652, 29, 264, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1305', '2018-05-21', 653, 29, 264, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1306', '2018-05-22', 1, 29, 264, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1307', '2018-05-23', 654, 29, 264, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1308', '2018-05-24', 654, 29, 265, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1309', '2018-05-25', 1, 29, 265, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1310', '2018-05-26', 655, 29, 265, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1311', '2018-05-27', 656, 29, 265, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1312', '2018-05-28', 656, 29, 265, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1313', '2018-05-29', 657, 29, 266, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1314', '2018-05-30', 657, 29, 266, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1315', '2018-05-31', 658, 29, 266, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1316', '2018-06-01', 658, 29, 266, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1317', '2018-06-02', 659, 29, 266, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1318', '2018-06-03', 659, 29, 267, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1319', '2018-06-04', 660, 29, 267, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1320', '2018-06-05', 660, 29, 267, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1321', '2018-06-06', 661, 29, 267, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1322', '2018-06-07', 661, 29, 267, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1323', '2018-06-08', 662, 29, 268, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1324', '2018-06-09', 662, 29, 268, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1325', '2018-06-10', 663, 30, 268, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1326', '2018-06-11', 663, 30, 268, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1327', '2018-06-12', 664, 30, 268, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1328', '2018-06-13', 664, 30, 269, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1329', '2018-06-14', 665, 30, 269, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1330', '2018-06-15', 665, 30, 269, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1331', '2018-06-16', 666, 30, 269, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1332', '2018-06-17', 666, 30, 269, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1333', '2018-06-18', 667, 30, 270, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1334', '2018-06-19', 667, 30, 270, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1335', '2018-06-20', 668, 30, 270, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1336', '2018-06-21', 668, 30, 270, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1337', '2018-06-22', 669, 30, 270, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1338', '2018-06-23', 669, 30, 271, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1339', '2018-06-24', 670, 30, 271, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1340', '2018-06-25', 670, 30, 271, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1341', '2018-06-26', 671, 30, 271, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1342', '2018-06-27', 671, 30, 271, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1343', '2018-06-28', 672, 30, 272, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1344', '2018-06-29', 672, 30, 272, 14, '2018-01-25 06:38:19', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1345', '2018-06-30', 673, 30, 272, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1346', '2018-07-01', 673, 30, 272, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1347', '2018-07-02', 674, 30, 272, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1348', '2018-07-03', 674, 30, 273, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1349', '2018-07-04', 675, 30, 273, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1350', '2018-07-05', 675, 30, 273, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1351', '2018-07-06', 676, 30, 273, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1352', '2018-07-07', 676, 30, 273, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1353', '2018-07-08', 677, 30, 274, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1354', '2018-07-09', 677, 30, 274, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1355', '2018-07-10', 678, 30, 274, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1356', '2018-07-11', 678, 30, 274, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1357', '2018-07-12', 679, 30, 274, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1358', '2018-07-13', 679, 30, 275, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1359', '2018-07-14', 680, 30, 275, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1360', '2018-07-15', 680, 30, 275, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1361', '2018-07-16', 681, 30, 275, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1362', '2018-07-17', 681, 30, 275, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1363', '2018-07-18', 682, 30, 276, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1364', '2018-07-19', 682, 30, 276, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1365', '2018-07-20', 683, 30, 276, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1366', '2018-07-21', 683, 30, 276, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1367', '2018-07-22', 684, 30, 276, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1368', '2018-07-23', 684, 30, 277, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1369', '2018-07-24', 685, 30, 277, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1370', '2018-07-25', 685, 30, 277, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1371', '2018-07-26', 686, 30, 277, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1372', '2018-07-27', 686, 30, 277, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1373', '2018-07-28', 687, 30, 278, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1374', '2018-07-29', 687, 30, 278, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1375', '2018-07-30', 688, 31, 278, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1376', '2018-07-31', 688, 31, 278, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1377', '2018-08-01', 689, 31, 278, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1378', '2018-08-02', 689, 31, 279, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1379', '2018-08-03', 690, 31, 279, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1380', '2018-08-04', 690, 31, 279, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1381', '2018-08-05', 691, 31, 279, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1382', '2018-08-06', 691, 31, 279, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1383', '2018-08-07', 692, 31, 280, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1384', '2018-08-08', 692, 31, 280, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1385', '2018-08-09', 1, 31, 280, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1386', '2018-08-10', 693, 31, 280, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1387', '2018-08-11', 694, 31, 280, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1388', '2018-08-12', 694, 31, 281, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1389', '2018-08-13', 695, 31, 281, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1390', '2018-08-14', 695, 31, 281, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1391', '2018-08-15', 696, 31, 281, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1392', '2018-08-16', 696, 31, 281, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1393', '2018-08-17', 697, 31, 282, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1394', '2018-08-18', 697, 31, 282, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1395', '2018-08-19', 698, 31, 282, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1396', '2018-08-20', 698, 31, 282, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1397', '2018-08-21', 699, 31, 282, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1398', '2018-08-22', 699, 31, 283, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1399', '2018-08-23', 700, 31, 283, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1400', '2018-08-24', 700, 31, 283, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1401', '2018-08-25', 701, 31, 283, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1402', '2018-08-26', 701, 31, 283, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1403', '2018-08-27', 702, 31, 284, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1404', '2018-08-28', 702, 31, 284, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1405', '2018-08-29', 703, 31, 284, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1406', '2018-08-30', 703, 31, 284, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1407', '2018-08-31', 704, 31, 284, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1408', '2018-09-01', 1, 31, 285, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1409', '2018-09-02', 705, 31, 285, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1410', '2018-09-03', 705, 31, 285, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1411', '2018-09-04', 706, 31, 285, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1412', '2018-09-05', 706, 31, 285, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1413', '2018-09-06', 707, 31, 286, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1414', '2018-09-07', 707, 31, 1, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1415', '2018-09-08', 708, 31, 1, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1416', '2018-09-09', 1, 31, 1, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1417', '2018-09-10', 1, 31, 2, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1418', '2018-09-11', 709, 31, 287, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1419', '2018-09-12', 710, 31, 287, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1420', '2018-09-13', 710, 31, 287, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1421', '2018-09-14', 711, 31, 287, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1422', '2018-09-15', 711, 31, 287, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1423', '2018-09-16', 712, 31, 288, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1424', '2018-09-17', 712, 31, 288, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1425', '2018-09-18', 713, 32, 288, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1426', '2018-09-19', 713, 32, 288, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1427', '2018-09-20', 714, 32, 288, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1428', '2018-09-21', 714, 32, 289, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1429', '2018-09-22', 715, 32, 289, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1430', '2018-09-23', 715, 32, 289, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1431', '2018-09-24', 716, 32, 1, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1432', '2018-09-25', 716, 32, 289, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1433', '2018-09-26', 717, 32, 290, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1434', '2018-09-27', 717, 32, 290, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1435', '2018-09-28', 718, 32, 290, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1436', '2018-09-29', 718, 32, 1, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1437', '2018-09-30', 719, 32, 290, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1438', '2018-10-01', 719, 32, 291, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1439', '2018-10-02', 720, 32, 291, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1440', '2018-10-03', 720, 32, 291, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1441', '2018-10-04', 721, 32, 291, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1442', '2018-10-05', 721, 32, 291, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1443', '2018-10-06', 722, 32, 292, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1444', '2018-10-07', 722, 32, 292, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1445', '2018-10-08', 1, 32, 292, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1446', '2018-10-09', 723, 32, 292, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1447', '2018-10-10', 724, 32, 292, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1448', '2018-10-11', 724, 32, 293, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1449', '2018-10-12', 725, 32, 293, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1450', '2018-10-13', 725, 32, 293, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1451', '2018-10-14', 726, 32, 4, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1452', '2018-10-15', 726, 32, 293, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1453', '2018-10-16', 727, 32, 294, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1454', '2018-10-17', 727, 32, 294, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1455', '2018-10-18', 728, 32, 294, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1456', '2018-10-19', 728, 32, 294, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1457', '2018-10-20', 729, 32, 294, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1458', '2018-10-21', 729, 32, 295, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1459', '2018-10-22', 730, 32, 1, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1460', '2018-10-23', 730, 32, 295, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1461', '2018-10-24', 731, 32, 295, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1462', '2018-10-25', 731, 32, 295, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1463', '2018-10-26', 732, 32, 296, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1464', '2018-10-27', 732, 32, 296, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1465', '2018-10-28', 733, 32, 296, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1466', '2018-10-29', 2, 32, 3, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1467', '2018-10-30', 734, 32, 296, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1468', '2018-10-31', 734, 32, 297, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1469', '2018-11-01', 735, 32, 297, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1470', '2018-11-02', 735, 32, 297, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1471', '2018-11-03', 1, 32, 297, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1472', '2018-11-04', 736, 32, 1, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1473', '2018-11-05', 737, 32, 298, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1474', '2018-11-06', 737, 32, 298, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1475', '2018-11-07', 738, 33, 298, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1476', '2018-11-08', 738, 33, 169, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1477', '2018-11-09', 1, 33, 298, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1478', '2018-11-10', 739, 33, 78, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1479', '2018-11-11', 740, 33, 299, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1480', '2018-11-12', 740, 33, 299, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1481', '2018-11-13', 741, 33, 299, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1482', '2018-11-14', 741, 33, 299, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1483', '2018-11-15', 742, 33, 300, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1484', '2018-11-16', 742, 33, 35, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1485', '2018-11-17', 743, 33, 300, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1486', '2018-11-18', 743, 33, 300, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1487', '2018-11-19', 744, 33, 300, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1488', '2018-11-20', 744, 33, 301, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1489', '2018-11-21', 745, 33, 234, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1490', '2018-11-22', 456, 33, 301, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1491', '2018-11-23', 746, 33, 301, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1492', '2018-11-24', 746, 33, 301, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1493', '2018-11-25', 747, 33, 302, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1494', '2018-11-26', 747, 4, 302, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1495', '2018-11-27', 748, 33, 302, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1496', '2018-11-28', 748, 33, 36, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1497', '2018-11-29', 749, 33, 302, 2, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1498', '2018-11-30', 749, 3, 303, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1499', '2018-12-01', 750, 33, 303, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1500', '2018-12-02', 234, 33, 303, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1501', '2018-12-03', 751, 33, 303, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1502', '2018-12-04', 751, 33, 303, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1503', '2018-12-05', 752, 6, 304, 33, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1505', '2018-12-07', 753, 33, 55, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1506', '2018-12-08', 753, 33, 304, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1507', '2018-12-09', 754, 33, 304, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1508', '2018-12-10', 754, 1, 305, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1509', '2018-12-11', 755, 33, 305, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1510', '2018-12-12', 755, 33, 305, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1511', '2018-12-13', 756, 33, 305, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1512', '2018-12-14', 366, 33, 305, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1513', '2018-12-15', 757, 33, 66, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1514', '2018-12-16', 757, 33, 306, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1515', '2018-12-17', 758, 33, 306, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1516', '2018-12-18', 758, 2, 306, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1517', '2018-12-19', 759, 33, 306, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1518', '2018-12-20', 564, 33, 307, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1519', '2018-12-21', 760, 33, 307, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1520', '2018-12-22', 760, 33, 307, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1521', '2018-12-23', 761, 33, 307, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1522', '2018-12-24', 761, 33, 307, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1527', '2018-12-29', 764, 34, 308, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1528', '2018-12-30', 764, 34, 309, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1529', '2018-12-31', 765, 34, 309, 14, '2018-01-25 06:38:20', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1554', '2018-01-01', 333, 34, 314, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1555', '2018-01-02', 778, 34, 314, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1556', '2018-01-03', 778, 34, 314, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1557', '2018-01-04', 779, 34, 314, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1558', '2018-01-05', 779, 34, 315, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1559', '2018-01-06', 780, 34, 315, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1560', '2018-01-07', 780, 34, 315, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1561', '2018-01-08', 781, 34, 315, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1562', '2018-01-09', 781, 34, 315, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1563', '2018-01-10', 782, 34, 316, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1564', '2018-01-11', 782, 34, 316, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1565', '2018-01-12', 783, 34, 316, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1566', '2018-01-13', 783, 34, 316, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1567', '2018-01-14', 784, 34, 316, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1568', '2018-01-15', 784, 34, 317, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1569', '2018-01-16', 23, 34, 317, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1570', '2018-01-17', 785, 34, 317, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1571', '2018-01-18', 786, 34, 317, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1572', '2018-01-19', 786, 34, 317, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1573', '2018-01-20', 787, 2, 318, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1574', '2018-01-21', 787, 2, 318, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1575', '2018-01-22', 788, 1, 318, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1576', '2018-01-23', 788, 35, 318, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1577', '2018-01-24', 789, 35, 318, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1578', '2018-01-25', 789, 1, 319, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1579', '2018-01-26', 790, 1, 319, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1580', '2018-01-27', 531, 2, 319, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1581', '2018-01-28', 791, 2, 319, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1582', '2018-01-29', 791, 2, 319, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1583', '2018-01-30', 2, 4, 2, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1584', '2018-01-31', 792, 35, 320, 14, '2018-02-02 08:58:31', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1586', '2018-02-01', 793, 4, 3, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1587', '2018-02-02', 794, 2, 1, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1588', '2018-02-03', 794, 1, 4, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1589', '2018-02-04', 795, 35, 321, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1590', '2018-02-05', 795, 35, 321, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1591', '2018-02-06', 796, 35, 321, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1592', '2018-02-07', 796, 35, 321, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1593', '2018-02-08', 797, 35, 322, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1594', '2018-02-09', 797, 35, 322, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1595', '2018-02-10', 99, 35, 322, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1596', '2018-02-11', 798, 35, 322, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1597', '2018-02-12', 799, 35, 322, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1598', '2018-02-13', 799, 35, 323, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1599', '2018-02-14', 800, 35, 323, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1600', '2018-02-15', 800, 35, 323, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1601', '2018-02-16', 89, 35, 90, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1602', '2018-02-17', 801, 35, 323, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1603', '2018-02-18', 802, 23, 324, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1604', '2018-02-19', 802, 2, 324, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1605', '2018-02-20', 803, 56, 324, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1606', '2018-02-21', 45, 35, 89, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1607', '2018-02-22', 804, 35, 324, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1608', '2018-02-23', 804, 35, 325, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1609', '2018-02-24', 805, 1, 3, 14, '2018-02-25 10:54:34', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1610', '2018-05-15', 0, 0, 0, 7, '2018-05-16 00:25:27', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1611', '2018-10-01', 0, 0, 0, 7, '2018-10-24 16:17:15', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1612', '2018-10-02', 0, 0, 0, 7, '2018-10-24 16:17:15', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1613', '2018-10-03', 0, 0, 0, 7, '2018-10-24 16:17:15', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1614', '2018-10-04', 0, 0, 0, 7, '2018-10-24 16:17:15', '0000-00-00 00:00:00');
INSERT INTO `statistics_daily` VALUES ('1615', '2018-10-05', 0, 0, 0, 7, '2018-10-24 16:17:15', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for statistics_lunbotu
-- ----------------------------
DROP TABLE IF EXISTS `statistics_lunbotu`;
CREATE TABLE `statistics_lunbotu`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '轮播图ID',
  `photo` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '轮播图图片路径',
  `name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '轮播图描述',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图的点击链接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Draft' COMMENT '轮播图状态 Draft未发布  Normal已发布',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '轮播图信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of statistics_lunbotu
-- ----------------------------
INSERT INTO `statistics_lunbotu` VALUES ('1225822621486882817', 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/lunbotu/80877f99-40e0-4a9c-b023-9776b3bd90657ec03ecc5db74ca6905b9ac376ff6f40.jpg', 'www.aliyun.com', 'www.aliyun.com', 0, 'Normal', 1, '2020-02-08 00:44:22', '2020-03-22 00:39:37');
INSERT INTO `statistics_lunbotu` VALUES ('1228310290758402050', 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/lunbotu/289d3fd6-5387-4673-9852-81973f6f685ccd537e5a8f39b1b3cee3fbee71396226.jpg', '教育 学习成就未来教育 学习成就未来', 'www.baidu.com', 13, 'Normal', 1, '2020-02-14 21:29:29', '2020-05-02 16:12:27');
INSERT INTO `statistics_lunbotu` VALUES ('1228310597445910529', 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/02/14/lunbotu/f3469d1e-7825-42c4-8832-ee9479f4286b2db5cf66161a4e78707ab5eedbb4eaa1.jpg', '艺术', 'www.baidu.com', 11, 'Normal', 1, '2020-02-14 21:30:42', '2020-04-17 01:36:00');
INSERT INTO `statistics_lunbotu` VALUES ('1261234566154952705', 'https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/2020/05/15/lunbotu/02d8f8f6-3ede-4d09-aa67-fb6e93ff2557微信图片_20200212143441.jpg', '微信', 'www.baidu.com', 0, 'Normal', 1, '2020-05-15 17:58:48', '2020-05-15 17:58:54');

SET FOREIGN_KEY_CHECKS = 1;
