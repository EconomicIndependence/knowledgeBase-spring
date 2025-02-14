-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: knowledge_user
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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '角色唯一标识（主键，递增 ID）',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称，唯一',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色描述',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','管理员角色','2024-11-22 20:03:06','2024-11-22 20:03:06');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识（主键，递增 ID）',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名，唯一，大小写不敏感',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户邮箱，唯一',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码（加密过）',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像(未上传则由应用层提供默认头像)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最后更新时间',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态（0：活跃，1：封禁，2：其他状态）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'rwwr','2509278665@qq.com','$2a$10$816uwdozYnMuSIiRMceH..1nd3BPi1hCBkz8.LDQ2dc/Y5Mc5kDAC',NULL,'2024-11-22 20:03:06','2024-11-22 20:03:06',0),(2,'usertest2','usertest2@qq.com','$2a$10$sOnmhw8jvnVBQEZawJfHxe.6/IyrazW.PkuyMfJYzPdv1sDOSKyfq',NULL,'2024-12-13 15:58:26','2024-12-13 15:58:26',0),(3,'usertest','usertest@qq.com','$2a$10$5.UkL9lNWK3x819P8XgUp.b7sZdLpkwEdwL.vE1scALQm.kz0pOl6',NULL,'2024-12-21 19:07:18','2024-12-21 19:07:18',0),(4,'rwwwr','25092786655@qq.com','$2a$10$agH.5p0Mixs1fisViSYu3uXsqccRVabY7s71mloC0GcLYxNRpiauS',NULL,'2024-12-27 20:02:19','2024-12-27 20:02:19',0),(5,'dwadw','250927866995@qq.com','$2a$10$O52wbPxGZOs.zuI8vm0/xuLx1Z8n23VJn8R0RKmpfrgsETmursP6C',NULL,'2024-12-27 20:04:27','2024-12-27 20:04:27',0),(6,'dawdwa','2239626478@qq.com','$2a$10$4LHf/u22OaOOt8sLt/pz6.eiPRIN4ihC03KC23RLmZ7ic3D0S9cv2',NULL,'2024-12-28 01:11:21','2024-12-28 01:11:21',0),(7,'dwada','1234567895@qq.com','$2a$10$AkELO/PXqxbebcYEU/l/QuqBaiCNs64i7svUHFZGpYFY2HCJJOhwO',NULL,'2024-12-28 01:12:11','2024-12-28 01:12:11',0),(8,'dafgdreg','25092grdg786655@qq.com','$2a$10$.J9wRbOXjTcHGlDX/foc9OCNJ5YHNAeitjbueM15dz3PgdAW/1rWm',NULL,'2024-12-28 01:17:31','2024-12-28 01:17:31',0),(9,'xxxy','3474146922@qq.com','$2a$10$guDtODxjxIPeYz3uPAM.euKwYyQ5ZPyg7JYKp4vxmTvfOTxuYe2Tm',NULL,'2024-12-30 10:32:18','2024-12-30 10:32:18',0),(10,'rwawr','usertedst@qq.com','$2a$10$DbjZRP2XGOylh48zoAzMZuEVYQnpdHYf2SruJ7DEEpMmLFFzJPAdG',NULL,'2024-12-30 10:49:52','2024-12-30 10:49:52',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` bigint unsigned NOT NULL COMMENT '用户 ID，关联到用户表',
  `role_id` bigint unsigned NOT NULL COMMENT '角色 ID，关联到角色表',
  `assigned_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '角色分配时间',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  KEY `idx_assigned_at` (`assigned_at`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户-角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,'2024-11-22 20:03:06'),(2,1,'2024-12-13 15:58:26'),(3,1,'2024-12-21 19:07:18'),(4,1,'2024-12-27 20:02:19'),(5,1,'2024-12-27 20:04:27'),(6,1,'2024-12-28 01:11:21'),(7,1,'2024-12-28 01:12:11'),(8,1,'2024-12-28 01:17:31'),(9,1,'2024-12-30 10:32:18'),(10,1,'2024-12-30 10:49:52');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-30 19:22:49
