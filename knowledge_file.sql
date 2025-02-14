-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: knowledge_file
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
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_info` (
  `file_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '文件唯一标识',
  `user_name` varchar(50) NOT NULL COMMENT '上传者用户名称（通过业务层进行外部关联）',
  `file_name` varchar(255) NOT NULL COMMENT '文件名',
  `file_path` varchar(255) NOT NULL COMMENT '文件存储路径',
  `oss_url` varchar(255) NOT NULL COMMENT '阿里云oss链接',
  `file_size` bigint NOT NULL COMMENT '文件大小（字节）',
  `file_type` varchar(255) NOT NULL COMMENT '文件类型（MIME 类型，如application/pdf）',
  `upload_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '文件状态（0：正常，1：已删除，2：垃圾回收站）',
  `is_public` tinyint(1) DEFAULT '0' COMMENT '是否公开访问',
  `tags` json DEFAULT NULL COMMENT '文件标签（支持分类和筛选）',
  `hash` varchar(64) DEFAULT NULL COMMENT '文件内容的哈希值，用于文件去重',
  `metadata` json DEFAULT NULL COMMENT '文件额外元信息（如上传设备信息、客户端 IP 等）',
  `feature_vector` json DEFAULT NULL COMMENT '用于存储文件的向量数据',
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `idx_user_id` (`user_name`),
  KEY `idx_file_status` (`status`),
  KEY `idx_file_name` (`file_name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件元数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_info`
--

LOCK TABLES `file_info` WRITE;
/*!40000 ALTER TABLE `file_info` DISABLE KEYS */;
INSERT INTO `file_info` VALUES (1,'rwwr','R-C.jpg','uploads/rwwrR-C.jpg','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/rwwrR-C.jpg',47009,'image/jpeg','2024-12-06 19:29:50',0,0,NULL,NULL,NULL,NULL,1),(3,'usertest','前端开发.md','uploads/rwwr/前端开发.md','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/rwwr/前端开发.md',4278,'text/markdown','2024-12-06 19:49:20',0,0,NULL,NULL,NULL,NULL,3),(4,'usertest','基于Elasticsearch的个人知识库搭建.md','uploads/rwwr/基于Elasticsearch的个人知识库搭建.md','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/rwwr/基于Elasticsearch的个人知识库搭建.md',6296,'text/markdown','2024-12-06 21:23:00',0,0,NULL,NULL,NULL,NULL,3),(5,'usertest','前端开发.pdf','uploads/rwwr/前端开发.pdf','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/rwwr/前端开发.pdf',3668310,'application/pdf','2024-12-18 14:09:00',0,0,NULL,NULL,NULL,NULL,3),(6,'usertest','前端开发.pdf','uploads/rwwr/前端开发.pdf','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/rwwr/前端开发.pdf',3668310,'application/pdf','2024-12-20 16:57:01',0,0,NULL,NULL,NULL,NULL,3),(7,'usertest','22级智能1班王明言2271130111毕业设计成果报告书.docx','uploads/usertest/22级智能1班王明言2271130111毕业设计成果报告书.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/22级智能1班王明言2271130111毕业设计成果报告书.docx',119928,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-26 09:06:13',0,0,NULL,NULL,NULL,NULL,3),(8,'usertest','毕业设计成果报告书 王明言.docx','uploads/usertest/毕业设计成果报告书 王明言.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/毕业设计成果报告书 王明言.docx',77756,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 02:41:37',0,0,NULL,NULL,NULL,NULL,3),(9,'usertest','毕业设计成果报告书 王明言.docx','uploads/usertest/毕业设计成果报告书 王明言.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/毕业设计成果报告书 王明言.docx',77756,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 03:10:06',0,0,NULL,NULL,NULL,NULL,3),(10,'usertest','毕业设计成果报告书 王明言.docx','uploads/usertest/毕业设计成果报告书 王明言.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/毕业设计成果报告书 王明言.docx',77756,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 03:25:06',0,0,NULL,NULL,NULL,NULL,3),(11,'usertest','毕业设计成果报告书 王明言.docx','uploads/usertest/毕业设计成果报告书 王明言.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/毕业设计成果报告书 王明言.docx',77756,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 04:06:33',0,0,NULL,NULL,NULL,NULL,3),(12,'usertest','毕业设计成果报告书 王明言.docx','uploads/usertest/毕业设计成果报告书 王明言.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/毕业设计成果报告书 王明言.docx',77756,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 04:07:30',0,0,NULL,NULL,NULL,NULL,3),(13,'usertest','毕业设计成果报告书 王明言.docx','uploads/usertest/毕业设计成果报告书 王明言.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/毕业设计成果报告书 王明言.docx',77756,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 04:11:38',0,0,NULL,NULL,NULL,NULL,3),(14,'usertest','网关登录校验示例.docx','uploads/usertest/网关登录校验示例.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/网关登录校验示例.docx',720179,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 04:12:56',0,0,NULL,NULL,NULL,NULL,3),(15,'usertest','网关登录校验示例.docx','uploads/usertest/网关登录校验示例.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/网关登录校验示例.docx',720179,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 04:22:03',0,0,NULL,NULL,NULL,NULL,3),(16,'usertest','网关登录校验示例.docx','uploads/usertest/网关登录校验示例.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/网关登录校验示例.docx',720179,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 04:49:27',0,0,NULL,NULL,NULL,NULL,3),(17,'usertest','附件3-四川文化产业职业学院毕业设计任务书.docx','uploads/usertest/附件3-四川文化产业职业学院毕业设计任务书.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/附件3-四川文化产业职业学院毕业设计任务书.docx',303102,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 05:02:57',0,0,NULL,NULL,NULL,NULL,3),(18,'usertest','网关登录校验示例.docx','uploads/usertest/网关登录校验示例.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/网关登录校验示例.docx',720179,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 05:03:34',0,0,NULL,NULL,NULL,NULL,3),(20,'usertest','markdown语法.md','uploads/usertest/markdown语法.md','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/markdown语法.md',15,'text/markdown','2024-12-28 06:06:21',0,0,NULL,NULL,NULL,NULL,3),(22,'usertest','毕业设计成果报告书 王明言.docx','uploads/usertest/毕业设计成果报告书 王明言.docx','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/毕业设计成果报告书 王明言.docx',120392,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2024-12-28 07:23:00',0,0,NULL,NULL,NULL,NULL,3),(23,'usertest','毕业设计.txt','uploads/usertest/毕业设计.txt','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/毕业设计.txt',6,'text/plain','2024-12-28 07:24:02',0,0,NULL,NULL,NULL,NULL,3),(24,'usertest','markdown演示.md','uploads/usertest/markdown演示.md','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/markdown演示.md',21,'text/markdown','2024-12-28 07:24:47',0,0,NULL,NULL,NULL,NULL,3),(25,'usertest','markdown演示.md','uploads/usertest/markdown演示.md','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/markdown演示.md',21,'text/markdown','2024-12-28 07:25:39',0,0,NULL,NULL,NULL,NULL,3),(26,'usertest','markdown演示文稿.md','uploads/usertest/markdown演示文稿.md','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/markdown演示文稿.md',21,'text/markdown','2024-12-28 07:25:55',0,0,NULL,NULL,NULL,NULL,3),(27,'usertest','markdown演示文稿.md','uploads/usertest/markdown演示文稿.md','https://web-rw.oss-cn-chengdu.aliyuncs.com/uploads/usertest/markdown演示文稿.md',26,'text/markdown','2024-12-30 10:48:24',0,0,NULL,NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_log`
--

DROP TABLE IF EXISTS `file_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志唯一标识',
  `file_id` bigint NOT NULL COMMENT '关联的文件ID',
  `user_id` bigint NOT NULL COMMENT '操作者用户ID（外部用户表关联）',
  `action` varchar(50) NOT NULL COMMENT '操作类型（如upload、download、delete等）',
  `action_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `details` text COMMENT '其他操作细节（如IP、客户端等信息）',
  PRIMARY KEY (`id`),
  KEY `idx_file_id` (`file_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_action_time` (`action_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_log`
--

LOCK TABLES `file_log` WRITE;
/*!40000 ALTER TABLE `file_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_recycle`
--

DROP TABLE IF EXISTS `file_recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_recycle` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '垃圾记录唯一标识',
  `file_id` bigint NOT NULL COMMENT '关联的文件ID',
  `deleted_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文件删除时间',
  `expire_time` datetime NOT NULL COMMENT '垃圾回收站过期时间',
  `user_id` bigint NOT NULL COMMENT '操作者用户ID（外部用户表关联）',
  PRIMARY KEY (`id`),
  KEY `idx_file_id` (`file_id`),
  KEY `idx_expire_time` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='垃圾回收记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_recycle`
--

LOCK TABLES `file_recycle` WRITE;
/*!40000 ALTER TABLE `file_recycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_recycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_search_index`
--

DROP TABLE IF EXISTS `file_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_search_index` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '索引唯一标识',
  `file_id` bigint NOT NULL COMMENT '关联的文件ID',
  `keywords` json DEFAULT NULL COMMENT '索引关键字（如标签、描述等）',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名（冗余存储用于快速同步）',
  `file_tags` json DEFAULT NULL COMMENT '文件标签（冗余存储用于分类与过滤）',
  `content_snippet` text COMMENT '文件内容片段（简短文本）',
  PRIMARY KEY (`id`),
  KEY `idx_file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='搜索索引辅助表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_search_index`
--

LOCK TABLES `file_search_index` WRITE;
/*!40000 ALTER TABLE `file_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_storage`
--

DROP TABLE IF EXISTS `file_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_storage` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '存储统计唯一标识',
  `user_id` bigint NOT NULL COMMENT '用户ID（通过业务层管理外部用户表）',
  `total_space` bigint NOT NULL COMMENT '分配的总存储空间（字节）',
  `used_space` bigint NOT NULL DEFAULT '0' COMMENT '已使用存储空间（字节）',
  `remaining_space` bigint GENERATED ALWAYS AS ((`total_space` - `used_space`)) STORED COMMENT '剩余存储空间（字节）',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户存储空间统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_storage`
--

LOCK TABLES `file_storage` WRITE;
/*!40000 ALTER TABLE `file_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_storage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-30 19:22:30
