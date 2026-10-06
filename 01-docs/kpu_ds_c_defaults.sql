/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80019 (8.0.19)
 Source Host           : localhost:3306
 Source Schema         : kpu_ds_c_defaults

 Target Server Type    : MySQL
 Target Server Version : 80019 (8.0.19)
 File Encoding         : 65001

 Date: 04/10/2026 10:15:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for com_appendix
-- ----------------------------
DROP TABLE IF EXISTS `com_appendix`;
CREATE TABLE `com_appendix`  (
  `id` bigint NOT NULL COMMENT '文件ID',
  `biz_id` bigint NOT NULL COMMENT '业务id',
  `biz_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型;同一个业务，不同的字段，需要分别设置不同的业务类型',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务附件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of com_appendix
-- ----------------------------

-- ----------------------------
-- Table structure for com_file
-- ----------------------------
DROP TABLE IF EXISTS `com_file`;
CREATE TABLE `com_file`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `biz_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型;同一个业务，不同的字段，需要分别设置不同的业务类型',
  `file_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'OTHER' COMMENT '文件类型;#FileType{IMAGE:图片;VIDEO:视频;AUDIO:音频;DOC:文档;OTHER:其他;}',
  `storage_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'LOCAL' COMMENT '存储类型;#FileStorageType{LOCAL:本地;FAST_DFS:FastDFS;MIN_IO:MinIO;ALI_OSS:阿里云OSS;QINIU_OSS:七牛云OSS;HUAWEI_OSS:华为云OSS;}',
  `bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件相对地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件访问地址',
  `unique_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '唯一文件名',
  `file_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件md5',
  `file_sha256` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件SHA256',
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '原始文件名',
  `content_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件类型',
  `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '后缀',
  `size_` bigint NULL DEFAULT 0 COMMENT '大小',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime NOT NULL COMMENT '最后修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后修改人',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '增量文件上传日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of com_file
-- ----------------------------

-- ----------------------------
-- Table structure for def_application
-- ----------------------------
DROP TABLE IF EXISTS `def_application`;
CREATE TABLE `def_application`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `app_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '应用标识',
  `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '应用秘钥',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '版本',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '10' COMMENT '应用类型;[10-自建应用 20-第三方应用]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.APPLICATION_TYPE)',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '重定向地址',
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '简介',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '应用地址',
  `is_general` bit(1) NULL DEFAULT b'0' COMMENT '是否公共应用;0-否 1-是',
  `is_visible` bit(1) NULL DEFAULT b'1' COMMENT '是否可见;0-否 1-是',
  `sort_value` int NULL DEFAULT 1 COMMENT '排序',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_application_key`(`app_key` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_application
-- ----------------------------
INSERT INTO `def_application` VALUES (1, 'basicPlatform', 'uhpe70w9rw0qjyp1hd6rae58ioa7anycc00p', '基础平台', 'v1.0', '10', '', '租户的工作台，最基础的功能。', '基础平台是整个平台最基础，最核心的功能，所有租户都拥有。可以理解为用户的工作台，跳转其他业务系统的控制台等。', '', b'1', b'1', 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_application` VALUES (2, 'devOperation', 'ymyqj01qvmz7bpkne5li81cvxma2bebrzb57', '开发运营系统', 'v1.0', '10', '', '开发者或运营者使用，系统级功能，不能分配给租户。', '开发运营系统是给 开发者和运营者公司的用户使用的，主要维护一些系统级的配置和数据，不能分配给普通租户使用。', '', b'1', b'1', 2, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_application` VALUES (3, 'businessSystem', 'c2mn7qb9i194mcypuletfxv8qe182e61awut', '业务系统', 'v1.0', '10', '', '物联网业务系统，租户需要购买方可使用。', '设备管理、产品管理、规则引擎、协议管理等功能', '', b'1', b'1', 3, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_area
-- ----------------------------
DROP TABLE IF EXISTS `def_area`;
CREATE TABLE `def_area`  (
  `id` bigint NOT NULL COMMENT 'id',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '编码;统计用区划代码',
  `division_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '城乡划分代码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '全名',
  `sort_value` int NULL DEFAULT 1 COMMENT '排序',
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '维度',
  `level_` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '10' COMMENT '行政级别;[10-国家 20-省份/直辖市 30-地市 40-区县 50-乡镇]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.AREA_LEVEL)',
  `source_` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据来源;[10-爬取 20-新增]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.AREA_SOURCE)',
  `state` bit(1) NULL DEFAULT b'0' COMMENT '状态',
  `tree_grade` int NULL DEFAULT 0 COMMENT '树层级',
  `tree_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '树路径',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父ID',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_area_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_area
-- ----------------------------

-- ----------------------------
-- Table structure for def_client
-- ----------------------------
DROP TABLE IF EXISTS `def_client`;
CREATE TABLE `def_client`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `client_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端ID',
  `client_secret` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端名称',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '10' COMMENT '类型;[10-WEB网站;15-移动端应用;20-手机H5网页;25-内部服务; 30-第三方应用]\n@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.CLIENT_TYPE)',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_client_client_id`(`client_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户端' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_client
-- ----------------------------
INSERT INTO `def_client` VALUES (1, 'kpu_web', 'kpu_web_secret', 'kpu_web', '15', '', b'1', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_datasource_config
-- ----------------------------
DROP TABLE IF EXISTS `def_datasource_config`;
CREATE TABLE `def_datasource_config`  (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `driver_class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '驱动',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NOT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_datasource_config
-- ----------------------------
INSERT INTO `def_datasource_config` VALUES (1, 'defaults库', 'root', 'lmx123125', 'jdbc:mysql://127.0.0.1:3306/kpu_ds_c_defaults?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true', 'com.mysql.cj.jdbc.Driver', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_datasource_config` VALUES (2, 'base库', 'root', 'lmx123125', 'jdbc:mysql://127.0.0.1:3306/kpu_base_1?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true', 'com.mysql.cj.jdbc.Driver', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);

-- ----------------------------
-- Table structure for def_dict
-- ----------------------------
DROP TABLE IF EXISTS `def_dict`;
CREATE TABLE `def_dict`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '字典ID',
  `parent_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父字典标识',
  `dict_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典分组',
  `classify` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '20' COMMENT '分类\n[10-系统字典 20-业务字典]\n@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.DICT_CLASSIFY)',
  `data_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据类型\n[1-字符串 2-整型 3-布尔]',
  `key_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `sort_value` int NULL DEFAULT 1 COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图标',
  `css_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'css样式',
  `css_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'css类元素',
  `prop_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组件属性\n用于Tag时，用于配置color属性\n用于Button时，用于配置type属性',
  `i18n_json` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '国际化配置',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dict_key`(`parent_id` ASC, `key_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_dict
-- ----------------------------
INSERT INTO `def_dict` VALUES (43, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '01', '汉族', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"汉族\", \"en-US\": \"Han Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (44, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '02', '壮族', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"壮族\", \"en-US\": \"Zhuang Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (45, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '03', '满族', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"满族\", \"en-US\": \"Manchu Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (46, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '04', '回族', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"回族\", \"en-US\": \"Hui Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (47, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '05', '苗族', b'1', '', 4, '', '', '', '', '{\"zh-CN\": \"苗族\", \"en-US\": \"Miao Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (48, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '06', '维吾尔族', b'1', '', 5, '', '', '', '', '{\"zh-CN\": \"维吾 尔族\", \"en-US\": \"Uyghur Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (49, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '07', '土家族', b'1', '', 6, '', '', '', '', '{\"zh-CN\": \"土家族\", \"en-US\": \"Tujia Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (50, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '08', '彝族', b'1', '', 7, '', '', '', '', '{\"zh-CN\": \"彝族\", \"en-US\": \"Yi Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (51, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '09', '蒙古族', b'1', '', 8, '', '', '', '', '{\"zh-CN\": \"蒙古族\", \"en-US\": \"Mongolian Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (52, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '10', '藏族', b'1', '', 9, '', '', '', '', '{\"zh-CN\": \"藏族\", \"en-US\": \"Tibetan Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (53, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '11', '布依族', b'1', '', 10, '', '', '', '', '{\"zh-CN\": \"布依族\", \"en-US\": \"Bouyei Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (54, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '12', '侗族', b'1', '', 11, '', '', '', '', '{\"zh-CN\": \"侗族\", \"en-US\": \"Dong Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (55, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '13', '瑶族', b'1', '', 12, '', '', '', '', '{\"zh-CN\": \"瑶族\", \"en-US\": \"Yao Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (56, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '14', '朝鲜族', b'1', '', 13, '', '', '', '', '{\"zh-CN\": \"朝鲜族\", \"en-US\": \"Korean Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (57, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '15', '白族', b'1', '', 14, '', '', '', '', '{\"zh-CN\": \"白族\", \"en-US\": \"Bai Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (58, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '16', '哈尼族', b'1', '', 15, '', '', '', '', '{\"zh-CN\": \"哈尼族\", \"en-US\": \"Hani Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (59, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '17', '哈萨克族', b'1', '', 16, '', '', '', '', '{\"zh-CN\": \"哈萨克族\", \"en-US\": \"Kazakh Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (60, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '18', '黎族', b'1', '', 17, '', '', '', '', '{\"zh-CN\": \"黎族\", \"en-US\": \"Li Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (61, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '19', '傣族', b'1', '', 18, '', '', '', '', '{\"zh-CN\": \"傣族\", \"en-US\": \"Dai Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (62, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '20', '畲族', b'1', '', 19, '', '', '', '', '{\"zh-CN\": \"畲族\", \"en-US\": \"She Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (63, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '21', '傈僳族', b'1', '', 20, '', '', '', '', '{\"zh-CN\": \"傈僳族\", \"en-US\": \"Lisu Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (64, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '22', '仡佬族', b'1', '', 21, '', '', '', '', '{\"zh-CN\": \"仡佬族\", \"en-US\": \"Gelao Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (65, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '23', '东乡族', b'1', '', 22, '', '', '', '', '{\"zh-CN\": \"东乡族\", \"en-US\": \"Dongxiang Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (66, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '24', '高山族', b'1', '', 23, '', '', '', '', '{\"zh-CN\": \"高山族\", \"en-US\": \"Gaoshan Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (67, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '25', '拉祜族', b'1', '', 24, '', '', '', '', '{\"zh-CN\": \"拉祜族\", \"en-US\": \"Lahu Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (68, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '26', '水族', b'1', '', 25, '', '', '', '', '{\"zh-CN\": \"水族\", \"en-US\": \"Sui Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (69, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '27', '佤族', b'1', '', 26, '', '', '', '', '{\"zh-CN\": \"佤族\", \"en-US\": \"Va Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (70, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '28', '纳西族', b'1', '', 27, '', '', '', '', '{\"zh-CN\": \"纳西族\", \"en-US\": \"Naxi Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (71, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '29', '羌族', b'1', '', 28, '', '', '', '', '{\"zh-CN\": \"羌族\", \"en-US\": \"Qiang Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (72, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '30', '土族', b'1', '', 29, '', '', '', '', '{\"zh-CN\": \"土族\", \"en-US\": \"Tu Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (73, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '31', '仫佬族', b'1', '', 30, '', '', '', '', '{\"zh-CN\": \"仫佬族\", \"en-US\": \"Mulao Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (74, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '32', '锡伯族', b'1', '', 31, '', '', '', '', '{\"zh-CN\": \"锡伯族\", \"en-US\": \"Xibe Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (75, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '33', '柯尔克孜族', b'1', '', 32, '', '', '', '', '{\"zh-CN\": \"柯尔克孜族\", \"en-US\": \"Kyrgyz Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (76, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '34', '达斡尔族', b'1', '', 33, '', '', '', '', '{\"zh-CN\": \"达斡尔族\", \"en-US\": \"Daur Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (77, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '35', '景颇族', b'1', '', 34, '', '', '', '', '{\"zh-CN\": \"景颇族\", \"en-US\": \"Jingpo Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (78, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '36', '毛南族', b'1', '', 35, '', '', '', '', '{\"zh-CN\": \"毛南族\", \"en-US\": \"Maonan Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (79, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '37', '撒拉族', b'1', '', 36, '', '', '', '', '{\"zh-CN\": \"撒拉族\", \"en-US\": \"Salar Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (80, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '38', '塔吉克族', b'1', '', 37, '', '', '', '', '{\"zh-CN\": \"塔吉克族\", \"en-US\": \"Tajik Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (81, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '39', '阿昌族', b'1', '', 38, '', '', '', '', '{\"zh-CN\": \"阿昌族\", \"en-US\": \"Achang Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (82, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '40', '普米族', b'1', '', 39, '', '', '', '', '{\"zh-CN\": \"普米族\", \"en-US\": \"Pumi Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (83, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '41', '鄂温克族', b'1', '', 40, '', '', '', '', '{\"zh-CN\": \"鄂温克族\", \"en-US\": \"Ewenki Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (84, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '42', '怒族', b'1', '', 41, '', '', '', '', '{\"zh-CN\": \"怒族\", \"en-US\": \"Nu Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (85, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '43', '京族', b'1', '', 42, '', '', '', '', '{\"zh-CN\": \"京族\", \"en-US\": \"Jing Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (86, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '44', '基诺族', b'1', '', 43, '', '', '', '', '{\"zh-CN\": \"基诺族\", \"en-US\": \"Jino Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (87, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '45', '德昂族', b'1', '', 44, '', '', '', '', '{\"zh-CN\": \"德昂族\", \"en-US\": \"Deang Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (88, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '46', '保安族', b'1', '', 45, '', '', '', '', '{\"zh-CN\": \"保安族\", \"en-US\": \"Bonan Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (89, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '47', '俄罗斯族', b'1', '', 46, '', '', '', '', '{\"zh-CN\": \"俄罗斯族\", \"en-US\": \"Russian Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (90, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '48', '裕固族', b'1', '', 47, '', '', '', '', '{\"zh-CN\": \"裕固族\", \"en-US\": \"Yugur Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (91, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '49', '乌兹别克族', b'1', '', 48, '', '', '', '', '{\"zh-CN\": \"乌兹别克族\", \"en-US\": \"Uzbek Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (92, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '50', '门巴族', b'1', '', 49, '', '', '', '', '{\"zh-CN\": \"门巴族\", \"en-US\": \"Monba Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (93, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '51', '鄂伦春族', b'1', '', 50, '', '', '', '', '{\"zh-CN\": \"鄂伦春族\", \"en-US\": \"Oroqen Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (94, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '52', '独龙族', b'1', '', 51, '', '', '', '', '{\"zh-CN\": \"独龙族\", \"en-US\": \"Derung Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (95, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '53', '塔塔尔族', b'1', '', 52, '', '', '', '', '{\"zh-CN\": \"塔塔尔族\", \"en-US\": \"Tatar Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (96, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '54', '赫哲族', b'1', '', 53, '', '', '', '', '{\"zh-CN\": \"赫哲族\", \"en-US\": \"Hezhen Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (97, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '55', '珞巴族', b'1', '', 54, '', '', '', '', '{\"zh-CN\": \"珞巴族\", \"en-US\": \"Lhoba Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (98, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '56', '布朗族', b'1', '', 55, '', '', '', '', '{\"zh-CN\": \"布朗族\", \"en-US\": \"Blang Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (99, 1451108231005863936, 'GLOBAL_NATION', 'system', '20', '1', '57', '其他', b'1', '', 100, '', '', '', '', '{\"zh-CN\": \"其他\", \"en-US\": \"Other\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (143963605795078148, 0, '', 'application', '10', '1', 'TENANT_APPLICATION_TYPE', '应用类型', b'1', '[10-自建应用 20-第三方应用]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (143963605795078149, 0, '', 'tenant', '10', '1', 'ApplicationGrantTypeEnum', '授权类型', b'1', '[10-应用授权 20-应用续期 30-取消授权]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (143963605795078150, 143963605795078149, 'ApplicationGrantTypeEnum', 'tenant', '10', '1', '10', '应用授权', b'1', '', 1, '', 'success', '', 'success', '{\"zh-CN\": \"应用授权\", \"en-US\": \"Application Authorization\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (143963605795078151, 143963605795078149, 'ApplicationGrantTypeEnum', 'tenant', '10', '1', '20', '应用续期', b'1', '', 2, '', 'info', '', 'processing', '{\"zh-CN\": \"应用续期\", \"en-US\": \"Application Renewal\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (143963605795078152, 143963605795078149, 'ApplicationGrantTypeEnum', 'tenant', '10', '1', '30', '取消授权', b'1', '', 3, '', 'warning', '', 'warning', '{\"zh-CN\": \"取消授权\", \"en-US\": \"Cancel Authorization\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (143963605795078153, 143963605795078148, 'TENANT_APPLICATION_TYPE', 'application', '10', '1', '10', '自建应用', b'1', '', 1, '', '', '', 'success', '{\"zh-CN\": \"自建应用\", \"en-US\": \"Self-built Application\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (143963605795078154, 143963605795078148, 'TENANT_APPLICATION_TYPE', 'application', '10', '1', '20', '第三方应用', b'1', '', 2, '', '', '', 'error', '{\"zh-CN\": \"第三方应用\", \"en-US\": \"Third-party Application\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (160561957882036228, 0, '', 'application', '10', '1', 'ResourceOpenWithEnum', '打开方式', b'1', '[01-组件 02-内链 03-外链]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (160561957882036229, 160561957882036228, 'ResourceOpenWithEnum', 'application', '10', '1', '01', '组件', b'1', '', 1, '', '', '', 'success', '{\"zh-CN\": \"组件\", \"en-US\": \"Component\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (160561957882036230, 160561957882036228, 'ResourceOpenWithEnum', 'application', '10', '1', '02', '内链', b'1', '', 2, '', '', '', 'error', '{\"zh-CN\": \"内链\", \"en-US\": \"Internal Link\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (160561957882036231, 160561957882036228, 'ResourceOpenWithEnum', 'application', '10', '1', '03', '外链', b'1', '', 3, '', '', '', 'processing', '{\"zh-CN\": \"外链\", \"en-US\": \"External Link\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293568, 0, '', 'system', '10', '1', 'RoleCategoryEnum', '角色类别', b'1', '[10-功能角色 20-桌面角色 30-数据角色]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293569, 0, '', 'application', '10', '1', 'DataScopeEnum', '数据范围', b'1', '[01-全部 02-本单位及子级 03-本单位 04-本部门及子级 05-本部门 06-个人 07-自定义]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293570, 179467712429293569, 'DataScopeEnum', 'application', '10', '1', '01', '全部', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"全部\", \"en-US\": \"All\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293571, 179467712429293569, 'DataScopeEnum', 'application', '10', '1', '02', '本单位及子级', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"本单位及子级\", \"en-US\": \"Current Unit and Subunits\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293572, 179467712429293569, 'DataScopeEnum', 'application', '10', '1', '03', '本单位', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"本单位\", \"en-US\": \"Current Unit\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293573, 179467712429293569, 'DataScopeEnum', 'application', '10', '1', '04', '本部门及子级', b'1', '', 4, '', '', '', '', '{\"zh-CN\": \"本部门及子级\", \"en-US\": \"Current Department and Subdepartments\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293574, 179467712429293569, 'DataScopeEnum', 'application', '10', '1', '05', '本部门', b'1', '', 5, '', '', '', '', '{\"zh-CN\": \"本部门\", \"en-US\": \"Current Department\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293575, 179467712429293569, 'DataScopeEnum', 'application', '10', '1', '06', '个人', b'1', '', 6, '', '', '', '', '{\"zh-CN\": \"个人\", \"en-US\": \"Personal\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293576, 179467712429293569, 'DataScopeEnum', 'application', '10', '1', '07', '自定义', b'1', '', 7, '', '', '', '', '{\"zh-CN\": \"自定义\", \"en-US\": \"Custom\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293577, 179467712429293568, 'RoleCategoryEnum', 'system', '10', '1', '10', '功能角色', b'1', '', 1, '', '', '', 'success', '{\"zh-CN\": \"功能角色\", \"en-US\": \"Functional Role\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293578, 179467712429293568, 'RoleCategoryEnum', 'system', '10', '1', '20', '桌面角色', b'1', '', 2, '', '', '', 'processing', '{\"zh-CN\": \"桌面角色\", \"en-US\": \"Desktop Role\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (179467712429293579, 179467712429293568, 'RoleCategoryEnum', 'system', '10', '1', '30', '数据角色', b'1', '', 1, '', '', '', 'error', '{\"zh-CN\": \"数据角色\", \"en-US\": \"Data Role\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (216686795209834626, 0, '', NULL, '20', NULL, 'TEST_ADD_DICT', '整形字典', b'1', '[1-测试 2-新增 aad-haha]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (216686795209834627, 216686795209834626, 'TEST_ADD_DICT', NULL, '20', NULL, '1', '测试', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"测试\", \"en-US\": \"Test\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (216686795209834628, 216686795209834626, 'TEST_ADD_DICT', NULL, '20', NULL, '2', '新增', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"新增\", \"en-US\": \"Add\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (244439645515939840, 0, '', 'developer', '10', '1', 'InterfaceExecModeEnum', '执行模式', b'1', '接口执行模式 [01-实现类 02-脚本]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (244439645515939841, 244439645515939840, 'InterfaceExecModeEnum', 'developer', '10', '1', '01', '实现类', b'1', '', 1, '', '', '', 'success', '{\"zh-CN\": \"实现类\", \"en-US\": \"Implementation Class\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (244439645515939842, 244439645515939840, 'InterfaceExecModeEnum', 'developer', '10', '1', '02', '脚本', b'1', '', 2, '', '', '', 'error', '{\"zh-CN\": \"脚本\", \"en-US\": \"Script\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922112, 0, '', 'developer', '10', '1', 'MsgTemplateTypeEnum', '消息类型', b'1', '[01-短信 02-邮件 03-站内信]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922113, 245619503096922112, 'MsgTemplateTypeEnum', 'developer', '10', '1', '01', '短信', b'1', '', 1, '', '', '', 'success', '{\"zh-CN\": \"短信\", \"en-US\": \"SMS\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922114, 245619503096922112, 'MsgTemplateTypeEnum', 'developer', '10', '1', '02', '邮件', b'1', '', 2, '', '', '', 'error', '{\"zh-CN\": \"邮件\", \"en-US\": \"Email\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922115, 245619503096922112, 'MsgTemplateTypeEnum', 'developer', '10', '1', '03', '站内信', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"站内信\", \"en-US\": \"Site Message\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922116, 0, '', 'developer', '10', '1', 'NOTICE_TARGET', '打开方式', b'1', '[01-页面 02-弹窗 03-新开窗口]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922117, 245619503096922116, 'NOTICE_TARGET', 'developer', '10', '1', '01', '页面', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"页面\", \"en-US\": \"Page\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922118, 245619503096922116, 'NOTICE_TARGET', 'developer', '10', '1', '02', '弹窗', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"弹窗\", \"en-US\": \"Popup\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922119, 245619503096922116, 'NOTICE_TARGET', 'developer', '10', '1', '03', '新开窗口', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"新开窗口\", \"en-US\": \"New Window\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922120, 0, '', 'developer', '10', '1', 'NoticeRemindModeEnum', '提醒方式', b'1', '[01-待办 02-预警 03-提醒]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922121, 245619503096922120, 'NoticeRemindModeEnum', 'developer', '10', '1', '01', '待办', b'1', '', 1, '', '', '', 'success', '{\"zh-CN\": \"待办\", \"en-US\": \"Pending\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922122, 245619503096922120, 'NoticeRemindModeEnum', 'developer', '10', '1', '02', '预警', b'1', '', 2, '', '', '', 'error', '{\"zh-CN\": \"预警\", \"en-US\": \"Early Warning\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (245619503096922123, 245619503096922120, 'NoticeRemindModeEnum', 'developer', '10', '1', '03', '提醒', b'1', '', 3, '', '', '', 'processing', '{\"zh-CN\": \"提醒\", \"en-US\": \"Reminder\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (249679058940461056, 0, '', 'developer', '10', '1', 'MsgInterfaceLoggingStatusEnum', '接口日志执行状态', b'1', '[01-初始化 02-成功 03-失败]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (249679058940461057, 249679058940461056, 'MsgInterfaceLoggingStatusEnum', 'developer', '10', '1', '01', '初始化', b'1', '[01-初 始化 02-成功 03-失败]', 1, '', '', '', '', '{\"zh-CN\": \"初始化\", \"en-US\": \"Initialization\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (249679058940461058, 249679058940461056, 'MsgInterfaceLoggingStatusEnum', 'developer', '10', '1', '02', '成功', b'1', '[01-初始 化 02-成功 03-失败]', 2, '', '', '', '', '{\"zh-CN\": \"成功\", \"en-US\": \"Success\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (249679058940461059, 249679058940461056, 'MsgInterfaceLoggingStatusEnum', 'developer', '10', '1', '03', '失败', b'1', '[01-初始 化 02-成功 03-失败]', 3, '', '', '', '', '{\"zh-CN\": \"失败\", \"en-US\": \"Failure\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (281139711563530588, 0, '', 'system', '10', '1', 'LoginStatusEnum', '登录状态', b'1', '[01-登录成功 02-验证码错误 03-密码错误 04-账号锁定 05-切换租户 06-短信验证码错误]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (281139711563530601, 281139711563530588, 'LoginStatusEnum', 'system', '10', '1', '01', '登录成功', b'1', '', 1, '', '', '', 'success', '{\"zh-CN\": \"登录成功\", \"en-US\": \"Login Success\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (281139711563530602, 281139711563530588, 'LoginStatusEnum', 'system', '10', '1', '02', '验证码错误', b'1', '', 2, '', '', '', 'error', '{\"zh-CN\": \"验证码错误\", \"en-US\": \"Verification Code Error\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (281139711563530603, 281139711563530588, 'LoginStatusEnum', 'system', '10', '1', '03', '密码错误', b'1', '', 3, '', '', '', 'error', '{\"zh-CN\": \"密码错误\", \"en-US\": \"Password Error\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (281139711563530604, 281139711563530588, 'LoginStatusEnum', 'system', '10', '1', '04', '账号锁定', b'1', '', 4, '', '', '', 'warning', '{\"zh-CN\": \"账号锁定\", \"en-US\": \"Account Locked\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (281139711563530605, 281139711563530588, 'LoginStatusEnum', 'system', '10', '1', '05', '切换租户', b'1', '', 5, '', '', '', 'processing', '{\"zh-CN\": \"切换租户\", \"en-US\": \"Switch Tenant\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (281139711563530606, 281139711563530588, 'LoginStatusEnum', 'system', '10', '1', '06', '短信验证码错误', b'1', '', 6, '', '', '', 'error', '{\"zh-CN\": \"短信验证码错误\", \"en-US\": \"SMS Verification Code Error\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (596670257059353788, 0, '', 'tenant', '10', '1', 'DATASOURCE_CONFIG_DRIVER', '数据源驱动', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (596670257059353805, 596670257059353788, 'DATASOURCE_CONFIG_DRIVER', 'tenant', '10', '1', 'com.mysql.cj.jdbc.Driver', 'mysql6', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"mysql6\", \"en-US\": \"mysql6\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (596670257059353808, 596670257059353788, 'DATASOURCE_CONFIG_DRIVER', 'tenant', '10', '1', 'com.mysql.jdbc.Driver', 'mysql5', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"mysql5\", \"en-US\": \"mysql5\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (596670257059353811, 596670257059353788, 'DATASOURCE_CONFIG_DRIVER', 'tenant', '10', '1', 'oracle.jdbc.driver.OracleDriver', 'oracle', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"oracle\", \"en-US\": \"oracle\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (596670257059353814, 596670257059353788, 'DATASOURCE_CONFIG_DRIVER', 'tenant', '10', '1', 'com.microsoft.sqlserver.jdbc.SQLServerDriver', 'sqlserver', b'1', '', 4, '', '', '', '', '{\"zh-CN\": \"sqlserver\", \"en-US\": \"sqlserver\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (628813886792178688, 0, '', 'open', '10', '2', 'SOP_API_INFO_REG_SOURCE', '注册来源', b'1', '[1-系统注册 2-手动注册]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (628813886792178691, 628813886792178688, 'SOP_API_INFO_REG_SOURCE', 'open', '10', '2', '1', '系统注册', b'1', '', 1, '', '', '', 'processing', '{\"zh-CN\": \"系统注册\", \"en-US\": \"System Registration\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (628901512714957824, 628813886792178688, 'SOP_API_INFO_REG_SOURCE', 'open', '10', '2', '2', '手动注册', b'1', '', 2, '', '', '', 'success', '{\"zh-CN\": \"手动注册\", \"en-US\": \"Manual Registration\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (629228789222933504, 0, '', 'open', '10', '2', 'SOP_API_INFO_API_MODE', '接口模式', b'1', '[1-open接口 2-Restful模式]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (629228789222933505, 629228789222933504, 'SOP_API_INFO_API_MODE', 'open', '10', '2', '2', 'Restful模式', b'1', '', 2, '', '', '', 'success', '{\"zh-CN\": \"Restful模式\", \"en-US\": \"Restful Mode\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (629228789222933506, 629228789222933504, 'SOP_API_INFO_API_MODE', 'open', '10', '2', '1', 'open接口', b'1', '', 1, '', '', '', 'processing', '{\"zh-CN\": \"open接口\", \"en-US\": \"Open Interface\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (630624567694850048, 0, '', 'open', '10', '2', 'SOP_ISV_CREATION_METHOD', '创建方式', b'1', '[0-后台创建 1-用户申请]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (630624567694850049, 630624567694850048, 'SOP_ISV_CREATION_METHOD', 'open', '10', '2', '0', '后台创建', b'1', '[0-后台创建 1-用 户申请]', 1, '', '', '', '', '{\"zh-CN\": \"后台创建\", \"en-US\": \"Background Creation\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (630624567694850050, 630624567694850048, 'SOP_ISV_CREATION_METHOD', 'open', '10', '2', '1', '用户申请', b'1', '[0-后台创建 1-用 户申请]', 2, '', '', '', '', '{\"zh-CN\": \"用户申请\", \"en-US\": \"User Application\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (631035840878223360, 0, '', 'open', '10', '2', 'SOP_ISV_KEYS_KEY_FORMAT', '秘钥格式', b'1', '[1-java适用 2-非java适用]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (631035840878223361, 631035840878223360, 'SOP_ISV_KEYS_KEY_FORMAT', 'open', '10', '2', '1', 'PKCS8(Java适用)', b'1', 'RSA', 1, '', '', '', '', '{\"zh-CN\": \"PKCS8(Java适用)\", \"en-US\": \"PKCS8 (for Java)\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (631035840878223362, 631035840878223360, 'SOP_ISV_KEYS_KEY_FORMAT', 'open', '10', '2', '2', 'PKCS1(非Java适用)', b'1', 'RSA/ECB/PKCS1Padding', 2, '', '', '', '', '{\"zh-CN\": \"PKCS1(非Java适用)\", \"en-US\": \"PKCS1 (non-Java)\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683018603156145159, 0, '', 'system', '10', '1', 'DICT_GROUP', '字典分组', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683018603156145169, 683018603156145159, 'DICT_GROUP', 'system', '10', '1', 'system', '系统字典', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"系统字典\", \"en-US\": \"System Dictionary\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683018603156145173, 683018603156145159, 'DICT_GROUP', 'system', '10', '1', 'tenant', '租户管理字典', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"租户管理字典\", \"en-US\": \"Tenant Management Dictionary\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683018603156145177, 683018603156145159, 'DICT_GROUP', 'system', '10', '1', 'application', '应用管理字典', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"应用管理字典\", \"en-US\": \"Application Management Dictionary\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683018603156145187, 683018603156145159, 'DICT_GROUP', 'system', '10', '1', 'developer', '开发者管理字典', b'1', '', 5, '', '', '', '', '{\"zh-CN\": \"开发者管理字典\", \"en-US\": \"Developer Management Dictionary\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683018603156145192, 683018603156145159, 'DICT_GROUP', 'system', '10', '1', 'open', '开放平台字典', b'1', '', 6, '', '', '', '', '{\"zh-CN\": \"开放平台字典\", \"en-US\": \"Open Platform Dictionary\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663166, 0, '', 'system', '10', '3', 'BooleanEnum', '是否-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663167, 683141327551663166, 'BooleanEnum', 'system', '10', '3', 'true', '是', b'1', '', 0, '', '', '', 'success', '{\"zh-CN\": \"是\", \"en-US\": \"Yes\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663168, 683141327551663166, 'BooleanEnum', 'system', '10', '3', 'false', '否', b'1', '', 1, '', '', '', 'error', '{\"zh-CN\": \"否\", \"en-US\": \"No\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663175, 0, '', 'system', '10', '1', 'DictDataTypeEnum', '字典数据类型-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663176, 683141327551663175, 'DictDataTypeEnum', 'system', '30', '1', '1', '字符串', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"字符串\", \"en-US\": \"String\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663177, 683141327551663175, 'DictDataTypeEnum', 'system', '30', '1', '2', '整型', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"整型\", \"en-US\": \"Integer\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663178, 683141327551663175, 'DictDataTypeEnum', 'system', '30', '1', '3', '布尔', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"布尔\", \"en-US\": \"Boolean\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663225, 0, '', 'application', '10', '1', 'ResourceTypeEnum', '资源类型-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663226, 683141327551663225, 'ResourceTypeEnum', 'application', '10', '1', '20', '菜单', b'1', '', 0, '', '', '', 'success', '{\"zh-CN\": \"菜单\", \"en-US\": \"Menu\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663227, 683141327551663225, 'ResourceTypeEnum', 'application', '10', '1', '40', '按钮', b'1', '', 1, '', '', '', 'cyan', '{\"zh-CN\": \"按钮\", \"en-US\": \"Button\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663228, 683141327551663225, 'ResourceTypeEnum', 'application', '10', '1', '50', '字段', b'1', '', 2, '', '', '', 'blue', '{\"zh-CN\": \"字段\", \"en-US\": \"Field\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663229, 683141327551663225, 'ResourceTypeEnum', 'application', '10', '1', '60', '数据', b'1', '', 3, '', '', '', 'purple', '{\"zh-CN\": \"数据\", \"en-US\": \"Data\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663326, 0, '', 'tenant', '10', '1', 'DefTenantRegisterTypeEnum', '注册类型-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663327, 683141327551663326, 'DefTenantRegisterTypeEnum', 'tenant', '10', '1', 'CREATE', '创建', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"创建\", \"en-US\": \"Create\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663328, 683141327551663326, 'DefTenantRegisterTypeEnum', 'tenant', '10', '1', 'REGISTER', '注册', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"注册\", \"en-US\": \"Register\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663393, 0, '', 'system', '10', '1', 'Sex', '性别-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663394, 683141327551663393, 'Sex', 'system', '10', '1', '1', '男', b'1', '', 0, '', '', '', 'success', '{\"zh-CN\": \"男\", \"en-US\": \"Male\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663395, 683141327551663393, 'Sex', 'system', '10', '1', '2', '女', b'1', '', 1, '', '', '', 'error', '{\"zh-CN\": \"女\", \"en-US\": \"Female\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663488, 0, '', 'system', '10', '1', 'HttpMethod', 'HTTP方法-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663489, 683141327551663488, 'HttpMethod', 'system', '30', '1', 'ALL', 'ALL', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"ALL\", \"en-US\": \"ALL\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663490, 683141327551663488, 'HttpMethod', 'system', '30', '1', 'GET', 'GET', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"GET\", \"en-US\": \"GET\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663491, 683141327551663488, 'HttpMethod', 'system', '30', '1', 'POST', 'POST', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"POST\", \"en-US\": \"POST\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663492, 683141327551663488, 'HttpMethod', 'system', '30', '1', 'PUT', 'PUT', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"PUT\", \"en-US\": \"PUT\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663493, 683141327551663488, 'HttpMethod', 'system', '30', '1', 'DELETE', 'DELETE', b'1', '', 4, '', '', '', '', '{\"zh-CN\": \"DELETE\", \"en-US\": \"DELETE\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663494, 683141327551663488, 'HttpMethod', 'system', '30', '1', 'PATCH', 'PATCH', b'1', '', 5, '', '', '', '', '{\"zh-CN\": \"PATCH\", \"en-US\": \"PATCH\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663495, 683141327551663488, 'HttpMethod', 'system', '30', '1', 'TRACE', 'TRACE', b'1', '', 6, '', '', '', '', '{\"zh-CN\": \"TRACE\", \"en-US\": \"TRACE\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663496, 683141327551663488, 'HttpMethod', 'system', '30', '1', 'HEAD', 'HEAD', b'1', '', 7, '', '', '', '', '{\"zh-CN\": \"HEAD\", \"en-US\": \"HEAD\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663497, 683141327551663488, 'HttpMethod', 'system', '30', '1', 'OPTIONS', 'OPTIONS', b'1', '', 8, '', '', '', '', '{\"zh-CN\": \"OPTIONS\", \"en-US\": \"OPTIONS\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663627, 0, '', 'developer', '10', '1', 'FileOverrideStrategyEnum', '文件覆盖策略', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663628, 683141327551663627, 'FileOverrideStrategyEnum', 'developer', '30', '1', 'OVERRIDE', '覆盖', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"覆盖\", \"en-US\": \"Override\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663629, 683141327551663627, 'FileOverrideStrategyEnum', 'developer', '30', '1', 'ADD', '新增', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"新增\", \"en-US\": \"Add\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663630, 683141327551663627, 'FileOverrideStrategyEnum', 'developer', '30', '1', 'IGNORE', '忽略', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"忽略\", \"en-US\": \"Ignore\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663631, 683141327551663627, 'FileOverrideStrategyEnum', 'developer', '30', '1', 'EXIST_IGNORE', '存在时忽略', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"存在时忽略\", \"en-US\": \"Ignore If Exists\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663759, 0, '', 'developer', '10', '1', 'ProjectTypeEnum', '项目类型', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663760, 683141327551663759, 'ProjectTypeEnum', 'developer', '10', '1', 'BOOT', '单体版', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"单体版\", \"en-US\": \"Monomer Edition\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663761, 683141327551663759, 'ProjectTypeEnum', 'developer', '10', '1', 'CLOUD', '微服务版', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"微服务版\", \"en-US\": \"Microservices Edition\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683141327551663992, 1445949268236959744, 'DictClassifyEnum', 'system', '30', '1', '30', '枚举字典', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"枚举字典\", \"en-US\": \"Enum Dictionary\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683406468767748102, 0, '', 'system', '10', '1', 'TaskStatus', '执行状态-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683406468767748103, 683406468767748102, 'TaskStatus', 'system', '30', '1', 'DRAFT', '草稿', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"草稿\", \"en-US\": \"Draft\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683406468767748104, 683406468767748102, 'TaskStatus', 'system', '30', '1', 'WAITING', '等待执行', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"等待执行\", \"en-US\": \"Waiting Execution\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683406468767748105, 683406468767748102, 'TaskStatus', 'system', '30', '1', 'SUCCESS', '执行成功', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"执行成功\", \"en-US\": \"Execution Success\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683406468767748106, 683406468767748102, 'TaskStatus', 'system', '30', '1', 'FAIL', '执行失败', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"执行失败\", \"en-US\": \"Execution Failure\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144263, 0, '', 'system', '10', '1', 'AuditStatusEnum', '审核状态-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144264, 683408255474144263, 'AuditStatusEnum', 'system', '30', '1', '0', '初始化', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"初始化\", \"en-US\": \"Initialization\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144265, 683408255474144263, 'AuditStatusEnum', 'system', '30', '1', '1', '申请中', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"申请中\", \"en-US\": \"Applying\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144266, 683408255474144263, 'AuditStatusEnum', 'system', '30', '1', '2', '通过', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"通过\", \"en-US\": \"Pass\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144267, 683408255474144263, 'AuditStatusEnum', 'system', '30', '1', '99', '退回', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"退回\", \"en-US\": \"Return\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144269, 0, '', 'developer', '10', '1', 'LogType', '日志类型-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144270, 683408255474144269, 'LogType', 'developer', '10', '1', 'OPT', '正常', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"正常\", \"en-US\": \"Normal\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144271, 683408255474144269, 'LogType', 'developer', '30', '1', 'EX', '异常', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"异常\", \"en-US\": \"Exception\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144369, 0, '', 'system', '10', '1', 'I18N_JSON', '国际化配置', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144374, 683408255474144369, 'I18N_JSON', 'system', '10', '1', 'zh-CN', '中文', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"中文\", \"en-US\": \"Chinese\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683408255474144378, 683408255474144369, 'I18N_JSON', 'system', '10', '1', 'en-US', 'English', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"English\", \"en-US\": \"English\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683418314287552650, 0, '', 'system', '30', '1', 'TenantConnectTypeEnum', '数据源链接类型-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683418314287552651, 683418314287552650, 'TenantConnectTypeEnum', 'system', '30', '1', 'SYSTEM', '系统内置数据源', b'1', '', 0, '', '', '', '', '{\"zh-CN\": \"系统内置数据源\", \"en-US\": \"System Built-in Data Source\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (683418314287552652, 683418314287552650, 'TenantConnectTypeEnum', 'system', '30', '1', 'CUSTOM', '自定义数据源', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"自定义数据源\", \"en-US\": \"Custom Data Source\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503372, 0, '', 'developer', '30', '1', 'EntitySuperClassEnum', '父类实体类型', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503373, 700749228881503372, 'EntitySuperClassEnum', 'developer', '30', '1', 'SUPER_ENTITY', 'SUPER_ENTITY', b'1', '', 0, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503374, 700749228881503372, 'EntitySuperClassEnum', 'developer', '30', '1', 'ENTITY', 'ENTITY', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503375, 700749228881503372, 'EntitySuperClassEnum', 'developer', '30', '1', 'TREE_ENTITY', 'TREE_ENTITY', b'1', '', 2, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503376, 700749228881503372, 'EntitySuperClassEnum', 'developer', '30', '1', 'NONE', 'NONE', b'1', '', 3, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503378, 0, '', 'developer', '30', '1', 'SuperClassEnum', '父类', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503379, 700749228881503378, 'SuperClassEnum', 'developer', '30', '1', 'SUPER_CLASS', 'SUPER_CLASS', b'1', '', 0, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503380, 700749228881503378, 'SuperClassEnum', 'developer', '30', '1', 'SUPER_POI_CLASS', 'SUPER_POI_CLASS', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503381, 700749228881503378, 'SuperClassEnum', 'developer', '30', '1', 'SUPER_CACHE_CLASS', 'SUPER_CACHE_CLASS', b'1', '', 2, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503382, 700749228881503378, 'SuperClassEnum', 'developer', '30', '1', 'SUPER_SIMPLE_CLASS', 'SUPER_SIMPLE_CLASS', b'1', '', 3, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503383, 700749228881503378, 'SuperClassEnum', 'developer', '30', '1', 'SUPER_READ_CLASS', 'SUPER_READ_CLASS', b'1', '', 4, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503384, 700749228881503378, 'SuperClassEnum', 'developer', '30', '1', 'SUPER_WRITE_CLASS', 'SUPER_WRITE_CLASS', b'1', '', 5, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503385, 700749228881503378, 'SuperClassEnum', 'developer', '30', '1', 'NONE_CS', 'NONE_CS', b'1', '', 6, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503386, 700749228881503378, 'SuperClassEnum', 'developer', '30', '1', 'NONE', 'NONE', b'1', '', 7, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503388, 0, '', 'developer', '30', '1', 'PopupTypeEnum', '弹窗方式', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503389, 700749228881503388, 'PopupTypeEnum', 'developer', '30', '1', 'MODAL', '对话框', b'1', '', 0, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503390, 700749228881503388, 'PopupTypeEnum', 'developer', '30', '1', 'DRAWER', '抽屉', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503391, 700749228881503388, 'PopupTypeEnum', 'developer', '30', '1', 'JUMP', '跳转', b'1', '', 2, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503393, 0, '', 'developer', '30', '1', 'SqlConditionEnum', 'SQL 比较条件常量定义类', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503394, 700749228881503393, 'SqlConditionEnum', 'developer', '30', '1', 'EQUAL', 'static com.baomidou.mybatisplus.annotation.SqlCondition.EQUAL', b'1', '', 0, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503395, 700749228881503393, 'SqlConditionEnum', 'developer', '30', '1', 'NOT_EQUAL', 'static com.baomidou.mybatisplus.annotation.SqlCondition.NOT_EQUAL', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503396, 700749228881503393, 'SqlConditionEnum', 'developer', '30', '1', 'LIKE', 'static cn.lmx.kpu.model.constant.Condition.LIKE', b'1', '', 2, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503397, 700749228881503393, 'SqlConditionEnum', 'developer', '30', '1', 'ORACLE_LIKE', 'static com.baomidou.mybatisplus.annotation.SqlCondition.ORACLE_LIKE', b'1', '', 3, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503398, 700749228881503393, 'SqlConditionEnum', 'developer', '30', '1', 'LIKE_LEFT', 'static com.baomidou.mybatisplus.annotation.SqlCondition.LIKE_LEFT', b'1', '', 4, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503399, 700749228881503393, 'SqlConditionEnum', 'developer', '30', '1', 'LIKE_RIGHT', 'static com.baomidou.mybatisplus.annotation.SqlCondition.LIKE_RIGHT', b'1', '', 5, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503420, 0, '', 'developer', '30', '1', 'TemplateEnum', '代码模板', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503421, 700749228881503420, 'TemplateEnum', 'developer', '30', '1', 'BACKEND', '后端', b'1', '', 0, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503422, 700749228881503420, 'TemplateEnum', 'developer', '30', '1', 'WEB_PLUS', '前端', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503423, 700749228881503420, 'TemplateEnum', 'developer', '30', '1', 'WEB_SOYBEAN', '前端(Soybean)', b'1', '', 2, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503424, 700749228881503420, 'TemplateEnum', 'developer', '30', '1', 'WEB_VBEN5', '前端(vben5)', b'1', '', 3, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503426, 0, '', 'developer', '30', '1', 'TplEnum', '模板类型', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503427, 700749228881503426, 'TplEnum', 'developer', '30', '1', 'SIMPLE', '单表', b'1', '', 0, 'ant-design:appstore-twotone', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503428, 700749228881503426, 'TplEnum', 'developer', '30', '1', 'TREE', '树结构', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (700749228881503429, 700749228881503426, 'TplEnum', 'developer', '30', '1', 'MAIN_SUB', '主从结构', b'1', '', 2, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (712712237514300664, 0, '', 'open', '30', '1', 'NotifyStatusEnum', '通知状态-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (712712237514300665, 712712237514300664, 'NotifyStatusEnum', 'open', '30', '1', '0', '待发送', b'1', '', 0, '', '', '', 'processing', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (712712237514300666, 712712237514300664, 'NotifyStatusEnum', 'open', '30', '1', '1', '发送成功', b'1', '', 1, '', '', '', 'success', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (712712237514300667, 712712237514300664, 'NotifyStatusEnum', 'open', '30', '1', '2', '发送失败', b'1', '', 2, '', '', '', 'error', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (712712237514300668, 712712237514300664, 'NotifyStatusEnum', 'open', '30', '1', '3', '重试结束', b'1', '', 3, '', '', '', 'warning', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (712712237514300669, 712712237514300664, 'NotifyStatusEnum', 'open', '30', '1', '4', '手动结束', b'1', '', 4, '', '', '', 'default', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319707996, 0, NULL, 'system', '30', '1', 'FileType', '文件类型-枚举', b'1', '枚举导入', 1, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319707997, 783038487319707996, 'FileType', 'system', '30', '1', 'IMAGE', '图片', b'1', '', 0, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319707998, 783038487319707996, 'FileType', 'system', '30', '1', 'VIDEO', '视频', b'1', '', 1, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319707999, 783038487319707996, 'FileType', 'system', '30', '1', 'AUDIO', '音频', b'1', '', 2, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319708000, 783038487319707996, 'FileType', 'system', '30', '1', 'DOC', '文档', b'1', '', 3, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319708001, 783038487319707996, 'FileType', 'system', '30', '1', 'OTHER', '其他', b'1', '', 4, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319708002, 0, NULL, 'system', '30', '1', 'FileStorageType', '文件存储类型', b'1', '枚举导入', 1, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319708003, 783038487319708002, 'FileStorageType', 'system', '30', '1', 'LOCAL', '本地', b'1', '', 0, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319708004, 783038487319708002, 'FileStorageType', 'system', '30', '1', 'FAST_DFS', 'FastDFS', b'1', '', 1, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319708005, 783038487319708002, 'FileStorageType', 'system', '30', '1', 'MIN_IO', 'MinIO', b'1', '', 2, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319708006, 783038487319708002, 'FileStorageType', 'system', '30', '1', 'ALI_OSS', '阿里云OSS', b'1', '', 3, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319708007, 783038487319708002, 'FileStorageType', 'system', '30', '1', 'QINIU_OSS', '七牛云OSS', b'1', '', 4, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (783038487319708008, 783038487319708002, 'FileStorageType', 'system', '30', '1', 'HUAWEI_OSS', '华为云OSS', b'1', '', 5, '', '', '', '', '', 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1445949268236959744, 0, '', 'system', '10', '1', 'DictClassifyEnum', '字典分类-枚举', b'1', '[10-系统字典 20-业务字典]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1445983002105479168, 1445949268236959744, 'DictClassifyEnum', 'system', '30', '1', '10', '系统字典', b'1', '', 1, '', '', '', 'success', '{\"zh-CN\": \"系统字典\", \"en-US\": \"System Dictionary\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1445983070812372992, 1445949268236959744, 'DictClassifyEnum', 'system', '30', '1', '20', '业务字典', b'1', '', 2, '', '', '', 'processing', '{\"zh-CN\": \"业务字典\", \"en-US\": \"Business Dictionary\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448505925026447360, 0, '', 'system', '10', '1', 'GLOBAL_AREA_LEVEL', '行政级别', b'1', '[10-国家 20-省份/直辖市 30-地市 40-区 县 50-乡镇]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448506028873220096, 0, '', 'system', '10', '1', 'TENANT_CLIENT_TYPE', '客户端类型', b'1', '[10-WEB网站;15-移动端应用;20-手机H5网页;25-内部服务; 30-第三方应用]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448506127556804608, 0, '', 'system', '10', '1', 'TENANT_AREA_SOURCE', '地区来源', b'1', '[10-爬取 20-新增]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448506284952256512, 0, '', 'system', '10', '1', 'TENANT_PARAMETER_TYPE', '参数类型', b'1', '[10-系统参数 20-业务参数]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448515694336409600, 1448506284952256512, 'TENANT_PARAMETER_TYPE', 'system', '10', '1', '10', '系统参数', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"系统参数\", \"en-US\": \"System Parameter\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448515728603873280, 1448506284952256512, 'TENANT_PARAMETER_TYPE', 'system', '10', '1', '20', '业务参数', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"业务参数\", \"en-US\": \"Business Parameter\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448515804071985152, 1448506127556804608, 'TENANT_AREA_SOURCE', 'system', '10', '1', '10', '爬取', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"爬取\", \"en-US\": \"Crawl\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448515832505171968, 1448506127556804608, 'TENANT_AREA_SOURCE', 'system', '10', '1', '20', '新增', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"新增\", \"en-US\": \"Add\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448636555584339968, 1448505925026447360, 'GLOBAL_AREA_LEVEL', 'system', '10', '1', '10', '国家', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"国家\", \"en-US\": \"Country\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448636622080835584, 1448505925026447360, 'GLOBAL_AREA_LEVEL', 'system', '10', '1', '20', '省份/直辖市', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"省份/直辖市\", \"en-US\": \"Province/Municipality\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448636660773289984, 1448505925026447360, 'GLOBAL_AREA_LEVEL', 'system', '10', '1', '30', '地市', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"地市\", \"en-US\": \"Prefecture-level City\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448636742079873024, 1448505925026447360, 'GLOBAL_AREA_LEVEL', 'system', '10', '1', '40', '区县', b'1', '', 4, '', '', '', '', '{\"zh-CN\": \"区县\", \"en-US\": \"District/County\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448636799311151104, 1448505925026447360, 'GLOBAL_AREA_LEVEL', 'system', '10', '1', '50', '乡镇', b'1', '', 5, '', '', '', '', '{\"zh-CN\": \"乡镇\", \"en-US\": \"Township\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448646183458177024, 1448506028873220096, 'TENANT_CLIENT_TYPE', 'system', '10', '1', '10', 'WEB网站', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"WEB网站\", \"en-US\": \"WEB Website\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448650608742498304, 1448506028873220096, 'TENANT_CLIENT_TYPE', 'system', '10', '1', '15', '移动端应用', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"移动端应用\", \"en-US\": \"Mobile Application\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448650640468213760, 1448506028873220096, 'TENANT_CLIENT_TYPE', 'system', '10', '1', '20', '手机H5网页', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"手机H5网页\", \"en-US\": \"Mobile H5 Webpage\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448650682050543616, 1448506028873220096, 'TENANT_CLIENT_TYPE', 'system', '10', '1', '25', '内部服务', b'1', '', 4, '', '', '', '', '{\"zh-CN\": \"内部服务\", \"en-US\": \"Internal Service\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1448650761264168960, 1448506028873220096, 'TENANT_CLIENT_TYPE', 'system', '10', '1', '30', '第三方应用', b'1', '', 5, '', '', '', '', '{\"zh-CN\": \"第三方应用\", \"en-US\": \"Third-party Application\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451099664811032576, 0, '', 'system', '10', '1', 'OrgTypeEnum', '机构类型', b'1', '[10-单位/门店 20-部门]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451099742934138880, 1451099664811032576, 'OrgTypeEnum', 'system', '10', '1', '10', '单位', b'1', '', 1, '', '', '', 'success', '{\"zh-CN\": \"单位\", \"en-US\": \"Unit\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451099769471500288, 1451099664811032576, 'OrgTypeEnum', 'system', '10', '1', '20', '部门', b'1', '', 2, '', '', '', 'error', '{\"zh-CN\": \"部门\", \"en-US\": \"Department\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451100760304517120, 0, '', 'system', '10', '1', 'BASE_POSITION_STATUS', '职位状态', b'1', '[10-在职 20-离职 30-未激活]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451100809038135296, 1451100760304517120, 'BASE_POSITION_STATUS', 'system', '10', '1', '10', '在职', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"在职\", \"en-US\": \"On Job\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451100851467714560, 1451100760304517120, 'BASE_POSITION_STATUS', 'system', '10', '1', '20', '离职', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"离职\", \"en-US\": \"Leave Job\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451103343890923520, 0, '', 'system', '10', '1', 'GLOBAL_EDUCATION', '学历', b'1', '[01-小学 02-中学 03-高中 04-专科 05-本科 06-硕士 07-博士 08-博士后 09-其他]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451103396311334912, 1451103343890923520, 'GLOBAL_EDUCATION', 'system', '10', '1', '01', '小学', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"小学\", \"en-US\": \"Primary School\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451103460706484224, 1451103343890923520, 'GLOBAL_EDUCATION', 'system', '10', '1', '02', '中学', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"中学\", \"en-US\": \"Middle School\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451105115103559680, 1451103343890923520, 'GLOBAL_EDUCATION', 'system', '10', '1', '03', '高中', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"高中\", \"en-US\": \"High School\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451105202630295552, 1451103343890923520, 'GLOBAL_EDUCATION', 'system', '10', '1', '04', '专科', b'1', '', 4, '', '', '', '', '{\"zh-CN\": \"专科\", \"en-US\": \"Junior College\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451105239401758720, 1451103343890923520, 'GLOBAL_EDUCATION', 'system', '10', '1', '05', '本科', b'1', '', 5, '', '', '', '', '{\"zh-CN\": \"本科\", \"en-US\": \"Undergraduate\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451105277691559936, 1451103343890923520, 'GLOBAL_EDUCATION', 'system', '10', '1', '06', '硕士', b'1', '', 6, '', '', '', '', '{\"zh-CN\": \"硕士\", \"en-US\": \"Master\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451105309626990592, 1451103343890923520, 'GLOBAL_EDUCATION', 'system', '10', '1', '07', '博士', b'1', '', 7, '', '', '', '', '{\"zh-CN\": \"博士\", \"en-US\": \"Doctor\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451105398009364480, 1451103343890923520, 'GLOBAL_EDUCATION', 'system', '10', '1', '08', '博士后', b'1', '', 8, '', '', '', '', '{\"zh-CN\": \"博士后\", \"en-US\": \"Postdoctoral\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451105441353302016, 1451103343890923520, 'GLOBAL_EDUCATION', 'system', '10', '1', '99', '其他', b'1', '', 99, '', '', '', '', '{\"zh-CN\": \"其他\", \"en-US\": \"Other\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1451108231005863936, 0, '', 'system', '10', '1', 'GLOBAL_NATION', '民族', b'1', '', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1454333051138998272, 0, '', 'tenant', '10', '1', 'DefTenantStatusEnum', '租户审核状态', b'1', '[05-正常 10-待初始化 15-已撤回 20-待审核 25-已拒绝 30-已同意]', 1, '', '', '', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1454333103441969152, 1454333051138998272, 'DefTenantStatusEnum', 'tenant', '10', '1', '05', '正常', b'1', '', 1, '', '', '', '', '{\"zh-CN\": \"正常\", \"en-US\": \"Normal\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1454333135360622592, 1454333051138998272, 'DefTenantStatusEnum', 'tenant', '10', '1', '10', '待初始化结构', b'1', '', 2, '', '', '', '', '{\"zh-CN\": \"待初始化结构\", \"en-US\": \"Pending Initialization Structure\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1454333161860235264, 1454333051138998272, 'DefTenantStatusEnum', 'tenant', '10', '1', '15', '待初始化数据源', b'1', '', 3, '', '', '', '', '{\"zh-CN\": \"待初始化数据源\", \"en-US\": \"Pending Initialization Data Source\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1454333189936906240, 1454333051138998272, 'DefTenantStatusEnum', 'tenant', '10', '1', '20', '已撤回', b'1', '', 4, '', '', '', '', '{\"zh-CN\": \"已撤回\", \"en-US\": \"Withdrawn\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1454333229619216384, 1454333051138998272, 'DefTenantStatusEnum', 'tenant', '10', '1', '25', '待审核', b'1', '', 5, '', '', '', '', '{\"zh-CN\": \"待审核\", \"en-US\": \"Pending Review\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1454333259683987456, 1454333051138998272, 'DefTenantStatusEnum', 'tenant', '10', '1', '30', '已拒绝', b'1', '', 6, '', '', '', '', '{\"zh-CN\": \"已拒绝\", \"en-US\": \"Rejected\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_dict` VALUES (1454333259683987458, 1454333051138998272, 'DefTenantStatusEnum', 'tenant', '10', '1', '35', '已同意', b'1', '', 7, '', '', '', '', '{\"zh-CN\": \"已同意\", \"en-US\": \"Approved\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `def_gen_table`;
CREATE TABLE `def_gen_table`  (
  `id` bigint NOT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表名称',
  `comment_` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `swagger_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'swagger描述',
  `ds_id` bigint NOT NULL COMMENT '数据源',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `sub_id` bigint NULL DEFAULT NULL COMMENT '关联子表的ID',
  `sub_java_field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '子表关联的外键Java字段名',
  `entity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实体类名称',
  `entity_super_class` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实体父类;\n#EntitySuperClassEnum{SUPER_ENTITY:01}',
  `super_class` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '父类;\n\n#SuperClassEnum{SUPER_CLASS:01}',
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '基础包路径',
  `plus_application_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端应用名;如：src/views目录下的basic和devOperation,basic表示基础平台。devOperation表示开发运营系统。xxx 表示你们自己新建的xxx系统。',
  `plus_module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模块名;如：src/views/devOperation目录下的文件夹名\n如：src/views/basic 目录下的文件夹名',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '服务名',
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块名',
  `child_package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '子包名',
  `is_tenant_line` bit(1) NOT NULL DEFAULT b'0' COMMENT '行级租户注解',
  `ds_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据源',
  `is_ds` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据源级租户注解',
  `is_lombok` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否为lombok模型',
  `is_chain` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否为链式模型',
  `is_column_constant` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否生成字段常量',
  `gen_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '01' COMMENT '生成代码方式;、; [01-zip压缩包 02-自定义路径]\n#GenTypeEnum{GEN:01,直接生成;ZIP:02,打包下载;}\n',
  `output_dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径;（不填默认项目路径）',
  `front_output_dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端(Vben)生成路径;（不填默认项目路径）',
  `front_soy_output_dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端(Soybean)生成路径;（不填默认项目路径）',
  `front_vben5_output_dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端(vben5)生成路径;',
  `tpl_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '01' COMMENT '使用的模板; #TplEnum{SIMPLE:01,单表;TREE:02,树结构;MAIN_SUB:03,主从结构}',
  `popup_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '01' COMMENT '弹窗方式; #PopupTypeEnum{MODAL:01,对话框;DRAWER:02,抽屉;}',
  `add_auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '新增按钮权限编码',
  `edit_auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编辑按钮权限编码',
  `delete_auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '删除按钮权限编码',
  `view_auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '查看按钮权限编码',
  `copy_auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '复制按钮权限编码',
  `add_show` bit(1) NOT NULL DEFAULT b'1' COMMENT '新增按钮是否显示',
  `edit_show` bit(1) NOT NULL DEFAULT b'1' COMMENT '编辑按钮是否显示',
  `delete_show` bit(1) NOT NULL DEFAULT b'1' COMMENT '删除按钮是否显示',
  `copy_show` bit(1) NOT NULL DEFAULT b'1' COMMENT '复制按钮是否显示',
  `view_show` bit(1) NOT NULL DEFAULT b'1' COMMENT '详情按钮是否显示',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '其它生成选项',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `menu_parent_id` bigint NULL DEFAULT NULL COMMENT '上级菜单ID',
  `menu_application_id` bigint NULL DEFAULT NULL COMMENT '所属应用ID',
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单名称',
  `menu_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单图标',
  `tree_parent_id` bigint NULL DEFAULT NULL COMMENT '父ID字段名',
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称字段名',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for def_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `def_gen_table_column`;
CREATE TABLE `def_gen_table_column`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `table_id` bigint NOT NULL COMMENT '所属表ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '列名称',
  `comment_` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '列描述',
  `swagger_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文档描述',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '列类型',
  `java_type` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'JAVA类型',
  `java_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'JAVA字段名',
  `ts_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'TS类型',
  `size_` bigint NOT NULL DEFAULT 0 COMMENT '长度',
  `digit` int NULL DEFAULT 0 COMMENT '小数位数',
  `is_pk` bit(1) NOT NULL DEFAULT b'0' COMMENT '主键',
  `is_increment` bit(1) NOT NULL DEFAULT b'0' COMMENT '自增',
  `is_required` bit(1) NOT NULL DEFAULT b'0' COMMENT '必填',
  `is_logic_delete_field` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除',
  `is_version_field` bit(1) NOT NULL DEFAULT b'0' COMMENT '乐观锁',
  `fill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '填充类型;\n#FieldFill{INSERT:1}',
  `is_edit` bit(1) NOT NULL DEFAULT b'1' COMMENT '编辑',
  `is_list` bit(1) NOT NULL DEFAULT b'1' COMMENT '列表',
  `is_query` bit(1) NOT NULL DEFAULT b'0' COMMENT '查询',
  `width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '宽度',
  `query_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '03' COMMENT '查询方式;\n#SqlConditionEnum{EQUAL:01}\n（等于、不等于、大于、小于、范围）',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Vben组件;（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `soy_component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Soybean组件',
  `vxe_component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Vxe组件;（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `echo_str` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Echo',
  `enum_str` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '枚举',
  `sort_value` int NULL DEFAULT 0 COMMENT '排序',
  `edit_def_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '默认值',
  `edit_help_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `index_help_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '列表提示信息',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for def_gen_test_simple
-- ----------------------------
DROP TABLE IF EXISTS `def_gen_test_simple`;
CREATE TABLE `def_gen_test_simple`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Kpu' COMMENT '名称',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父id',
  `sort_value` int NULL DEFAULT 22 COMMENT '排序',
  `stock` int NOT NULL COMMENT '库存',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT 123123 COMMENT '修改人',
  `type_` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品类型;;\n#ProductType{ordinary:普通;gift:赠品}',
  `type2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品类型2;;\n#{ordinary:01,普通;gift:02,赠品;}',
  `type3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '学历;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,  dictType = EchoDictType.Global.EDUCATION)',
  `state` bit(1) NULL DEFAULT b'0' COMMENT '状态',
  `test4` int NULL DEFAULT NULL COMMENT '测试',
  `test5` date NULL DEFAULT NULL COMMENT '时间',
  `test6` datetime NULL DEFAULT NULL COMMENT '日期',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `test7` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '01' COMMENT '字符字典;@Echo(api = \"cn.lmx.kpu.common.api.DictApi\", dictType=\"GLOBAL_SEX\")',
  `test12` int NULL DEFAULT NULL COMMENT '整形字典;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.TEST_ADD_DICT)[1-测试 2-新增 aad-haha]',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户;@Echo(api = EchoApi.POSITION_ID_CLASS)',
  `org_id` bigint NULL DEFAULT NULL COMMENT '组织;@Echo(api = EchoApi.ORG_ID_CLASS)',
  `test8` decimal(16, 4) NULL DEFAULT 21.2300 COMMENT '小数',
  `test9` float NULL DEFAULT NULL COMMENT '浮点2',
  `test10` decimal(24, 6) NULL DEFAULT NULL COMMENT '浮点',
  `test11` decimal(2, 0) NULL DEFAULT NULL COMMENT 'xiao树',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试树结构' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_gen_test_simple
-- ----------------------------

-- ----------------------------
-- Table structure for def_gen_test_tree
-- ----------------------------
DROP TABLE IF EXISTS `def_gen_test_tree`;
CREATE TABLE `def_gen_test_tree`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'kpu' COMMENT '名称',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父id',
  `sort_value` int NULL DEFAULT 22 COMMENT '排序',
  `stock` int NOT NULL COMMENT '库存',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT 123123 COMMENT '修改人',
  `type_` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品类型;\n#ProductType{ordinary:普通;gift:赠品}',
  `type2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品类型2;#{ordinary:01,普通;gift:02,赠品;}',
  `type3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '学历;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,  dictType = EchoDictType.Global.EDUCATION)',
  `state` bit(1) NULL DEFAULT b'0' COMMENT '状态',
  `test4` int NULL DEFAULT NULL COMMENT '测试',
  `test5` date NULL DEFAULT NULL COMMENT '时间',
  `test6` datetime NULL DEFAULT NULL COMMENT '日期',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `test7` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '01' COMMENT '字符字典;@Echo(api = “cn.lmx.kpu.common.api.DictApi\", dictType=\"GLOBAL_SEX\")',
  `test12` int NULL DEFAULT NULL COMMENT '整形字典;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.TEST_ADD_DICT)[1-测试 2-新增 aad-haha]',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户;@Echo(api = EchoApi.POSITION_ID_CLASS)[1-aa 2-ddd]',
  `org_id` bigint NULL DEFAULT NULL COMMENT '组织;@Echo(api = EchoApi.ORG_ID_CLASS)',
  `test8` decimal(16, 4) NULL DEFAULT 21.2300 COMMENT '小数',
  `test9` float NULL DEFAULT NULL COMMENT '浮点2',
  `test10` decimal(24, 6) NULL DEFAULT NULL COMMENT '浮点',
  `test11` decimal(2, 0) NULL DEFAULT NULL COMMENT 'xiao树',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试树结构' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_gen_test_tree
-- ----------------------------

-- ----------------------------
-- Table structure for def_interface
-- ----------------------------
DROP TABLE IF EXISTS `def_interface`;
CREATE TABLE `def_interface`  (
  `id` bigint NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接口编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接口名称',
  `exec_mode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '01' COMMENT '执行方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.INTERFACE_EXEC_MODE)[01-实现类 02-脚本]',
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '实现脚本',
  `impl_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实现类',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_INTERFACE_CODE`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_interface
-- ----------------------------
INSERT INTO `def_interface` VALUES (244439130119864323, 'ALI_SMS', '阿里短信', '01', '', 'aliSmsMsgStrategyImpl', b'1', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface` VALUES (244881451621810192, 'TENCENT_MAIL', '腾讯邮件', '01', '', 'tencentMailMsgStrategyImpl', b'1', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface` VALUES (244913337459015682, 'CHUANGLAN_SMS', '创蓝短信', '01', '', 'clSmsMsgStrategyImpl', b'1', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface` VALUES (250025856074776718, 'BAIDU_SMS', '百度短信', '01', NULL, 'baiduSmsMsgStrategyImpl', b'1', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface` VALUES (250025856074776719, 'TENCENT_SMS', '腾讯短信', '01', NULL, 'tencentSmsMsgStrategyImpl', b'1', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface` VALUES (251763346439667712, 'TEST', '测试通过脚本执行接口逻辑', '02', 'package cn.lmx.kpu.msg.strategy.impl;\n\nimport cn.lmx.kpu.msg.entity.ExtendMsg;\nimport cn.lmx.kpu.msg.service.ExtendMsgService;\nimport cn.lmx.kpu.msg.strategy.MsgStrategy;\nimport cn.lmx.kpu.msg.strategy.domain.MsgParam;\nimport cn.lmx.kpu.msg.strategy.domain.MsgResult;\nimport jakarta.annotation.Resource;\nimport org.slf4j.Logger;\nimport org.slf4j.LoggerFactory;\n\n\n/**\n * @author lmx\n * @date 2025-01-01 00:00\n */\npublic class TestMsgStrategyImpl implements MsgStrategy {\n    private static final Logger log = LoggerFactory.getLogger(TestMsgStrategyImpl.class);\n\n    @Resource\n    private ExtendMsgService extendMsgService;\n\n    @Override\n    public MsgResult exec(MsgParam msgParam) {\n        System.out.println(\" 请开始你的接口逻辑 \");\n\n        ExtendMsg a = extendMsgService.getById(msgParam.getExtendMsg().getId());\n        log.info(\"a {}\", a);\n\n        return MsgResult.builder().result(\"保存成功\").build();\n    }\n}', '', b'1', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface` VALUES (395546031032642561, 'NOTICE', '站内信', '01', NULL, 'noticeMsgStrategyImpl', b'1', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);

-- ----------------------------
-- Table structure for def_interface_property
-- ----------------------------
DROP TABLE IF EXISTS `def_interface_property`;
CREATE TABLE `def_interface_property`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `interface_id` bigint NOT NULL COMMENT '接口ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `key_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数值',
  `sort_value` int NULL DEFAULT 0 COMMENT '顺序号',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NOT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_I_P_INTERFACE_ID_KEY`(`interface_id` ASC, `key_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口属性' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_interface_property
-- ----------------------------
INSERT INTO `def_interface_property` VALUES (245606910252810240, 244913337459015682, '是否debug模式', 'debug', '0', 0, '1不发短信 0发短信', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (245606910252810244, 244913337459015682, '普通短信接口', 'endPoint', 'http://smssh1.253.com/msg/v1/send/json', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (245606910252810245, 244913337459015682, '签名', 'sign', '闪购网', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (245606910252810246, 244913337459015682, '变量短信接口', 'variableEndPoint', 'http://smssh1.253.com/msg/variable/json', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (245606910252810248, 244913337459015682, '云通讯API密码', 'password', '请填写正确的秘钥', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (245606910252810252, 244913337459015682, '云通讯API账号', 'account', '请填写正确的秘钥', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (246604205953908742, 244913337459015682, '是否变量短信', 'variable', 'true', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (246756273565990915, 244881451621810192, '发送邮箱地址', 'fromEmail', 'admin@gzpj.cc', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (246756273565990916, 244881451621810192, '发送邮箱名称', 'fromName', 'KPU快速开发平台', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (246756273565990917, 244881451621810192, '邮件服务器地址', 'hostName', 'smtp.exmail.qq.com', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (246756273565990918, 244881451621810192, '密码', 'password', '123', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (246756273565990919, 244881451621810192, '用户名', 'username', 'admin@gzpj.cc', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (246756273565990920, 244881451621810192, '端口', 'smtpPort', '465', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (246756273565990921, 244881451621810192, '是否ssl', 'ssl', 'true', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (246756273565990922, 244881451621810192, '字符集', 'charset', 'UTF-8', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250025856074776720, 244439130119864323, '是否调试', 'debug', '0', 0, '1-不发短信 0-发短信', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250025856074776721, 244439130119864323, 'Access Key ID', 'accessKeyId', '请填写正确的秘钥', 0, '发送账号安全认证的Access Key ID', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250025856074776722, 244439130119864323, 'Secret Access Key', 'accessKeySecret', '请填写正确的秘钥', 0, '发送账号安全认证的Secret Access Key', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250025856074776723, 244439130119864323, '发送使用签名', 'signName', '闪购网', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250025856074776724, 244439130119864323, '地域ID', 'regionId', 'cn-hangzhou', 0, 'https://help.aliyun.com/document_detail/419270.html', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250025856074776726, 244439130119864323, '域名', 'endpoint', 'dysmsapi.aliyuncs.com', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250660012290998272, 250025856074776718, '域名', 'endPoint', 'http://smsv3.bj.baidubce.com', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250660012290998273, 250025856074776718, 'secretKey', 'secretKey', 'bacbedee5a604a939cc4c996371856b8', 0, '该id是百度提供的测试id，能成功调用，但无法接收短信', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250660012290998274, 250025856074776718, 'accessKeyId', 'accessKeyId', '626e6a284eac4e3f97cc30b38ffea6a4', 0, '该id是百度提供的测试id，能成功调用，但无法接收短信', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250660012290998276, 250025856074776718, '是否调试模式', 'debug', '0', 0, '0-非调试模式,发送短信  1-调试模式,不发短信', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250660012290998277, 250025856074776719, '短信 SdkAppId', 'sdkAppId', '1400006666', 0, '在 短信控制台 添加应用后生成的实际 SdkAppId，示例如1400006666', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250660012290998278, 250025856074776719, '指定接入地域域名', 'region', 'ap-beijing', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250660012290998279, 250025856074776719, 'secretId', 'secretId', '44', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250660012290998280, 250025856074776719, 'secretKey', 'secretKey', '123', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);
INSERT INTO `def_interface_property` VALUES (250660012290998281, 250025856074776719, '地域域名', 'endpoint', 'sms.tencentcloudapi.com', 0, '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);

-- ----------------------------
-- Table structure for def_login_log
-- ----------------------------
DROP TABLE IF EXISTS `def_login_log`;
CREATE TABLE `def_login_log`  (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '所属企业',
  `employee_id` bigint NULL DEFAULT NULL COMMENT '登录员工',
  `user_id` bigint NULL DEFAULT NULL COMMENT '登录用户',
  `request_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录人姓名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录人账号',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '01' COMMENT '登录状态;[01-登录成功 02-验证码错误 03-密码错误 04-账号锁定]\n    @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.LOGIN_STATUS)',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录描述',
  `login_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录时间',
  `ua` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器请求头',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器名称',
  `browser_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器版本',
  `operating_system` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for def_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `def_msg_template`;
CREATE TABLE `def_msg_template`  (
  `id` bigint NOT NULL COMMENT '模板ID',
  `interface_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接口ID',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息类型;[01-短信 02-邮件 03-站内信];@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.MSG_TEMPLATE_TYPE)',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板标识',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模板名称',
  `state` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `template_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模板编码',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '签名',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板内容',
  `param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模板参数',
  `config_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '消息配置参数',
  `script` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '脚本',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `target_` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '打开方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_TARGET)[01-页面 02-弹窗 03-新开窗口]',
  `auto_read` bit(1) NULL DEFAULT b'1' COMMENT '自动已读',
  `remind_mode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提醒方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_REMIND_MODE)[01-待办 02-预警 03-提醒]',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '跳转地址',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后修改人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_MSG_TEMPLATE_CODE`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_msg_template
-- ----------------------------
INSERT INTO `def_msg_template` VALUES (245657569392066565, '244881451621810192', '02', 'TENCENT_EMAIL', '腾讯邮件', b'1', NULL, '', '你的一份邮件', '邮件内容3 ${xx}, ddd, \n\n<br/>\n<p style=\"color: red;\">red</p>', '[{\"key\":\"xx\",\"value\":\"\"}]', '', '', '3', '02', b'1', '02', '44', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (245891967232245772, '244913337459015682', '01', 'CHUAGNLAN_REG_SMS', '注册短信', b'1', '111', '盘江煤电', '注册', '采购项目【${xmmc}】发起了${lbmc}质疑，等待您的答复', '[{\"key\":\"xmmc\",\"value\":\"\"},{\"key\":\"lbmc\",\"value\":\"\"}]', '', '', 'chuanglan短信', NULL, b'1', NULL, '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (250055645967941632, '244439130119864323', '01', 'REGISTER_SMS', '注册成功短信', b'1', 'SMS_99185070', '闪购网', '', '尊敬的用户，欢迎注册闪购网，您的注册验证码：${code},有效期5分钟。请勿将短信验证码告知他人！', '[{\"key\":\"code\",\"value\":\"\"}]', '', '', '', NULL, b'1', NULL, '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (250660012290998275, '250025856074776718', '01', 'BAIDU_SMS_REG', '百度注册短信', b'1', 'sms-tmpl-awKvRY85349', 'sms-signQxkiwz88470', NULL, '您的验证码为：${code}, ${minute}分钟内有效', '[{\"key\":\"code\",\"value\":\"\"},{\"key\":\"minute\",\"value\":\"\"}]', '', '', '', NULL, b'1', NULL, '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (250660012290998282, '250025856074776719', '01', 'TX_SMS', '腾讯注册短信', b'1', '1234', '腾讯云', NULL, '你的验证阿妈为： ${code}', '[{\"key\":\"code\",\"value\":\"\"}]', '', NULL, '', NULL, b'1', NULL, '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (251763346439667713, '251763346439667712', '03', 'TEST', '测试', b'1', NULL, '', '发送一个xx', '发送 ${xmmc}, 哈哈哈 ${name}.', '[{\"key\":\"xmmc\",\"value\":\"\"},{\"key\":\"name\",\"value\":\"\"}]', '', NULL, '', '02', b'1', '01', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (252969897242394624, '244439130119864323', '01', 'MOBILE_LOGIN', '手机登录短信', b'1', 'SMS_99185070', '闪购网', '', '本次验证码为：${code}', '[{\"key\":\"code\",\"value\":\"\"}]', '', '', '', NULL, b'1', NULL, '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (252969897242394625, '244881451621810192', '02', 'REGISTER_EMAIL', '注册邮件验证码', b'1', NULL, '', '欢迎注册${applicationName}', '尊敬的用户：\n	欢迎注册${applicationName}，您的注册验证码为：${code}', '[{\"key\":\"applicationName\",\"value\":\"\"},{\"key\":\"code\",\"value\":\"\"}]', '', '// 逻辑\n\n\n// 返回\n[\n  applicationName: \"《KPU中后台快速开发平台》\",\n  code: code\n]', '', NULL, b'1', NULL, '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (277119952886956032, '244439130119864323', '01', 'MOBILE_EDIT', '个人中心修改手机', b'1', 'SMS_99185070', '闪购网', NULL, '您正在修改登录手机，您的验证码为：${code}，请勿告知他人。', '[{\"key\":\"code\",\"value\":\"\"}]', '', NULL, NULL, NULL, b'1', NULL, NULL, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (277119952886956033, '244881451621810192', '02', 'EMAIL_EDIT', '修改登录邮箱', b'1', NULL, NULL, '修改登录邮箱', '您正在修改登录邮箱，您的验证码为：${code}，请勿告知他人。', '[{\"key\":\"code\",\"value\":\"\"}]', '', NULL, NULL, NULL, b'1', NULL, NULL, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (395546031032642562, '395546031032642561', '03', 'NOTICE_TEMPLATE', '停服通知', b'1', NULL, NULL, NULL, '尊敬的用户,${nickname}：\n  近期服务器迁移，需要停服2天，特此通知。', '[{\"key\":\"nickname\",\"value\":\"\"}]', '', NULL, NULL, NULL, b'1', NULL, NULL, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_msg_template` VALUES (820195735420015777, '244439130119864323', '01', 'FORGET_PASSWORD', '忘记密码', b'1', '111', 'KPU', '', '您正在找回密码的密码，验证码是:${code}', '[{\"key\":\"code\",\"value\":\"\"}]', '', '', '', '', b'1', '', '', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_parameter
-- ----------------------------
DROP TABLE IF EXISTS `def_parameter`;
CREATE TABLE `def_parameter`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `key_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数值',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态',
  `param_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '20' COMMENT '类型;[10-系统参数 20-业务参数]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.PARAMETER_TYPE)',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_param_key`(`key_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for def_resource
-- ----------------------------
DROP TABLE IF EXISTS `def_resource`;
CREATE TABLE `def_resource`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `application_id` bigint NOT NULL COMMENT '应用ID;#def_application',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '编码;唯一编码，用于区分资源',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `resource_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '20' COMMENT '类型;[20-菜单 40-按钮 50-字段 60-数据]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,dictType = EchoDictType.System.RESOURCE_TYPE)菜单即左侧显示的菜单视图即隐藏的菜单(需要配置在路由中)和页面上点击后需要通过路由打开的页面功能即页面上的非视图的按钮字段即列表页或编辑页的字段接口即后台的访问接口',
  `parent_id` bigint NOT NULL COMMENT '父级ID',
  `open_with` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '01' COMMENT '打开方式;[01-组件 02-内链 03-外链]\n@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.RESOURCE_OPEN_WITH)',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述;resource_type=接口时表示接口说明',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址栏路径',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '页面路径\n用于resource_type=菜单和视图. 前端页面在src/views目录下的相对地址.',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '网址\n',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '重定向;用于resource_type=菜单和视图',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图标',
  `is_hidden` bit(1) NULL DEFAULT b'0' COMMENT '是否隐藏菜单;\nresource_type=20时生效',
  `is_general` bit(1) NULL DEFAULT b'0' COMMENT '是否公共资源;1-无需分配所有人就可以访问的',
  `state` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态;[0-禁用 1-启用]',
  `sort_value` int NULL DEFAULT 1 COMMENT '排序;默认升序',
  `sub_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '分组',
  `field_is_secret` bit(1) NULL DEFAULT b'0' COMMENT '是否脱敏;显示时是否需要脱敏实现 (用于resource_type=字段)',
  `field_is_edit` bit(1) NULL DEFAULT b'1' COMMENT '是否可以编辑;是否可以编辑(用于resource_type=字段)',
  `data_scope` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据范围;[01-全部 02-本单位及子级 03-本单位 04-本部门及子级 05-本部门 06-个人 07-自定义]',
  `custom_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实现类;自定义实现类全类名',
  `is_def` bit(1) NULL DEFAULT b'0' COMMENT '是否默认',
  `tree_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '树路径',
  `tree_grade` int NULL DEFAULT 0 COMMENT '树层级',
  `meta_json` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '{}' COMMENT '元数据;菜单视图的元数据',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_resource_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_resource
-- ----------------------------
INSERT INTO `def_resource` VALUES (137848577387921408, 2, 'tenant:defTenant', '租户中心', '20', 0, '01', '', '/tenant', 'LAYOUT', NULL, '/tenant/tenant', 'ant-design:group-outlined', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921409, 2, 'tenant:application', '应用管理', '20', 0, '01', '', '/application', 'LAYOUT', NULL, '/application/application', 'ant-design:appstore-add-outlined', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921410, 2, 'tenant:tenant:datasourceConfig', '数据源管理', '20', 137848577387921408, '01', '', '/tenant/datasource', '/devOperation/tenant/defDatasourceConfig/index', NULL, '', 'ant-design:database-filled', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921411, 2, 'tenant:tenant:tenant', '租户管理', '20', 137848577387921408, '01', '', '/tenant/tenant', '/devOperation/tenant/defTenant/index', NULL, '', 'clarity-thin-client-line', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921412, 2, 'tenant:tenant:user', '用户管理', '20', 137848577387921408, '01', '', '/tenant/user', '/devOperation/tenant/defUser/index', NULL, '', 'ant-design:user-add-outlined', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921413, 2, 'tenant:application:application', '应用列表', '20', 137848577387921409, '01', '', '/application/application', '/devOperation/application/defApplication/index', NULL, '', 'ant-design:appstore-twotone', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/', 1, '{\"hideChildrenInMenu\":true}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921414, 2, 'tenant:application:resource', '资源管理', '20', 137848577387921409, '01', '', '/application/resource', '/devOperation/application/defResource/index', NULL, '', 'ant-design:menu-unfold-outlined', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/', 1, '{\"badge\":\"菜单\",\"keepAlive\":true,\"content\":\"菜单\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921415, 2, 'tenant:application:authorize', '应用资源授权', '20', 137848577387921409, '01', '', '/application/authorize', '/devOperation/application/defTenantApplicationRel/index', NULL, '', 'ion:key-outline', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921416, 2, 'tenant:application:authorizeRecord', '应用授权记录', '20', 137848577387921409, '01', '', '/application/authorizeRecord', '/devOperation/application/defTenantApplicationRecord/index', NULL, '', 'fluent:record-stop-48-regular', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921417, 2, 'tenant:application:application:add', '新增', '40', 137848577387921413, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921418, 2, 'tenant:application:application:edit', '编辑', '40', 137848577387921413, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921419, 2, 'tenant:application:application:copy', '复制', '40', 137848577387921413, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921420, 2, 'tenant:application:application:delete', '删除', '40', 137848577387921413, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921421, 2, 'tenant:application:application:resource', '应用资源管理', '20', 137848577387921413, '01', '', '/application/application/resource/:id', '/devOperation/application/defResource/index', NULL, '', '', b'1', b'0', b'1', 50, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/', 2, '{\"currentActiveMenu\":\"/application/application\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (137848577387921422, 2, 'tenant:application:application:resource:add', '新增', '40', 137848577387921421, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/137848577387921421/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (139496646533709824, 2, 'tenant:application:resource:add', '新增', '40', 137848577387921414, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921414/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (139702946697838592, 2, 'tenant:application:resource:edit', '编辑', '40', 137848577387921414, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921414/137848577387921409/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (139702946697838593, 2, 'tenant:application:resource:delete', '删除', '40', 137848577387921414, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921414/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (140154107242479616, 2, 'tenant:application:authorize:grant', '应用授权', '20', 137848577387921415, '01', '', 'grant', '/devOperation/application/defTenantApplicationRel/grant', NULL, '', '', b'1', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921415/', 2, '{\"currentActiveMenu\":\"/application/authorize\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (140154107242479617, 2, 'tenant:application:authorize:cancel', '取消授权', '40', 137848577387921415, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1000, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921415/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (140154107242479618, 2, 'tenant:application:authorize:renewal', '续期', '40', 137848577387921415, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921415/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278336, 2, 'tenant:system', '系统管理', '20', 0, '01', '', '/system', 'LAYOUT', NULL, '/system/dict', 'ant-design:setting-outlined', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278337, 2, 'tenant:system:dict2', '数据字典', '20', 143911967403278336, '01', '', '/system/dict2', '/devOperation/system/defDict/index', NULL, '', 'ant-design:book-outlined', b'0', b'0', b'1', 15, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{\"content\":\"路由\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278338, 2, 'tenant:system:dict2:add', '新增', '40', 143911967403278337, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/143911967403278337/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278339, 2, 'tenant:system:dict2:edit', '编辑', '40', 143911967403278337, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/143911967403278337/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278340, 2, 'tenant:system:dict2:delete', '删除', '40', 143911967403278337, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/143911967403278337/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278341, 2, 'tenant:system:dict2:copy', '复制', '40', 143911967403278337, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/143911967403278337/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278342, 2, 'tenant:system:dict2:dictItem', '字典项管理', '20', 143911967403278337, '01', '', '/system/dict/:dictId', '/devOperation/system/defDictItem/index', NULL, '', 'ant-design:book-twotone', b'1', b'0', b'1', 50, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/143911967403278337/', 2, '{\"currentActiveMenu\":\"/system/dict2\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278343, 2, 'tenant:system:dict2:dictItem:add', '新增', '40', 143911967403278342, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/143911967403278337/143911967403278342/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278344, 2, 'tenant:system:dict2:dictItem:edit', '编辑', '40', 143911967403278342, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/143911967403278337/143911967403278342/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278345, 2, 'tenant:system:dict2:dictItem:delete', '删除', '40', 143911967403278342, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/143911967403278337/143911967403278342/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (143911967403278346, 2, 'tenant:system:dict2:dictItem:copy', '复制', '40', 143911967403278342, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/143911967403278337/143911967403278342/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (144313439471271936, 1, 'basic:base', '基础配置', '20', 0, '01', '', '/base', 'LAYOUT', NULL, '/base/dict', 'ant-design:number-outlined', b'0', b'0', b'1', 50, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (144313439471271937, 1, 'basic:base:dict', '个性字典', '20', 144313439471271936, '01', '', '/base/dict', '/basic/base/dict/index', NULL, '', 'ant-design:book-outlined', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (144313439471271938, 1, 'basic:base:dict:import', '导入字典', '40', 144313439471271937, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/144313439471271937/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (144313439471271939, 1, 'basic:base:dict:edit', '编辑字典', '40', 144313439471271937, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/144313439471271937/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (144313439471271940, 1, 'basic:base:dict:delete', '删除字典', '40', 144313439471271937, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/144313439471271937/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (144313439471271947, 1, 'basic:system', '系统功能', '20', 0, '01', '', '/sysFunction', 'LAYOUT', NULL, '/system/role', 'ant-design:setting-outlined', b'0', b'0', b'1', 60, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160561957882036227, 2, 'tenant:tenant:user:reset:password', '重置密码', '40', 137848577387921412, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 5, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921412/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938437, 2, 'tenant:developer', '开发者管理', '20', 0, '01', '', '/developer', 'LAYOUT', NULL, '/developer/tools/generator', 'ant-design:bug-outlined', b'0', b'0', b'1', 50, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938438, 2, 'tenant:developer:doc', 'Swagger文档', '20', 160833820721938437, '02', '', '/developer/doc', 'IFRAME', 'https://datasource.kpu.cn/api/base/doc.html', '', 'ant-design:file-word-outlined', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938439, 2, 'tenant:developer:nacos', 'nacos', '20', 160833820721938437, '03', '', '/developer/nacos', 'IFRAME', 'https://kpu.cn/nacos/', '', 'ant-design:aliyun-outlined', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938440, 2, 'tenant:developer:skyWalking', 'SkyWalking', '20', 160833820721938437, '03', '', '/developer/sky', 'IFRAME', 'http://sky.kpu.cn', '', 'ant-design:fund-projection-screen-outlined', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938441, 2, 'tenant:developer:db', '数据库监控', '20', 160833820721938437, '02', '', '/developer/druid', 'IFRAME', 'https://datasource.kpu.cn/druid/index.html', '', 'ant-design:console-sql-outlined', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938442, 2, 'tenant:about', '了解kpu', '20', 0, '01', '', '/kpu', 'LAYOUT', NULL, '', 'ant-design:github-filled', b'0', b'0', b'1', 1110, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938443, 2, 'tenant:about:doc', '企业版文档', '20', 160833820721938442, '03', '', '/vipdoc', 'IFRAME', 'https://kpu.cn/doc/%E7%AE%80%E4%BB%8B.html', '', 'ant-design:file-pdf-outlined', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938442/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938444, 2, 'tenant:about:vip', '企业版', '20', 160833820721938442, '03', '', '/vipvip', 'IFRAME', 'https://kpu.cn/vip/%E5%A6%82%E4%BD%95%E8%B5%9E%E5%8A%A9.html', '', 'ant-design:eye-invisible-outlined', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938442/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938445, 2, 'tenant:about:opensource', '开源版', '20', 160833820721938442, '03', '', '/opensource', 'IFRAME', 'https://github.com/***', '', 'ant-design:gitlab-outlined', b'0', b'0', b'1', 6, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938442/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (160833820721938446, 2, 'tenant:about:landscape', '蓝图', '20', 160833820721938442, '03', '', '/roadmap', 'IFRAME', 'https://kpu.cn/upgrade/%E5%8A%9F%E8%83%BD%E8%93%9D%E5%9B%BE.html', '', 'ant-design:rise-outlined', b'0', b'0', b'1', 5, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938442/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (172353511420329984, 2, 'tenant:system:file', '全局附件管理', '20', 143911967403278336, '01', '', '/system/file', '/devOperation/system/defFile/index', NULL, '', 'ant-design:file-zip-outlined', b'0', b'0', b'1', 70, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (172353511420329986, 2, 'tenant:system:file:upload', '上传', '40', 172353511420329984, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/172353511420329984/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (172353511420329987, 2, 'tenant:system:file:debug:upload', '调试上传', '40', 172353511420329984, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/172353511420329984/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (172353511420329988, 2, 'tenant:system:file:download', '下载', '40', 172353511420329984, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 5, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/172353511420329984/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (172353511420329989, 2, 'tenant:system:file:delete', '删除', '40', 172353511420329984, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/172353511420329984/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (179582070228516864, 1, 'basic:msg:msg:self', '查看个人消息', '60', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1000, '', b'0', b'1', '06', NULL, b'1', '/1449734007292952576/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (179582070228516865, 1, 'basic:msg:msg:all', '查看全部数据', '60', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1010, '', b'0', b'1', '01', NULL, b'0', '/1449734007292952576/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (179582070228516866, 1, 'basic:msg:msg:company:children', '查看本单位其子单位数据', '60', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1001, '', b'0', b'1', '02', NULL, b'0', '/1449734007292952576/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (179582070228516867, 1, 'basic:msg:msg:company', '查看本单位数据', '60', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1002, '', b'0', b'1', '03', NULL, b'0', '/1449734007292952576/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (179582070228516868, 1, 'basic:msg:msg:dept', '查看本部门数据', '60', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1005, '', b'0', b'1', '05', NULL, b'0', '/1449734007292952576/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (179582070228516869, 1, 'basic:msg:msg:dept:children', '查看本部及其子部门数据', '60', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1006, '', b'0', b'1', '04', NULL, b'0', '/1449734007292952576/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (179582070228516870, 1, 'basic:msg:msg:custom', '查看自定义的数据', '60', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1020, '', b'0', b'1', '07', 'DATA_SCOPE_TEST', b'0', '/1449734007292952576/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (198310764748996608, 2, 'tenant:developer:tools', '开发工具', '20', 160833820721938437, '01', '', '/developer/tools', 'LAYOUT', NULL, '', 'ant-design:code-twotone', b'0', b'0', b'1', 0, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (198310764748996609, 2, 'tenant:developer:tools:generator', '代码生成', '20', 198310764748996608, '01', '', '/developer/tools/generator', '/devOperation/developer/defGenTable/index', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/198310764748996608/160833820721938437/', 2, '{\"content\":\"new\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (199848844077301779, 1, 'basic:user:employee:invitation', '邀请', '40', 1449738581135327232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/1449738581135327232/1449732267470487552/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (199848844077301787, 2, 'tenant:tenant:tenant:view:unBind', '解绑', '40', 1461615207515160576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/1461615207515160576/137848577387921408/137848577387921411/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (201343651610099712, 2, 'tenant:developer:tools:generator:edit', '修改代码配置', '20', 198310764748996609, '01', '', 'edit/:id', '/devOperation/developer/defGenTable/Edit', NULL, '', '', b'1', b'0', b'1', 5, '', b'0', b'1', NULL, NULL, NULL, '/198310764748996609/198310764748996608/160833820721938437/', 3, '{\"currentActiveMenu\":\"/developer/tools/generator\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (206499429136465920, 2, 'tenant:developer:tools:generator:project', '项目生成', '20', 198310764748996608, '01', '', 'project', 'devOperation/developer/genProject/index', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/198310764748996608/160833820721938437/', 2, '{\"content\":\"new\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207209017863307264, 2, 'tenant:developer:demo', '开发示例', '20', 160833820721938437, '01', '', 'demo', 'LAYOUT', NULL, '', 'ant-design:code-outlined', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207209017863307265, 2, 'tenant:developer:demo:simple', '单表CRUD', '20', 207209017863307264, '01', '', 'simple', '/devOperation/developer/defGenTestSimple/index', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/207209017863307264/160833820721938437/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207209017863307266, 2, 'tenant:developer:demo:tree', '树CRUD', '20', 207209017863307264, '01', '', 'tree', '/devOperation/developer/defGenTestTree/index', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/207209017863307264/160833820721938437/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207209017863307267, 2, 'tenant:developer:demo:m_s', '主从CRUD', '20', 207209017863307264, '01', '', 'mainSub', '/devOperation/developer/defGenTestMainSub/index', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/207209017863307264/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207592996529504364, 2, 'tenant:developer:tools:generator:import', '导入', '40', 198310764748996609, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/198310764748996609/198310764748996608/160833820721938437/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207592996529504370, 2, 'tenant:developer:tools:generator:sync', '同步', '40', 198310764748996609, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/198310764748996609/198310764748996608/160833820721938437/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207644798130061312, 2, 'tenant:developer:tools:generator:delete', '删除', '40', 198310764748996609, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/198310764748996609/198310764748996608/160833820721938437/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207644798130061314, 2, 'tenant:developer:tools:generator:preview', '预览', '40', 198310764748996609, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 50, '', b'0', b'1', NULL, NULL, NULL, '/198310764748996609/198310764748996608/160833820721938437/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207644798130061318, 2, 'tenant:developer:tools:generator:edit:delete', '删除', '40', 201343651610099712, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/201343651610099712/198310764748996609/198310764748996608/160833820721938437/', 4, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207644798130061323, 2, 'tenant:developer:tools:generator:edit:edit', '修改', '40', 201343651610099712, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/201343651610099712/198310764748996609/198310764748996608/160833820721938437/', 4, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (207644798130061325, 2, 'tenant:developer:tools:generator:edit:sync', '同步', '40', 201343651610099712, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/201343651610099712/198310764748996609/198310764748996608/160833820721938437/', 4, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (215458769570627596, 2, 'tenant:system:defDict', '字典管理', '20', 143911967403278336, '01', '', '/system/defDict', '/devOperation/system/defDictManager/index', NULL, '', 'ant-design:book-filled', b'0', b'0', b'1', 17, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{\"content\":\"一对多\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (215458769570627601, 2, 'tenant:system:defDict:add', '新增', '40', 215458769570627596, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/215458769570627596/143911967403278336/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (215458769570627602, 2, 'tenant:system:defDict:edit', '编辑', '40', 215458769570627596, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/215458769570627596/143911967403278336/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (215458769570627603, 2, 'tenant:system:defDict:delete', '删除', '40', 215458769570627596, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/215458769570627596/143911967403278336/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (215458769570627604, 2, 'tenant:system:defDict:copy', '复制', '40', 215458769570627596, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/215458769570627596/143911967403278336/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (242152648445263888, 2, 'tenant:developer:minio', 'MinIO', '20', 160833820721938437, '02', '', '/developer/minio', 'IFRAME', 'https://static.kpu.cn/minio/', '', 'ant-design:folder-open-filled', b'0', b'0', b'1', 50, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (242152648445263893, 2, 'tenant:developer:job', '分布式定时任务', '20', 160833820721938437, '03', '', '/developer/job', 'IFRAME', 'https://gitee.com/***/kpu-job', '', 'ant-design:project-outlined', b'0', b'0', b'1', 60, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (242152648445263898, 2, 'tenant:developer:file', '文件预览', '20', 160833820721938437, '02', '', '/developer/filepreview', 'IFRAME', 'https://file.kkview.cn/', '', 'ant-design:file-exclamation-outlined', b'0', b'0', b'1', 70, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (242181583639937024, 2, 'tenant:developer:server', '服务器监控', '20', 160833820721938437, '01', '', '/developer/srever', '/devOperation/developer/srever/index', NULL, '', 'ant-design:aim-outlined', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (242300348075606021, 2, 'tenant:developer:jenkins', 'Jenkins', '20', 160833820721938437, '03', '', '/developer/jenkins', 'IFRAME', 'http://jenkins.kpu.cn/', '', 'ant-design:dropbox-outlined', b'0', b'0', b'1', 80, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (244034011624636417, 1, 'basic:msg:template', '个性消息模板', '20', 1449733521265393664, '01', '', '/msg/template', 'basic/msg/extendMsgTemplate/index', NULL, '', 'ant-design:medium-outlined', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (244177274553761796, 1, 'basic:user:employee:rest:pwd', '重置密码', '40', 1449738581135327232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 70, '', b'0', b'1', NULL, NULL, NULL, '/1449738581135327232/1449732267470487552/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (249954310509559808, 2, 'tenant:ops', '运维平台', '20', 0, '01', '', '/ops', 'LAYOUT', NULL, '/ops/template', 'ant-design:tool-outlined', b'0', b'0', b'1', 60, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (249954310509559809, 2, 'tenant:ops:interfaces', '接口管理', '20', 249954310509559808, '01', '', '/ops/interface', '/devOperation/ops/defInterface/index', NULL, '', 'ant-design:node-expand-outlined', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (249954310509559810, 2, 'tenant:ops:interface:log', '接口日志', '20', 249954310509559808, '01', '', '/ops/log', '/devOperation/ops/defInterfaceLog/index', NULL, '', 'ant-design:customer-service-outlined', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (249954310509559811, 2, 'tenant:ops:template', '消息模板', '20', 249954310509559808, '01', '', '/ops/template', '/devOperation/ops/defMsgTemplate/index', NULL, '', 'ant-design:medium-outlined', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (249954310509559812, 2, 'tenant:ops:interfaces:property', '接口设置', '20', 249954310509559809, '01', '', '/ops/interface/property/:id', '/devOperation/ops/defInterface/property/index', NULL, '', '', b'1', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559809/249954310509559808/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (249954310509559813, 2, 'tenant:ops:interfaces:log:logging', '日志执行记录', '20', 249954310509559810, '01', '', '/ops/log/:id', '/devOperation/ops/defInterfaceLogging/index', NULL, '', '', b'1', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559810/', 2, '{\"currentActiveMenu\":\"/ops/log\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (250025856074776576, 2, 'tenant:ops:interfaces:add', '新增', '40', 249954310509559809, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559809/249954310509559808/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (250025856074776577, 2, 'tenant:ops:interfaces:edit', '编辑', '40', 249954310509559809, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559809/249954310509559808/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (250025856074776578, 2, 'tenant:ops:interfaces:view', '查看', '40', 249954310509559809, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559809/249954310509559808/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (250025856074776579, 2, 'tenant:ops:interfaces:delete', '删除', '40', 249954310509559809, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 5, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559809/249954310509559808/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (250025856074776580, 2, 'tenant:ops:interfaces:log:delete', '删除', '40', 249954310509559810, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559810/249954310509559808/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (250025856074776581, 2, 'tenant:ops:interfaces:log:logging:delete', '删除', '40', 249954310509559813, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559813/249954310509559810/249954310509559808/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (250025856074776582, 2, 'tenant:ops:template:add', '新增', '40', 249954310509559811, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559811/249954310509559808/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (250025856074776583, 2, 'tenant:ops:template:edit', '编辑', '40', 249954310509559811, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559811/249954310509559808/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (250025856074776584, 2, 'tenant:ops:template:delete', '删除', '40', 249954310509559811, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559811/249954310509559808/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (253596752014213210, 1, 'basic:msg:template:delete', '删除', '40', 244034011624636417, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/244034011624636417/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (253596752014213212, 1, 'basic:msg:template:import', '导入', '40', 244034011624636417, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/244034011624636417/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (253596752014213214, 1, 'basic:msg:template:edit', '编辑', '40', 244034011624636417, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/244034011624636417/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (281886056620490965, 2, 'tenant:application:resource:move', '移动', '40', 137848577387921414, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921414/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (281886056620490972, 2, 'tenant:application:application:resource:move', '移动', '40', 137848577387921421, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/137848577387921421/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (289400372487783095, 1, 'basic:user:org:bind', '绑定角色', '40', 1449738119237599232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 5, '', b'0', b'1', NULL, NULL, b'0', '/1449732267470487552/1449738119237599232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (393222543919799296, 2, 'tenant:ops:template:test', '测试消息', '40', 249954310509559811, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, b'0', '/249954310509559808/249954310509559811/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (528754428833486865, 2, 'tenant:system:online', '在线用户', '20', 143911967403278336, '01', '', '/system/online', 'devOperation/system/online/index', NULL, '', 'ant-design:user-outlined', b'0', b'0', b'1', 80, '', b'0', b'0', '06', NULL, b'0', '/143911967403278336/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (528767537073677314, 2, 'tenant:system:online:kickout', '踢人下线', '40', 528754428833486865, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'0', '06', NULL, b'0', '/143911967403278336/528754428833486865/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (528767537073677316, 2, 'tenant:system:online:logout', '强制注销', '40', 528754428833486865, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'0', '06', NULL, b'0', '/143911967403278336/528754428833486865/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (625950651139229696, 1, 'basic:open', '开放能力', '20', 0, '01', '', '/open', 'LAYOUT', NULL, '', 'carbon:api-1', b'0', b'0', b'1', 70, '', b'0', b'1', NULL, NULL, b'0', '/', 0, '{\"badgeType\":\"dot\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (625950651139229697, 1, 'basic:open:accessKey', '应用申请', '20', 625950651139229696, '01', '', '/open/accessKey', '/basic/open/accessKey/index', NULL, '', 'ant-design:key-outlined', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, b'0', '/625950651139229696/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (625950651139229698, 1, 'basic:open:doc', '文档列表', '20', 625950651139229696, '01', '', '/open/docinfo', '/open/welcome/index', NULL, '/doc/api', 'ant-design:file-word-outlined', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, b'0', '/625950651139229696/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (625950651139229699, 2, 'tenant:sop', '开放平台', '20', 0, '01', '', '/sop', 'LAYOUT', NULL, '', 'ant-design:skype-outlined', b'0', b'0', b'1', 70, '', b'0', b'1', NULL, NULL, b'0', '/', 0, '{\"badgeType\":\"dot\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (625950651139229700, 2, 'tenant:sop:isv', '开放应用', '20', 625950651139229699, '01', '', '/sop/sopIsvInfo', '/devOperation/sop/sopIsvInfo/index', NULL, '', 'ant-design:linkedin-outlined', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, b'0', '/625950651139229699/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (625950651139229701, 2, 'tenant:sop:doc', '文档管理', '20', 625950651139229699, '01', '', '/sop/sopDocInfo', '/devOperation/sop/sopDocInfo/index', NULL, '', 'ant-design:file-exclamation-outlined', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, b'0', '/625950651139229699/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (629222767678781445, 2, 'tenant:sop:api', '开放接口', '20', 625950651139229699, '01', '', '/sop/sopApiInfo', '/devOperation/sop/sopApiInfo/index', NULL, '', 'ant-design:api-outlined', b'0', b'0', b'1', 10, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (629222767678781459, 2, 'tenant:sop:apiconfig', '文档配置', '20', 625950651139229699, '01', '', '/sop/sopSysConfig', '/devOperation/sop/sopSysConfig/index', NULL, '', 'ant-design:container-outlined', b'0', b'0', b'1', 20, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (629222767678781464, 2, 'tenant:sop:group', '应用分组', '20', 625950651139229699, '01', '', '/sop/sopPermGroup', '/devOperation/sop/sopPermGroup/index', NULL, '', 'ant-design:group-outlined', b'0', b'0', b'1', 50, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424356922, 1, 'basic:open:accessKey:add', '新增', '40', 625950651139229697, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'0', '06', NULL, b'0', '/625950651139229696/625950651139229697/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424356926, 1, 'basic:open:accessKey:edit', '编辑', '40', 625950651139229697, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'0', '06', NULL, b'0', '/625950651139229696/625950651139229697/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424356931, 1, 'basic:open:accessKey:delete', '删除', '40', 625950651139229697, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'0', '06', NULL, b'0', '/625950651139229696/625950651139229697/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424357166, 2, 'tenant:sop:api:edit', '编辑', '40', 629222767678781445, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/629222767678781445/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424357170, 2, 'tenant:sop:api:delete', '删除', '40', 629222767678781445, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/629222767678781445/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424357381, 2, 'tenant:sop:apiconfig:add', '新增', '40', 629222767678781459, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/629222767678781459/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424357385, 2, 'tenant:sop:apiconfig:edit', '编辑', '40', 629222767678781459, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/629222767678781459/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424357389, 2, 'tenant:sop:apiconfig:delete', '删除', '40', 629222767678781459, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/629222767678781459/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424357626, 2, 'tenant:sop:doc:addApp', '新增应用', '40', 625950651139229701, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229701/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424357631, 2, 'tenant:sop:doc:publish', '发布', '40', 625950651139229701, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229701/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424357635, 2, 'tenant:sop:doc:offline', '下线', '40', 625950651139229701, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229701/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632566992424357639, 2, 'tenant:sop:doc:sync', '同步文档', '40', 625950651139229701, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 40, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229701/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441551, 2, 'tenant:sop:group:add', '新增', '40', 629222767678781464, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/629222767678781464/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441555, 2, 'tenant:sop:group:edit', '编辑', '40', 629222767678781464, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/629222767678781464/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441559, 2, 'tenant:sop:group:delete', '删除', '40', 629222767678781464, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 30, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/629222767678781464/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441748, 2, 'tenant:sop:group:authorize', '授权', '40', 629222767678781464, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 40, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/629222767678781464/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441965, 2, 'tenant:sop:isv:add', '新增', '40', 625950651139229700, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229700/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441969, 2, 'tenant:sop:isv:edit', '编辑', '40', 625950651139229700, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229700/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441973, 2, 'tenant:sop:isv:delete', '删除', '40', 625950651139229700, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229700/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441977, 2, 'tenant:sop:isv:settingKeys', '设置秘钥', '40', 625950651139229700, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 40, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229700/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441985, 2, 'tenant:sop:isv:settingGroup', '设置分组', '40', 625950651139229700, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 50, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229700/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (632694501413441989, 2, 'tenant:sop:isv:examine', '审核', '40', 625950651139229700, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 60, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/625950651139229700/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (662630960337663004, 2, 'tenant:tenant:user:export', '导入导出', '40', 137848577387921412, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 60, '', b'0', b'0', '06', NULL, b'0', '/137848577387921408/137848577387921412/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (701591557867618314, 2, 'tenant:application:resource:clearCache', '清理缓存', '40', 137848577387921414, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1000, '', b'0', b'0', '06', NULL, b'0', '/137848577387921409/137848577387921414/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (712672045210342575, 2, 'tenant:sop:notify', '回调日志', '20', 625950651139229699, '01', '', '/sop/notify', '/devOperation/sop/sopNotifyInfo/index', NULL, '', 'carbon:flow-logs-vpc', b'0', b'0', b'1', 60, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (712672045210342580, 2, 'tenant:sop:helpdoc', '帮助文档', '20', 625950651139229699, '01', '', '/sop/helpDoc', '/devOperation/sop/sopHelpDoc/index', NULL, '', 'carbon:doc', b'0', b'0', b'1', 40, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (712712237514300423, 2, 'tenant:sop:helpdoc:edit', '新增编辑', '40', 712672045210342580, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/712672045210342580/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (712712237514300427, 2, 'tenant:sop:notify:push', '重试', '40', 712672045210342575, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/712672045210342575/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (712712237514300431, 2, 'tenant:sop:notify:end', '结束重试', '40', 712672045210342575, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 20, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/712672045210342575/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (712712237514300871, 2, 'tenant:sop:helpdoc:delete', '删除', '40', 712672045210342580, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/712672045210342580/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (712839991315310592, 2, 'tenant:sop:notify:delete', '删除', '40', 712672045210342575, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1000, '', b'0', b'0', '06', NULL, b'0', '/625950651139229699/712672045210342575/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1448315264151060480, 2, 'tenant:system:param', '参数管理', '20', 143911967403278336, '01', '', '/system/parameter', '/devOperation/system/defParameter/index', NULL, '', 'ant-design:profile-outlined', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1448315406962917376, 2, 'tenant:system:area', '地区管理', '20', 143911967403278336, '01', '', '/system/area', '/devOperation/system/defArea/index', NULL, '', 'ant-design:area-chart-outlined', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1448315861369618432, 2, 'tenant:system:client', '客户端管理', '20', 143911967403278336, '01', '', '/system/client', '/devOperation/system/defClient/index', NULL, '', 'ant-design:android-outlined', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449391740313141248, 2, 'tenant:system:dict', '字典列表', '20', 143911967403278336, '01', '', '/system/dict', '/devOperation/system/dict/index', NULL, '', 'ant-design:book-twotone', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449723704727568384, 2, 'tenant:system:dict:add', '新增字典', '40', 1449391740313141248, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449723831227777024, 2, 'tenant:system:dict:edit', '编辑字典', '40', 1449391740313141248, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449723907798990848, 2, 'tenant:system:dict:delete', '删除字典', '40', 1449391740313141248, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449724021556903936, 2, 'tenant:system:dict:addItem', '新增字典项', '40', 1449391740313141248, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449724119569399808, 2, 'tenant:system:dict:editItem', '编辑字典项', '40', 1449391740313141248, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 11, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449724196207722496, 2, 'tenant:system:dict:deleteItem', '删除字典项', '40', 1449391740313141248, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 13, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449730763980275712, 1, 'basic:base:dict:addItem', '新增字典项', '40', 144313439471271937, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/144313439471271937/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449730828442533888, 1, 'basic:base:dict:editItem', '编辑字典项', '40', 144313439471271937, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 11, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/144313439471271937/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449730881009745920, 1, 'basic:base:dict:deleteItem', '删除字典项', '40', 144313439471271937, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 13, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/144313439471271937/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449731618892677120, 1, 'basic:base:parameter', '个性参数', '20', 144313439471271936, '01', '', '/base/parameter', '/basic/base/baseParameter/index', NULL, '', 'ant-design:profile-outlined', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449732267470487552, 1, 'basic:user', '用户中心', '20', 0, '01', '', '/user', 'LAYOUT', NULL, '/user/employee', 'ant-design:usergroup-add-outlined', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449732868459724800, 1, 'basic:application:myApplication', '我的应用', '20', 0, '01', '', '/myApplication', '/basic/application/myApp/index', NULL, '', 'ant-design:appstore-outlined', b'0', b'1', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449733521265393664, 1, 'basic:msg', '消息中心', '20', 0, '01', '', '/msg', 'LAYOUT', NULL, '/msg/myMsg', 'ant-design:message-outlined', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449733787893104640, 1, 'basic:msg:myMsg', '我的消息', '20', 1449733521265393664, '01', '', '/msg/myMsg', '/basic/msg/extendNotice/index', NULL, '', 'wpf-my-topic', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449734007292952576, 1, 'basic:msg:msg', '消息管理', '20', 1449733521265393664, '01', '', '/msg/msg', '/basic/msg/extendMsg/index', NULL, '', 'codicon-repo-push', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/', 1, '{\"badge\":\"数据权限\",\"content\":\"数据权限\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449734450995789824, 1, 'basic:system:role', '角色管理', '20', 144313439471271947, '01', '', '/system/role', '/basic/system/baseRole/index', NULL, '', 'ant-design:lock-outlined', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449734944434683904, 1, 'basic:system:webLog', '操作日志', '20', 144313439471271947, '01', '', '/system/operationLog', '/basic/system/baseOperationLog/index', NULL, '', 'ant-design:reconciliation-outlined', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449735103088427008, 1, 'basic:system:loginLog', '登录日志', '20', 144313439471271947, '01', '', '/sysFunction/loginLog', '/basic/system/baseLoginLog/index', NULL, '', 'ant-design:login-outlined', b'0', b'0', b'1', 40, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449738119237599232, 1, 'basic:user:org', '组织机构', '20', 1449732267470487552, '01', '', '/user/org', '/basic/user/baseOrg/index', NULL, '', 'ant-design:cluster-outlined', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449738581135327232, 1, 'basic:user:employee', '员工管理', '20', 1449732267470487552, '01', '', '/user/employee', '/basic/user/baseEmployee/index', NULL, '', 'ant-design:user-add-outlined', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1449739134456299520, 1, 'basic:user:position', '岗位管理', '20', 1449732267470487552, '01', '', '/user/position', '/basic/user/basePosition/index', NULL, '', 'eos-icons:job', b'0', b'0', b'1', 30, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457601147127726080, 1, 'basic:application', '应用管理', '20', 0, '01', '', '/basicApplication', 'LAYOUT', NULL, '/basicApplication/appStore', 'ant-design:appstore-twotone', b'0', b'0', b'1', 20, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457602393330941952, 1, 'basic:application:appStore', '已购应用', '20', 1457601147127726080, '01', '', '/basicApplication/appStore', '/basic/application/appStore/index', NULL, '', 'ant-design:appstore-add-outlined', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/1457601147127726080/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457620408604819456, 1, 'basic:user:employee:add', '新增', '40', 1449738581135327232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457620470995091456, 1, 'basic:user:employee:edit', '编辑', '40', 1449738581135327232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457620528469639168, 1, 'basic:user:employee:delete', '删除', '40', 1449738581135327232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457620585302458368, 1, 'basic:user:employee:view', '查看', '40', 1449738581135327232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457665354649042944, 1, 'basic:user:position:add', '新增', '40', 1449739134456299520, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449739134456299520/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457665399683284992, 1, 'basic:user:position:edit', '编辑', '40', 1449739134456299520, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449739134456299520/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457665444381982720, 1, 'basic:user:position:delete', '删除', '40', 1449739134456299520, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449739134456299520/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457665503664275456, 1, 'basic:user:position:view', '查看', '40', 1449739134456299520, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449739134456299520/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457665587088982016, 1, 'basic:user:org:add', '新增', '40', 1449738119237599232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738119237599232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457665635705159680, 1, 'basic:user:org:edit', '编辑', '40', 1449738119237599232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738119237599232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457665696765837312, 1, 'basic:user:org:delete', '删除', '40', 1449738119237599232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738119237599232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457665749857337344, 1, 'basic:user:org:switch', '切换', '40', 1449738119237599232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738119237599232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457668537614073856, 1, 'basic:system:role:add', '新增', '40', 1449734450995789824, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457668602952941568, 1, 'basic:system:role:edit', '编辑', '40', 1449734450995789824, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457668655000059904, 1, 'basic:system:role:delete', '删除', '40', 1449734450995789824, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457668749124435968, 1, 'basic:system:role:bindUser', '绑定用户', '40', 1449734450995789824, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457668844297388032, 1, 'basic:system:role:bindResource', '配置资源', '40', 1449734450995789824, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 6, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1457671975706034176, 1, 'basic:base:dict:view', '查看字典', '40', 144313439471271937, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/144313439471271937/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1459061181095346176, 2, 'tenant:system:loginLog', '全局登录日志', '20', 143911967403278336, '01', '', '/system/loginLog', '/devOperation/system/defLoginLog/index', NULL, '', 'ant-design:login-outlined', b'0', b'0', b'1', 60, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460436763976663040, 1, 'basic:msg:msg:add', '发布消息', '20', 1449734007292952576, '01', '', '/msg/msg/:type/:id', '/basic/msg/extendMsg/Edit', NULL, '', '', b'1', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/1449734007292952576/', 2, '{\"currentActiveMenu\":\"/msg/msg\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460436856054218752, 1, 'basic:msg:msg:edit', '编辑', '40', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/1449734007292952576/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460436934051495936, 1, 'basic:msg:msg:delete', '删除', '40', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 5, '', b'0', b'1', NULL, NULL, NULL, '/1449734007292952576/1449733521265393664/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460468030063509504, 1, 'basic:msg:myMsg:edit', '查看我的消息', '20', 1449733787893104640, '01', '', '/msg/myMsg/:type/:id', '/basic/msg/extendNotice/Edit', NULL, '', '', b'1', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/1449733787893104640/', 2, '{\"currentActiveMenu\":\"/msg/myMsg\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460537476991942656, 1, 'basic:msg:myMsg:delete', '删除', '40', 1449733787893104640, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/1449733787893104640/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460537873248813056, 1, 'basic:msg:msg:view', '查看', '40', 1449734007292952576, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/1449734007292952576/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460538387822804992, 1, 'basic:base:parameter:add', '新增', '40', 1449731618892677120, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/1449731618892677120/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460538432919961600, 1, 'basic:base:parameter:edit', '编辑', '40', 1449731618892677120, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/1449731618892677120/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460538485118074880, 1, 'basic:base:parameter:delete', '删除', '40', 1449731618892677120, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/1449731618892677120/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460538532253663232, 1, 'basic:base:parameter:view', '查看', '40', 1449731618892677120, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271936/1449731618892677120/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460538960118808576, 1, 'basic:system:webLog:delete', '删除', '40', 1449734944434683904, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734944434683904/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460539047851065344, 1, 'basic:system:webLog:view', '查看', '40', 1449734944434683904, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734944434683904/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460540557393657856, 1, 'basic:system:loginLog:delete', '删除', '40', 1449735103088427008, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449735103088427008/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460540612146102272, 1, 'basic:system:loginLog:view', '查看', '40', 1449735103088427008, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449735103088427008/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460541171116802048, 2, 'tenant:tenant:datasourceConfig:add', '新增', '40', 137848577387921410, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921410/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460541225001025536, 2, 'tenant:tenant:datasourceConfig:edit', '编辑', '40', 137848577387921410, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921410/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460541409667842048, 2, 'tenant:tenant:datasourceConfig:delete', '删除', '40', 137848577387921410, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921410/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460541584536764416, 2, 'tenant:tenant:datasourceConfig:test', '测试', '40', 137848577387921410, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921410/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460541814825025536, 2, 'tenant:tenant:tenant:add', '新增', '40', 137848577387921411, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921411/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460541863848050688, 2, 'tenant:tenant:tenant:edit', '编辑', '40', 137848577387921411, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921411/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460541913261146112, 2, 'tenant:tenant:tenant:delete', '删除', '40', 137848577387921411, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921411/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460542054323978240, 2, 'tenant:tenant:tenant:initData', '初始化租户数据库表结构和初始数据', '40', 137848577387921411, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921411/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460542155125686272, 2, 'tenant:tenant:tenant:initDataSource', '初始化数据源', '40', 137848577387921411, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 5, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921411/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460542227817168896, 2, 'tenant:tenant:tenant:bindUser', '绑定用户', '40', 137848577387921411, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 6, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921411/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460542416003006464, 2, 'tenant:tenant:tenant:toExamine', '审核', '40', 137848577387921411, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 7, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921411/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460542581971615744, 2, 'tenant:tenant:user:add', '新增', '40', 137848577387921412, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921412/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460542629845401600, 2, 'tenant:tenant:user:edit', '编辑', '40', 137848577387921412, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921412/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460542675554926592, 2, 'tenant:tenant:user:delete', '删除', '40', 137848577387921412, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921412/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460543317040168960, 2, 'tenant:tenant:user:view', '查看', '40', 137848577387921412, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921412/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460547251804831744, 2, 'tenant:application:application:resource:edit', '编辑', '40', 137848577387921421, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/137848577387921421/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460547377491345408, 2, 'tenant:application:application:resource:delete', '删除', '40', 137848577387921421, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/137848577387921421/', 3, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460547739937931264, 2, 'tenant:system:param:add', '新增', '40', 1448315264151060480, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315264151060480/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460547794912673792, 2, 'tenant:system:param:edit', '编辑', '40', 1448315264151060480, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315264151060480/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460547848918532096, 2, 'tenant:system:param:view', '查看', '40', 1448315264151060480, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315264151060480/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460547893147467776, 2, 'tenant:system:param:delete', '删除', '40', 1448315264151060480, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315264151060480/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460547974479216640, 2, 'tenant:system:area:add', '新增', '40', 1448315406962917376, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315406962917376/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460548071271170048, 2, 'tenant:system:area:edit', '编辑', '40', 1448315406962917376, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315406962917376/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460548273847664640, 2, 'tenant:system:area:delete', '删除', '40', 1448315406962917376, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315406962917376/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460548462427766784, 2, 'tenant:system:client:add', '新增', '40', 1448315861369618432, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315861369618432/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460548519843594240, 2, 'tenant:system:client:edit', '编辑', '40', 1448315861369618432, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315861369618432/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460548553880371200, 2, 'tenant:system:client:delete', '删除', '40', 1448315861369618432, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315861369618432/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460548589812973568, 2, 'tenant:system:client:view', '查看', '40', 1448315861369618432, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315861369618432/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460548658754748416, 2, 'tenant:system:loginLog:delete', '删除', '40', 1459061181095346176, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1459061181095346176/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1460548689041817600, 2, 'tenant:system:loginLog:view', '查看', '40', 1459061181095346176, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1459061181095346176/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1461609523809615872, 1, 'basic:user:employee:bindRole', '绑定角色', '40', 1449738581135327232, '01', '', '', '', NULL, '', '', b'0', b'0', b'1', 10, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2, '{}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource` VALUES (1461615207515160576, 2, 'tenant:tenant:tenant:view', '查看企业信息', '20', 137848577387921411, '01', '', '/tenant/tenant/:id', '/devOperation/tenant/defTenant/view/index', NULL, '', '', b'1', b'0', b'1', 0, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921408/137848577387921411/', 2, '{\"currentActiveMenu\":\"/tenant/tenant\"}', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_resource_api
-- ----------------------------
DROP TABLE IF EXISTS `def_resource_api`;
CREATE TABLE `def_resource_api`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `resource_id` bigint NOT NULL COMMENT '资源ID',
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '控制器类名',
  `spring_application_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '所属服务;取配置文件中 spring.application.name ',
  `request_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '接口名;接口上的注释',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接口地址;kpu-cloud版：uri需要拼接上gateway中路径前缀kpu-boot版: uri需要不需要拼接前缀',
  `is_input` bit(1) NULL DEFAULT NULL COMMENT '是否手动录入',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_res_api_resource_id`(`resource_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源接口' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_resource_api
-- ----------------------------
INSERT INTO `def_resource_api` VALUES (167906188749438980, 1460537873248813056, 'DefUserController', 'kpu-system-server', 'POST', '用户-查找同一企业下的用户', '/system/defUser/pageUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167906188749438981, 1460537873248813056, 'MsgController', 'kpu-base-server', 'GET', '消息表-查询消息中心', '/base/msg/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167906188749438982, 1460537873248813056, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-批量查询', '/base/baseRole/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029221539, 1460542155125686272, 'TenantDsController', 'kpu-gateway-server', 'GET', '检测是否存在指定数据源-gateway', '/ds/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029221542, 1460542155125686272, 'TenantDsController', 'kpu-gateway-server', 'GET', '初始化数据源-gateway', '/ds/initDataSource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225477, 1457620585302458368, 'BaseEmployeeController', 'kpu-base-server', 'GET', '员工-单体查询', '/base/baseEmployee/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225478, 1457620528469639168, 'BaseEmployeeController', 'kpu-base-server', 'DELETE', '员工-删除', '/base/baseEmployee', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225479, 1457620470995091456, 'BaseEmployeeController', 'kpu-base-server', 'PUT', '员工-修改', '/base/baseEmployee', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225480, 1461609523809615872, 'BaseEmployeeController', 'kpu-base-server', 'GET', '员工-查询员工的角色', '/base/baseEmployee/findEmployeeRoleByEmployeeId', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225481, 1461609523809615872, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-分页查询员工的角色', '/base/baseRole/pageMyRole', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225482, 1461609523809615872, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工-给员工分配角色', '/base/baseEmployee/employeeRole', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225483, 1449738119237599232, 'BaseOrgController', 'kpu-base-server', 'POST', '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225484, 1457665587088982016, 'BaseOrgController', 'kpu-base-server', 'POST', '组织-新增', '/base/baseOrg', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225485, 1457665635705159680, 'BaseOrgController', 'kpu-base-server', 'PUT', '组织-修改', '/base/baseOrg', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225486, 1457665696765837312, 'BaseOrgController', 'kpu-base-server', 'DELETE', '组织-删除', '/base/baseOrg', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225488, 1457665354649042944, 'BaseOrgController', 'kpu-base-server', 'POST', '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225489, 1457665354649042944, 'BasePositionController', 'kpu-base-server', 'POST', '岗位-新增', '/base/basePosition', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225490, 1457665399683284992, 'BasePositionController', 'kpu-base-server', 'PUT', '岗位-修改', '/base/basePosition', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225491, 1457665444381982720, 'BasePositionController', 'kpu-base-server', 'DELETE', '岗位-删除', '/base/basePosition', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225492, 144313439471271937, 'BaseDictController', 'kpu-base-server', 'POST', '字典-分页列表查询', '/base/baseDict/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225493, 144313439471271937, 'BaseDictItemController', 'kpu-base-server', 'POST', '字典项-分页列表查询', '/base/baseDictItem/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225494, 144313439471271938, 'DefDictController', 'kpu-system-server', 'POST', '字典-分页列表查询', '/system/defDict/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225495, 144313439471271938, 'BaseDictController', 'kpu-base-server', 'POST', '字典-导入', '/base/baseDict/importDict', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225496, 144313439471271939, 'BaseDictController', 'kpu-base-server', 'PUT', '字典-修改', '/base/baseDict', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225497, 144313439471271940, 'BaseDictController', 'kpu-base-server', 'DELETE', '字典-删除', '/base/baseDict', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225500, 1449730881009745920, 'BaseDictItemController', 'kpu-base-server', 'DELETE', '字典项-删除', '/base/baseDictItem', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225501, 1449731618892677120, 'BaseParameterController', 'kpu-base-server', 'POST', '个性参数-分页列表查询', '/base/baseParameter/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225502, 1460538387822804992, 'BaseParameterController', 'kpu-base-server', 'POST', '个性参数-新增', '/base/baseParameter', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225503, 1460538485118074880, 'BaseParameterController', 'kpu-base-server', 'DELETE', '个性参数-删除', '/base/baseParameter', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225504, 1449735103088427008, 'BaseLoginLogController', 'kpu-base-server', 'POST', '登录日志-分页列表查询', '/base/baseLoginLog/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225505, 1460540557393657856, 'BaseLoginLogController', 'kpu-base-server', 'DELETE', '登录日志-清空日志', '/base/baseLoginLog/clear', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225506, 1460540557393657856, 'BaseLoginLogController', 'kpu-base-server', 'DELETE', '登录日志-删除', '/base/baseLoginLog', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225507, 1460540612146102272, 'BaseLoginLogController', 'kpu-base-server', 'GET', '登录日志-查询单体详情', '/base/baseLoginLog/detail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225508, 1449734944434683904, 'BaseOperationLogController', 'kpu-base-server', 'POST', '操作日志-分页列表查询', '/base/baseOperationLog/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225509, 1460538960118808576, 'BaseOperationLogController', 'kpu-base-server', 'DELETE', '操作日志-清空日志', '/base/baseOperationLog/clear', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225510, 1460538960118808576, 'BaseOperationLogController', 'kpu-base-server', 'DELETE', '操作日志-删除', '/base/baseOperationLog', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225511, 1460539047851065344, 'BaseOperationLogController', 'kpu-base-server', 'GET', '操作日志-查询单体详情', '/base/baseOperationLog/detail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225517, 1457668537614073856, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-新增', '/base/baseRole', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225518, 1457668602952941568, 'BaseRoleController', 'kpu-base-server', 'PUT', '角色-修改', '/base/baseRole', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225519, 1457668655000059904, 'BaseRoleController', 'kpu-base-server', 'DELETE', '角色-删除', '/base/baseRole', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225520, 1457668749124435968, 'BaseOrgController', 'kpu-base-server', 'POST', '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225521, 1457668749124435968, 'BaseRoleController', 'kpu-base-server', 'GET', '角色-查询角色绑定的员工', '/base/baseRole/employeeList', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225522, 1457668749124435968, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工-分页列表查询', '/base/baseEmployee/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225523, 1457668749124435968, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-给角色分配员工', '/base/baseRole/roleEmployee', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225524, 1457668844297388032, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-给角色配置资源', '/base/baseRole/roleResource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225526, 1460541171116802048, 'DefDatasourceConfigController', 'kpu-system-server', 'POST', '数据源-新增', '/system/defDatasourceConfig', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225527, 1460541225001025536, 'DefDatasourceConfigController', 'kpu-system-server', 'PUT', '数据源-修改', '/system/defDatasourceConfig', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225528, 1460541409667842048, 'DefDatasourceConfigController', 'kpu-system-server', 'DELETE', '数据源-删除', '/system/defDatasourceConfig', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225529, 1460541584536764416, 'DefDatasourceConfigController', 'kpu-system-server', 'POST', '数据源-测试数据库链接', '/system/defDatasourceConfig/testConnect', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225531, 1460541814825025536, 'DefTenantController', 'kpu-system-server', 'POST', '企业-新增', '/system/defTenant', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225533, 1460541913261146112, 'DefTenantController', 'kpu-system-server', 'DELETE', '企业-删除', '/system/defTenant', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225534, 1460542054323978240, 'DefTenantController', 'kpu-system-server', 'POST', '企业-初始化数据', '/system/defTenant/initData', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225535, 1460542054323978240, 'DefDatasourceConfigController', 'kpu-system-server', 'POST', '数据源-批量查询', '/system/defDatasourceConfig/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225539, 1460542155125686272, 'TenantDsController', 'kpu-base-server', 'GET', '检测是否存在指定数据源', '/*/ds/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225540, 1460542155125686272, 'GeneratorController', 'kpu-gateway-server', 'GET', '查询在线服务的前缀', '/gateway/findOnlineServicePrefix', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225541, 1460542155125686272, 'DefTenantController', 'kpu-system-server', 'POST', '企业-修改租户审核状态', '/system/defTenant/updateStatus', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225542, 1460542155125686272, 'TenantDsController', 'kpu-base-server', 'GET', '初始化数据源', '/*/ds/initDataSource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225543, 1460542227817168896, 'DefUserController', 'kpu-system-server', 'POST', '用户-查询未绑定到该企业的用户', '/system/defUser/findNotUserByTenantId', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225544, 1460542227817168896, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工-企业绑定用户并设置为租户管理员', '/base/baseEmployee/bindUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225552, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'POST', '用户-新增', '/system/defUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225553, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'PUT', '用户-修改', '/system/defUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225554, 1460542675554926592, 'DefUserController', 'kpu-system-server', 'DELETE', '用户-删除', '/system/defUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225555, 160561957882036227, 'DefUserController', 'kpu-system-server', 'PUT', '用户-重置密码', '/system/defUser/resetPassword', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225557, 137848577387921417, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-新增', '/system/defApplication', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225558, 137848577387921419, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-新增', '/system/defApplication', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225559, 137848577387921418, 'DefApplicationController', 'kpu-system-server', 'PUT', '应用-修改', '/system/defApplication', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225568, 1460547377491345408, 'DefResourceController', 'kpu-system-server', 'DELETE', '资源-删除', '/system/defResource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225569, 137848577387921422, 'DefResourceController', 'kpu-system-server', 'POST', '资源-新增', '/system/defResource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225570, 137848577387921422, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源编码是否可用', '/system/defResource/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225571, 137848577387921422, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源路径是否可用', '/system/defResource/checkPath', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225572, 137848577387921422, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源名称是否可用', '/system/defResource/checkName', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225573, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'PUT', '资源-修改', '/system/defResource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225574, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'GET', '资源-单体查询', '/system/defResource/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225575, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源路径是否可用', '/system/defResource/checkPath', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225576, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源编码是否可用', '/system/defResource/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225577, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源名称是否可用', '/system/defResource/checkName', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225581, 139496646533709824, 'DefResourceController', 'kpu-system-server', 'POST', '资源-新增', '/system/defResource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225582, 139496646533709824, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源路径是否可用', '/system/defResource/checkPath', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225583, 139496646533709824, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源编码是否可用', '/system/defResource/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225584, 139496646533709824, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源名称是否可用', '/system/defResource/checkName', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225590, 139702946697838593, 'DefResourceController', 'kpu-system-server', 'DELETE', '资源-删除', '/system/defResource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225594, 140154107242479618, 'DefTenantController', 'kpu-system-server', 'POST', '企业-批量查询', '/system/defTenant/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225595, 140154107242479618, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-批量查询', '/system/defApplication/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225596, 140154107242479618, 'DefTenantApplicationRelController', 'kpu-system-server', 'GET', '租户应用授权-查询单体详情', '/system/defTenantApplicationRel/detail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225597, 140154107242479618, 'DefTenantApplicationRelController', 'kpu-system-server', 'POST', '租户应用授权-续期', '/system/defTenantApplicationRel/renewal', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225598, 140154107242479617, 'DefTenantApplicationRelController', 'kpu-system-server', 'POST', '租户应用授权-取消授权', '/system/defTenantApplicationRel/cancel', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225602, 137848577387921416, 'DefTenantApplicationRecordController', 'kpu-system-server', 'POST', '租户应用授权记录-分页列表查询', '/system/defTenantApplicationRecord/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225603, 137848577387921416, 'DefTenantController', 'kpu-system-server', 'POST', '企业-批量查询', '/system/defTenant/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225604, 137848577387921416, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-批量查询', '/system/defApplication/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225609, 1449723907798990848, 'DefDictController', 'kpu-system-server', 'DELETE', '字典-删除', '/system/defDict', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225610, 1449723704727568384, 'DefDictController', 'kpu-system-server', 'POST', '字典-新增', '/system/defDict', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225611, 1449723704727568384, 'DefDictController', 'kpu-system-server', 'GET', '字典-检测字典标识是否可用', '/system/defDict/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225612, 1449723831227777024, 'DefDictController', 'kpu-system-server', 'PUT', '字典-修改', '/system/defDict', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225613, 1449723831227777024, 'DefDictController', 'kpu-system-server', 'GET', '字典-检测字典标识是否可用', '/system/defDict/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225614, 1449724021556903936, 'DefDictItemController', 'kpu-system-server', 'POST', '字典项-新增', '/system/defDictItem', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225615, 1449724119569399808, 'DefDictItemController', 'kpu-system-server', 'PUT', '字典项-修改', '/system/defDictItem', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225616, 1449724196207722496, 'DefDictItemController', 'kpu-system-server', 'DELETE', '字典项-删除', '/system/defDictItem', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225618, 1460547739937931264, 'DefParameterController', 'kpu-system-server', 'POST', '参数配置-新增', '/system/defParameter', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225619, 1460547794912673792, 'DefParameterController', 'kpu-system-server', 'PUT', '参数配置-修改', '/system/defParameter', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225620, 1460547893147467776, 'DefParameterController', 'kpu-system-server', 'DELETE', '参数配置-删除', '/system/defParameter', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225622, 1460547974479216640, 'DefAreaController', 'kpu-system-server', 'POST', '地区表-新增', '/system/defArea', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225623, 1460548071271170048, 'DefAreaController', 'kpu-system-server', 'PUT', '地区表-修改', '/system/defArea', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225624, 1460548273847664640, 'DefAreaController', 'kpu-system-server', 'DELETE', '地区表-删除', '/system/defArea', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225626, 1460548462427766784, 'DefClientController', 'kpu-system-server', 'POST', '客户端-新增', '/system/defClient', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225627, 1460548519843594240, 'DefClientController', 'kpu-system-server', 'PUT', '客户端-修改', '/system/defClient', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225628, 1460548553880371200, 'DefClientController', 'kpu-system-server', 'DELETE', '客户端-删除', '/system/defClient', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225630, 1460548658754748416, 'DefLoginLogController', 'kpu-system-server', 'DELETE', '登录日志-清空日志', '/system/defLoginLog/clear', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225631, 1460548658754748416, 'DefLoginLogController', 'kpu-system-server', 'DELETE', '登录日志-删除', '/system/defLoginLog', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (167990267029225632, 1460548689041817600, 'DefLoginLogController', 'kpu-system-server', 'GET', '登录日志-查询单体详情', '/system/defLoginLog/detail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169176494046707717, 1457620408604819456, 'BasePositionController', 'kpu-base-server', 'POST', '岗位-批量查询', '/base/basePosition/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169176494046707718, 1457620408604819456, 'BaseOrgController', 'kpu-base-server', 'POST', '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169176494046707719, 1457620408604819456, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工-新增', '/base/baseEmployee', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169176494046707720, 1457620408604819456, 'DefUserController', 'kpu-system-server', 'GET', '用户-检测手机号是否存在', '/system/defUser/checkMobile', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169176494046707724, 1460538432919961600, 'BaseParameterController', 'kpu-base-server', 'PUT', '个性参数-修改', '/base/baseParameter', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169176494046707725, 1449730763980275712, 'BaseDictItemController', 'kpu-base-server', 'POST', '字典项-新增', '/base/baseDictItem', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169176494046707726, 1449730763980275712, 'BaseDictItemController', 'kpu-base-server', 'GET', '字典项-检测字典项标识是否可用', '/base/baseDictItem/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169176494046707727, 1449730828442533888, 'BaseDictItemController', 'kpu-base-server', 'PUT', '字典项-修改', '/base/baseDictItem', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169176494046707728, 1449730828442533888, 'BaseDictItemController', 'kpu-base-server', 'GET', '字典项-检测字典项标识是否可用', '/base/baseDictItem/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374593, 144313439471271939, 'BaseDictController', 'kpu-base-server', 'GET', '字典-检测字典标识是否可用', '/base/baseDict/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374660, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'GET', '用户-检测手机号是否存在', '/system/defUser/checkMobile', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374661, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'GET', '用户-检测用户名是否存在', '/system/defUser/checkUsername', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374662, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'GET', '用户-检测邮箱是否存在', '/system/defUser/checkEmail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374663, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'GET', '用户-检测身份证是否存在', '/system/defUser/checkIdCard', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374665, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'GET', '用户-检测手机号是否存在', '/system/defUser/checkMobile', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374666, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'GET', '用户-检测用户名是否存在', '/system/defUser/checkUsername', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374667, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'GET', '用户-检测邮箱是否存在', '/system/defUser/checkEmail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374668, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'GET', '用户-检测身份证是否存在', '/system/defUser/checkIdCard', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374673, 137848577387921420, 'DefApplicationController', 'kpu-system-server', 'DELETE', '应用-删除', '/system/defApplication', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374676, 1449724021556903936, 'DefDictItemController', 'kpu-system-server', 'GET', '字典项-检测字典项标识是否可用', '/system/defDictItem/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374678, 1449724119569399808, 'DefDictItemController', 'kpu-system-server', 'GET', '字典项-检测字典项标识是否可用', '/system/defDictItem/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374682, 1460547739937931264, 'DefParameterController', 'kpu-system-server', 'GET', '参数配置-检测参数键是否可用', '/system/defParameter/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (169380096971374684, 1460547794912673792, 'DefParameterController', 'kpu-system-server', 'GET', '参数配置-检测参数键是否可用', '/system/defParameter/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (199848844077301780, 199848844077301779, 'BaseEmployeeController', 'kpu-boot-server', 'POST', '员工-租户绑定或解绑用户', '/base/baseEmployee/invitationUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (199848844077301781, 199848844077301779, 'DefUserController', 'kpu-boot-server', 'POST', '用户-邀请员工进入企业前精确查询用户', '/system/defUser/queryUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (199848844077301788, 199848844077301787, 'DefUserController', 'kpu-boot-server', 'POST', '用户-查找同一企业下的用户', '/system/defUser/pageUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (199848844077301789, 199848844077301787, 'BaseEmployeeController', 'kpu-boot-server', 'POST', '员工-企业绑定或解绑用户并设置为租户管理员', '/base/baseEmployee/bindUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207592996529504256, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'PUT', '资源-修改', '/system/defResource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207592996529504257, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源路径是否可用', '/system/defResource/checkPath', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207592996529504258, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源编码是否可用', '/system/defResource/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207592996529504259, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'GET', '资源-检测资源名称是否可用', '/system/defResource/checkName', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207592996529504260, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'GET', '资源-单体查询', '/system/defResource/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207592996529504261, 139702946697838592, 'GeneratorController', 'kpu-gateway-server', 'GET', '查询在线服务的前缀', '/gateway/findOnlineService', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207592996529504371, 207592996529504370, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-同步表的字段', '/generator/defGenTable/syncField', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207644798130061313, 207644798130061312, 'DefGenTableController', 'kpu-generator-server', 'DELETE', '代码生成-删除', '/generator/defGenTable', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207644798130061319, 207644798130061318, 'DefGenTableColumnController', 'kpu-generator-server', 'DELETE', '代码生成字段-删除', '/generator/defGenTableColumn', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207644798130061324, 207644798130061323, 'DefGenTableColumnController', 'kpu-generator-server', 'PUT', '代码生成字段-修改', '/generator/defGenTableColumn', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207950410822975489, 207209017863307265, 'DefGenTestSimpleController', 'kpu-generator-server', 'ALL', '测试', '/*/defGenTestSimple/**', b'1', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (207950410822975490, 207209017863307266, 'DefGenTestTreeController', 'kpu-generator-server', 'ALL', '测试', '/*/defGenTestTree/**', b'1', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (210957953082064896, 206499429136465920, 'DefGenProjectController', 'kpu-generator-server', 'POST', '项目生成-生成项目', '/generator/defGenProject/generator', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (210957953082064897, 206499429136465920, 'DefGenProjectController', 'kpu-generator-server', 'POST', '项目生成-获取默认配置', '/generator/defGenProject/getDef', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197696, 198310764748996609, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-分页列表查询', '/generator/defGenTable/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197697, 198310764748996609, 'DefGenTableController', 'kpu-generator-server', 'GET', '代码生成-查询单体详情', '/generator/defGenTable/detail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197704, 207592996529504364, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-导入检测', '/generator/defGenTable/importCheck', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197705, 207592996529504364, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-导入表结构', '/generator/defGenTable/importTable', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197706, 207592996529504364, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-分页查询代码生成表', '/generator/defGenTable/selectTableList', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197707, 207592996529504364, 'DefDatasourceConfigController', 'kpu-system-server', 'POST', '数据源-批量查询', '/system/defDatasourceConfig/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197714, 137848577387921415, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-批量查询', '/system/defApplication/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197715, 137848577387921415, 'DefTenantController', 'kpu-system-server', 'POST', '企业-批量查询', '/system/defTenant/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197716, 137848577387921415, 'DefTenantApplicationRelController', 'kpu-system-server', 'POST', '租户应用授权-分页列表查询', '/system/defTenantApplicationRel/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197717, 207644798130061314, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-预览', '/generator/defGenTable/previewCode', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197718, 207644798130061314, 'DefGenTableController', 'kpu-generator-server', 'GET', '代码生成-批量生成代码', '/generator/defGenTable/generatorCode', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (212844732215197719, 207644798130061314, 'DefGenTableController', 'kpu-generator-server', 'GET', '代码生成-批量下载代码', '/generator/defGenTable/downloadZip', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (214351621490999296, 207644798130061325, 'DefGenTableColumnController', 'kpu-generator-server', 'POST', '代码生成字段-同步字段结构', '/generator/defGenTableColumn/syncField', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (215458769570627605, 215458769570627596, 'DefDictController', 'kpu-system-server', 'ALL', 'test', '/system/defDict/**', b'1', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (215458769570627606, 215458769570627596, 'DefDictItemController', 'kpu-system-server', 'ALL', 'test', '/system/defDictItem/**', b'1', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092736, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'GET', '代码生成-查询单体详情', '/generator/defGenTable/detail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092737, 201343651610099712, 'DefGenTableColumnController', 'kpu-generator-server', 'POST', '代码生成字段-分页列表查询', '/generator/defGenTableColumn/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092738, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'PUT', '代码生成-修改', '/generator/defGenTable', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092739, 201343651610099712, 'DefResourceController', 'kpu-system-server', 'POST', '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092740, 201343651610099712, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-批量查询', '/system/defApplication/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092741, 201343651610099712, 'GeneratorController', 'kpu-system-server', 'GET', '查询在线服务', '/gateway/findOnlineService', b'1', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092742, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-预览', '/generator/defGenTable/previewCode', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092743, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-批量生成代码', '/generator/defGenTable/generatorCode', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092744, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'GET', '代码生成-批量下载代码', '/generator/defGenTable/downloadZip', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092745, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'GET', '代码生成-获取生成代码是否覆盖的默认配置', '/generator/defGenTable/getDefFileOverrideStrategy', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092746, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'GET', '代码生成-获取字段模板映射', '/generator/defGenTable/getFieldTemplate', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092747, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-批量查询', '/generator/defGenTable/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236152403039092748, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'POST', '代码生成-批量查询', '/generator/defGenTable/findTableList', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (236742432761315345, 206499429136465920, 'DefGenProjectController', 'kpu-generator-server', 'POST', '项目生成-下载项目', '/generator/defGenProject/download', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (242500321752907776, 242181583639937024, 'DefServerController', 'kpu-system-server', 'GET', '服务监控-server', '/system/defServer', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (244177274553761797, 244177274553761796, 'DefUserController', 'kpu-system-server', 'PUT', '用户-重置密码', '/system/defUser/resetPassword', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213194, 249954310509559809, 'DefInterfaceController', 'kpu-system-server', 'POST', '接口-分页列表查询', '/system/defInterface/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213197, 250025856074776579, 'DefInterfaceController', 'kpu-system-server', 'DELETE', '接口-删除', '/system/defInterface', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213198, 249954310509559812, 'DefInterfacePropertyController', 'kpu-system-server', 'POST', '接口属性-保存', '/system/defInterfaceProperty/batchSave', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213199, 249954310509559812, 'DefInterfacePropertyController', 'kpu-system-server', 'POST', '接口属性-分页列表查询', '/system/defInterfaceProperty/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213202, 250025856074776580, 'ExtendInterfaceLogController', 'kpu-base-server', 'DELETE', '接口执行日志-删除', '/base/extendInterfaceLog', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213204, 250025856074776581, 'ExtendInterfaceLoggingController', 'kpu-base-server', 'DELETE', '接口执行日志记录-删除', '/base/extendInterfaceLogging', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213205, 249954310509559811, 'DefMsgTemplateController', 'kpu-system-server', 'POST', '消息模板-分页列表查询', '/system/defMsgTemplate/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213208, 250025856074776584, 'DefMsgTemplateController', 'kpu-system-server', 'DELETE', '消息模板-删除', '/system/defMsgTemplate', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213209, 244034011624636417, 'ExtendMsgTemplateController', 'kpu-base-server', 'POST', '消息模板-分页列表查询', '/base/extendMsgTemplate/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213211, 253596752014213210, 'ExtendMsgTemplateController', 'kpu-base-server', 'DELETE', '消息模板-删除', '/base/extendMsgTemplate', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213216, 253596752014213212, 'ExtendMsgTemplateController', 'kpu-base-server', 'POST', '消息模板-导入系统消息模板', '/base/extendMsgTemplate/importMsgTemplate', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213217, 253596752014213212, 'DefMsgTemplateController', 'kpu-system-server', 'POST', '消息模板-分页列表查询', '/system/defMsgTemplate/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213219, 1460436934051495936, 'ExtendMsgController', 'kpu-base-server', 'DELETE', '消息-删除', '/base/extendMsg', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213227, 1460436856054218752, 'ExtendMsgController', 'kpu-base-server', 'POST', '消息-发布站内信', '/base/extendMsg/publish', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213228, 1460436856054218752, 'ExtendMsgController', 'kpu-base-server', 'GET', '消息-查询单体详情', '/base/extendMsg/detail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213229, 1460436856054218752, 'ExtendMsgController', 'kpu-base-server', 'GET', '消息-查询消息中心', '/base/extendMsg/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213230, 1460436856054218752, 'DefUserController', 'kpu-system-server', 'POST', '用户-批量查询', '/system/defUser/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213231, 253596752014213214, 'ExtendMsgTemplateController', 'kpu-base-server', 'PUT', '消息模板-修改', '/base/extendMsgTemplate', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213232, 253596752014213214, 'ExtendMsgTemplateController', 'kpu-base-server', 'GET', '消息模板-检测资源编码是否可用', '/base/extendMsgTemplate/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213233, 253596752014213214, 'DefInterfaceController', 'kpu-system-server', 'POST', '接口-批量查询', '/system/defInterface/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213234, 250025856074776577, 'DefInterfaceController', 'kpu-system-server', 'PUT', '接口-修改', '/system/defInterface', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213235, 250025856074776577, 'DefInterfaceController', 'kpu-system-server', 'GET', '接口-检测资源编码是否可用', '/system/defInterface/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213236, 250025856074776576, 'DefInterfaceController', 'kpu-system-server', 'POST', '接口-新增', '/system/defInterface', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213237, 250025856074776576, 'DefInterfaceController', 'kpu-system-server', 'GET', '接口-检测资源编码是否可用', '/system/defInterface/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213238, 249954310509559810, 'ExtendInterfaceLogController', 'kpu-base-server', 'POST', '接口执行日志-分页列表查询', '/base/extendInterfaceLog/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213239, 249954310509559810, 'DefTenantController', 'kpu-system-server', 'POST', '企业-批量查询', '/system/defTenant/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213240, 250025856074776582, 'DefMsgTemplateController', 'kpu-system-server', 'POST', '消息模板-新增', '/system/defMsgTemplate', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213241, 250025856074776582, 'DefMsgTemplateController', 'kpu-system-server', 'GET', '消息模板-检测资源编码是否可用', '/system/defMsgTemplate/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213242, 250025856074776582, 'DefInterfaceController', 'kpu-system-server', 'POST', '接口-批量查询', '/system/defInterface/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213243, 250025856074776583, 'DefMsgTemplateController', 'kpu-system-server', 'PUT', '消息模板-修改', '/system/defMsgTemplate', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213244, 250025856074776583, 'DefInterfaceController', 'kpu-system-server', 'POST', '接口-批量查询', '/system/defInterface/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (253596752014213245, 250025856074776583, 'DefMsgTemplateController', 'kpu-system-server', 'GET', '消息模板-检测资源编码是否可用', '/system/defMsgTemplate/check', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (281886056620490966, 281886056620490965, 'DefResourceController', 'kpu-system-server', 'PUT', '资源-移动资源', '/system/defResource/moveResource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (281886056620490967, 281886056620490965, 'DefResourceController', 'kpu-system-server', 'POST', '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (281886056620490973, 281886056620490972, 'DefResourceController', 'kpu-system-server', 'PUT', '资源-移动资源', '/system/defResource/moveResource', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (281886056620490974, 281886056620490972, 'DefResourceController', 'kpu-system-server', 'POST', '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (289400372487783096, 289400372487783095, 'BaseOrgController', 'kpu-base-server', 'GET', '组织-查询机构的角色', '/base/baseOrg/findOrgRoleByOrgId', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (289400372487783097, 289400372487783095, 'BaseOrgController', 'kpu-base-server', 'POST', '组织-给机构分配角色', '/base/baseOrg/orgRole', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (392483109465207808, 1460541863848050688, 'DefTenantController', 'kpu-system-server', 'PUT', '企业-修改', '/system/defTenant', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (392483109465207809, 1460541863848050688, 'DefTenantController', 'kpu-system-server', 'POST', '企业-修改租户状态', '/system/defTenant/updateState', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (393222543919799297, 393222543919799296, 'DefMsgTemplateController', 'kpu-system-server', 'GET', '消息模板-查询单体详情', '/system/defMsgTemplate/detail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (393222543919799298, 393222543919799296, 'ExtendMsgController', 'kpu-base-server', 'POST', '消息-根据模板发送消息', '/base/extendMsg/sendByTemplate', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (452129128486074368, 1459061181095346176, 'DefLoginLogController', 'kpu-system-server', 'POST', '登录日志-分页列表查询', '/system/defLoginLog/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042429, 1461615207515160576, 'DefTenantController', 'kpu-system-server', 'GET', '企业-单体查询', '/system/defTenant/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042430, 1461615207515160576, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-批量查询', '/system/defApplication/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042431, 1461615207515160576, 'DefTenantApplicationRelController', 'kpu-system-server', 'POST', '租户应用授权-分页列表查询', '/system/defTenantApplicationRel/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042432, 1461615207515160576, 'DefTenantApplicationRelController', 'kpu-system-server', 'POST', '租户应用授权-取消授权', '/system/defTenantApplicationRel/cancel', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042433, 1461615207515160576, 'DefUserController', 'kpu-system-server', 'POST', '用户-查找同一企业下的用户', '/system/defUser/pageUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042468, 1460436763976663040, 'ExtendMsgController', 'kpu-base-server', 'POST', '消息-发布站内信', '/base/extendMsg/publish', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042469, 1460436763976663040, 'ExtendMsgController', 'kpu-base-server', 'GET', '消息-查询消息中心', '/base/extendMsg/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042470, 1460436763976663040, 'ExtendMsgController', 'kpu-base-server', 'GET', '消息-查询单体详情', '/base/extendMsg/detail', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042471, 1460436763976663040, 'DefUserController', 'kpu-system-server', 'POST', '用户-批量查询', '/system/defUser/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042496, 137848577387921421, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-批量查询', '/system/defApplication/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042497, 137848577387921421, 'DefResourceController', 'kpu-system-server', 'POST', '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042498, 137848577387921421, 'DefResourceController', 'kpu-system-server', 'GET', '资源-单体查询', '/system/defResource/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042501, 140154107242479616, 'DefApplicationController', 'kpu-system-server', 'GET', '应用-查询应用资源列表', '/system/defApplication/findApplicationResourceList', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042502, 140154107242479616, 'DefTenantController', 'kpu-system-server', 'POST', '企业-分页列表查询', '/system/defTenant/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042503, 140154107242479616, 'DefTenantApplicationRelController', 'kpu-system-server', 'POST', '租户应用授权-授权', '/system/defTenantApplicationRel/grant', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (496820612548042506, 249954310509559813, 'ExtendInterfaceLoggingController', 'kpu-base-server', 'POST', '接口执行日志记录-分页列表查询', '/base/extendInterfaceLogging/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (505728284525686833, 1457671975706034176, 'BaseDictItemController', 'kpu-base-server', 'GET', '字典项单体查询', '/base/baseDictItem/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (507048518817780084, 172353511420329984, 'FileController', 'kpu-base-server', 'POST', 'com_file表增删改分页列表查询', '/base/file/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (507048518817780087, 172353511420329989, 'FileController', 'kpu-base-server', 'DELETE', 'com_file表增删改删除', '/base/file', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (528767537073677312, 528754428833486865, 'DefUserController', 'kpu-system-server', 'POST', '用户获取在线人员', '/system/defUser/onlineUsers/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (528767537073677313, 528754428833486865, 'DefUserController', 'kpu-system-server', 'POST', '用户获取此 Session 绑定的 Token 签名列表 ', '/system/defUser/onlineUsers/getTokenSignList', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (528767537073677315, 528767537073677314, 'DefUserController', 'kpu-system-server', 'POST', '用户踢人下线', '/system/defUser/onlineUsers/kickout', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (528767537073677317, 528767537073677316, 'DefUserController', 'kpu-system-server', 'POST', '用户强制注销', '/system/defUser/onlineUsers/logout', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (538316018171908096, 137848577387921412, 'DefUserController', 'kpu-system-server', 'POST', '用户-分页列表查询', '/system/defUser/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (538316018171908097, 137848577387921412, 'DefUserController', 'kpu-system-server', 'PUT', '用户修改状态', '/system/defUser/updateState', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (613319079307072699, 1449734007292952576, 'ExtendMsgController', 'kpu-base-server', 'POST', '消息-分页列表查询', '/base/extendMsg/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (613319079307072700, 1449734007292952576, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工-批量查询', '/base/baseEmployee/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (613319079307072701, 1449734007292952576, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工根据Id批量查询', '/base/baseEmployee/findByIds', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (620622714143691776, 1460542416003006464, 'DefTenantController', 'kpu-system-server', 'POST', '企业-修改租户审核状态', '/system/defTenant/updateStatus', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (620622714143691777, 1460542416003006464, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工运营者通过租户申请，并将申请者设为管理员', '/base/baseEmployee/toExamineTenantAndBindUser', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (628901512714957833, 207209017863307267, 'DefGenTestMainSubController', 'kpu-generator-server', 'ALL', '测试', '/*/defGenTestMainSub/**', b'1', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424356923, 632566992424356922, 'SopIsvInfoController', 'kpu-sop-admin-server', 'POST', 'isv信息表applyFor', '/sopadmin/sopIsvInfo/open/applyFor', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424356932, 632566992424356931, 'SopIsvInfoController', 'kpu-sop-admin-server', 'DELETE', 'isv信息表删除', '/sopadmin/sopIsvInfo', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357157, 629222767678781445, 'SopApiInfoController', 'kpu-sop-admin-server', 'POST', '接口信息表分页列表查询', '/sopadmin/sopApiInfo/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357167, 632566992424357166, 'SopApiInfoController', 'kpu-sop-admin-server', 'PUT', '接口信息表修改', '/sopadmin/sopApiInfo', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357171, 632566992424357170, 'SopApiInfoController', 'kpu-sop-admin-server', 'DELETE', '接口信息表删除', '/sopadmin/sopApiInfo', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357371, 629222767678781459, 'SopSysConfigController', 'kpu-sop-admin-server', 'POST', '系统配置表分页列表查询', '/sopadmin/sopSysConfig/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357377, 625950651139229701, 'SopDocAppController', 'kpu-sop-admin-server', 'POST', '文档应用批量查询', '/sopadmin/sopDocApp/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357378, 625950651139229701, 'SopDocInfoController', 'kpu-sop-admin-server', 'POST', '文档信息按树结构查询', '/sopadmin/sopDocInfo/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357382, 632566992424357381, 'SopSysConfigController', 'kpu-sop-admin-server', 'POST', '系统配置表新增', '/sopadmin/sopSysConfig', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357386, 632566992424357385, 'SopSysConfigController', 'kpu-sop-admin-server', 'PUT', '系统配置表修改', '/sopadmin/sopSysConfig', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357390, 632566992424357389, 'SopSysConfigController', 'kpu-sop-admin-server', 'DELETE', '系统配置表删除', '/sopadmin/sopSysConfig', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357627, 632566992424357626, 'SopDocAppController', 'kpu-sop-admin-server', 'POST', '文档应用新增', '/sopadmin/sopDocApp', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357632, 632566992424357631, 'SopDocInfoController', 'kpu-sop-admin-server', 'POST', '文档信息发布文档', '/sopadmin/sopDocInfo/publish', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357636, 632566992424357635, 'SopDocInfoController', 'kpu-sop-admin-server', 'POST', '文档信息发布文档', '/sopadmin/sopDocInfo/publish', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357640, 632566992424357639, 'SopDocInfoController', 'kpu-sop-admin-server', 'POST', '文档信息同步应用文档', '/sopadmin/sopDocInfo/syncAppDoc', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632566992424357641, 632566992424357639, 'SopDocInfoController', 'kpu-sop-admin-server', 'POST', '文档信息同步文档', '/sopadmin/sopDocInfo/syncDoc', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441552, 632694501413441551, 'SopPermGroupController', 'kpu-sop-admin-server', 'POST', '分组表新增', '/sopadmin/sopPermGroup', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441556, 632694501413441555, 'SopPermGroupController', 'kpu-sop-admin-server', 'PUT', '分组表修改', '/sopadmin/sopPermGroup', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441560, 632694501413441559, 'SopPermGroupController', 'kpu-sop-admin-server', 'DELETE', '分组表删除', '/sopadmin/sopPermGroup', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441966, 632694501413441965, 'SopIsvInfoController', 'kpu-sop-admin-server', 'POST', 'isv信息表新增', '/sopadmin/sopIsvInfo', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441970, 632694501413441969, 'SopIsvInfoController', 'kpu-sop-admin-server', 'PUT', 'isv信息表修改', '/sopadmin/sopIsvInfo', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441974, 632694501413441973, 'SopIsvInfoController', 'kpu-sop-admin-server', 'DELETE', 'isv信息表删除', '/sopadmin/sopIsvInfo', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441978, 632694501413441977, 'SopIsvInfoController', 'kpu-sop-admin-server', 'POST', 'isv信息表createKeys', '/sopadmin/sopIsvInfo/createKeys', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441979, 632694501413441977, 'SopIsvInfoController', 'kpu-sop-admin-server', 'GET', 'isv信息表getKeys', '/sopadmin/sopIsvInfo/getKeys', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441980, 632694501413441977, 'SopIsvInfoController', 'kpu-sop-admin-server', 'POST', 'isv信息表updateKeys', '/sopadmin/sopIsvInfo/updateKeys', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413441990, 632694501413441989, 'SopIsvInfoController', 'kpu-sop-admin-server', 'POST', 'isv信息表examine', '/sopadmin/sopIsvInfo/examine', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413442366, 632694501413441985, 'SopPermGroupController', 'kpu-sop-admin-server', 'GET', '分组表listByGroupId', '/sopadmin/sopPermGroup/listByGroupId', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632694501413442367, 632694501413441985, 'SopPermGroupController', 'kpu-sop-admin-server', 'POST', '分组表updateIsvGroup', '/sopadmin/sopPermGroup/updateIsvGroup', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612173, 625950651139229697, 'SopIsvInfoController', 'kpu-sop-admin-server', 'POST', 'isv信息表openPage', '/sopadmin/sopIsvInfo/open/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612177, 625950651139229700, 'SopPermGroupController', 'kpu-sop-admin-server', 'POST', '分组表批量查询', '/sopadmin/sopPermGroup/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612178, 625950651139229700, 'SopIsvInfoController', 'kpu-sop-admin-server', 'POST', 'isv信息表分页列表查询', '/sopadmin/sopIsvInfo/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612179, 625950651139229700, 'DefTenantController', 'kpu-sop-admin-server', 'POST', '企业批量查询', '/sopadmin/defTenant/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612182, 629222767678781464, 'SopPermGroupController', 'kpu-sop-admin-server', 'POST', '分组表分页列表查询', '/sopadmin/sopPermGroup/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612183, 629222767678781464, 'SopApiInfoController', 'kpu-sop-admin-server', 'POST', '接口信息表根据分组查询接口', '/sopadmin/sopApiInfo/pageByGroup', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612184, 629222767678781464, 'SopApiInfoController', 'kpu-sop-admin-server', 'POST', '接口信息表批量查询', '/sopadmin/sopApiInfo/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612202, 1449734450995789824, 'DefApplicationController', 'kpu-system-server', 'GET', '应用-查询可用的应用资源列表', '/system/defApplication/findAvailableApplicationResourceList', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612203, 1449734450995789824, 'BaseRoleController', 'kpu-base-server', 'GET', '角色-查询角色拥有的资源id集合', '/base/baseRole/resourceList', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612204, 1449734450995789824, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-分页列表查询', '/base/baseRole/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612205, 1449734450995789824, 'BaseRoleController', 'kpu-base-server', 'GET', '角色-查询角色拥有的数据权限ID', '/base/baseRole/findResourceDataScopeIdByRoleId', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612206, 1449734450995789824, 'DefApplicationController', 'kpu-system-server', 'GET', '应用-查询可用的应用数据权限列表', '/system/defApplication/findAvailableApplicationDataScopeList', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612209, 1449738581135327232, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工-分页列表查询', '/base/baseEmployee/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612210, 1449738581135327232, 'BasePositionController', 'kpu-base-server', 'POST', '岗位-批量查询', '/base/basePosition/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612211, 1449738581135327232, 'BaseOrgController', 'kpu-base-server', 'POST', '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612214, 1449739134456299520, 'BasePositionController', 'kpu-base-server', 'POST', '岗位-分页列表查询', '/base/basePosition/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612220, 137848577387921411, 'DefTenantController', 'kpu-system-server', 'POST', '企业-分页列表查询', '/system/defTenant/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612227, 137848577387921413, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-分页列表查询', '/system/defApplication/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612230, 137848577387921414, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-批量查询', '/system/defApplication/query', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612231, 137848577387921414, 'DefResourceController', 'kpu-system-server', 'POST', '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612232, 137848577387921414, 'DefResourceController', 'kpu-system-server', 'GET', '资源-单体查询', '/system/defResource/{id}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612235, 1449391740313141248, 'DefDictController', 'kpu-system-server', 'POST', '字典-分页列表查询', '/system/defDict/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612236, 1449391740313141248, 'DefDictItemController', 'kpu-system-server', 'POST', '字典项-分页列表查询', '/system/defDictItem/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612239, 1448315264151060480, 'DefParameterController', 'kpu-system-server', 'POST', '参数配置-分页列表查询', '/system/defParameter/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612242, 1448315406962917376, 'DefAreaController', 'kpu-system-server', 'POST', '地区表-按树结构查询地区', '/system/defArea/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612245, 1448315861369618432, 'DefClientController', 'kpu-system-server', 'POST', '客户端-分页列表查询', '/system/defClient/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612254, 137848577387921410, 'DefDatasourceConfigController', 'kpu-system-server', 'POST', '数据源-分页列表查询', '/system/defDatasourceConfig/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (632826464283612258, 143911967403278342, 'DefDictItemController', 'kpu-system-server', 'ALL', '字典项全称', '/system/defDictItem/**', b'1', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (635833224858718816, 632694501413441748, 'SopPermGroupPermissionController', 'kpu-sop-admin-server', 'POST', '组权限表新增', '/sopadmin/sopPermGroupPermission', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (635833224858718817, 632694501413441748, 'SopApiInfoController', 'kpu-sop-admin-server', 'POST', '接口信息表分页列表查询', '/sopadmin/sopApiInfo/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (635833224858718818, 632694501413441748, 'SopPermGroupPermissionController', 'kpu-boot-server-datasource', 'POST', '组权限表delete', '/sopadmin/sopPermGroupPermission/delete', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (646417188212236295, 632566992424356926, 'SopIsvInfoController', 'kpu-sop-admin-server', 'POST', 'isv信息表submit', '/sopadmin/sopIsvInfo/open/submit', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (646417188212236296, 632566992424356926, 'SopIsvInfoController', 'kpu-boot-server-datasource', 'PUT', 'isv信息表update', '/sopadmin/sopIsvInfo/open/update', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (662630960337663005, 662630960337663004, 'DefUserController', 'kpu-boot-server-datasource', 'POST', '用户导出Excel', '/system/defUser/export', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (662630960337663006, 662630960337663004, 'DefUserController', 'kpu-boot-server-datasource', 'POST', '用户导入Excel', '/system/defUser/import', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (701591557867618315, 701591557867618314, 'DefResourceController', 'kpu-boot-server-datasource', 'POST', '资源清理指定应用下的资源缓存', '/system/defResource/clearCache', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (712712237514300418, 712672045210342580, 'SopHelpDocController', 'kpu-boot-sop-server-datasource', 'POST', '帮助内容表按树结构查询', '/sopadmin/sopHelpDoc/tree', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (712712237514300419, 712672045210342580, 'SopHelpDocController', 'kpu-boot-sop-server-datasource', 'GET', '帮助内容表单体查询', '/sopadmin/sopHelpDoc/{id:[0-9]+}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (712712237514300428, 712712237514300427, 'SopNotifyInfoController', 'kpu-boot-sop-server-datasource', 'POST', '回调信息update', '/sopadmin/sopNotifyInfo/push', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (712712237514300432, 712712237514300431, 'SopNotifyInfoController', 'kpu-boot-sop-server-datasource', 'POST', '回调信息end', '/sopadmin/sopNotifyInfo/end', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (712712237514300623, 712672045210342575, 'SopNotifyInfoController', 'kpu-boot-sop-server-datasource', 'POST', '回调信息分页列表查询', '/sopadmin/sopNotifyInfo/page', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (712712237514300866, 712712237514300423, 'SopHelpDocController', 'kpu-boot-sop-server-datasource', 'GET', '帮助内容表单体查询', '/sopadmin/sopHelpDoc/{id:[0-9]+}', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (712712237514300867, 712712237514300423, 'SopHelpDocController', 'kpu-boot-sop-server-datasource', 'POST', '帮助内容表新增', '/sopadmin/sopHelpDoc', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (712712237514300868, 712712237514300423, 'SopHelpDocController', 'kpu-boot-sop-server-datasource', 'PUT', '帮助内容表修改', '/sopadmin/sopHelpDoc', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_resource_api` VALUES (712712237514300872, 712712237514300871, 'SopHelpDocController', 'kpu-boot-sop-server-datasource', 'DELETE', '帮助内容表删除', '/sopadmin/sopHelpDoc', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_tenant
-- ----------------------------
DROP TABLE IF EXISTS `def_tenant`;
CREATE TABLE `def_tenant`  (
  `id` bigint NOT NULL COMMENT '主键ID',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '企业编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业名称',
  `abbreviation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '企业简称',
  `credit_code` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '统一社会信用代码',
  `contact_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人',
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系方式',
  `contact_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系邮箱',
  `province_id` bigint NULL DEFAULT NULL COMMENT '省',
  `province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '省',
  `city_id` bigint NULL DEFAULT NULL COMMENT '市',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '市',
  `district_id` bigint NULL DEFAULT NULL COMMENT '区',
  `district_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '详细地址',
  `register_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'CREATE' COMMENT '类型;#{CREATE:创建;REGISTER:注册}',
  `connect_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM' COMMENT '数据源链接类型;#TenantConnectTypeEnum{SYSTEM:系统内置数据源;CUSTOM:自定义数据源}',
  `classify` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '分类',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态;0-禁用 1-启用',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '10' COMMENT '审核状态;[05-正常 10-待初始化结构 15-待初始化数据源 20-已撤回 25-待审核 30-已拒绝 35-已同意]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.TENANT_STATUS)',
  `review_comments` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '审核意见',
  `readonly_` bit(1) NULL DEFAULT b'0' COMMENT '内置',
  `expiration_time` datetime NULL DEFAULT NULL COMMENT '有效期;\n为空表示永久',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '企业简介',
  `created_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人姓名',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_tenant
-- ----------------------------
INSERT INTO `def_tenant` VALUES (1, '0000', 'kpu集团', '内置开发者所在企业', '代码', 'lmx', '18888888888', 'lmx@163.com', 162862591473876992, NULL, 162862591473876993, NULL, 162862591473876995, NULL, '北京路', 'CREATE', 'SYSTEM', NULL, b'1', '05', NULL, b'0', NULL, '企业介绍', '最后', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2);

-- ----------------------------
-- Table structure for def_tenant_application_record
-- ----------------------------
DROP TABLE IF EXISTS `def_tenant_application_record`;
CREATE TABLE `def_tenant_application_record`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `tenant_application_rel_id` bigint NOT NULL COMMENT '授权ID',
  `tenant_id` bigint NOT NULL COMMENT '企业ID',
  `application_id` bigint NOT NULL COMMENT '应用ID',
  `application_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '应用名称',
  `tenant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '企业名称',
  `operate_by_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人姓名',
  `grant_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '授权类型;[10-应用授权 20-应用续期 30-取消授权] @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.APPLICATION_GRANT_TYPE)',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户应用授权记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_tenant_application_record
-- ----------------------------

-- ----------------------------
-- Table structure for def_tenant_application_rel
-- ----------------------------
DROP TABLE IF EXISTS `def_tenant_application_rel`;
CREATE TABLE `def_tenant_application_rel`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `application_id` bigint NOT NULL COMMENT '应用ID',
  `expiration_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tar_tenant_application`(`tenant_id` ASC, `application_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户的应用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_tenant_application_rel
-- ----------------------------
INSERT INTO `def_tenant_application_rel` VALUES (588459714119084389, 1, 1, NULL, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_application_rel` VALUES (588459714119084390, 1, 2, NULL, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_tenant_ds_c_rel
-- ----------------------------
DROP TABLE IF EXISTS `def_tenant_ds_c_rel`;
CREATE TABLE `def_tenant_ds_c_rel`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `tenant_id` bigint NOT NULL COMMENT '租户id',
  `datasource_config_id` bigint NOT NULL COMMENT '数据源id',
  `db_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据源前缀',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tdscr_ten_dsc_app`(`tenant_id` ASC, `datasource_config_id` ASC, `db_prefix` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户的数据源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_tenant_ds_c_rel
-- ----------------------------

-- ----------------------------
-- Table structure for def_tenant_resource_rel
-- ----------------------------
DROP TABLE IF EXISTS `def_tenant_resource_rel`;
CREATE TABLE `def_tenant_resource_rel`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `resource_id` bigint NOT NULL COMMENT '资源ID',
  `application_id` bigint NOT NULL COMMENT '应用Id',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_trl_tenant_resource`(`tenant_id` ASC, `application_id` ASC, `resource_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户的资源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_tenant_resource_rel
-- ----------------------------
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281018, 1449732868459724800, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281019, 1457601147127726080, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281020, 1457602393330941952, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281021, 1449733521265393664, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281022, 1449733787893104640, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281023, 1460468030063509504, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281024, 1460537476991942656, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281025, 1449734007292952576, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281026, 1460436763976663040, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281027, 1460436856054218752, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281028, 1460436934051495936, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281029, 1460537873248813056, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281030, 179582070228516864, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281031, 179582070228516866, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281032, 179582070228516867, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281033, 179582070228516868, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281034, 179582070228516869, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281035, 179582070228516865, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281036, 179582070228516870, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281037, 244034011624636417, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281038, 253596752014213210, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281039, 253596752014213212, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281040, 253596752014213214, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281041, 1449732267470487552, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281042, 1449738581135327232, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281043, 1457620408604819456, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281044, 1457620470995091456, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281045, 1457620528469639168, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281046, 1457620585302458368, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281047, 1461609523809615872, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281048, 199848844077301779, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281049, 244177274553761796, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281050, 1449738119237599232, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281051, 1457665587088982016, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281052, 1457665635705159680, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281053, 1457665696765837312, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281054, 1457665749857337344, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281055, 289400372487783095, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281056, 1449739134456299520, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281057, 1457665354649042944, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281058, 1457665399683284992, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281059, 1457665444381982720, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281060, 1457665503664275456, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281061, 144313439471271936, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281062, 144313439471271937, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281063, 144313439471271938, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281064, 144313439471271939, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281065, 144313439471271940, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281066, 1457671975706034176, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281067, 1449730763980275712, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281068, 1449730828442533888, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281069, 1449730881009745920, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281070, 1449731618892677120, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281071, 1460538387822804992, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281072, 1460538432919961600, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281073, 1460538485118074880, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281074, 1460538532253663232, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281075, 144313439471271947, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281076, 1449734450995789824, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281077, 1457668537614073856, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281078, 1457668602952941568, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281079, 1457668655000059904, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281080, 1457668749124435968, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281081, 1457668844297388032, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281082, 1449734944434683904, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281083, 1460538960118808576, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281084, 1460539047851065344, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281085, 1449735103088427008, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281086, 1460540557393657856, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281087, 1460540612146102272, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281088, 625950651139229697, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281089, 632566992424356922, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281090, 632566992424356926, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281091, 632566992424356931, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281092, 625950651139229698, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281093, 625950651139229696, 1, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281097, 137848577387921408, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281098, 137848577387921410, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281099, 1460541171116802048, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281100, 1460541225001025536, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281101, 1460541409667842048, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281102, 1460541584536764416, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281103, 137848577387921411, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281104, 1461615207515160576, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281105, 199848844077301787, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281106, 1460541814825025536, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281107, 1460541863848050688, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281108, 1460541913261146112, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281109, 1460542054323978240, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281110, 1460542155125686272, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281111, 1460542227817168896, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281112, 1460542416003006464, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281113, 137848577387921412, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281114, 1460542581971615744, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281115, 1460542629845401600, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281116, 1460542675554926592, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281117, 1460543317040168960, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281118, 160561957882036227, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281119, 662630960337663004, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281120, 137848577387921409, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281121, 137848577387921413, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281122, 137848577387921417, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281123, 137848577387921418, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281124, 137848577387921419, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281125, 137848577387921420, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281126, 137848577387921421, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281127, 137848577387921422, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281128, 1460547251804831744, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281129, 1460547377491345408, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281130, 281886056620490972, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281131, 137848577387921414, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281132, 139496646533709824, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281133, 139702946697838592, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281134, 139702946697838593, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281135, 281886056620490965, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281136, 701591557867618314, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281137, 137848577387921415, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281138, 140154107242479616, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281139, 140154107242479618, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281140, 140154107242479617, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281141, 137848577387921416, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281142, 143911967403278336, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281143, 1449391740313141248, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281144, 1449723704727568384, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281145, 1449723831227777024, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281146, 1449723907798990848, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281147, 1449724021556903936, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281148, 1449724119569399808, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281149, 1449724196207722496, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281150, 143911967403278337, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281151, 143911967403278338, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281152, 143911967403278339, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281153, 143911967403278340, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281154, 143911967403278341, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281155, 143911967403278342, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281156, 143911967403278343, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281157, 143911967403278344, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281158, 143911967403278345, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281159, 143911967403278346, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281160, 215458769570627596, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281161, 215458769570627601, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281162, 215458769570627602, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281163, 215458769570627603, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281164, 215458769570627604, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281165, 1448315264151060480, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281166, 1460547739937931264, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281167, 1460547794912673792, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281168, 1460547848918532096, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281169, 1460547893147467776, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281170, 1448315406962917376, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281171, 1460547974479216640, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281172, 1460548071271170048, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281173, 1460548273847664640, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281174, 1448315861369618432, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281175, 1460548462427766784, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281176, 1460548519843594240, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281177, 1460548553880371200, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281178, 1460548589812973568, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281179, 1459061181095346176, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281180, 1460548658754748416, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281181, 1460548689041817600, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281182, 172353511420329984, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281183, 172353511420329986, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281184, 172353511420329987, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281185, 172353511420329988, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281186, 172353511420329989, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281187, 528754428833486865, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281188, 528767537073677314, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281189, 528767537073677316, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281190, 160833820721938437, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281191, 198310764748996608, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281192, 198310764748996609, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281193, 201343651610099712, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281194, 207644798130061318, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281195, 207644798130061323, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281196, 207644798130061325, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281197, 207592996529504364, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281198, 207592996529504370, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281199, 207644798130061312, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281200, 207644798130061314, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281201, 206499429136465920, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281202, 207209017863307264, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281203, 207209017863307265, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281204, 207209017863307266, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281205, 207209017863307267, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281206, 242181583639937024, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281207, 160833820721938438, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281208, 160833820721938439, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281209, 160833820721938440, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281210, 160833820721938441, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281211, 242152648445263888, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281212, 242152648445263893, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281213, 242152648445263898, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281214, 242300348075606021, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281215, 249954310509559808, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281216, 249954310509559809, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281217, 249954310509559812, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281218, 250025856074776576, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281219, 250025856074776577, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281220, 250025856074776578, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281221, 250025856074776579, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281222, 249954310509559810, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281223, 249954310509559813, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281224, 250025856074776581, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281225, 250025856074776580, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281226, 249954310509559811, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281227, 250025856074776582, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281228, 250025856074776583, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281229, 250025856074776584, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281230, 393222543919799296, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281231, 625950651139229699, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281232, 629222767678781445, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281233, 632566992424357166, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281234, 632566992424357170, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281235, 629222767678781459, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281236, 632566992424357381, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281237, 632566992424357385, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281238, 632566992424357389, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281239, 625950651139229701, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281240, 632566992424357626, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281241, 632566992424357631, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281242, 632566992424357635, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281243, 632566992424357639, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281244, 625950651139229700, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281245, 632694501413441965, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281246, 632694501413441969, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281247, 632694501413441973, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281248, 632694501413441977, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281249, 632694501413441985, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281250, 632694501413441989, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281251, 712672045210342580, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281252, 712712237514300423, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281253, 712712237514300871, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281254, 629222767678781464, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281255, 632694501413441551, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281256, 632694501413441555, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281257, 632694501413441559, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281258, 632694501413441748, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281259, 712672045210342575, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281260, 712712237514300427, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281261, 712712237514300431, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281262, 712839991315310592, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281263, 160833820721938442, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281264, 160833820721938444, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281265, 160833820721938446, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281266, 160833820721938445, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_tenant_resource_rel` VALUES (820219864546281267, 160833820721938443, 2, 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_user
-- ----------------------------
DROP TABLE IF EXISTS `def_user`;
CREATE TABLE `def_user`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名;大小写数字下划线',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机;1开头11位纯数字',
  `id_card` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '身份证;15或18位',
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '微信OpenId',
  `dd_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '钉钉OpenId',
  `readonly` bit(1) NOT NULL DEFAULT b'0' COMMENT '内置;[0-否 1-是]',
  `nation` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '民族;[01-汉族 99-其他]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.NATION)',
  `education` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '学历;[01-小学 02-中学 03-高中 04-专科 05-本科 06-硕士 07-博士 08-博士后 99-其他]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.EDUCATION)',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '性别;[1-男 2-女 3-未知]\n@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.SEX)',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态;[0-禁用 1-启用]',
  `work_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '工作描述',
  `password_error_last_time` datetime NULL DEFAULT NULL COMMENT '输错密码时间',
  `password_error_num` int NULL DEFAULT 0 COMMENT '密码错误次数',
  `password_expire_time` datetime NULL DEFAULT NULL COMMENT '密码过期时间',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `uk_user_mobile`(`mobile` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_user
-- ----------------------------
INSERT INTO `def_user` VALUES (1, 'superAdmin', '超管', NULL, '13000000000', NULL, NULL, NULL, b'0', '01', '02', '1', b'1', '', NULL, 0, NULL, 'd3cf98806ab5ea6094bdfaa8d321b3e86142c7cd9032e333fb79eb8ab4f326aa', 'd0OAyArl0f0X9594rfQU', '2025-01-01 00:00:00', 0, '2025-01-01 00:00:00', 0, '2025-01-01 00:00:00');
INSERT INTO `def_user` VALUES (2, 'admin', '内置超管', 'admin@qq.com', '15211111111', NULL, NULL, NULL, b'0', '04', '02', '1', b'1', '老子今天不上班，爽翻，巴适得板。', NULL, 0, NULL, 'd3cf98806ab5ea6094bdfaa8d321b3e86142c7cd9032e333fb79eb8ab4f326aa', 'd0OAyArl0f0X9594rfQU', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_user` VALUES (442312581298783074, 'test1', '门店管理员', NULL, '15211111112', NULL, '', '', b'0', '02', '02', '1', b'1', '', NULL, 0, NULL, 'd3cf98806ab5ea6094bdfaa8d321b3e86142c7cd9032e333fb79eb8ab4f326aa', 'd0OAyArl0f0X9594rfQU', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_user_application
-- ----------------------------
DROP TABLE IF EXISTS `def_user_application`;
CREATE TABLE `def_user_application`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT '所属用户ID',
  `application_id` bigint NOT NULL COMMENT '所属应用ID',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户的默认应用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_user_application
-- ----------------------------
INSERT INTO `def_user_application` VALUES (199848844077301775, 1, 2, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for def_user_tenant_rel
-- ----------------------------
DROP TABLE IF EXISTS `def_user_tenant_rel`;
CREATE TABLE `def_user_tenant_rel`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `is_default` bit(1) NULL DEFAULT b'0' COMMENT '默认员工',
  `user_id` bigint NOT NULL COMMENT '用户',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态',
  `tenant_id` bigint NOT NULL COMMENT '所属企业',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_utr_user_tenant`(`user_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of def_user_tenant_rel
-- ----------------------------
INSERT INTO `def_user_tenant_rel` VALUES (339843960220418056, b'1', 1, b'1', 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');
INSERT INTO `def_user_tenant_rel` VALUES (543809234108564219, b'0', 2, b'1', 1, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00');

-- ----------------------------
-- Table structure for sop_api_info
-- ----------------------------
DROP TABLE IF EXISTS `sop_api_info`;
CREATE TABLE `sop_api_info`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `application` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `api_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接口名称',
  `api_version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1.0' COMMENT '版本号',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '接口描述',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `interface_class_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接口class',
  `method_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '方法名称',
  `param_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数信息',
  `is_permission` tinyint NOT NULL DEFAULT 0 COMMENT '接口是否需要授权访问',
  `is_need_token` tinyint NOT NULL DEFAULT 0 COMMENT '是否需要appAuthToken',
  `has_common_response` tinyint NULL DEFAULT 1 COMMENT '是否有公共响应参数',
  `reg_source` tinyint NOT NULL DEFAULT 1 COMMENT '注册来源\n[1-系统注册 2-手动注册]',
  `api_mode` tinyint NULL DEFAULT 1 COMMENT '接口模式\n[1-open接口 2-Restful模式]',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态\n[1-启用 0-禁用]',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_apiname_version`(`api_name` ASC, `api_version` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_api_info
-- ----------------------------

-- ----------------------------
-- Table structure for sop_doc_app
-- ----------------------------
DROP TABLE IF EXISTS `sop_doc_app`;
CREATE TABLE `sop_doc_app`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Torna应用token',
  `is_publish` tinyint NULL DEFAULT 0 COMMENT '是否发布',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档应用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_doc_app
-- ----------------------------
INSERT INTO `sop_doc_app` VALUES (819414021307381760, 'kpu-openapi', 'a51646632973456cbff1f5b8b4c23819', 1, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);

-- ----------------------------
-- Table structure for sop_doc_content
-- ----------------------------
DROP TABLE IF EXISTS `sop_doc_content`;
CREATE TABLE `sop_doc_content`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `doc_info_id` bigint NOT NULL DEFAULT 0 COMMENT '文档ID\ndoc_info.id',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文档内容',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_doc_info_id`(`doc_info_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档内容' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_doc_content
-- ----------------------------
INSERT INTO `sop_doc_content` VALUES (819414021307381770, 819414021307381761, '{\"children\":[],\"contentType\":\"\",\"description\":\"\",\"docName\":\"演示 - 支付接口\",\"docTitle\":\"演示 - 支付接口\",\"errorCodeParams\":[],\"globalHeaders\":[],\"globalParams\":[],\"globalReturns\":[],\"gmtCreate\":\"2026-10-02 06:17:28\",\"gmtModified\":\"2026-10-02 06:17:28\",\"headerParams\":[],\"headerParamsRaw\":[],\"httpMethod\":\"\",\"id\":120,\"isFolder\":1,\"name\":\"演示 - 支付接口\",\"parentId\":0,\"pathParams\":[],\"queryParams\":[],\"requestParams\":[],\"responseParams\":[],\"url\":\"\",\"version\":\"\"}', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_content` VALUES (819414021307381771, 819414021307381762, '{\"children\":[],\"contentType\":\"\",\"description\":\"该接口是页面跳转接口，用于生成用户访问跳转链接。\\n请在服务端执行SDK中pageExecute方法，读取响应中的body()结果。\\n该结果用于跳转到页面，返回到用户浏览器渲染或重定向跳转到页面。\\n具体使用方法请参考 <a href=\\\"https://torna.cn\\\" target=\\\"_blank\\\">接入指南</a>\",\"docName\":\"手机网站支付接口\",\"docTitle\":\"手机网站支付接口\",\"errorCodeParams\":[],\"globalHeaders\":[],\"globalParams\":[],\"globalReturns\":[],\"gmtCreate\":\"2026-10-02 06:17:28\",\"gmtModified\":\"2026-10-02 06:17:28\",\"headerParams\":[],\"headerParamsRaw\":[],\"httpMethod\":\"\",\"id\":121,\"isFolder\":0,\"name\":\"手机网站支付接口\",\"parentId\":120,\"pathParams\":[],\"queryParams\":[],\"requestParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商户网站唯一订单号\",\"docId\":121,\"enumId\":0,\"example\":\"70501111111S001111119\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:28\",\"gmtModified\":\"2026-10-02 06:17:28\",\"id\":814,\"maxLength\":\"64\",\"modifierName\":\"Lmx\",\"name\":\"outTradeNo\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"订单总金额.单位为元，精确到小数点后两位，取值范围：[0.01,100000000]\",\"docId\":121,\"enumId\":0,\"example\":\"9.00\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:28\",\"gmtModified\":\"2026-10-02 06:17:28\",\"id\":815,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"totalAmount\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"BigDecimal\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"订单标题。注意：不可使用特殊字符，如 /，=，& 等。\",\"docId\":121,\"enumId\":0,\"example\":\"大乐透\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":816,\"maxLength\":\"256\",\"modifierName\":\"Lmx\",\"name\":\"subject\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"销售产品码，商家和支付平台签约的产品码。手机网站支付为：QUICK_WAP_WAY\",\"docId\":121,\"enumId\":0,\"example\":\"QUICK_WAP_WAY\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":817,\"maxLength\":\"64\",\"modifierName\":\"Lmx\",\"name\":\"productCode\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"针对用户授权接口，获取用户相关数据时，用于标识用户授权关系\",\"docId\":121,\"enumId\":0,\"example\":\"appopenBb64d181d0146481ab6a762c00714cC27\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":818,\"maxLength\":\"40\",\"modifierName\":\"Lmx\",\"name\":\"authToken\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"用户付款中途退出返回商户网站的地址\",\"docId\":121,\"enumId\":0,\"example\":\"http://www.taobao.com/product/113714.html\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":819,\"maxLength\":\"400\",\"modifierName\":\"Lmx\",\"name\":\"quit_url\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商品的编号\",\"docId\":121,\"enumId\":0,\"example\":\"apple-01\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":821,\"maxLength\":\"64\",\"modifierName\":\"Lmx\",\"name\":\"goodsId\",\"parentId\":820,\"require\":false,\"required\":1,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商品名称\",\"docId\":121,\"enumId\":0,\"example\":\"ipad\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":822,\"maxLength\":\"256\",\"modifierName\":\"Lmx\",\"name\":\"goodsName\",\"parentId\":820,\"require\":false,\"required\":1,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商品数量\",\"docId\":121,\"enumId\":0,\"example\":\"1\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":823,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"quantity\",\"parentId\":820,\"require\":false,\"required\":1,\"type\":\"Integer\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商品单价，单位为元\",\"docId\":121,\"enumId\":0,\"example\":\"2000\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":824,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"price\",\"parentId\":820,\"require\":false,\"required\":1,\"type\":\"BigDecimal\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"支付平台定义的统一商品编号\",\"docId\":121,\"enumId\":0,\"example\":\"20010001\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":825,\"maxLength\":\"32\",\"modifierName\":\"Lmx\",\"name\":\"alipayGoodsId\",\"parentId\":820,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商品类目\",\"docId\":121,\"enumId\":0,\"example\":\"34543238\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":826,\"maxLength\":\"24\",\"modifierName\":\"Lmx\",\"name\":\"goodsCategory\",\"parentId\":820,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商品类目树，从商品类目根节点到叶子节点的类目id组成，类目id值使用|分割\",\"docId\":121,\"enumId\":0,\"example\":\"124868003|126232002|126252004\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":827,\"maxLength\":\"128\",\"modifierName\":\"Lmx\",\"name\":\"categoriesTree\",\"parentId\":820,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商品描述信息\",\"docId\":121,\"enumId\":0,\"example\":\"特价手机\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":828,\"maxLength\":\"1000\",\"modifierName\":\"Lmx\",\"name\":\"body\",\"parentId\":820,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商品的展示地址\",\"docId\":121,\"enumId\":0,\"example\":\"http://www.alipay.com/xxx.jpg\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":829,\"maxLength\":\"400\",\"modifierName\":\"Lmx\",\"name\":\"showUrl\",\"parentId\":820,\"require\":false,\"required\":0,\"type\":\"String\"}],\"creatorName\":\"Lmx\",\"description\":\"订单包含的商品列表信息，json格式，其它说明详见商品明细说明\",\"docId\":121,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":820,\"maxLength\":\"\",\"modifierName\":\"Lmx\",\"name\":\"goodsDetail\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"List<PayTradeWapPayRequest$GoodsDetail>\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"绝对超时时间，格式为yyyy-MM-dd HH:mm:ss。超时时间范围：1m~15d。\",\"docId\":121,\"enumId\":0,\"example\":\"2016-12-31 10:05:00\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":830,\"maxLength\":\"32\",\"modifierName\":\"Lmx\",\"name\":\"timeExpire\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商户传入业务信息，具体值要和支付平台约定，应用于安全，营销等参数直传场景，格式为json格式\",\"docId\":121,\"enumId\":0,\"example\":\"{mc_create_trade_ip:127.0.0.1}\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":831,\"maxLength\":\"512\",\"modifierName\":\"Lmx\",\"name\":\"businessParams\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"公用回传参数，如果请求时传递了该参数，则返回给商户时会回传该参数。支付平台只会在同步返回（包括跳转回商户网站）和异步通知时将该参数原样返回。本参数必须进行UrlEncode之后才可以发送给支付平台。\",\"docId\":121,\"enumId\":0,\"example\":\"merchantBizType%3d3C%26merchantBizNo%3d2016010101111\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":832,\"maxLength\":\"512\",\"modifierName\":\"Lmx\",\"name\":\"passbackParams\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"商户原始订单号，最大长度限制32位\",\"docId\":121,\"enumId\":0,\"example\":\"{mc_create_trade_ip:127.0.0.1}\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":833,\"maxLength\":\"32\",\"modifierName\":\"Lmx\",\"name\":\"merchantOrderNo\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"}],\"responseParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"用于跳转支付平台页面的信息，POST和GET方法生成内容不同：使用POST方法执行，结果为html form表单，在浏览器渲染即可<br>使用GET方法会得到支付平台URL，需要打开或重定向到该URL。建议使用POST方式。\",\"docId\":121,\"enumId\":0,\"example\":\"请参考响应示例\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":834,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"pageRedirectionData\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"}],\"url\":\"openapi.wap.pay\",\"version\":\"1.0\"}', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_content` VALUES (819414021307381772, 819414021307381763, '{\"children\":[],\"contentType\":\"\",\"description\":\"根据id，查询本租户下的员工数据\",\"docName\":\"查询员工\",\"docTitle\":\"查询员工\",\"errorCodeParams\":[],\"globalHeaders\":[],\"globalParams\":[],\"globalReturns\":[],\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"headerParams\":[],\"headerParamsRaw\":[],\"httpMethod\":\"\",\"id\":124,\"isFolder\":0,\"name\":\"查询员工\",\"parentId\":123,\"pathParams\":[],\"queryParams\":[],\"requestParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"员工id\",\"docId\":124,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":841,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"id\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"名称\",\"docId\":124,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":842,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"name\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"}],\"responseParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":843,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"id\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"object\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"yyyy-MM-dd HH:mm:ss\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":844,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"createdTime\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"LocalDateTime\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":845,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"createdBy\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"object\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"yyyy-MM-dd HH:mm:ss\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":846,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"updatedTime\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"LocalDateTime\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":847,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"updatedBy\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"object\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"true\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":848,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"isDefault\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Boolean\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":849,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"userId\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":850,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"lastCompanyId\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":851,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"lastDeptId\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":852,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"positionId\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":853,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"realName\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":854,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"positionStatus\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":855,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"activeStatus\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"true\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":856,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"state\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Boolean\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":124,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":857,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"createdOrgId\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Long\"}],\"url\":\"openapi.employee.get\",\"version\":\"1.0\"}', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_content` VALUES (819414021307381773, 819414021307381764, '{\"children\":[],\"contentType\":\"\",\"description\":\"订单查询接口\",\"docName\":\"订单查询接口\",\"docTitle\":\"订单查询接口\",\"errorCodeParams\":[],\"globalHeaders\":[],\"globalParams\":[],\"globalReturns\":[],\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"headerParams\":[],\"headerParamsRaw\":[],\"httpMethod\":\"\",\"id\":122,\"isFolder\":0,\"name\":\"订单查询接口\",\"parentId\":120,\"pathParams\":[],\"queryParams\":[],\"requestParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"订单编号\",\"docId\":122,\"enumId\":0,\"example\":\"xxxx\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":835,\"maxLength\":\"64\",\"modifierName\":\"Lmx\",\"name\":\"orderNo\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"}],\"responseParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"订单编号\",\"docId\":122,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":836,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"orderNo\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"支付编号\",\"docId\":122,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":837,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"payNo\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"支付人id\",\"docId\":122,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":838,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"payUserId\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"支付人姓名\",\"docId\":122,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":839,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"payUserName\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"备注\",\"docId\":122,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":840,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"remark\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"}],\"url\":\"openapi.order.search\",\"version\":\"1.0\"}', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_content` VALUES (819414021307381774, 819414021307381765, '{\"children\":[],\"contentType\":\"\",\"description\":\"\",\"docName\":\"演示 - 查询租户下的数据\",\"docTitle\":\"演示 - 查询租户下的数据\",\"errorCodeParams\":[],\"globalHeaders\":[],\"globalParams\":[],\"globalReturns\":[],\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"headerParams\":[],\"headerParamsRaw\":[],\"httpMethod\":\"\",\"id\":123,\"isFolder\":1,\"name\":\"演示 - 查询租户下的数据\",\"parentId\":0,\"pathParams\":[],\"queryParams\":[],\"requestParams\":[],\"responseParams\":[],\"url\":\"\",\"version\":\"\"}', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_content` VALUES (819414021307381775, 819414021307381766, '{\"children\":[],\"contentType\":\"\",\"description\":\"演示单文件上传\",\"docName\":\"演示单文件上传\",\"docTitle\":\"演示单文件上传\",\"errorCodeParams\":[],\"globalHeaders\":[],\"globalParams\":[],\"globalReturns\":[],\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"headerParams\":[],\"headerParamsRaw\":[],\"httpMethod\":\"\",\"id\":125,\"isFolder\":0,\"name\":\"演示单文件上传\",\"parentId\":123,\"pathParams\":[],\"queryParams\":[],\"requestParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"产品名称\",\"docId\":125,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":858,\"maxLength\":\"64\",\"modifierName\":\"Lmx\",\"name\":\"productName\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"添加时间\",\"docId\":125,\"enumId\":0,\"example\":\"yyyy-MM-dd HH:mm:ss\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":859,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"addTime\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"Date\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回表单字段名\",\"docId\":125,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":860,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"name\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件原始名称.\",\"docId\":125,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":861,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"originalFilename\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件Content type,没有指定返回null\",\"docId\":125,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":862,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"contentType\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"文件内容是否为空\",\"docId\":125,\"enumId\":0,\"example\":\"true\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":863,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"empty\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"boolean\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件内容大小单位byte,没有返回0\",\"docId\":125,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":864,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"size\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文字字节内容\",\"docId\":125,\"enumId\":0,\"example\":\",\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":865,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"bytes\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"byte[]\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件流\",\"docId\":125,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":866,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"inputStream\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"InputStream\"}],\"responseParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":125,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":867,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"id\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Integer\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":125,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":868,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"name\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":125,\"enumId\":0,\"example\":\"yyyy-MM-dd HH:mm:ss\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":869,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"addTime\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Date\"}],\"url\":\"openapi.upload\",\"version\":\"1.0\"}', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_content` VALUES (819414021307381776, 819414021307381767, '{\"children\":[],\"contentType\":\"\",\"description\":\"演示多文件上传\",\"docName\":\"演示多文件上传\",\"docTitle\":\"演示多文件上传\",\"errorCodeParams\":[],\"globalHeaders\":[],\"globalParams\":[],\"globalReturns\":[],\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"headerParams\":[],\"headerParamsRaw\":[],\"httpMethod\":\"\",\"id\":126,\"isFolder\":0,\"name\":\"演示多文件上传\",\"parentId\":123,\"pathParams\":[],\"queryParams\":[],\"requestParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"产品名称\",\"docId\":126,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":870,\"maxLength\":\"64\",\"modifierName\":\"Lmx\",\"name\":\"productName\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"添加时间\",\"docId\":126,\"enumId\":0,\"example\":\"yyyy-MM-dd HH:mm:ss\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":871,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"addTime\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"Date\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回表单字段名\",\"docId\":126,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":872,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"name\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件原始名称.\",\"docId\":126,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":873,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"originalFilename\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件Content type,没有指定返回null\",\"docId\":126,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":874,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"contentType\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"文件内容是否为空\",\"docId\":126,\"enumId\":0,\"example\":\"true\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":875,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"empty\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"boolean\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件内容大小单位byte,没有返回0\",\"docId\":126,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":876,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"size\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文字字节内容\",\"docId\":126,\"enumId\":0,\"example\":\",\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":877,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"bytes\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"byte[]\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件流\",\"docId\":126,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":878,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"inputStream\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"InputStream\"}],\"responseParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":126,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":886,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"id\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Integer\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":126,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":887,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"name\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":126,\"enumId\":0,\"example\":\"yyyy-MM-dd HH:mm:ss\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":888,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"addTime\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Date\"}],\"url\":\"openapi.upload.more\",\"version\":\"1.0\"}', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_content` VALUES (819414021307381777, 819414021307381768, '{\"children\":[],\"contentType\":\"\",\"description\":\"演示多文件上传2\",\"docName\":\"演示多文件上传2\",\"docTitle\":\"演示多文件上传2\",\"errorCodeParams\":[],\"globalHeaders\":[],\"globalParams\":[],\"globalReturns\":[],\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"headerParams\":[],\"headerParamsRaw\":[],\"httpMethod\":\"\",\"id\":127,\"isFolder\":0,\"name\":\"演示多文件上传2\",\"parentId\":123,\"pathParams\":[],\"queryParams\":[],\"requestParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"产品名称\",\"docId\":127,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":889,\"maxLength\":\"64\",\"modifierName\":\"Lmx\",\"name\":\"productName\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"添加时间\",\"docId\":127,\"enumId\":0,\"example\":\"yyyy-MM-dd HH:mm:ss\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":890,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"addTime\",\"parentId\":0,\"require\":false,\"required\":1,\"type\":\"Date\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回表单字段名\",\"docId\":127,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":891,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"name\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件原始名称.\",\"docId\":127,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":892,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"originalFilename\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件Content type,没有指定返回null\",\"docId\":127,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":893,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"contentType\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"文件内容是否为空\",\"docId\":127,\"enumId\":0,\"example\":\"true\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":894,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"empty\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"boolean\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件内容大小单位byte,没有返回0\",\"docId\":127,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":895,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"size\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文字字节内容\",\"docId\":127,\"enumId\":0,\"example\":\",\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":896,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"bytes\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"byte[]\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件流\",\"docId\":127,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":897,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"inputStream\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"InputStream\"}],\"responseParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":127,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":898,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"id\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Integer\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":127,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":899,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"name\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"No comments found.\",\"docId\":127,\"enumId\":0,\"example\":\"yyyy-MM-dd HH:mm:ss\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":900,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"addTime\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Date\"}],\"url\":\"openapi.upload.list\",\"version\":\"1.0\"}', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_content` VALUES (819414021307381778, 819414021307381769, '{\"children\":[],\"contentType\":\"\",\"description\":\"下载\",\"docName\":\"下载\",\"docTitle\":\"下载\",\"errorCodeParams\":[],\"globalHeaders\":[],\"globalParams\":[],\"globalReturns\":[],\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"headerParams\":[],\"headerParamsRaw\":[],\"httpMethod\":\"\",\"id\":128,\"isFolder\":0,\"name\":\"下载\",\"parentId\":123,\"pathParams\":[],\"queryParams\":[],\"requestParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"业务参数\",\"docId\":128,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":901,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"id\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"Integer\"}],\"responseParams\":[{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回表单字段名\",\"docId\":128,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":902,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"name\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件原始名称.\",\"docId\":128,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":903,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"originalFilename\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件Content type,没有指定返回null\",\"docId\":128,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":904,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"contentType\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"String\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"文件内容是否为空\",\"docId\":128,\"enumId\":0,\"example\":\"true\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":905,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"empty\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"boolean\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件内容大小单位byte,没有返回0\",\"docId\":128,\"enumId\":0,\"example\":\"0\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":906,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"size\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"long\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文字字节内容\",\"docId\":128,\"enumId\":0,\"example\":\",\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":907,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"bytes\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"byte[]\"},{\"children\":[],\"creatorName\":\"Lmx\",\"description\":\"返回文件流\",\"docId\":128,\"enumId\":0,\"example\":\"\",\"global\":false,\"gmtCreate\":\"2026-10-02 06:17:29\",\"gmtModified\":\"2026-10-02 06:17:29\",\"id\":908,\"maxLength\":\"-\",\"modifierName\":\"Lmx\",\"name\":\"inputStream\",\"parentId\":0,\"require\":false,\"required\":0,\"type\":\"InputStream\"}],\"url\":\"openapi.download\",\"version\":\"1.0\"}', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);

-- ----------------------------
-- Table structure for sop_doc_info
-- ----------------------------
DROP TABLE IF EXISTS `sop_doc_info`;
CREATE TABLE `sop_doc_info`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `doc_app_id` bigint NOT NULL COMMENT '应用id\ndoc_app.id',
  `doc_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文档标题',
  `doc_id` bigint NOT NULL COMMENT '文档id\ntorna.doc_info.id',
  `doc_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文档编码',
  `doc_type` int NULL DEFAULT 1 COMMENT '文档类型\n[1-dubbo 2-富文本 3-Markdown]',
  `source_type` int NULL DEFAULT 1 COMMENT '来源类型\n[1-torna 2-自建]',
  `doc_version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文档版本号',
  `doc_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文档名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `is_folder` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否分类',
  `is_publish` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态\n[0-未发布 1-已发布]',
  `parent_id` bigint NOT NULL COMMENT '父文档节点id',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_doc_app_id`(`doc_app_id` ASC) USING BTREE,
  INDEX `idx_doc_id`(`doc_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_doc_info
-- ----------------------------
INSERT INTO `sop_doc_info` VALUES (819414021307381761, 819414021307381760, '演示 - 支付接口', 120, '', 1, 1, '', '演示 - 支付接口', '', 1, 1, 0, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_info` VALUES (819414021307381762, 819414021307381760, '手机网站支付接口', 121, '', 1, 1, '1.0', 'openapi.wap.pay', '该接口是页面跳转接口，用于生成用户访问跳转链接。\n请在服务端执行SDK中pageExecute方法，读取响应中的body()结果。\n该结果用于跳转到页面，返回到用户浏览器渲染或重定向跳转到页面。\n具体使用方法请参考 <a href=\"https://torna.cn\" target=\"_blank\">接入指南</a>', 0, 1, 120, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_info` VALUES (819414021307381763, 819414021307381760, '查询员工', 124, '', 1, 1, '1.0', 'openapi.employee.get', '根据id，查询本租户下的员工数据', 0, 1, 123, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_info` VALUES (819414021307381764, 819414021307381760, '订单查询接口', 122, '', 1, 1, '1.0', 'openapi.order.search', '订单查询接口', 0, 1, 120, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_info` VALUES (819414021307381765, 819414021307381760, '演示 - 查询租户下的数据', 123, '', 1, 1, '', '演示 - 查询租户下的数据', '', 1, 1, 0, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_info` VALUES (819414021307381766, 819414021307381760, '演示单文件上传', 125, '', 1, 1, '1.0', 'openapi.upload', '演示单文件上传', 0, 1, 123, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_info` VALUES (819414021307381767, 819414021307381760, '演示多文件上传', 126, '', 1, 1, '1.0', 'openapi.upload.more', '演示多文件上传', 0, 1, 123, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_info` VALUES (819414021307381768, 819414021307381760, '演示多文件上传2', 127, '', 1, 1, '1.0', 'openapi.upload.list', '演示多文件上传2', 0, 1, 123, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_doc_info` VALUES (819414021307381769, 819414021307381760, '下载', 128, '', 1, 1, '1.0', 'openapi.download', '下载', 0, 1, 123, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);

-- ----------------------------
-- Table structure for sop_help_doc
-- ----------------------------
DROP TABLE IF EXISTS `sop_help_doc`;
CREATE TABLE `sop_help_doc`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `label` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文档名称',
  `sort_value` int NOT NULL DEFAULT 0 COMMENT '排序',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态\n1：启用，0：禁用',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `content_type` tinyint NOT NULL DEFAULT 1 COMMENT '内容类型\n1-Markdown,2-富文本',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父级id',
  `created_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '添加时间',
  `updated_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帮助内容' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_help_doc
-- ----------------------------
INSERT INTO `sop_help_doc` VALUES (712712237514301095, '示例1： Java基础语法入门', 22, b'1', '# 文档一：Java基础语法入门\n\n## 一、Java简介与环境搭建\n\nJava是一种跨平台、面向对象的编程语言，具有“一次编写，到处运行”的特性，广泛应用于后端开发、移动开发等领域。要开展Java开发，首先需完成环境搭建，核心是安装JDK（Java Development Kit，Java开发工具包）。\n\n### 环境搭建步骤：\n\n1. 下载JDK：前往Oracle官网（https://www.oracle.com/java/technologies/downloads/），选择对应操作系统（Windows/macOS/Linux）的JDK版本（推荐Java 8或Java 17，兼容性较好）。\n\n2. 安装JDK：双击安装包，按向导完成安装，记住安装路径（如Windows下的“C:\\Program Files\\Java\\jdk1.8.0_301”）。\n\n3. 配置环境变量：\n       \n\n    - Windows：右键“此电脑”→“属性”→“高级系统设置”→“环境变量”，在系统变量中新建“JAVA_HOME”，值为JDK安装路径；编辑“Path”变量，添加“%JAVA_HOME%\\bin”和“%JAVA_HOME%\\jre\\bin”。\n\n    - macOS/Linux：打开终端，编辑~/.bash_profile或~/.zshrc文件，添加“export JAVA_HOME=JDK安装路径”“export PATH=$JAVA_HOME/bin:$PATH”，保存后执行“source ~/.bash_profile”生效。\n\n4. 验证：打开终端，输入“java -version”和“javac -version”，若显示版本信息则说明环境搭建成功。\n\n## 二、第一个Java程序：Hello World\n\n环境搭建完成后，编写第一个Java程序，步骤如下：\n\n1. 创建源文件：新建文本文件，命名为“HelloWorld.java”（注意：文件名必须与类名一致，后缀为.java）。\n\n2. 编写代码：\n`// 定义公共类HelloWorld\npublic class HelloWorld {\n    // 程序入口方法，main方法是Java程序的执行起点\n    public static void main(String[] args) {\n        // 输出“Hello World!”到控制台\n        System.out.println(\"Hello World!\");\n    }\n}`\n\n3. 编译与运行：\n       \n\n    - 编译：打开终端，进入源文件所在目录，输入“javac HelloWorld.java”，若没有报错，会生成“HelloWorld.class”字节码文件。\n\n    - 运行：输入“java HelloWorld”，控制台将输出“Hello World!”。\n\n## 三、核心基础语法\n\n### 1. 变量与数据类型\n\nJava是强类型语言，变量必须先声明再使用，且声明时需指定数据类型。核心数据类型分为两类：\n\n- 基本数据类型（8种）：\n        \n\n    - 整数类型：byte（1字节）、short（2字节）、int（4字节，默认）、long（8字节，声明时需加L后缀，如100L）。\n\n    - 浮点类型：float（4字节，声明时需加F后缀，如3.14F）、double（8字节，默认）。\n\n    - 字符类型：char（2字节，用单引号包裹，如\'a\'、\'中\'）。\n\n    - 布尔类型：boolean（1字节，值为true或false）。\n\n- 引用数据类型：类（如String）、数组、接口等，默认值为null。\n\n变量声明示例：\n\n```java\n\npublic class VariableDemo {\n    public static void main(String[] args) {\n        // 基本数据类型变量\n        int age = 20;\n        double score = 95.5;\n        char gender = \'男\';\n        boolean isPass = true;\n        \n        // 引用数据类型变量\n        String name = \"张三\";\n        \n        // 输出变量值\n        System.out.println(\"姓名：\" + name + \"，年龄：\" + age);\n    }\n}\n```\n\n### 2. 运算符\n\n常用运算符包括：\n\n- 算术运算符：+（加）、-（减）、*（乘）、/（除）、%（取余）、++（自增）、--（自减）。\n\n- 关系运算符：==（等于）、!=（不等于）、>（大于）、<（小于）、>=（大于等于）、<=（小于等于），结果为boolean类型。\n\n- 逻辑运算符：&&（短路与）、||（短路或）、!（非），用于连接boolean表达式。\n\n- 赋值运算符：=、+=、-=、*=、/=等。\n\n### 3. 流程控制语句\n\n用于控制程序执行顺序，核心包括：\n\n- 条件语句：if-else、switch-case。\n\n- 循环语句：for、while、do-while。\n\n- 跳转语句：break（跳出循环或switch）、continue（跳过本次循环，进入下一次）。\n\n示例（for循环与if-else）：\n\n```java\n\npublic class FlowControlDemo {\n    public static void main(String[] args) {\n        // 循环输出1-10的数字，判断奇偶性\n        for (int i = 1; i <= 10; i++) {\n            if (i % 2 == 0) {\n                System.out.println(i + \"是偶数\");\n            } else {\n                System.out.println(i + \"是奇数\");\n            }\n        }\n    }\n}\n```', 1, 0, '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000', 2, 2);
INSERT INTO `sop_help_doc` VALUES (712712237514301098, '文档二：Java面向对象基础', 222, b'1', '# 文档二：Java面向对象基础\n\n## 一、面向对象核心概念\n\nJava是纯面向对象编程语言，核心思想是“万物皆对象”，即将现实世界中的事物抽象为程序中的“对象”，通过对象的“属性”（特征）和“方法”（行为）描述事物。面向对象有三大特性：封装、继承、多态。\n\n关键术语：\n\n- 类：对象的抽象模板，定义了对象的属性和方法，如“Person”类。\n\n- 对象：类的实例化结果，如“张三”是“Person”类的一个对象。\n\n- 属性：类中的成员变量，描述对象的特征，如Person类的name、age。\n\n- 方法：类中的成员函数，描述对象的行为，如Person类的eat()、sleep()。\n\n## 二、类与对象的创建和使用\n\n### 1. 定义类\n\n类的定义格式：\n\n```java\n\n// 定义Person类\npublic class Person {\n    // 成员变量（属性）\n    String name;\n    int age;\n    \n    // 成员方法（行为）\n    // 无参数无返回值方法\n    public void eat() {\n        System.out.println(name + \"在吃饭\");\n    }\n    \n    // 有参数有返回值方法\n    public int getAge() {\n        return age;\n    }\n}\n```\n\n### 2. 创建与使用对象\n\n通过“new”关键字创建对象，格式为：`类名 对象名 = new 类名();`，之后通过“对象名.属性”“对象名.方法()”操作对象。\n\n示例：\n\n```java\n\npublic class PersonTest {\n    public static void main(String[] args) {\n        // 创建Person对象\n        Person zhangsan = new Person();\n        \n        // 给对象的属性赋值\n        zhangsan.name = \"张三\";\n        zhangsan.age = 25;\n        \n        // 调用对象的方法\n        zhangsan.eat();\n        int age = zhangsan.getAge();\n        System.out.println(\"年龄：\" + age);\n    }\n}\n```\n\n### 3. 构造方法\n\n构造方法是类中特殊的方法，用于对象的初始化，创建对象时自动调用。其特点：\n\n- 方法名与类名完全一致。\n\n- 没有返回值类型（包括void）。\n\n- 若类中未定义构造方法，系统会默认提供一个无参构造方法；若自定义了构造方法，默认无参构造会失效。\n\n示例（带参构造方法）：\n\n```java\n\npublic class Person {\n    String name;\n    int age;\n    \n    // 无参构造方法\n    public Person() {}\n    \n    // 带参构造方法\n    public Person(String n, int a) {\n        name = n;\n        age = a;\n    }\n    \n    public void eat() {\n        System.out.println(name + \"在吃饭\");\n    }\n}\n\n// 使用带参构造创建对象\npublic class PersonTest {\n    public static void main(String[] args) {\n        Person lisi = new Person(\"李四\", 30);\n        lisi.eat(); // 输出：李四在吃饭\n    }\n}\n```\n\n## 三、面向对象三大特性\n\n### 1. 封装\n\n封装是指将对象的属性和方法隐藏起来，仅通过公共的方法对外提供访问和修改接口，目的是提高代码安全性和可维护性。实现步骤：\n\n1. 将成员变量用“private”修饰（私有访问权限，仅本类可访问）。\n\n2. 提供公共的“getter”方法（获取属性值）和“setter”方法（修改属性值）。\n\n示例：\n\n```java\n\npublic class Person {\n    // 私有成员变量\n    private String name;\n    private int age;\n    \n    // getter方法（获取name）\n    public String getName() {\n        return name;\n    }\n    \n    // setter方法（修改name）\n    public void setName(String n) {\n        // 可在setter中添加逻辑校验\n        if (n != null && !n.equals(\"\")) {\n            name = n;\n        } else {\n            System.out.println(\"姓名不能为空\");\n        }\n    }\n    \n    // getter和setter方法（age）\n    public int getAge() {\n        return age;\n    }\n    \n    public void setAge(int a) {\n        if (a > 0 && a < 150) {\n            age = a;\n        } else {\n            System.out.println(\"年龄输入无效\");\n        }\n    }\n}\n\n// 使用封装后的类\npublic class PersonTest {\n    public static void main(String[] args) {\n        Person wangwu = new Person();\n        wangwu.setName(\"王五\");\n        wangwu.setAge(28);\n        System.out.println(\"姓名：\" + wangwu.getName() + \"，年龄：\" + wangwu.getAge());\n        \n        wangwu.setAge(200); // 输出：年龄输入无效\n    }\n}\n```\n\n### 2. 继承\n\n继承是指一个类（子类）继承另一个类（父类）的属性和方法，子类可复用父类的代码，同时可添加自己的特有属性和方法，实现代码复用和扩展。Java中类只能单继承（一个子类只能有一个直接父类），通过“extends”关键字实现。\n\n示例：\n\n```java\n\n// 父类：Person\npublic class Person {\n    private String name;\n    private int age;\n    \n    // getter和setter方法\n    public String getName() { return name; }\n    public void setName(String name) { this.name = name; }\n    public int getAge() { return age; }\n    public void setAge(int age) { this.age = age; }\n    \n    public void eat() {\n        System.out.println(name + \"在吃饭\");\n    }\n}\n\n// 子类：Student，继承Person\npublic class Student extends Person {\n    // 子类特有属性\n    private String studentId;\n    \n    // 子类特有方法\n    public void study() {\n        System.out.println(getName() + \"（学号：\" + studentId + \"）在学习\");\n    }\n    \n    // 子类getter和setter方法\n    public String getStudentId() { return studentId; }\n    public void setStudentId(String studentId) { this.studentId = studentId; }\n}\n\n// 测试类\npublic class StudentTest {\n    public static void main(String[] args) {\n        Student zhaoliu = new Student();\n        zhaoliu.setName(\"赵六\");\n        zhaoliu.setAge(20);\n        zhaoliu.setStudentId(\"2024001\");\n        \n        zhaoliu.eat(); // 继承父类的方法，输出：赵六在吃饭\n        zhaoliu.study(); // 子类特有方法，输出：赵六（学号：2024001）在学习\n    }\n}\n```\n\n### 3. 多态\n\n多态是指同一方法在不同对象上有不同的实现，即“一个接口，多种实现”。实现多态的前提：\n\n- 存在继承关系（子类继承父类）。\n\n- 子类重写父类的方法（方法名、参数列表、返回值类型完全一致，父类方法不能是private）。\n\n- 父类引用指向子类对象。\n\n示例：\n\n```java\n\n// 父类：Animal\npublic class Animal {\n    public void cry() {\n        System.out.println(\"动物在叫\");\n    }\n}\n\n// 子类：Dog，重写cry方法\npublic class Dog extends Animal {\n    @Override\n    public void cry() {\n        System.out.println(\"小狗汪汪叫\");\n    }\n}\n\n// 子类：Cat，重写cry方法\npublic class Cat extends Animal {\n    @Override\n    public void cry() {\n        System.out.println(\"小猫喵喵叫\");\n    }\n}\n\n// 测试多态\npublic class AnimalTest {\n    public static void main(String[] args) {\n        // 父类引用指向子类对象\n        Animal animal1 = new Dog();\n        Animal animal2 = new Cat();\n        \n        // 调用方法时，实际执行的是子类重写后的方法\n        animal1.cry(); // 输出：小狗汪汪叫\n        animal2.cry(); // 输出：小猫喵喵叫\n    }\n}\n```\n', 1, 0, '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000', 2, 2);
INSERT INTO `sop_help_doc` VALUES (712712237514301101, '三篇随机主题Markdown文章', 11, b'1', '# 三篇随机主题Markdown文章\n\n## 文章一：慢下来，遇见生活的本真\n\n**不知从何时起，我们的生活被按下了快进键。清晨在闹钟的催促中匆忙起身，一边啃着面包一边追赶公交，白天在会议室与电脑前不停切换，傍晚拖着疲惫的身躯回家，刚放下包又要为第二天的工作做准备。我们像上了发条的陀螺，不停旋转，却渐渐忘了为何而转。**\n\n*直到某个周末的清晨，我意外地没有被闹钟吵醒，窗外的阳光透过窗帘的缝隙洒进来，在地板上形成斑驳的光影。我没有立刻起身，而是静静地躺在床上，听着窗外的鸟鸣声、楼下小贩的吆喝声，还有风吹过树叶的沙沙声。那些平时被忽略的声音，此刻却构成了一首温柔的交响曲。*\n\n> 起身後，我没有像往常一样点外卖，而是走进厨房，慢慢洗米、煮粥，看着米粒在锅中慢慢膨胀、变得软糯。早餐时，我细细品味每一口粥的香甜，不再像以前那样狼吞虎咽。那一刻，我突然明白，生活的美好不在于速度有多快，而在于我们是否有足够的耐心去感受。\n\n[慢下来，不是懒惰，而是一种生活态度。慢下来，我们可以有时间欣赏路边的风景，感受四季的变化；慢下来，我们可以和家人好好聊天，享受亲情的温暖；慢下来，我们可以倾听自己内心的声音，找到真正想要的生活。](http://baidu.com)\n\n`试着把生活的节奏放慢一点吧，你会发现，那些被我们忽略的瞬间，才是生活最本真的模样。`\n\n## 文章二：一场与古镇的不期而遇\n\n周末逃离喧嚣的城市，无意间走进了一座藏在群山深处的古镇。古镇没有商业化的过度包装，没有摩肩接踵的游客，只有青石板路、老宅院和流淌的溪水，安静得像一幅尘封已久的水墨画。\n\n```js\n1111 \nconst a = 1;\n```\n- 1.  111\n- 2. 222\n- 3.  333\n\n~~踏上青石板路的那一刻，仿佛穿越了时空。路面被岁月打磨得光滑发亮，缝隙里长着些许青苔，散发着潮湿的泥土气息。路的两旁是鳞次栉比的老宅院，白墙黛瓦，木窗雕花，每一处细节都透露着古朴的韵味。有些宅院的门敞开着，能看到院内的天井和摆放整齐的花草，偶尔有老人坐在门口的竹椅上晒太阳，闭目养神，神情安详。~~\n\n- [ ] 古镇的中心有一条蜿蜒的溪水，溪水清澈见底，能看到水底的鹅卵石和游动的小鱼。溪边有几位妇女在洗衣服，木槌敲打衣物的声音此起彼伏，与溪水的流淌声交织在一起，充满了生活气息。我沿着溪边漫步，偶尔停下脚步，看着溪水缓缓流过，感受着这份难得的宁静。\n\n\n| Heading | title2 |\n| --- | --- |\n| 11 | 2222 |\n\n\n傍晚时分，夕阳西下，金色的阳光洒在古镇的屋顶上，给古镇镀上了一层温暖的光晕。家家户户开始升起炊烟，空气中弥漫着饭菜的香味。我找了一家临溪的小店坐下，点了一碗当地的特色小吃，看着窗外的风景，听着身边的闲谈，内心无比惬意。\n\n离开古镇的时候，天色已经暗了下来。回头望去，古镇在夜色中渐渐模糊，只有零星的灯光在闪烁。这场不期而遇的古镇之旅，就像一场心灵的洗礼，让我暂时忘却了城市的烦恼，找回了内心的平静。\n\n文章三：读《追风筝的人》有感\n\n“为你，千千万万遍。” 当我读完《追风筝的人》最后一个字时，这句话依然在我的脑海中回荡，久久无法散去。这本书以阿富汗的战乱为背景，讲述了主人公阿米尔与仆人哈桑之间跨越数十年的友情、愧疚与救赎之路。\n\n阿米尔与哈桑从小一起长大，哈桑对阿米尔忠心耿耿，无论阿米尔遇到什么困难，哈桑都会挺身而出。然而，在一次风筝比赛中，阿米尔为了赢得父亲的认可，眼睁睁地看着哈桑被欺负却选择了沉默，甚至后来还设计将哈桑赶走。这份愧疚像一根刺，深深扎在阿米尔的心里，伴随了他数十年。\n\n成年后的阿米尔移民美国，过着看似平静的生活，但内心的愧疚从未消散。直到有一天，父亲的老朋友拉辛汗打来电话，告诉他“那里有再次成为好人的路”，阿米尔才下定决心回到战乱中的阿富汗，寻找哈桑的儿子索拉博，弥补自己当年的过错。\n\n读这本书的过程中，我的心情始终被阿米尔的命运牵动着。我为他当年的懦弱而愤怒，为他内心的愧疚而心疼，更为他后来的勇敢救赎而感动。这本书不仅让我看到了战争对一个国家和人民的摧残，更让我明白了人性的复杂与美好。\n\n我们每个人的心中或许都有一个“风筝”，它可能是一份未完成的心愿，一段遗憾的感情，或是一个需要弥补的过错。追逐风筝的过程，就是追逐内心的平静与救赎的过程。无论过去我们犯过多少错误，只要我们有勇气去面对，有决心去弥补，就永远不算太晚。\n\n《追风筝的人》是一本值得反复品读的书，它教会我们珍惜友情、勇敢面对过错、坚守内心的善良。每一次阅读，都会有不一样的感悟。\n\n\n', 1, 712712237514301095, '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000', 2, 2);
INSERT INTO `sop_help_doc` VALUES (712712237514301114, '文档三：Java常用类与工具类入门', 4, b'1', '# 文档三：Java常用类与工具类入门\n\n## 一、String类（字符串类）\n\nString类用于表示字符串，是Java中最常用的类之一。String类是不可变类（字符串对象创建后，其内容不能被修改，修改会创建新的字符串对象）。\n\n### 1. String对象的创建\n\n```java\n\npublic class StringDemo {\n    public static void main(String[] args) {\n        // 方式1：直接赋值（推荐，会复用字符串常量池中的对象）\n        String s1 = \"Hello Java\";\n        \n        // 方式2：通过new关键字创建（会创建新对象，不复用常量池）\n        String s2 = new String(\"Hello Java\");\n        \n        // 比较两个字符串的内容（用equals方法，不要用==）\n        System.out.println(s1.equals(s2)); // 输出：true\n        \n        // 比较两个对象的地址（==）\n        System.out.println(s1 == s2); // 输出：false\n    }\n}\n```\n\n### 2. 常用方法\n\n- length()：返回字符串的长度。\n\n- equals(Object obj)：比较两个字符串的内容是否相等（区分大小写）。\n\n- equalsIgnoreCase(String anotherString)：比较两个字符串的内容是否相等（不区分大小写）。\n\n- concat(String str)：拼接字符串，等价于“+”。\n\n- substring(int beginIndex)：从指定索引开始截取字符串，直到末尾。\n\n- substring(int beginIndex, int endIndex)：从beginIndex截取到endIndex（左闭右开，不包含endIndex）。\n\n- trim()：去除字符串前后的空白字符（空格、制表符等）。\n\n- indexOf(String str)：返回指定子串在字符串中第一次出现的索引，若不存在返回-1。\n\n- replace(CharSequence target, CharSequence replacement)：替换字符串中的指定子串。\n\n示例：\n\n```java\n\npublic class StringMethodDemo {\n    public static void main(String[] args) {\n        String s = \"  Hello Java World  \";\n        \n        System.out.println(s.length()); // 输出：17\n        System.out.println(s.trim()); // 输出：Hello Java World\n        System.out.println(s.substring(2, 11)); // 输出：Hello Java\n        System.out.println(s.replace(\"Java\", \"Python\")); // 输出：  Hello Python World  \n        System.out.println(s.indexOf(\"World\")); // 输出：12\n    }\n}\n```\n\n## 二、ArrayList类（动态数组）\n\nArrayList是Java集合框架中的动态数组类，用于存储多个元素，相比普通数组（固定长度），ArrayList的长度可以动态变化，支持添加、删除、修改元素等操作。ArrayList位于java.util包下，使用前需导入。\n\n### 1. 基本使用\n\n```java\n\nimport java.util.ArrayList;\n\npublic class ArrayListDemo {\n    public static void main(String[] args) {\n        // 创建ArrayList对象，指定存储String类型的元素\n        ArrayList<String> list = new ArrayList<>();\n        \n        // 添加元素（add方法）\n        list.add(\"苹果\");\n        list.add(\"香蕉\");\n        list.add(\"橙子\");\n        System.out.println(list); // 输出：[苹果, 香蕉, 橙子]\n        \n        // 获取元素（get方法，索引从0开始）\n        String fruit = list.get(1);\n        System.out.println(fruit); // 输出：香蕉\n        \n        // 修改元素（set方法）\n        list.set(2, \"葡萄\");\n        System.out.println(list); // 输出：[苹果, 香蕉, 葡萄]\n        \n        // 删除元素（remove方法，可根据索引或元素值删除）\n        list.remove(0); // 删除索引为0的元素\n        System.out.println(list); // 输出：[香蕉, 葡萄]\n        \n        // 获取集合长度（size方法）\n        System.out.println(list.size()); // 输出：2\n        \n        // 遍历集合（for循环）\n        for (int i = 0; i < list.size(); i++) {\n            System.out.println(list.get(i));\n        }\n        \n        // 增强for循环遍历（更简洁）\n        for (String s : list) {\n            System.out.println(s);\n        }\n    }\n}\n```\n\n### 2. 注意事项\n\n- ArrayList存储的是引用数据类型，不能直接存储基本数据类型（如int、double），若需存储基本数据类型，需使用对应的包装类（Integer、Double等）。\n\n- 示例（存储整数）：\n`ArrayList<Integer> numList = new ArrayList<>();\nnumList.add(10); // 自动装箱（int→Integer）\nnumList.add(20);\nint num = numList.get(0); // 自动拆箱（Integer→int）\nSystem.out.println(num); // 输出：10`\n\n## 三、Scanner类（输入工具类）\n\nScanner类用于从控制台获取用户输入，是Java入门阶段常用的输入工具，位于java.util包下，使用前需导入。\n\n### 1. 基本使用\n\n```java\n\nimport java.util.Scanner;\n\npublic class ScannerDemo {\n    public static void main(String[] args) {\n        // 创建Scanner对象，关联控制台输入\n        Scanner scanner = new Scanner(System.in);\n        \n        // 获取字符串输入（nextLine()方法）\n        System.out.print(\"请输入姓名：\");\n        String name = scanner.nextLine();\n        \n        // 获取整数输入（nextInt()方法）\n        System.out.print(\"请输入年龄：\");\n        int age = scanner.nextInt();\n        \n        // 获取浮点数输入（nextDouble()方法）\n        System.out.print(\"请输入成绩：\");\n        double score = scanner.nextDouble();\n        \n        // 输出获取到的信息\n        System.out.println(\"姓名：\" + name + \"，年龄：\" + age + \"，成绩：\" + score);\n        \n        // 关闭Scanner（释放资源）\n        scanner.close();\n    }\n}\n```\n\n### 2. 常用方法\n\n- nextLine()：获取一行字符串（包括空格）。\n\n- next()：获取一个字符串（以空格或回车为分隔符，不包含空格）。\n\n- nextInt()：获取整数。\n\n- nextDouble()：获取浮点数。\n\n- hasNextInt()：判断下一个输入是否为整数，返回boolean类型（用于避免输入类型错误）。\n\n### 3. 注意事项\n\n使用nextInt()、nextDouble()等方法后，若后续使用nextLine()，会导致nextLine()读取到空字符串（因为前一个方法会留下回车符）。解决方法：在nextInt()后添加一行scanner.nextLine()，消耗掉回车符。\n\n```java\n\nimport java.util.Scanner;\n\npublic class ScannerNote {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        \n        System.out.print(\"请输入年龄：\");\n        int age = scanner.nextInt();\n        scanner.nextLine(); // 消耗回车符\n        \n        System.out.print(\"请输入姓名：\");\n        String name = scanner.nextLine();\n        \n        System.out.println(\"姓名：\" + name + \"，年龄：\" + age);\n        scanner.close();\n    }\n}\n```', 1, 0, '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000', 2, 2);

-- ----------------------------
-- Table structure for sop_isv_info
-- ----------------------------
DROP TABLE IF EXISTS `sop_isv_info`;
CREATE TABLE `sop_isv_info`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `app_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'appKey',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态\n[1-启用 2-禁用]',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  `start_expiration_time` datetime NULL DEFAULT NULL COMMENT '开始有效期',
  `end_expiration_time` datetime NULL DEFAULT NULL COMMENT '结束有效期',
  `audit_status` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '审核状态\n[0-初始化 1-申请中 2-通过 99-退回]',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `submission_time` datetime NULL DEFAULT NULL COMMENT '提交时间',
  `creation_method` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '创建方式\n[0-后台创建 1-用户申请]',
  `review_comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '审核意见',
  `tenant_id` bigint NOT NULL COMMENT '租户id\ndef_tenant.id',
  `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回调地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_appid`(`app_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'isv信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_isv_info
-- ----------------------------
INSERT INTO `sop_isv_info` VALUES (1, '内置ISV', '20261002819414021307381779', 1, '内置测试使用，请勿删除', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2, NULL, NULL, 2, NULL, NULL, 0, '', 1, 'http://localhost:18766/notify/callback');

-- ----------------------------
-- Table structure for sop_isv_keys
-- ----------------------------
DROP TABLE IF EXISTS `sop_isv_keys`;
CREATE TABLE `sop_isv_keys`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `isv_id` bigint NOT NULL DEFAULT 0 COMMENT 'ISV\nisv_info.id',
  `key_format` tinyint NOT NULL DEFAULT 1 COMMENT '秘钥格式\n[1-PKCS8(JAVA适用) 2-PKCS1(非JAVA适用)]',
  `public_key_isv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开发者生成的公钥',
  `private_key_isv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开发者生成的私钥\n（提供给开发者）',
  `public_key_platform` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台生成的公钥\n（提供给开发者）',
  `private_key_platform` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台生成的私钥',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_appid`(`isv_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ISV秘钥管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_isv_keys
-- ----------------------------
INSERT INTO `sop_isv_keys` VALUES (1, 1, 1, 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtpY7aBI6yztXXh65SLDT8ra5MRFJHsHleYY+aGr/PPc2X8EwmNYIlt/j/aKUVoLAc+yahG25vNaechPCk3wlyjBmMaqjA0DaUE8Bie2QCeEdXnioDxwr6T2YeZewkoVlcKRg8WAWGuheu7rEsHPL/T0veB5dNe1mJSdaFcBoxaN3Xf8waywaX1eJIoPLKCWU9o2mMs5be8XnSCfd7cYIjaG06nIETEDl+2kluxsxfzt2nnYLRn5uDkNSdeAqlxqiNp6d5WXUGBowGFtc3AVrTkAz/3hS3lwZxi5KN5rK3ZnCkKK4nDPNDFasGvGjfK6MfThRwadwFkwX24/OEI59LwIDAQAB', 'MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC2ljtoEjrLO1deHrlIsNPytrkxEUkeweV5hj5oav889zZfwTCY1giW3+P9opRWgsBz7JqEbbm81p5yE8KTfCXKMGYxqqMDQNpQTwGJ7ZAJ4R1eeKgPHCvpPZh5l7CShWVwpGDxYBYa6F67usSwc8v9PS94Hl017WYlJ1oVwGjFo3dd/zBrLBpfV4kig8soJZT2jaYyzlt7xedIJ93txgiNobTqcgRMQOX7aSW7GzF/O3aedgtGfm4OQ1J14CqXGqI2np3lZdQYGjAYW1zcBWtOQDP/eFLeXBnGLko3msrdmcKQoricM80MVqwa8aN8rox9OFHBp3AWTBfbj84Qjn0vAgMBAAECggEAWS4jsf9FbEJ9t+D1ysVjoGcTKR4yQq2d8a9aCBJKvHJawoZPwDa6V0bfyuB/54lRis2D4y7cy5lgJoP0Q6kdpBXjtFqN6Gbiutr7+2xnMAweFiiEnWy7Hd8R/EHU4pv5If2HxB2UbmwU6UieDTlh5zzdVKQwDsj3XSpNW9Zw1ibf97TDWIM352CbZEQt6x6QTC4cE0BwMu1a+rE0keTbTuw4zOH2Kv/m93WdaLIoQNBEUtQULAKIaIHN4mo3IQbFApRiBMVEDja1VZfca+oxjx/TklBRfusnQAQTT6eK2b4OfMGEj+z2vcPrp5CdFFGJbblJSdB/kN134R2PsYnVAQKBgQDlDfCdDEaNXiZ5WvxCbsbqasZyhKSK0E/2hm+GjFAxgkA0A0gw9jVpuiM2geZweKvlgzcJ+xn0osKZOXWhU/rGMR5Vt0gHjBymBqceybi3puelL99rN54jJ1RGfuQUQRnR04XhGmC0OV1KqHnlcxcRAiGEfOWJpIQneppWm+7G7wKBgQDMEOcfovue3cZOCnzpc5RqAA78Q0O/VhU8RMwycIANG/zJA/8L5xpcaf3m62jsD3dC5epiLO6vCvimpecDT2S3t9F3wYxNR12f+tqIzUrRjcZbpEy441eHr5Jg2LqYmCyCNO5hvYmomOxJDxKZzSRFuj9jmMfnO7nC7qm9ZJWtwQKBgQCMoUNiWMAUWYLLrVYFv5e3IvlWJCQV6hG+LQnaFNnDm9GpXX58OR3QHO0zsQt3cE8xqZ8oLJfh/+/0PTgAZdwoxM14GQBLSfXo5VrD51vWvc2pOLw2Sr53nNT8Nzn3SYT9s52V+Cj5XeLuTIQSoNe/pIxJmJkhKfXNe1O46yHt1wKBgQDAiSooNVSG3eReeZLFiOF86bU52hUvj/7VMGwhIvgOZlupJXYcOt4qV27R00bZgvYZTmhIXPCOgyF7yogeHWh/1pVyElFYEH+Lk9lgvaFb+hIvIOOqhgVt5f+MFLBpjRphd6N64KPjSPWXMPtx1ZXlnAZ26A2kZDuuahQIt8BpgQKBgQDcXfV9+J/kFez45JzoHxI7LcN97R65Vzysrhu6xtG46oxi8wybAR2Cl9YZ8QTHxrSwtt9tHLUJDl5qXU2Vb3xWtkeq4hea0qZgC/zyxOIH4GD0FZO8BqytjPRWEF5a4dkHJKI5lMuCNfLnL2fWAwpQo2CdTAQbX0m3ccTzDIBP2g==', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq9IUj8G1dKVkMhQarWkz6Aj/iTXdX2zR+2JAbHFlytBbSL+zA86IrH8l7VFz4wLs6PbQfjKxngPiqMB2iTmTk4qCAzM38Xb7d+5WM3AVpvPIt6nQdNzah0DaEDFk3g2l45fuwUpOfelrSu9xIgi3OVU+y+gjjxj9WTIOML88Le5lBTWy2klGhXT/qgmyf+9wkW3PXnDrhABeiWEMRiWNXHIPPucvDLsQ2SQf/daQFKyW6jozBYF2NfcALspsaR+ZbLeZeG4D41EOq5JSGH/s/8MP5T2qPiGF3UCwHffnisS6MnsYpKctFDMK/Jong1Y8xNwGLdxZbhgR7yfoIZjypwIDAQAB', 'MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCr0hSPwbV0pWQyFBqtaTPoCP+JNd1fbNH7YkBscWXK0FtIv7MDzoisfyXtUXPjAuzo9tB+MrGeA+KowHaJOZOTioIDMzfxdvt37lYzcBWm88i3qdB03NqHQNoQMWTeDaXjl+7BSk596WtK73EiCLc5VT7L6COPGP1ZMg4wvzwt7mUFNbLaSUaFdP+qCbJ/73CRbc9ecOuEAF6JYQxGJY1ccg8+5y8MuxDZJB/91pAUrJbqOjMFgXY19wAuymxpH5lst5l4bgPjUQ6rklIYf+z/ww/lPao+IYXdQLAd9+eKxLoyexikpy0UMwr8mieDVjzE3AYt3FluGBHvJ+ghmPKnAgMBAAECggEAJAfO1gKJ+acBJts+aOTpxJu2cmCARpV8RxnoZpU1Al3E9rF0abTyxjF3k5eEFLO1WHkBaaVZx8gKzNZnRQl03/iooOEptxH7U8AABZNYhwUSLymGFCuIC9rWn5SsEUCNa/edUp0xbof3PuSNNdTcD0LIA1xvsH9OCVlMzn4bsYm3YVQfhsYi46V3pAo2dD+Pc3flQ9gegO2fb6T3lVphsKQer4oarcPzN33NJkvOXMw2JcUjGb149Ix2eVaPElAv4pJ9Y9RSPZhgDn8a1M/70KisN88jglxJjf40cA1KwvECnN9Q9XNHzFTKYwaP/xD+MzLMRVUFs429YAqczTJ6iQKBgQDSa4dJNkLFxnxJktn3KA2EeNFEAbv4BP+8B1V9lAi79wKuV1DR6tF+rdqN13pKZgIajpQRsmzbo6a8w+aUZCJh/KcTJWmFyQEy6ALzIDcM+I9pOHZNF0vF9JDuXGtak7zYjQ019MGZCiSfIFF+OzxxAiJ/X/sObEi+l0rY8lQoHQKBgQDRChcCe43DwPVCg9zsMfAMMOoFlUWbbHJspoK23qIiplGa/faNkRua7ztAvsESpl2vV568xlG1TUWIjGtQsR9gQWUwKlcRVl/sBzs5RN3Paz3qzlIPPdNGFCsCEpWbby74d6AIyPcVamgBzEia3ukZJ6/LUHkgYFGEALR0NL1ykwKBgH8ddGnW/LmLsbOkokY8DQZ1Ej5aKdqn8nH9oDivwCMFErqNhwZ5K7uyfTBo9riRLT4r2eli934sO+MXGWmVoGu/fJMFa9zlU/MT1AxZ7sfINKKk+FqT8zOQDing7P2X+GJ9u3hX9shkJ0F1/aUbVeUTHBIEwp6w7bUtooqywgJFAoGBAJHiccZ4xansuv1tmzt3amiHpnq4/zgFyiFLX4QSAaMe4WrCfFO2BkbtWDPKLGJAmrco9g4WdaWKxNET9jz9L8F0QhMIKXVfC1hkf49rIUWFOVPqI1ihtBV/M7ihkalFQcmDartWzSEz/lvq3my+znyQtt20TqQqtBjkiQtkVyZjAoGBAImns2+7bOgFc9BpeXr5nJwYEz3DmaYglRpXtNBxbjEoUL3AJ1iLEx8lurtMen+Sjc3+7rxfa7JeDX2u1fSsXd1nF3/Dwpsip40zaUjzHy5C4aLXVezbYsj8kfjfbyKCrxwpzLSko5QC2fSAXbX6PH1L+/qUIfmoccvdq82kOEMn', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);

-- ----------------------------
-- Table structure for sop_notify_info
-- ----------------------------
DROP TABLE IF EXISTS `sop_notify_info`;
CREATE TABLE `sop_notify_info`  (
  `id` bigint UNSIGNED NOT NULL,
  `app_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'app_id',
  `api_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'api_name',
  `api_version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'api_version',
  `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '回调url',
  `last_send_time` datetime(3) NULL DEFAULT NULL COMMENT '最近一次发送时间',
  `next_send_time` datetime(3) NULL DEFAULT NULL COMMENT '下一次发送时间',
  `send_max` int NULL DEFAULT NULL COMMENT '最大发送次数',
  `send_cnt` int NULL DEFAULT NULL COMMENT '已发送次数',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发送内容',
  `notify_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '状态\n[1-发送成功,2-发送失败,3-重试结束]',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '失败原因',
  `result_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回结果',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `created_time` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_time` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_app_id`(`app_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '回调信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_notify_info
-- ----------------------------

-- ----------------------------
-- Table structure for sop_perm_group
-- ----------------------------
DROP TABLE IF EXISTS `sop_perm_group`;
CREATE TABLE `sop_perm_group`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组名称',
  `deleted_at` bigint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_perm_group
-- ----------------------------

-- ----------------------------
-- Table structure for sop_perm_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `sop_perm_group_permission`;
CREATE TABLE `sop_perm_group_permission`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `group_id` bigint NOT NULL DEFAULT 0 COMMENT '分组id\nperm_group.id',
  `api_id` bigint NOT NULL DEFAULT 0 COMMENT '文档id\napi_info.id',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_apiid_groupid`(`api_id` ASC, `group_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_perm_group_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sop_perm_isv_group
-- ----------------------------
DROP TABLE IF EXISTS `sop_perm_isv_group`;
CREATE TABLE `sop_perm_isv_group`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `isv_id` bigint NOT NULL COMMENT 'ISV',
  `group_id` bigint NOT NULL DEFAULT 0 COMMENT '分组\nperm_group.id',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_isvid_groupid`(`isv_id` ASC, `group_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'isv分组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_perm_isv_group
-- ----------------------------

-- ----------------------------
-- Table structure for sop_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sop_sys_config`;
CREATE TABLE `sop_sys_config`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键id',
  `config_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `config_value` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `deleted_at` bigint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint NULL DEFAULT 0 COMMENT '创建人id',
  `updated_by` bigint NULL DEFAULT 0 COMMENT '最后更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configkey`(`config_key` ASC, `deleted_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sop_sys_config
-- ----------------------------
INSERT INTO `sop_sys_config` VALUES (1, 'admin.open-prod-url', 'https://openapi.kpu.com/api', '开放平台线上环境地址', 0, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_sys_config` VALUES (2, 'admin.open-sandbox-url', 'https://openapi.kpu.com/api', '开放平台测试环境地址', 0, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);
INSERT INTO `sop_sys_config` VALUES (3, 'admin.torna-server-addr', 'http://localhost:7700/', 'Torna服务器地址(完整地址为:http://ip:port,结尾无须加\"/\"，或\"/api\")', 0, '2025-01-01 00:00:00', '2025-01-01 00:00:00', 2, 2);

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'increment id',
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid` ASC, `branch_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for worker_node
-- ----------------------------
DROP TABLE IF EXISTS `worker_node`;
CREATE TABLE `worker_node`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'auto;increment id',
  `host_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主机名',
  `port` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '端口',
  `type` int NOT NULL COMMENT '节点类型:;ACTUAL 或者 CONTAINER',
  `launch_date` date NOT NULL COMMENT '上线日期',
  `modified` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `created` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'DB;WorkerID Assigner for UID Generator' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of worker_node
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
