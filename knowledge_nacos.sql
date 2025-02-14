-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: knowledge_nacos
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'group_id',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'configuration description',
  `c_use` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'configuration usage',
  `effect` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL COMMENT '配置生效的描述',
  `type` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL COMMENT '配置的类型',
  `c_schema` text COLLATE utf8mb3_bin COMMENT '配置的模式',
  `encrypted_data_key` varchar(1024) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT '密钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (3,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','server:\n  port: 8082\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-chengdu.aliyuncs.com\n        access-key-id: LTAI5tKUT5wevePbz931gqLU\n        access-key-secret: 5rlNChW1SajR1DK29xNtLFlKivMCbb\n        bucket-name: web-rw\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10485760\n      max-request-size: 10485760\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\nfeign:\n  okhttp:\n    enabled: true\n\n\nfile:\n  upload:\n    maxSize: 10485760        # 设置最大文件大小\n    allowedTypes:        # 允许的文件类型\n      - \"pdf\"\n      - \"docx\"\n      - \"txt\"\n      - \"md\"\n    allowedMimeTypes:    # 允许的 MIME 类型\n      - \"application/pdf\"\n      - \"application/msword\"\n      - \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\"\n      - \"text/plain\"\n      - \"text/markdown\"\n      - \"text/x-markdown\"\n','9b2e75ae62e9f4c3a3dbd9a480c81a9a','2024-11-30 19:47:31','2024-12-20 16:28:13',NULL,'0:0:0:0:0:0:0:1','','8648100a-894e-469e-b4b7-0b191a94a21d','所有配置','','','yaml','',''),(4,'user-service-dev-sql-config.yaml','DEFAULT_GROUP','server:\n  port: 8081\n\nspring:\n  application:\n    name: user-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_user?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.user.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\nfeign:\n  okhttp:\n    enabled: true\n\n','d6ed3beb9759b482676601b721380043','2024-12-06 19:08:10','2024-12-20 16:28:24',NULL,'0:0:0:0:0:0:0:1','','8648100a-894e-469e-b4b7-0b191a94a21d','所有配置','','','yaml','',''),(5,'gateway-service-dev-config.yaml','DEFAULT_GROUP','server:\n  port: 8080\nspring:\n  application:\n    name: knowledge-gateway\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n    gateway:\n      routes:\n        - id: knowledge-service-user\n          uri: lb://user-service\n          predicates:\n            - Path=/api/user/**\n        - id: knowledge-service-file\n          uri: lb://file-service\n          predicates:\n            - Path=/api/files/**\n        - id: knowledge-service-search\n          uri: lb://knowledge-service-search\n          predicates:\n            - Path=/api/search/**\nknowledge:\n  jwt:\n    secret: rwwr5d0a6c8f18db7b913f2b5c6d25c6  # JWT 密钥\n    expiration: 604800000  # JWT 过期时间，默认 7 天\n  auth:\n    excludePaths:\n      - /api/user/login\n      - /api/user/register','5ea700ac7aa9da7077709f8ddd1fd74b','2024-12-20 16:38:53','2024-12-26 09:23:51',NULL,'0:0:0:0:0:0:0:1','','8648100a-894e-469e-b4b7-0b191a94a21d','网关','','','yaml','','');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` varchar(1024) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT '密钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增长标识',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL COMMENT 'id',
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增标识',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `op_type` char(10) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'operation type',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` varchar(1024) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT '密钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (1,10,'common-config.yaml','DEFAULT_GROUP','','# common-config.yml\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n\n','7a5f09efd7f2c728c2df6366b968805c','2024-11-30 15:53:55','2024-11-30 15:53:55',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(1,11,'common-config.yaml','DEFAULT_GROUP','','# common-config.yml\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\nspring:\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr\n','c544891629a65601495033e404d45dbb','2024-11-30 19:26:16','2024-11-30 19:26:17',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(1,12,'common-config.yaml','DEFAULT_GROUP','','# common-config.yml\n\nserver:\n  port: 8081\nspring:\n  config:\n    import:\n      - nacos:nacos-config-example.properties?refreshEnabled=true  # 从 Nacos 获取配置文件，并启用刷新功能\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 sto 包\n\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n\nspring:\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr\n','e404009331f210cc80b2c99217dd22d4','2024-11-30 19:26:39','2024-11-30 19:26:39',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(1,13,'common-config.yaml','DEFAULT_GROUP','','# common-config.yml\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n\n','7a5f09efd7f2c728c2df6366b968805c','2024-11-30 19:27:03','2024-11-30 19:27:03',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(1,14,'common-config.yaml','DEFAULT_GROUP','','# common-config.yml\n\nserver:\n  port: 8081\nspring:\n  config:\n    import:\n      - nacos:nacos-config-example.properties?refreshEnabled=true  # 从 Nacos 获取配置文件，并启用刷新功能\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 sto 包\n\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n\nspring:\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr\n','e404009331f210cc80b2c99217dd22d4','2024-11-30 19:27:34','2024-11-30 19:27:35',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(0,15,'fileservice','DEFAULT_GROUP','','server:\r\n  port: 8081\r\nspring:\r\n  config:\r\n    import:\r\n      - nacos:nacos-config-example.properties?refreshEnabled=true  # 从 Nacos 获取配置文件，并启用刷新功能\r\n  application:\r\n    name: file-service  # 服务名称\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 250927\r\nlogging:\r\n  level:\r\n    cn.svcci: debug\r\n  pattern:\r\n    dateformat: HH:mm:ss:SSS\r\n  file:\r\n    path: \"logs/${spring.application.name}\"\r\n\r\nspringdoc:\r\n  swagger-ui:\r\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\r\n    tags-sorter: alpha  # 标签排序\r\n    operations-sorter: alpha  # 操作排序\r\n  api-docs:\r\n    path: /v3/api-docs  # 设置 API 文档路径\r\n  group-configs:\r\n    - group: \'default\'\r\n      paths-to-match: \'/**\'  # 匹配所有路径\r\n      packages-to-scan:\r\n        - cn.svcci.file.controller  # 扫描 .controller 包\r\n        - cn.svcci.damain.dto  # 扫描 sto 包\r\n\r\n','1da123be3bb6ec0e0d8eade41505d5c3','2024-11-30 19:28:54','2024-11-30 19:28:55',NULL,'0:0:0:0:0:0:0:1','I','8648100a-894e-469e-b4b7-0b191a94a21d',''),(2,16,'fileservice','DEFAULT_GROUP','','server:\r\n  port: 8081\r\nspring:\r\n  config:\r\n    import:\r\n      - nacos:nacos-config-example.properties?refreshEnabled=true  # 从 Nacos 获取配置文件，并启用刷新功能\r\n  application:\r\n    name: file-service  # 服务名称\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: 250927\r\nlogging:\r\n  level:\r\n    cn.svcci: debug\r\n  pattern:\r\n    dateformat: HH:mm:ss:SSS\r\n  file:\r\n    path: \"logs/${spring.application.name}\"\r\n\r\nspringdoc:\r\n  swagger-ui:\r\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\r\n    tags-sorter: alpha  # 标签排序\r\n    operations-sorter: alpha  # 操作排序\r\n  api-docs:\r\n    path: /v3/api-docs  # 设置 API 文档路径\r\n  group-configs:\r\n    - group: \'default\'\r\n      paths-to-match: \'/**\'  # 匹配所有路径\r\n      packages-to-scan:\r\n        - cn.svcci.file.controller  # 扫描 .controller 包\r\n        - cn.svcci.damain.dto  # 扫描 sto 包\r\n\r\n','1da123be3bb6ec0e0d8eade41505d5c3','2024-11-30 19:30:03','2024-11-30 19:30:03',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(2,17,'fileservice','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  config:\n    import:\n      - nacos:nacos-config-example.properties?refreshEnabled=true  # 从 Nacos 获取配置文件，并启用刷新功能\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n\n  logging:\n    level:\n      cn.svcci: debug\n    pattern:\n      dateformat: HH:mm:ss:SSS\n    file:\n      path: \"logs/${spring.application.name}\"\n\n  springdoc:\n    swagger-ui:\n      path: /swagger-ui.html  # 设置 Swagger UI 的路径\n      tags-sorter: alpha  # 标签排序\n      operations-sorter: alpha  # 操作排序\n    api-docs:\n      path: /v3/api-docs  # 设置 API 文档路径\n    group-configs:\n      - group: \'default\'\n        paths-to-match: \'/**\'  # 匹配所有路径\n        packages-to-scan:\n          - cn.svcci.file.controller  # 扫描 .controller 包\n          - cn.svcci.damain.dto  # 扫描 dto 包\n\n  mybatis-plus:\n    configuration:\n      default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n    global-config:\n      db-config:\n        update-strategy: not_null\n        id-type: auto\n\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr\n','7ec24881d0a725ed80825a1bdba8973f','2024-11-30 19:30:29','2024-11-30 19:30:29',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(0,18,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','1','c4ca4238a0b923820dcc509a6f75849b','2024-11-30 19:47:31','2024-11-30 19:47:31',NULL,'0:0:0:0:0:0:0:1','I','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,19,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','1','c4ca4238a0b923820dcc509a6f75849b','2024-11-30 19:48:26','2024-11-30 19:48:26',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(1,20,'common-config.yaml','DEFAULT_GROUP','','# common-config.yml\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\nspring:\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr\n','c544891629a65601495033e404d45dbb','2024-11-30 19:48:34','2024-11-30 19:48:35',NULL,'0:0:0:0:0:0:0:1','D','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,21,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n\n  logging:\n    level:\n      cn.svcci: debug\n    pattern:\n      dateformat: HH:mm:ss:SSS\n    file:\n      path: \"logs/${spring.application.name}\"\n\n  springdoc:\n    swagger-ui:\n      path: /swagger-ui.html  # 设置 Swagger UI 的路径\n      tags-sorter: alpha  # 标签排序\n      operations-sorter: alpha  # 操作排序\n    api-docs:\n      path: /v3/api-docs  # 设置 API 文档路径\n    group-configs:\n      - group: \'default\'\n        paths-to-match: \'/**\'  # 匹配所有路径\n        packages-to-scan:\n          - cn.svcci.file.controller  # 扫描 .controller 包\n          - cn.svcci.damain.dto  # 扫描 dto 包\n\n  mybatis-plus:\n    configuration:\n      default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n    global-config:\n      db-config:\n        update-strategy: not_null\n        id-type: auto\n\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr\n','5d029d29470afa44e5af688e3ac33346','2024-11-30 20:02:27','2024-11-30 20:02:27',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,22,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr  \n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n\n','31bc532dfa944530afbc7f07e561c354','2024-11-30 20:03:01','2024-11-30 20:03:02',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,23,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr  \n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n\n','31bc532dfa944530afbc7f07e561c354','2024-11-30 20:31:03','2024-11-30 20:31:03',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,24,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr  \n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10MB\n      max-request-size: 10MB\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n\n','4a4f396935f052504da0148cd6114f82','2024-11-30 20:56:52','2024-11-30 20:56:52',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,25,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr  \n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10MB\n      max-request-size: 10MB\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n\n','b9301f5eefd681d7a3068fe5b879d6dc','2024-11-30 21:19:44','2024-11-30 21:19:44',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,26,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-chengdu.aliyuncs.com\n        access-key-id: LTAI5tKUT5wevePbz931gqLU\n        access-key-secret: 5rlNChW1SajR1DK29xNtLFlKivMCbb\n        bucket-name: web-rw\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10MB\n      max-request-size: 10MB\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n\n','08ac7bde4cde4d097f0a48757386237e','2024-12-01 16:20:47','2024-12-01 16:20:47',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,27,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-chengdu.aliyuncs.com\n        access-key-id: LTAI5tKUT5wevePbz931gqLU\n        access-key-secret: 5rlNChW1SajR1DK29xNtLFlKivMCbb\n        bucket-name: web-rw\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10MB\n      max-request-size: 10MB\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\nfile:\n  upload:\n    maxSize: 10MB        # 设置最大文件大小\n    allowedTypes:        # 允许的文件类型\n      - \"pdf\"\n      - \"docx\"\n      - \"txt\"\n      - \"md\"\n    allowedMimeTypes:    # 允许的 MIME 类型\n      - \"application/pdf\"\n      - \"application/msword\"\n      - \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\"\n      - \"text/plain\"\n      - \"text/markdown\"\n      - \"text/x-markdown\"\n','527798a92b633b9767c35f5cecb0c7ca','2024-12-05 15:37:36','2024-12-05 15:37:36',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,28,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-chengdu.aliyuncs.com\n        access-key-id: LTAI5tKUT5wevePbz931gqLU\n        access-key-secret: 5rlNChW1SajR1DK29xNtLFlKivMCbb\n        bucket-name: web-rw\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10485760\n      max-request-size: 10485760\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\nfile:\n  upload:\n    maxSize: 10MB        # 设置最大文件大小\n    allowedTypes:        # 允许的文件类型\n      - \"pdf\"\n      - \"docx\"\n      - \"txt\"\n      - \"md\"\n    allowedMimeTypes:    # 允许的 MIME 类型\n      - \"application/pdf\"\n      - \"application/msword\"\n      - \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\"\n      - \"text/plain\"\n      - \"text/markdown\"\n      - \"text/x-markdown\"\n','d347f94b66fccb40d854b9da66ed9146','2024-12-05 15:39:18','2024-12-05 15:39:18',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(0,29,'user-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-chengdu.aliyuncs.com\n        access-key-id: LTAI5tKUT5wevePbz931gqLU\n        access-key-secret: 5rlNChW1SajR1DK29xNtLFlKivMCbb\n        bucket-name: web-rw\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10485760\n      max-request-size: 10485760\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\nfile:\n  upload:\n    maxSize: 10485760        # 设置最大文件大小\n    allowedTypes:        # 允许的文件类型\n      - \"pdf\"\n      - \"docx\"\n      - \"txt\"\n      - \"md\"\n    allowedMimeTypes:    # 允许的 MIME 类型\n      - \"application/pdf\"\n      - \"application/msword\"\n      - \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\"\n      - \"text/plain\"\n      - \"text/markdown\"\n      - \"text/x-markdown\"\n','3f164cebb8498b581f2c71dd5c854b2b','2024-12-06 19:08:09','2024-12-06 19:08:10',NULL,'0:0:0:0:0:0:0:1','I','8648100a-894e-469e-b4b7-0b191a94a21d',''),(4,30,'user-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-chengdu.aliyuncs.com\n        access-key-id: LTAI5tKUT5wevePbz931gqLU\n        access-key-secret: 5rlNChW1SajR1DK29xNtLFlKivMCbb\n        bucket-name: web-rw\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10485760\n      max-request-size: 10485760\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\nfile:\n  upload:\n    maxSize: 10485760        # 设置最大文件大小\n    allowedTypes:        # 允许的文件类型\n      - \"pdf\"\n      - \"docx\"\n      - \"txt\"\n      - \"md\"\n    allowedMimeTypes:    # 允许的 MIME 类型\n      - \"application/pdf\"\n      - \"application/msword\"\n      - \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\"\n      - \"text/plain\"\n      - \"text/markdown\"\n      - \"text/x-markdown\"\n','3f164cebb8498b581f2c71dd5c854b2b','2024-12-06 19:09:48','2024-12-06 19:09:49',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,31,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-chengdu.aliyuncs.com\n        access-key-id: LTAI5tKUT5wevePbz931gqLU\n        access-key-secret: 5rlNChW1SajR1DK29xNtLFlKivMCbb\n        bucket-name: web-rw\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10485760\n      max-request-size: 10485760\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\nfile:\n  upload:\n    maxSize: 10485760        # 设置最大文件大小\n    allowedTypes:        # 允许的文件类型\n      - \"pdf\"\n      - \"docx\"\n      - \"txt\"\n      - \"md\"\n    allowedMimeTypes:    # 允许的 MIME 类型\n      - \"application/pdf\"\n      - \"application/msword\"\n      - \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\"\n      - \"text/plain\"\n      - \"text/markdown\"\n      - \"text/x-markdown\"\n','3f164cebb8498b581f2c71dd5c854b2b','2024-12-06 20:04:09','2024-12-06 20:04:09',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,32,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-chengdu.aliyuncs.com\n        access-key-id: LTAI5tKUT5wevePbz931gqLU\n        access-key-secret: 5rlNChW1SajR1DK29xNtLFlKivMCbb\n        bucket-name: web-rw\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10485760\n      max-request-size: 10485760\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\nfegin:\n  okhttp:\n    enabled: true\n\n\nfile:\n  upload:\n    maxSize: 10485760        # 设置最大文件大小\n    allowedTypes:        # 允许的文件类型\n      - \"pdf\"\n      - \"docx\"\n      - \"txt\"\n      - \"md\"\n    allowedMimeTypes:    # 允许的 MIME 类型\n      - \"application/pdf\"\n      - \"application/msword\"\n      - \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\"\n      - \"text/plain\"\n      - \"text/markdown\"\n      - \"text/x-markdown\"\n','de0e996487d076194bc010d53e0807d6','2024-12-06 20:39:31','2024-12-06 20:39:32',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(4,33,'user-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8080\n\nspring:\n  application:\n    name: user-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_user?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.user.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\n','03f747f46160451ad2dbac96d52821d2','2024-12-06 21:16:09','2024-12-06 21:16:09',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(2,34,'fileservice','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  config:\n    import:\n      - nacos:nacos-config-example.properties?refreshEnabled=true  # 从 Nacos 获取配置文件，并启用刷新功能\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n\n  logging:\n    level:\n      cn.svcci: debug\n    pattern:\n      dateformat: HH:mm:ss:SSS\n    file:\n      path: \"logs/${spring.application.name}\"\n\n  springdoc:\n    swagger-ui:\n      path: /swagger-ui.html  # 设置 Swagger UI 的路径\n      tags-sorter: alpha  # 标签排序\n      operations-sorter: alpha  # 操作排序\n    api-docs:\n      path: /v3/api-docs  # 设置 API 文档路径\n    group-configs:\n      - group: \'default\'\n        paths-to-match: \'/**\'  # 匹配所有路径\n        packages-to-scan:\n          - cn.svcci.file.controller  # 扫描 .controller 包\n          - cn.svcci.damain.dto  # 扫描 dto 包\n\n  mybatis-plus:\n    configuration:\n      default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n    global-config:\n      db-config:\n        update-strategy: not_null\n        id-type: auto\n\n  cloud:\n    alibaba:\n      oss:\n        endpoint: web-rwwr.oss-cn-hangzhou.aliyuncs.com\n        access-key-id: LTAI5tG6SWkZ2HaANSfPAU2X\n        access-key-secret: 62XxejYNT5OoXPaUf2RjuGQiKxTjHx\n        bucket-name: web-rwwr\n','7ec24881d0a725ed80825a1bdba8973f','2024-12-20 16:27:59','2024-12-20 16:28:00',NULL,'0:0:0:0:0:0:0:1','D','8648100a-894e-469e-b4b7-0b191a94a21d',''),(3,35,'file-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8081\n\nspring:\n  application:\n    name: file-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_file?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n  cloud:\n    alibaba:\n      oss:\n        endpoint: oss-cn-chengdu.aliyuncs.com\n        access-key-id: LTAI5tKUT5wevePbz931gqLU\n        access-key-secret: 5rlNChW1SajR1DK29xNtLFlKivMCbb\n        bucket-name: web-rw\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 10485760\n      max-request-size: 10485760\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.file.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\nfeign:\n  okhttp:\n    enabled: true\n\n\nfile:\n  upload:\n    maxSize: 10485760        # 设置最大文件大小\n    allowedTypes:        # 允许的文件类型\n      - \"pdf\"\n      - \"docx\"\n      - \"txt\"\n      - \"md\"\n    allowedMimeTypes:    # 允许的 MIME 类型\n      - \"application/pdf\"\n      - \"application/msword\"\n      - \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\"\n      - \"text/plain\"\n      - \"text/markdown\"\n      - \"text/x-markdown\"\n','870a3e0ce64cac63e6bc79bbfe5a6aaf','2024-12-20 16:28:13','2024-12-20 16:28:13',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(4,36,'user-service-dev-sql-config.yaml','DEFAULT_GROUP','','server:\n  port: 8080\n\nspring:\n  application:\n    name: user-service  # 服务名称\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/knowledge_user?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 250927\n\nlogging:\n  level:\n    cn.svcci: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"\n\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html  # 设置 Swagger UI 的路径\n    tags-sorter: alpha  # 标签排序\n    operations-sorter: alpha  # 操作排序\n  api-docs:\n    path: /v3/api-docs  # 设置 API 文档路径\n  group-configs:\n    - group: \'default\'\n      paths-to-match: \'/**\'  # 匹配所有路径\n      packages-to-scan:\n        - cn.svcci.user.controller  # 扫描 .controller 包\n        - cn.svcci.damain.dto  # 扫描 dto 包\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto\n\nfeign:\n  okhttp:\n    enabled: true\n\n','d38a0bd2cb026d0739ad8cc8d664de35','2024-12-20 16:28:23','2024-12-20 16:28:24',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(0,37,'gateway-service-dev-config.yaml','DEFAULT_GROUP','','server:\r\n  port: 8080\r\nspring:\r\n  application:\r\n    name: knowledge-gateway\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 127.0.0.1:8848\r\n    gateway:\r\n      routes:\r\n        - id: knowledge-service\r\n          uri: lb://knowledge-service-user\r\n          predicates:\r\n            - Path=/api/user/**\r\n        - id: knowledge-service-admin\r\n          uri: lb://knowledge-service-file\r\n          predicates:\r\n            - Path=/api/file/**\r\n        - id: knowledge-service-search\r\n          uri: lb://knowledge-service-search\r\n          predicates:\r\n            - Path=/api/search/**','010156263f82109a7c01a737694590ca','2024-12-20 16:38:52','2024-12-20 16:38:53',NULL,'0:0:0:0:0:0:0:1','I','8648100a-894e-469e-b4b7-0b191a94a21d',''),(5,38,'gateway-service-dev-config.yaml','DEFAULT_GROUP','','server:\r\n  port: 8080\r\nspring:\r\n  application:\r\n    name: knowledge-gateway\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 127.0.0.1:8848\r\n    gateway:\r\n      routes:\r\n        - id: knowledge-service\r\n          uri: lb://knowledge-service-user\r\n          predicates:\r\n            - Path=/api/user/**\r\n        - id: knowledge-service-admin\r\n          uri: lb://knowledge-service-file\r\n          predicates:\r\n            - Path=/api/file/**\r\n        - id: knowledge-service-search\r\n          uri: lb://knowledge-service-search\r\n          predicates:\r\n            - Path=/api/search/**','010156263f82109a7c01a737694590ca','2024-12-20 16:55:00','2024-12-20 16:55:01',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(5,39,'gateway-service-dev-config.yaml','DEFAULT_GROUP','','server:\n  port: 8080\nspring:\n  application:\n    name: knowledge-gateway\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n    gateway:\n      routes:\n        - id: knowledge-service-user\n          uri: lb://user-service\n          predicates:\n            - Path=/api/user/**\n        - id: knowledge-service-file\n          uri: lb://file-service\n          predicates:\n            - Path=/api/file/**\n        - id: knowledge-service-search\n          uri: lb://knowledge-service-search\n          predicates:\n            - Path=/api/search/**','5aa763d8e705e091d84ac23cd89b831a','2024-12-20 16:56:54','2024-12-20 16:56:54',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(5,40,'gateway-service-dev-config.yaml','DEFAULT_GROUP','','server:\n  port: 8080\nspring:\n  application:\n    name: knowledge-gateway\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n    gateway:\n      routes:\n        - id: knowledge-service-user\n          uri: lb://user-service\n          predicates:\n            - Path=/api/user/**\n        - id: knowledge-service-file\n          uri: lb://file-service\n          predicates:\n            - Path=/api/files/**\n        - id: knowledge-service-search\n          uri: lb://knowledge-service-search\n          predicates:\n            - Path=/api/search/**','c67f35732fcb4b1c52df49fb1803cd3a','2024-12-21 22:15:48','2024-12-21 22:15:48',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(5,41,'gateway-service-dev-config.yaml','DEFAULT_GROUP','','server:\n  port: 8080\nspring:\n  application:\n    name: knowledge-gateway\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n    gateway:\n      routes:\n        - id: knowledge-service-user\n          uri: lb://user-service\n          predicates:\n            - Path=/api/user/**\n        - id: knowledge-service-file\n          uri: lb://file-service\n          predicates:\n            - Path=/api/files/**\n        - id: knowledge-service-search\n          uri: lb://knowledge-service-search\n          predicates:\n            - Path=/api/search/**\nknowledge:\n  jwt:\n    secret: rwwr5d0a6c8f18db7b913f2b5c6d25c6a  # JWT 密钥\n    expiration: 604800  # JWT 过期时间，单位秒，默认 7 天\n  auth:\n    excludePaths:\n      - /api/user/login\n      - /api/user/register','6e273e9ba4803302996da60408c68eeb','2024-12-22 16:32:44','2024-12-22 16:32:45',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d',''),(5,42,'gateway-service-dev-config.yaml','DEFAULT_GROUP','','server:\n  port: 8080\nspring:\n  application:\n    name: knowledge-gateway\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n    gateway:\n      routes:\n        - id: knowledge-service-user\n          uri: lb://user-service\n          predicates:\n            - Path=/api/user/**\n        - id: knowledge-service-file\n          uri: lb://file-service\n          predicates:\n            - Path=/api/files/**\n        - id: knowledge-service-search\n          uri: lb://knowledge-service-search\n          predicates:\n            - Path=/api/search/**\nknowledge:\n  jwt:\n    secret: rwwr5d0a6c8f18db7b913f2b5c6d25c6  # JWT 密钥\n    expiration: 604800  # JWT 过期时间，单位秒，默认 7 天\n  auth:\n    excludePaths:\n      - /api/user/login\n      - /api/user/register','85369678feaa24bf35cb5958522e5058','2024-12-26 09:23:51','2024-12-26 09:23:51',NULL,'0:0:0:0:0:0:0:1','U','8648100a-894e-469e-b4b7-0b191a94a21d','');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL COMMENT 'role',
  `resource` varchar(128) NOT NULL COMMENT 'resource',
  `action` varchar(8) NOT NULL COMMENT 'action',
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL COMMENT 'username',
  `role` varchar(50) NOT NULL COMMENT 'role',
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
INSERT INTO `tenant_info` VALUES (1,'1','8648100a-894e-469e-b4b7-0b191a94a21d','dev','本地测试','nacos',1732349084092,1732349084092);
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL COMMENT 'username',
  `password` varchar(500) NOT NULL COMMENT 'password',
  `enabled` tinyint(1) NOT NULL COMMENT 'enabled',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-30 19:22:44
