/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80019 (8.0.19)
 Source Host           : localhost:3306
 Source Schema         : kpu_base_1

 Target Server Type    : MySQL
 Target Server Version : 80019 (8.0.19)
 File Encoding         : 65001

 Date: 04/10/2026 10:15:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `parent_id` bigint NOT NULL COMMENT '所属字典',
  `parent_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '所属字典标识',
  `dict_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典分组',
  `key_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `classify` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '20' COMMENT '分类;[10-系统字典 20-业务字典]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.DICT_CLASSIFY)',
  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据类型\n[1-字符串 2-整型 3-布尔]',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `sort_value` int NULL DEFAULT 1 COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图标',
  `css_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'css样式',
  `css_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'css类元素',
  `prop_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组件属性\n用于Tag时，用于配置color属性\n用于Button时，用于配置type属性',
  `i18n_json` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '国际化配置',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_dict
-- ----------------------------

-- ----------------------------
-- Table structure for base_employee
-- ----------------------------
DROP TABLE IF EXISTS `base_employee`;
CREATE TABLE `base_employee`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `is_default` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否默认员工;[0-否 1-是]',
  `position_id` bigint NULL DEFAULT NULL COMMENT '所属岗位',
  `user_id` bigint NOT NULL COMMENT '用户',
  `last_company_id` bigint NULL DEFAULT NULL COMMENT '上一次登录单位ID',
  `last_dept_id` bigint NULL DEFAULT NULL COMMENT '上一次登录部门ID',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `active_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '20' COMMENT '激活状态;[10-未激活 20-已激活]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.ACTIVE_STATUS)',
  `position_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '10' COMMENT '职位状态;[10-在职 20-离职]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.POSITION_STATUS)',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态;[0-禁用 1-启用]',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_emp_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_employee
-- ----------------------------
INSERT INTO `base_employee` VALUES (339843960220418056, b'0', NULL, 1, 470449818292977807, NULL, 'superAdmin', '20', '10', b'1', 2, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00', 1);
INSERT INTO `base_employee` VALUES (543809234108564219, b'0', NULL, 2, NULL, NULL, 'admin', '20', '10', b'1', 2, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00', NULL);

-- ----------------------------
-- Table structure for base_employee_org_rel
-- ----------------------------
DROP TABLE IF EXISTS `base_employee_org_rel`;
CREATE TABLE `base_employee_org_rel`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `org_id` bigint NOT NULL COMMENT '关联机构',
  `employee_id` bigint NOT NULL COMMENT '关联员工',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_employee_org`(`org_id` ASC, `employee_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工所在部门' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_employee_org_rel
-- ----------------------------
INSERT INTO `base_employee_org_rel` VALUES (783920836774986754, 470449818292977807, 339843960220418056, 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00', NULL);

-- ----------------------------
-- Table structure for base_employee_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `base_employee_role_rel`;
CREATE TABLE `base_employee_role_rel`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `role_id` bigint NOT NULL COMMENT '拥有角色;#base_role',
  `employee_id` bigint NOT NULL COMMENT '所属员工;#base_employee',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_err_role_employee`(`role_id` ASC, `employee_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工的角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_employee_role_rel
-- ----------------------------
INSERT INTO `base_employee_role_rel` VALUES (339843960220418058, 1452496398934081536, 339843960220418056, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', NULL);
INSERT INTO `base_employee_role_rel` VALUES (739397474948784136, 1452944729753780224, 543809234108564219, 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', NULL);
INSERT INTO `base_employee_role_rel` VALUES (783020023255297033, 1452496398934081536, 543809234108564219, 1, '2025-01-01 00:00:00', 1, '2025-01-01 00:00:00', NULL);

-- ----------------------------
-- Table structure for base_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `base_operation_log`;
CREATE TABLE `base_operation_log`  (
  `id` bigint NOT NULL COMMENT '主键',
  `request_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作IP',
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'OPT' COMMENT '日志类型;#LogType{OPT:操作类型;EX:异常类型}',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作描述',
  `class_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类路径',
  `action_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方法',
  `request_uri` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求地址',
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'GET' COMMENT '请求类型;#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '完成时间',
  `consuming_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  `ua` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for base_operation_log_ext
-- ----------------------------
DROP TABLE IF EXISTS `base_operation_log_ext`;
CREATE TABLE `base_operation_log_ext`  (
  `id` bigint NOT NULL COMMENT '主键',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回值',
  `ex_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常描述',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人ID',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志扩展' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_operation_log_ext
-- ----------------------------

-- ----------------------------
-- Table structure for base_org
-- ----------------------------
DROP TABLE IF EXISTS `base_org`;
CREATE TABLE `base_org`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type_` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '10' COMMENT '类型;[10-单位 20-部门]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.ORG_TYPE)',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '简称',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父组织',
  `tree_grade` int NULL DEFAULT 0 COMMENT '树层级',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '树路径;用id拼接树结构',
  `sort_value` int NULL DEFAULT 1 COMMENT '排序',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态;[0-禁用 1-启用]',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_org_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_org
-- ----------------------------
INSERT INTO `base_org` VALUES (470449818292977807, '研发部', '10', 'Research and Development', 0, 0, '/', 100, b'1', NULL, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2, NULL);
INSERT INTO `base_org` VALUES (470449818292977812, '硬件开发团队', '20', '硬件开发', 470449818292977807, 1, '/470449818292977807/', 100, b'1', '负责物联网设备的硬件设计、开发和测试', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2, NULL);

-- ----------------------------
-- Table structure for base_org_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `base_org_role_rel`;
CREATE TABLE `base_org_role_rel`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `org_id` bigint NOT NULL COMMENT '所属部门;#base_org',
  `role_id` bigint NOT NULL COMMENT '拥有角色;#base_role',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_org_role`(`org_id` ASC, `role_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织的角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_org_role_rel
-- ----------------------------

-- ----------------------------
-- Table structure for base_parameter
-- ----------------------------
DROP TABLE IF EXISTS `base_parameter`;
CREATE TABLE `base_parameter`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `key_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数值',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态',
  `param_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '20' COMMENT '类型;[10-系统参数 20-业务参数]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.PARAMETER_TYPE)',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '个性参数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for base_position
-- ----------------------------
DROP TABLE IF EXISTS `base_position`;
CREATE TABLE `base_position`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `org_id` bigint NULL DEFAULT NULL COMMENT '所属组织;#base_org@Echo(api = EchoApi.ORG_ID_CLASS)',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态;0-禁用 1-启用',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_position
-- ----------------------------
INSERT INTO `base_position` VALUES (600026945810652161, '前端开发', 470449818292977807, b'1', '', '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 2, NULL);

-- ----------------------------
-- Table structure for base_role
-- ----------------------------
DROP TABLE IF EXISTS `base_role`;
CREATE TABLE `base_role`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `category` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '10' COMMENT '角色类别;[10-功能角色 20-桌面角色 30-数据角色]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.ROLE_CATEGORY)',
  `type_` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '20' COMMENT '角色类型;[10-系统角色 20-自定义角色]; \n@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.DATA_TYPE)',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '编码',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `state` bit(1) NULL DEFAULT b'1' COMMENT '状态',
  `readonly_` bit(1) NULL DEFAULT b'0' COMMENT '内置角色',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_role
-- ----------------------------
INSERT INTO `base_role` VALUES (739397474948784128, '10', '20', '测试租户管理员', 'TEST_TENANT_ADMIN', '', b'1', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', NULL);
INSERT INTO `base_role` VALUES (1452496398934081536, '10', '10', '租户管理员', 'TENANT_ADMIN', '租户管理员', b'1', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 0);
INSERT INTO `base_role` VALUES (1452944729753780224, '30', '20', '机构管理员', 'ORG_ADMIN', '单位(门店)管理员', b'1', b'0', 2, '2025-01-01 00:00:00', 2, '2025-01-01 00:00:00', 0);

-- ----------------------------
-- Table structure for base_role_resource_rel
-- ----------------------------
DROP TABLE IF EXISTS `base_role_resource_rel`;
CREATE TABLE `base_role_resource_rel`  (
  `id` bigint NOT NULL COMMENT '主键',
  `resource_id` bigint NOT NULL COMMENT '拥有资源;#def_resource',
  `application_id` bigint NOT NULL COMMENT '所属应用;#def_application',
  `role_id` bigint NOT NULL COMMENT '所属角色;#base_role',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后更新人',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人组织',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_resource`(`resource_id` ASC, `role_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色的资源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_role_resource_rel
-- ----------------------------

-- ----------------------------
-- Table structure for extend_interface_log
-- ----------------------------
DROP TABLE IF EXISTS `extend_interface_log`;
CREATE TABLE `extend_interface_log`  (
  `id` bigint NOT NULL,
  `interface_id` bigint NOT NULL COMMENT '接口ID;\n#extend_interface',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接口名称',
  `success_count` int NULL DEFAULT 0 COMMENT '成功次数',
  `fail_count` int NULL DEFAULT 0 COMMENT '失败次数',
  `last_exec_time` datetime NULL DEFAULT NULL COMMENT '最后执行时间',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_EIL_INTERFACE_ID`(`interface_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口执行日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of extend_interface_log
-- ----------------------------

-- ----------------------------
-- Table structure for extend_interface_logging
-- ----------------------------
DROP TABLE IF EXISTS `extend_interface_logging`;
CREATE TABLE `extend_interface_logging`  (
  `id` bigint NOT NULL,
  `log_id` bigint NOT NULL COMMENT '接口日志ID;\n#extend_interface_log',
  `exec_time` datetime NOT NULL COMMENT '执行时间',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '01' COMMENT '执行状态;[01-初始化 02-成功 03-失败]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.MSG_INTERFACE_LOGGING_STATUS)',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '接口返回',
  `error_msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常信息',
  `biz_id` bigint NULL DEFAULT NULL COMMENT '业务ID',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口执行日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of extend_interface_logging
-- ----------------------------

-- ----------------------------
-- Table structure for extend_msg
-- ----------------------------
DROP TABLE IF EXISTS `extend_msg`;
CREATE TABLE `extend_msg`  (
  `id` bigint NOT NULL COMMENT '短信记录ID',
  `template_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '消息模板;\n#extend_msg_template',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '消息类型;[01-短信 02-邮件 03-站内信];@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.MSG_TEMPLATE_TYPE)',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '执行状态;\n#TaskStatus{DRAFT:草稿;WAITING:等待执行;SUCCESS:执行成功;FAIL:执行失败}',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发送渠道;\n#SourceType{APP:应用;SERVICE:服务}',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数;需要封装为[{‘key’:‘‘,;’value’:‘‘}, {’key2’:‘‘, ’value2’:‘‘}]格式',
  `config_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息配置参数',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发送内容',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `biz_id` bigint NULL DEFAULT NULL COMMENT '业务ID',
  `biz_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '业务类型',
  `remind_mode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提醒方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_REMIND_MODE)[01-待办 02-预警 03-提醒]',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发布人姓名',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后修改人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '创建人所属机构',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tempate_id_topic_content`(`template_code` ASC, `title` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of extend_msg
-- ----------------------------

-- ----------------------------
-- Table structure for extend_msg_recipient
-- ----------------------------
DROP TABLE IF EXISTS `extend_msg_recipient`;
CREATE TABLE `extend_msg_recipient`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `msg_id` bigint NOT NULL COMMENT '任务ID;\n#extend_msg',
  `recipient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接收人;\n可能是手机号、邮箱、用户ID等',
  `ext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展信息',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后修改人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_id_tel_num`(`msg_id` ASC, `recipient` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息接收人' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of extend_msg_recipient
-- ----------------------------

-- ----------------------------
-- Table structure for extend_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `extend_msg_template`;
CREATE TABLE `extend_msg_template`  (
  `id` bigint NOT NULL COMMENT '模板ID',
  `interface_id` bigint NOT NULL COMMENT '接口ID',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息类型;[01-短信 02-邮件 03-站内信];@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.MSG_TEMPLATE_TYPE)',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板标识',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模板名称',
  `state` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `template_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模板编码',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '签名',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板内容',
  `script` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '脚本',
  `param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模板参数',
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
  UNIQUE INDEX `UK_EX_MSG_TEMPLATE_CODE`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of extend_msg_template
-- ----------------------------

-- ----------------------------
-- Table structure for extend_notice
-- ----------------------------
DROP TABLE IF EXISTS `extend_notice`;
CREATE TABLE `extend_notice`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `msg_id` bigint NULL DEFAULT NULL COMMENT '消息ID',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '业务ID',
  `biz_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '业务类型',
  `recipient_id` bigint NOT NULL COMMENT '接收人',
  `remind_mode` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '提醒方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_REMIND_MODE)[01-待办 02-预警 03-提醒]',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发布人',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '处理地址',
  `target_` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '打开方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_TARGET)[01-页面 02-弹窗 03-新开窗口]',
  `auto_read` bit(1) NULL DEFAULT NULL COMMENT '自动已读',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `read_time` datetime NULL DEFAULT NULL COMMENT '读取时间',
  `is_read` bit(1) NULL DEFAULT b'0' COMMENT '是否已读',
  `is_handle` bit(1) NULL DEFAULT b'0' COMMENT '是否处理',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '最后修改人',
  `created_org_id` bigint NULL DEFAULT NULL COMMENT '所属组织',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of extend_notice
-- ----------------------------

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

SET FOREIGN_KEY_CHECKS = 1;
