-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: practice
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `t_book_info`
--

DROP TABLE IF EXISTS `t_book_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_book_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `author` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '作者',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '描述',
  `inventory` int DEFAULT NULL COMMENT '总数',
  `language` int DEFAULT NULL COMMENT '语言1:中文，2：英文，3其它',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '书名',
  `number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编号',
  `publication_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '出版日期',
  `publishing_house` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '出版社',
  `typeid` bigint DEFAULT NULL COMMENT '类别ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='图书信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_book_info`
--

LOCK TABLES `t_book_info` WRITE;
/*!40000 ALTER TABLE `t_book_info` DISABLE KEYS */;
INSERT INTO `t_book_info` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `author`, `description`, `inventory`, `language`, `name`, `number`, `publication_date`, `publishing_house`, `typeid`) VALUES (5,1,'2023-07-17 15:17:01',1,'2023-07-24 11:13:38','王五','时光易逝',9,1,'时光日记','202307174796','2023-07-13','教育出版社',2),(7,1,'2023-07-17 17:51:51',1,'2023-07-24 11:13:46','张三','快速入门java基础',7,1,'Java基础','202307175971','2023-07-01','教育出版社',1),(8,1,'2023-07-17 18:30:57',1,'2023-07-24 11:13:43','张三','亲近自然',8,1,'走近自然','202307172105','2023-06-09','教育出版社',7),(9,1,'2023-07-17 18:32:36',1,'2023-07-24 11:13:50','李四','关注孩子健康成长',0,2,'心里健康与成长','202307178915','2023-06-05','教育出版社',5),(10,1,'2023-07-18 09:36:59',1,'2023-07-24 11:13:58','王五','科学之路就在脚下',9,1,'走近科学','202307183883','2023-06-18','教育出版社',6);
/*!40000 ALTER TABLE `t_book_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_book_type`
--

DROP TABLE IF EXISTS `t_book_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_book_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类别名称',
  `num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='图书类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_book_type`
--

LOCK TABLES `t_book_type` WRITE;
/*!40000 ALTER TABLE `t_book_type` DISABLE KEYS */;
INSERT INTO `t_book_type` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `name`, `num`) VALUES (1,1,'2023-07-18 17:32:50',1,'2023-07-18 17:32:50','技术类',1),(2,1,'2023-07-18 17:33:25',1,'2023-07-24 09:14:39','文学类',2),(3,1,'2023-07-18 17:33:38',1,'2023-07-24 09:14:51','教育类',6),(4,1,'2023-07-18 17:34:16',1,'2023-07-18 17:34:16','儿童类',4),(5,1,'2023-07-18 17:34:28',1,'2023-07-18 17:34:28','心理类',5),(6,1,'2023-07-18 17:34:48',1,'2023-07-18 17:36:43','社会科学类',8),(7,1,'2023-07-18 17:34:48',1,'2023-07-18 17:35:37','自然科学类',7);
/*!40000 ALTER TABLE `t_book_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_borrowing_record`
--

DROP TABLE IF EXISTS `t_borrowing_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_borrowing_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `bookid` bigint DEFAULT NULL COMMENT '图书ID',
  `return_time` varchar(32) DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  `borrow_time` varchar(32) DEFAULT NULL,
  `typeid` bigint DEFAULT NULL COMMENT '类别ID',
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='借阅记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_borrowing_record`
--

LOCK TABLES `t_borrowing_record` WRITE;
/*!40000 ALTER TABLE `t_borrowing_record` DISABLE KEYS */;
INSERT INTO `t_borrowing_record` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `bookid`, `return_time`, `userid`, `borrow_time`, `typeid`, `status`) VALUES (24,6,'2023-07-24 11:14:37',6,'2023-07-24 11:14:37',8,'2023-07-28 00:00:00',6,'2023-07-24 11:14:37',7,1),(25,5,'2023-07-24 11:15:08',5,'2023-07-24 11:15:08',7,'2023-08-08 11:32:48',5,'2023-07-24 11:15:07',1,1),(26,5,'2023-07-24 11:15:13',5,'2023-07-24 11:15:13',5,'2023-08-10 00:00:00',5,'2023-07-24 11:15:13',2,1),(28,6,'2023-07-24 20:04:07',6,'2023-07-24 20:04:07',10,'2023-07-24 20:04:13',6,'2023-07-24 20:04:06',6,0),(29,5,'2023-07-25 09:26:22',5,'2023-07-25 09:26:22',7,'2023-08-04 00:00:00',5,'2023-07-25 09:26:21',1,1),(30,5,'2023-07-25 09:26:29',5,'2023-07-25 09:26:29',7,'2023-08-04 00:00:00',5,'2023-07-25 09:26:29',1,1),(31,5,'2023-07-25 09:26:54',5,'2023-07-25 09:26:54',8,'2023-08-08 00:00:00',5,'2023-07-25 09:26:54',7,1);
/*!40000 ALTER TABLE `t_borrowing_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_cfg`
--

DROP TABLE IF EXISTS `t_sys_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_cfg` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `cfg_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `cfg_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数名',
  `cfg_value` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='系统参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_cfg`
--

LOCK TABLES `t_sys_cfg` WRITE;
/*!40000 ALTER TABLE `t_sys_cfg` DISABLE KEYS */;
INSERT INTO `t_sys_cfg` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `cfg_desc`, `cfg_name`, `cfg_value`) VALUES (1,NULL,NULL,1,'2019-04-15 21:36:07','应用名称update by 2019-03-27 11:47:04','system.app.name','web-flash'),(2,NULL,NULL,1,'2019-04-15 21:36:17','系统默认上传文件路径','system.file.upload.path','/data/web-flash/runtime/upload'),(3,NULL,NULL,1,'2019-04-15 21:36:17','腾讯sms接口appid','api.tencent.sms.appid','需要去申请咯'),(4,NULL,NULL,1,'2019-04-15 21:36:17','腾讯sms接口appkey','api.tencent.sms.appkey','需要去申请咯'),(5,NULL,NULL,1,'2019-04-15 21:36:17','腾讯sms接口签名参数','api.tencent.sms.sign','需要去申请咯'),(6,NULL,NULL,1,'2019-04-15 21:36:17','阿里云sms接口accesskey','api.aliyun.sms.access.key.id','需要去申请咯'),(7,NULL,NULL,1,'2019-04-15 21:36:17','阿里云sms接口access Secret','api.aliyun.sms.access.secret','需要去申请咯'),(8,NULL,NULL,1,'2019-04-15 21:36:17','阿里云sms接口地域id','api.aliyun.sms.region.id','需要去申请咯');
/*!40000 ALTER TABLE `t_sys_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_dept`
--

DROP TABLE IF EXISTS `t_sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '货代FTP账号',
  `forwarder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '货代代码',
  `ftp_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'FTP目录',
  `fullname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门/组织全称',
  `num` int DEFAULT NULL COMMENT '排序',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '货代FTP密码',
  `pid` bigint DEFAULT NULL COMMENT '父组织id',
  `pids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所有上级组织id列表',
  `simplename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门/组织简称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='组织/部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_dept`
--

LOCK TABLES `t_sys_dept` WRITE;
/*!40000 ALTER TABLE `t_sys_dept` DISABLE KEYS */;
INSERT INTO `t_sys_dept` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `account`, `forwarder`, `ftp_path`, `fullname`, `num`, `password`, `pid`, `pids`, `simplename`) VALUES (1,NULL,NULL,1,'2022-06-15 10:47:13',NULL,NULL,NULL,'NB209',1,NULL,0,'[0],','总公司'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'开发部',2,NULL,1,'[0],[1],','开发部'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'运营部',3,NULL,1,'[0],[1],','运营部'),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'战略部',4,NULL,1,'[0],[1],','战略部');
/*!40000 ALTER TABLE `t_sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_dict`
--

DROP TABLE IF EXISTS `t_sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典显示值',
  `num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典值',
  `pid` bigint DEFAULT NULL COMMENT '字典记录所属组id',
  `tips` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_dict`
--

LOCK TABLES `t_sys_dict` WRITE;
/*!40000 ALTER TABLE `t_sys_dict` DISABLE KEYS */;
INSERT INTO `t_sys_dict` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `name`, `num`, `pid`, `tips`) VALUES (16,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','状态','0',0,NULL),(17,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','启用','1',16,NULL),(18,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','禁用','2',16,NULL),(29,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','性别','0',0,NULL),(30,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','男','1',29,NULL),(31,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','女','2',29,NULL),(35,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','账号状态','0',0,NULL),(36,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','启用','1',35,NULL),(37,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','冻结','2',35,NULL),(38,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','已删除','3',35,NULL),(53,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','证件类型','0',0,NULL),(54,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','身份证','1',53,NULL),(55,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','护照','2',53,NULL),(68,1,'2019-01-13 14:18:21',1,'2019-01-13 14:18:21','是否','0',0,NULL),(69,1,'2019-01-13 14:18:21',1,'2019-01-13 14:18:21','是','1',68,NULL),(70,1,'2019-01-13 14:18:21',1,'2019-01-13 14:18:21','否','0',68,NULL),(71,1,'2020-07-18 21:43:41',1,'2020-07-18 21:43:41','日志类型','0',0,NULL),(72,1,'2020-07-18 21:43:41',1,'2020-07-18 21:43:41','业务日志','1',71,NULL),(73,1,'2019-01-13 14:18:21',1,'2020-07-18 21:43:41','异常日志','2',71,NULL),(74,1,'2021-07-24 22:27:00',1,'2021-07-24 22:27:00','工作流实例状态','0',0,NULL),(75,1,'2021-07-24 22:27:00',1,'2021-07-24 22:27:00','进行中','0',74,NULL),(76,1,'2021-07-24 22:27:00',1,'2021-07-24 22:27:00','成功','1',74,NULL),(77,1,'2021-07-24 22:27:00',1,'2021-07-24 22:27:00','失败','2',74,NULL);
/*!40000 ALTER TABLE `t_sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_file_info`
--

DROP TABLE IF EXISTS `t_sys_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_file_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `original_file_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原始文件名称',
  `real_file_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件存储在磁盘中的真正名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_file_info`
--

LOCK TABLES `t_sys_file_info` WRITE;
/*!40000 ALTER TABLE `t_sys_file_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sys_file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_login_log`
--

DROP TABLE IF EXISTS `t_sys_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作ip',
  `logname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志表述',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '日志详情',
  `succeed` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作结果标识',
  `userid` int DEFAULT NULL COMMENT '操作用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_login_log`
--

LOCK TABLES `t_sys_login_log` WRITE;
/*!40000 ALTER TABLE `t_sys_login_log` DISABLE KEYS */;
INSERT INTO `t_sys_login_log` (`id`, `create_time`, `ip`, `logname`, `message`, `succeed`, `userid`) VALUES (71,'2019-05-10 13:17:43','127.0.0.1','登录日志',NULL,'成功',1),(72,'2019-05-12 13:36:56','127.0.0.1','登录日志',NULL,'成功',1),(73,'2022-06-14 10:43:40','127.0.0.1','登录日志',NULL,'成功',1),(74,'2022-06-14 10:47:46','127.0.0.1','登录日志',NULL,'成功',1),(75,'2022-06-14 10:49:49','127.0.0.1','登录日志',NULL,'成功',1),(76,'2022-06-14 10:58:42','127.0.0.1','登录日志',NULL,'成功',1),(77,'2022-06-15 10:41:41','127.0.0.1','登录日志',NULL,'成功',1),(78,'2022-06-15 10:43:46','127.0.0.1','登录日志',NULL,'成功',1),(79,'2023-07-09 20:05:34','127.0.0.1','登录日志',NULL,'成功',1),(80,'2023-07-09 20:43:55','127.0.0.1','登录日志',NULL,'成功',1),(81,'2023-07-09 20:47:38','127.0.0.1','登录日志',NULL,'成功',1),(82,'2023-07-09 20:50:23','127.0.0.1','登录日志',NULL,'成功',5),(83,'2023-07-09 20:50:38','127.0.0.1','登录日志',NULL,'成功',1),(84,'2023-07-09 21:21:22','127.0.0.1','登录日志',NULL,'成功',1),(85,'2023-07-09 21:23:19','127.0.0.1','登录日志',NULL,'成功',1),(86,'2023-07-09 21:28:20','127.0.0.1','登录日志',NULL,'成功',1),(87,'2023-07-09 21:54:19','127.0.0.1','登录日志',NULL,'成功',1),(88,'2023-07-09 21:54:41','127.0.0.1','登录日志',NULL,'成功',5),(89,'2023-07-09 21:54:48','127.0.0.1','登录日志',NULL,'成功',1),(90,'2023-07-09 21:55:09','127.0.0.1','登录日志',NULL,'成功',5),(91,'2023-07-09 21:55:19','127.0.0.1','登录日志',NULL,'成功',1),(92,'2023-07-09 22:04:10','127.0.0.1','登录日志',NULL,'成功',1),(93,'2023-07-09 22:18:07','127.0.0.1','登录日志',NULL,'成功',1),(94,'2023-07-09 22:50:39','127.0.0.1','登录日志',NULL,'成功',1),(95,'2023-07-09 23:27:33','127.0.0.1','登录日志',NULL,'成功',1),(96,'2023-07-09 23:46:02','127.0.0.1','登录日志',NULL,'成功',1),(97,'2023-07-10 09:26:03','127.0.0.1','登录日志',NULL,'成功',1),(98,'2023-07-10 14:37:09','127.0.0.1','登录日志',NULL,'成功',1),(99,'2023-07-10 15:11:41','127.0.0.1','登录日志',NULL,'成功',1),(100,'2023-07-10 16:40:32','127.0.0.1','登录日志',NULL,'成功',1),(101,'2023-07-10 16:40:56','127.0.0.1','登录日志',NULL,'成功',1),(102,'2023-07-10 19:20:40','127.0.0.1','登录日志',NULL,'成功',1),(103,'2023-07-13 09:26:53','127.0.0.1','登录日志',NULL,'成功',1),(104,'2023-07-13 09:57:18','127.0.0.1','登录日志',NULL,'成功',1),(105,'2023-07-13 10:28:34','127.0.0.1','登录日志',NULL,'成功',1),(106,'2023-07-13 10:30:43','127.0.0.1','登录日志',NULL,'成功',5),(107,'2023-07-13 10:31:24','127.0.0.1','登录日志',NULL,'成功',1),(108,'2023-07-13 11:11:49','127.0.0.1','登录日志',NULL,'成功',1),(109,'2023-07-13 14:06:13','127.0.0.1','登录日志',NULL,'成功',1),(110,'2023-07-13 15:20:00','127.0.0.1','登录日志',NULL,'成功',1),(111,'2023-07-13 15:21:42','127.0.0.1','登录日志',NULL,'成功',1),(112,'2023-07-13 15:55:26','127.0.0.1','登录日志',NULL,'成功',1),(113,'2023-07-13 18:34:40','127.0.0.1','登录日志',NULL,'成功',1),(114,'2023-07-13 18:40:14','127.0.0.1','登录日志',NULL,'成功',1),(115,'2023-07-13 19:07:05','127.0.0.1','登录日志',NULL,'成功',1),(116,'2023-07-13 19:28:51','127.0.0.1','登录日志',NULL,'成功',1),(117,'2023-07-13 19:37:56','127.0.0.1','登录日志',NULL,'成功',1),(118,'2023-07-13 21:35:00','127.0.0.1','登录日志',NULL,'成功',1),(119,'2023-07-14 08:30:17','127.0.0.1','登录日志',NULL,'成功',1),(120,'2023-07-14 08:47:56','127.0.0.1','登录日志',NULL,'成功',1),(121,'2023-07-14 09:18:52','127.0.0.1','登录日志',NULL,'成功',1),(122,'2023-07-14 10:00:34','127.0.0.1','登录日志',NULL,'成功',1),(123,'2023-07-14 10:46:57','127.0.0.1','登录日志',NULL,'成功',1),(124,'2023-07-14 10:48:37','127.0.0.1','登录日志',NULL,'成功',5),(125,'2023-07-14 11:08:25','127.0.0.1','登录日志',NULL,'成功',1),(126,'2023-07-14 11:49:17','127.0.0.1','登录日志',NULL,'成功',1),(127,'2023-07-14 12:56:07','127.0.0.1','登录日志',NULL,'成功',1),(128,'2023-07-14 13:47:39','127.0.0.1','登录日志',NULL,'成功',1),(129,'2023-07-14 14:58:00','127.0.0.1','登录日志',NULL,'成功',1),(130,'2023-07-14 15:28:36','127.0.0.1','登录日志',NULL,'成功',1),(131,'2023-07-14 16:01:58','127.0.0.1','登录日志',NULL,'成功',1),(132,'2023-07-14 18:43:48','127.0.0.1','登录日志',NULL,'成功',1),(133,'2023-07-14 19:43:38','127.0.0.1','登录日志',NULL,'成功',1),(134,'2023-07-15 11:27:26','127.0.0.1','登录日志',NULL,'成功',1),(135,'2023-07-15 15:56:58','127.0.0.1','登录日志',NULL,'成功',1),(136,'2023-07-15 16:31:30','127.0.0.1','登录日志',NULL,'成功',1),(137,'2023-07-15 17:36:39','127.0.0.1','登录日志',NULL,'成功',1),(138,'2023-07-15 19:06:31','127.0.0.1','登录日志',NULL,'成功',1),(139,'2023-07-15 19:52:02','127.0.0.1','登录日志',NULL,'成功',1),(140,'2023-07-15 19:54:04','127.0.0.1','登录日志',NULL,'成功',1),(141,'2023-07-15 20:24:52','127.0.0.1','登录日志',NULL,'成功',1),(142,'2023-07-17 08:26:28','127.0.0.1','登录日志',NULL,'成功',1),(143,'2023-07-17 08:38:09','127.0.0.1','登录日志',NULL,'成功',1),(144,'2023-07-17 08:50:25','127.0.0.1','登录日志',NULL,'成功',1),(145,'2023-07-17 08:53:54','127.0.0.1','登录日志',NULL,'成功',1),(146,'2023-07-17 09:07:45','127.0.0.1','登录日志',NULL,'成功',1),(147,'2023-07-17 09:28:13','127.0.0.1','登录日志',NULL,'成功',1),(148,'2023-07-17 10:18:24','127.0.0.1','登录日志',NULL,'成功',1),(149,'2023-07-17 10:50:22','127.0.0.1','登录日志',NULL,'成功',1),(150,'2023-07-17 11:34:24','127.0.0.1','登录日志',NULL,'成功',1),(151,'2023-07-17 12:08:04','127.0.0.1','登录日志',NULL,'成功',1),(152,'2023-07-17 14:08:04','127.0.0.1','登录日志',NULL,'成功',1),(153,'2023-07-17 14:25:26','127.0.0.1','登录日志',NULL,'成功',1),(154,'2023-07-17 14:43:29','127.0.0.1','登录日志',NULL,'成功',1),(155,'2023-07-17 15:06:06','127.0.0.1','登录日志',NULL,'成功',1),(156,'2023-07-17 15:08:28','127.0.0.1','登录日志',NULL,'成功',1),(157,'2023-07-17 15:38:42','127.0.0.1','登录日志',NULL,'成功',1),(158,'2023-07-17 15:44:17','127.0.0.1','登录日志',NULL,'成功',1),(159,'2023-07-17 16:02:22','127.0.0.1','登录日志',NULL,'成功',1),(160,'2023-07-17 16:36:25','127.0.0.1','登录日志',NULL,'成功',1),(161,'2023-07-17 17:06:51','127.0.0.1','登录日志',NULL,'成功',1),(162,'2023-07-17 17:36:32','127.0.0.1','登录日志',NULL,'成功',1),(163,'2023-07-17 18:27:06','127.0.0.1','登录日志',NULL,'成功',1),(164,'2023-07-17 19:09:57','127.0.0.1','登录日志',NULL,'成功',1),(165,'2023-07-17 19:47:47','127.0.0.1','登录日志',NULL,'成功',1),(166,'2023-07-17 20:00:15','127.0.0.1','登录日志',NULL,'成功',1),(167,'2023-07-17 20:04:52','127.0.0.1','登录日志',NULL,'成功',1),(168,'2023-07-17 20:06:48','127.0.0.1','登录日志',NULL,'成功',1),(169,'2023-07-17 20:39:19','127.0.0.1','登录日志',NULL,'成功',1),(170,'2023-07-18 08:39:16','127.0.0.1','登录日志',NULL,'成功',1),(171,'2023-07-18 09:25:00','127.0.0.1','登录日志',NULL,'成功',1),(172,'2023-07-18 09:34:16','127.0.0.1','登录日志',NULL,'成功',1),(173,'2023-07-18 10:06:03','127.0.0.1','登录日志',NULL,'成功',1),(174,'2023-07-18 10:37:05','127.0.0.1','登录日志',NULL,'成功',1),(175,'2023-07-18 11:17:51','127.0.0.1','登录日志',NULL,'成功',1),(176,'2023-07-18 11:53:23','127.0.0.1','登录日志',NULL,'成功',1),(177,'2023-07-18 13:40:56','127.0.0.1','登录日志',NULL,'成功',1),(178,'2023-07-18 14:14:24','127.0.0.1','登录日志',NULL,'成功',1),(179,'2023-07-18 14:32:42','127.0.0.1','登录日志',NULL,'成功',1),(180,'2023-07-18 16:14:22','127.0.0.1','登录日志',NULL,'成功',1),(181,'2023-07-18 16:16:52','127.0.0.1','登录日志',NULL,'成功',1),(182,'2023-07-18 16:19:00','127.0.0.1','登录日志',NULL,'成功',1),(183,'2023-07-18 16:27:17','127.0.0.1','登录日志',NULL,'成功',1),(184,'2023-07-18 16:34:03','127.0.0.1','登录日志',NULL,'成功',1),(185,'2023-07-18 16:50:04','127.0.0.1','登录日志',NULL,'成功',1),(186,'2023-07-18 17:21:27','127.0.0.1','登录日志',NULL,'成功',1),(187,'2023-07-18 17:36:31','127.0.0.1','登录日志',NULL,'成功',1),(188,'2023-07-18 17:43:49','127.0.0.1','登录日志',NULL,'成功',1),(189,'2023-07-18 17:47:39','127.0.0.1','登录日志',NULL,'成功',1),(190,'2023-07-18 17:50:05','127.0.0.1','登录日志',NULL,'成功',1),(191,'2023-07-18 17:57:42','127.0.0.1','登录日志',NULL,'成功',1),(192,'2023-07-18 18:38:21','127.0.0.1','登录日志',NULL,'成功',1),(193,'2023-07-18 18:38:48','127.0.0.1','登录日志',NULL,'成功',1),(194,'2023-07-18 18:47:15','127.0.0.1','登录日志',NULL,'成功',1),(195,'2023-07-18 18:49:52','127.0.0.1','登录日志',NULL,'成功',1),(196,'2023-07-18 18:57:02','127.0.0.1','登录日志',NULL,'成功',1),(197,'2023-07-18 19:00:23','127.0.0.1','登录日志',NULL,'成功',1),(198,'2023-07-18 19:02:21','127.0.0.1','登录日志',NULL,'成功',1),(199,'2023-07-18 19:10:37','127.0.0.1','登录日志',NULL,'成功',1),(200,'2023-07-18 19:25:50','127.0.0.1','登录日志',NULL,'成功',1),(201,'2023-07-18 20:05:45','127.0.0.1','登录日志',NULL,'成功',1),(202,'2023-07-19 08:35:41','127.0.0.1','登录日志',NULL,'成功',1),(203,'2023-07-19 08:51:09','127.0.0.1','登录日志',NULL,'成功',1),(204,'2023-07-19 09:27:41','127.0.0.1','登录日志',NULL,'成功',1),(205,'2023-07-19 10:08:42','127.0.0.1','登录日志',NULL,'成功',1),(206,'2023-07-19 10:55:19','127.0.0.1','登录日志',NULL,'成功',1),(207,'2023-07-19 11:31:49','127.0.0.1','登录日志',NULL,'成功',1),(208,'2023-07-19 14:04:39','127.0.0.1','登录日志',NULL,'成功',1),(209,'2023-07-19 14:24:54','127.0.0.1','登录日志',NULL,'成功',5),(210,'2023-07-19 14:25:56','127.0.0.1','登录日志',NULL,'成功',5),(211,'2023-07-19 14:56:14','127.0.0.1','登录日志',NULL,'成功',1),(212,'2023-07-19 15:02:13','127.0.0.1','登录日志',NULL,'成功',1),(213,'2023-07-19 15:02:56','127.0.0.1','登录日志',NULL,'成功',1),(214,'2023-07-19 15:03:27','127.0.0.1','登录日志',NULL,'成功',1),(215,'2023-07-19 15:03:50','127.0.0.1','登录日志',NULL,'成功',6),(216,'2023-07-19 15:36:07','127.0.0.1','登录日志',NULL,'成功',5),(217,'2023-07-19 16:06:33','127.0.0.1','登录日志',NULL,'成功',5),(218,'2023-07-19 16:33:45','127.0.0.1','登录日志',NULL,'成功',5),(219,'2023-07-19 18:23:30','127.0.0.1','登录日志',NULL,'成功',5),(220,'2023-07-19 19:22:16','127.0.0.1','登录日志',NULL,'成功',5),(221,'2023-07-19 19:53:48','127.0.0.1','登录日志',NULL,'成功',5),(222,'2023-07-19 20:59:42','127.0.0.1','登录日志',NULL,'成功',5),(223,'2023-07-20 09:03:39','127.0.0.1','登录日志',NULL,'成功',5),(224,'2023-07-20 11:07:06','127.0.0.1','登录日志',NULL,'成功',5),(225,'2023-07-20 11:36:24','127.0.0.1','登录日志',NULL,'成功',1),(226,'2023-07-20 11:37:35','127.0.0.1','登录日志',NULL,'成功',5),(227,'2023-07-20 15:03:30','127.0.0.1','登录日志',NULL,'成功',6),(228,'2023-07-20 15:08:19','127.0.0.1','登录日志',NULL,'成功',1),(229,'2023-07-20 15:11:15','127.0.0.1','登录日志',NULL,'成功',5),(230,'2023-07-20 15:19:17','127.0.0.1','登录日志',NULL,'成功',6),(231,'2023-07-20 15:49:48','127.0.0.1','登录日志',NULL,'成功',6),(232,'2023-07-20 16:22:56','127.0.0.1','登录日志',NULL,'成功',6),(233,'2023-07-20 19:02:41','127.0.0.1','登录日志',NULL,'成功',6),(234,'2023-07-20 19:52:05','127.0.0.1','登录日志',NULL,'成功',6),(235,'2023-07-20 19:59:36','127.0.0.1','登录日志',NULL,'成功',6),(236,'2023-07-20 20:30:38','127.0.0.1','登录日志',NULL,'成功',6),(237,'2023-07-20 20:58:43','127.0.0.1','登录日志',NULL,'成功',6),(238,'2023-07-21 08:44:25','127.0.0.1','登录日志',NULL,'成功',6),(239,'2023-07-21 09:32:55','127.0.0.1','登录日志',NULL,'成功',6),(240,'2023-07-21 10:12:43','127.0.0.1','登录日志',NULL,'成功',6),(241,'2023-07-21 10:13:57','127.0.0.1','登录日志',NULL,'成功',6),(242,'2023-07-21 10:19:49','127.0.0.1','登录日志',NULL,'成功',6),(243,'2023-07-21 10:23:01','127.0.0.1','登录日志',NULL,'成功',6),(244,'2023-07-21 10:26:10','127.0.0.1','登录日志',NULL,'成功',6),(245,'2023-07-21 10:29:49','127.0.0.1','登录日志',NULL,'成功',6),(246,'2023-07-21 10:57:40','127.0.0.1','登录日志',NULL,'成功',6),(247,'2023-07-21 10:59:24','127.0.0.1','登录日志',NULL,'成功',6),(248,'2023-07-21 11:05:24','127.0.0.1','登录日志',NULL,'成功',6),(249,'2023-07-21 11:06:42','127.0.0.1','登录日志',NULL,'成功',6),(250,'2023-07-21 11:12:00','127.0.0.1','登录日志',NULL,'成功',6),(251,'2023-07-21 11:38:19','127.0.0.1','登录日志',NULL,'成功',6),(252,'2023-07-21 11:52:44','127.0.0.1','登录日志',NULL,'成功',6),(253,'2023-07-21 12:29:46','127.0.0.1','登录日志',NULL,'成功',6),(254,'2023-07-21 12:31:23','127.0.0.1','登录日志',NULL,'成功',6),(255,'2023-07-21 14:07:41','127.0.0.1','登录日志',NULL,'成功',6),(256,'2023-07-21 14:47:10','127.0.0.1','登录日志',NULL,'成功',6),(257,'2023-07-21 14:49:15','127.0.0.1','登录日志',NULL,'成功',6),(258,'2023-07-21 15:01:44','127.0.0.1','登录日志',NULL,'成功',6),(259,'2023-07-21 15:04:25','127.0.0.1','登录日志',NULL,'成功',6),(260,'2023-07-21 15:05:31','127.0.0.1','登录日志',NULL,'成功',6),(261,'2023-07-21 15:16:34','127.0.0.1','登录日志',NULL,'成功',6),(262,'2023-07-21 15:43:28','127.0.0.1','登录日志',NULL,'成功',6),(263,'2023-07-21 15:53:28','127.0.0.1','登录日志',NULL,'成功',6),(264,'2023-07-21 15:55:58','127.0.0.1','登录日志',NULL,'成功',6),(265,'2023-07-21 15:58:32','127.0.0.1','登录日志',NULL,'成功',6),(266,'2023-07-21 16:02:21','127.0.0.1','登录日志',NULL,'成功',6),(267,'2023-07-21 16:19:00','127.0.0.1','登录日志',NULL,'成功',5),(268,'2023-07-21 16:19:44','127.0.0.1','登录日志',NULL,'成功',1),(269,'2023-07-21 16:43:06','127.0.0.1','登录日志',NULL,'成功',1),(270,'2023-07-21 16:52:24','127.0.0.1','登录日志',NULL,'成功',5),(271,'2023-07-21 16:52:51','127.0.0.1','登录日志',NULL,'成功',1),(272,'2023-07-21 17:49:52','127.0.0.1','登录日志',NULL,'成功',1),(273,'2023-07-24 09:14:18','127.0.0.1','登录日志',NULL,'成功',1),(274,'2023-07-24 10:52:36','127.0.0.1','登录日志',NULL,'成功',1),(275,'2023-07-24 11:00:52','127.0.0.1','登录日志',NULL,'成功',6),(276,'2023-07-24 11:10:24','127.0.0.1','登录日志',NULL,'成功',6),(277,'2023-07-24 11:11:25','127.0.0.1','登录日志',NULL,'成功',5),(278,'2023-07-24 11:12:46','127.0.0.1','登录日志',NULL,'成功',6),(279,'2023-07-24 11:13:11','127.0.0.1','登录日志',NULL,'成功',1),(280,'2023-07-24 11:14:14','127.0.0.1','登录日志',NULL,'成功',6),(281,'2023-07-24 11:14:54','127.0.0.1','登录日志',NULL,'成功',5),(282,'2023-07-24 11:46:15','127.0.0.1','登录日志',NULL,'成功',6),(283,'2023-07-24 14:27:14','127.0.0.1','登录日志',NULL,'成功',1),(284,'2023-07-24 15:18:33','127.0.0.1','登录日志',NULL,'成功',1),(285,'2023-07-24 16:35:47','127.0.0.1','登录日志',NULL,'成功',1),(286,'2023-07-24 16:36:07','127.0.0.1','登录日志',NULL,'成功',6),(287,'2023-07-24 16:36:52','127.0.0.1','登录日志',NULL,'成功',1),(288,'2023-07-24 17:12:48','127.0.0.1','登录日志',NULL,'成功',6),(289,'2023-07-24 19:32:56','127.0.0.1','登录日志',NULL,'成功',6),(290,'2023-07-24 19:56:07','127.0.0.1','登录日志',NULL,'成功',6),(291,'2023-07-24 19:59:10','127.0.0.1','登录日志',NULL,'成功',1),(292,'2023-07-24 19:59:30','127.0.0.1','登录日志',NULL,'成功',6),(293,'2023-07-24 20:03:45','127.0.0.1','登录日志',NULL,'成功',6),(294,'2023-07-24 20:05:17','127.0.0.1','登录日志',NULL,'成功',1),(295,'2023-07-25 08:45:06','127.0.0.1','登录日志',NULL,'成功',6),(296,'2023-07-25 09:26:03','127.0.0.1','登录日志',NULL,'成功',5),(297,'2023-07-25 09:27:57','127.0.0.1','登录日志',NULL,'成功',1),(298,'2023-07-25 09:28:39','127.0.0.1','登录日志',NULL,'成功',5),(299,'2023-07-25 09:29:50','127.0.0.1','登录日志',NULL,'成功',4),(300,'2023-07-25 09:30:39','127.0.0.1','登录日志',NULL,'成功',1);
/*!40000 ALTER TABLE `t_sys_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_menu`
--

DROP TABLE IF EXISTS `t_sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '页面组件',
  `hidden` tinyint DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `ismenu` int NOT NULL COMMENT '是否是菜单1:菜单,0:按钮',
  `isopen` int DEFAULT NULL COMMENT '是否默认打开1:是,0:否',
  `levels` int NOT NULL COMMENT '级别',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `num` int NOT NULL COMMENT '顺序',
  `pcode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父菜单编号',
  `pcodes` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '递归父级菜单编号',
  `tips` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '鼠标悬停提示信息',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源/权限标识',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_s37unj3gh67ujhk83lqva8i1t` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_menu`
--

LOCK TABLES `t_sys_menu` WRITE;
/*!40000 ALTER TABLE `t_sys_menu` DISABLE KEYS */;
INSERT INTO `t_sys_menu` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `code`, `component`, `hidden`, `icon`, `ismenu`, `isopen`, `levels`, `name`, `num`, `pcode`, `pcodes`, `tips`, `url`) VALUES (1,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','system','layout',0,'system',1,1,1,'系统管理',1,'0','[0],',NULL,'/system'),(3,1,'2019-07-31 22:04:30',1,'2020-07-25 18:12:57','operationMgr','layout',0,'operation',1,NULL,1,'运维管理',2,'0','[0],',NULL,'/optionMgr'),(4,1,'2019-07-31 22:04:30',1,'2019-04-16 18:59:15','mgr','views/system/user/index',0,'user',1,NULL,2,'用户管理',1,'system','[0],[system],',NULL,'/mgr'),(5,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrAdd',NULL,0,NULL,0,NULL,3,'添加用户',1,'mgr','[0],[system],[mgr],',NULL,'/mgr/add'),(6,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrEdit',NULL,0,NULL,0,NULL,3,'修改用户',2,'mgr','[0],[system],[mgr],',NULL,'/mgr/edit'),(7,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrDelete',NULL,0,NULL,0,0,3,'删除用户',3,'mgr','[0],[system],[mgr],',NULL,'/mgr/delete'),(8,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrReset',NULL,0,NULL,0,0,3,'重置密码',4,'mgr','[0],[system],[mgr],',NULL,'/mgr/reset'),(9,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','setRole',NULL,0,NULL,0,0,3,'分配角色',5,'mgr','[0],[system],[mgr],',NULL,'/mgr/setRole'),(10,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrUnfreeze',NULL,0,NULL,0,0,3,'解除冻结用户',6,'mgr','[0],[system],[mgr],',NULL,'/mgr/unfreeze'),(11,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrSetRole',NULL,0,NULL,0,0,3,'分配角色',7,'mgr','[0],[system],[mgr],',NULL,'/mgr/setRole'),(12,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','role','views/system/role/index',0,'peoples',1,0,2,'角色管理',2,'system','[0],[system],',NULL,'/role'),(13,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','roleAdd',NULL,0,NULL,0,0,3,'添加角色',1,'role','[0],[system],[role],',NULL,'/role/add'),(14,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','roleEdit',NULL,0,NULL,0,0,3,'修改角色',2,'role','[0],[system],[role],',NULL,'/role/edit'),(15,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','roleDelete',NULL,0,NULL,0,0,3,'删除角色',3,'role','[0],[system],[role],',NULL,'/role/remove'),(16,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','roleSetAuthority',NULL,0,NULL,0,0,3,'配置权限',4,'role','[0],[system],[role],',NULL,'/role/setAuthority'),(17,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','menu','views/system/menu/index',0,'menu',1,0,2,'菜单管理',4,'system','[0],[system],',NULL,'/menu'),(18,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','menuAdd',NULL,0,NULL,0,0,3,'添加菜单',1,'menu','[0],[system],[menu],',NULL,'/menu/add'),(19,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','menuEdit',NULL,0,NULL,0,0,3,'修改菜单',2,'menu','[0],[system],[menu],',NULL,'/menu/edit'),(20,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','menuDelete',NULL,0,NULL,0,0,3,'删除菜单',3,'menu','[0],[system],[menu],',NULL,'/menu/remove'),(21,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dept','views/system/dept/index',0,'dept',1,NULL,2,'部门管理',3,'system','[0],[system],',NULL,'/dept'),(22,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dict','views/system/dict/index',0,'dict',1,NULL,2,'字典管理',4,'system','[0],[system],',NULL,'/dict'),(23,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptEdit',NULL,0,NULL,0,NULL,3,'修改部门',1,'dept','[0],[system],[dept],',NULL,'/dept/update'),(24,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptDelete',NULL,0,NULL,0,NULL,3,'删除部门',1,'dept','[0],[system],[dept],',NULL,'/dept/delete'),(25,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictAdd',NULL,0,NULL,0,NULL,3,'添加字典',1,'dict','[0],[system],[dict],',NULL,'/dict/add'),(26,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictEdit',NULL,0,NULL,0,NULL,3,'修改字典',1,'dict','[0],[system],[dict],',NULL,'/dict/update'),(27,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictDelete',NULL,0,NULL,0,NULL,3,'删除字典',1,'dict','[0],[system],[dict],',NULL,'/dict/delete'),(28,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptList',NULL,0,NULL,0,NULL,3,'部门列表',5,'dept','[0],[system],[dept],',NULL,'/dept/list'),(29,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptDetail',NULL,0,NULL,0,NULL,3,'部门详情',6,'dept','[0],[system],[dept],',NULL,'/dept/detail'),(30,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictList',NULL,0,NULL,0,NULL,3,'字典列表',5,'dict','[0],[system],[dict],',NULL,'/dict/list'),(31,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictDetail',NULL,0,NULL,0,NULL,3,'字典详情',6,'dict','[0],[system],[dict],',NULL,'/dict/detail'),(32,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptAdd',NULL,0,NULL,0,NULL,3,'添加部门',1,'dept','[0],[system],[dept],',NULL,'/dept/add'),(33,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','cfg','views/system/cfg/index',0,'cfg',1,NULL,2,'参数管理',10,'system','[0],[system],',NULL,'/cfg'),(34,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','cfgAdd',NULL,0,NULL,0,NULL,3,'添加参数',1,'cfg','[0],[system],[cfg],',NULL,'/cfg/add'),(35,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','cfgEdit',NULL,0,NULL,0,NULL,3,'修改参数',2,'cfg','[0],[system],[cfg],',NULL,'/cfg/update'),(36,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','cfgDelete',NULL,0,NULL,0,NULL,3,'删除参数',3,'cfg','[0],[system],[cfg],',NULL,'/cfg/delete'),(37,1,'2019-07-31 22:04:30',1,'2020-07-25 18:08:05','task','views/system/task/index',0,'task',1,NULL,2,'任务管理',11,'system','[0],[system],',NULL,'/task'),(38,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','taskAdd',NULL,0,NULL,0,NULL,3,'添加任务',1,'task','[0],[system],[task],',NULL,'/task/add'),(39,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','taskEdit',NULL,0,NULL,0,NULL,3,'修改任务',2,'task','[0],[system],[task],',NULL,'/task/update'),(40,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','taskDelete',NULL,0,NULL,0,NULL,3,'删除任务',3,'task','[0],[system],[task],',NULL,'/task/delete'),(47,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','taskLog','views/system/task/taskLog',1,'task',1,NULL,2,'任务日志',4,'system','[0],[system],',NULL,'/taskLog'),(48,1,'2019-07-31 22:04:30',1,'2019-06-02 10:25:31','log','views/operation/log/index',0,'log',1,NULL,2,'业务日志',6,'operationMgr','[0],[operationMgr],',NULL,'/log'),(49,1,'2019-07-31 22:04:30',1,'2019-06-02 10:25:36','loginLog','views/operation/loginLog/index',0,'logininfor',1,NULL,2,'登录日志',6,'operationMgr','[0],[operationMgr],',NULL,'/loginLog'),(50,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','logClear',NULL,0,NULL,0,NULL,3,'清空日志',3,'log','[0],[system],[log],',NULL,'/log/delLog'),(51,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','logDetail',NULL,0,NULL,0,NULL,3,'日志详情',3,'log','[0],[system],[log],',NULL,'/log/detail'),(52,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','loginLogClear',NULL,0,NULL,0,NULL,3,'清空登录日志',1,'loginLog','[0],[system],[loginLog],',NULL,'/loginLog/delLoginLog'),(53,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','loginLogList',NULL,0,NULL,0,NULL,3,'登录日志列表',2,'loginLog','[0],[system],[loginLog],',NULL,'/loginLog/list'),(54,1,'2019-06-02 10:10:20',1,'2019-06-02 10:10:20','druid','views/operation/druid/index',0,'monitor',1,NULL,2,'数据库管理',1,'operationMgr','[0],[operationMgr],',NULL,'/druid'),(55,1,'2019-06-02 10:10:20',1,'2019-06-02 10:10:20','swagger','views/operation/api/index',0,'swagger',1,NULL,2,'接口文档',2,'operationMgr','[0],[operationMgr],',NULL,'/swagger'),(86,1,'2023-07-09 23:42:14',1,'2023-07-14 15:50:16','stu','layout',0,'education',1,NULL,1,'学生管理',3,'0','[0],',NULL,'/training'),(87,1,'2023-07-09 23:44:28',1,'2023-07-14 15:43:51','student','views/training/student/index',0,'monitor',1,NULL,2,'学生',1,'stu','[0],[stu],',NULL,'/student'),(92,1,'2023-07-14 15:31:15',1,'2023-07-15 16:19:24','bookinfo','views/training/bookmanager/bookinfo/index',0,'eye-open',1,NULL,2,'信息管理',1,'bookmanager','[0],[bookmanager],',NULL,'/bookinfo'),(93,1,'2023-07-14 15:53:15',1,'2023-07-15 16:15:47','bookmanager','layout',0,'table',1,NULL,1,'图书管理',4,'0','[0],',NULL,'/manager'),(95,1,'2023-07-15 16:20:57',1,'2023-07-15 16:20:57','bookclassify','views/training/bookmanager/bookclassify/index',0,'form',1,NULL,2,'分类管理',2,'bookmanager','[0],[bookmanager],',NULL,'/classify'),(96,1,'2023-07-19 14:21:08',1,'2023-07-19 14:21:08','reader','layout',0,'menu',1,NULL,1,'功能菜单',5,'0','[0],',NULL,'/reader'),(97,1,'2023-07-19 14:24:25',1,'2023-07-19 14:24:25','booklist','views/training/reader/booklist/index',0,'education',1,NULL,2,'图书查询',1,'reader','[0],[reader],',NULL,'/booklist'),(98,1,'2023-07-20 15:10:43',1,'2023-07-20 15:10:43','personalrecord','views/training/reader/personalrecord/index',0,'table',1,NULL,2,'借阅记录',2,'reader','[0],[reader],',NULL,'/personalrecord'),(99,1,'2023-07-21 16:25:35',1,'2023-07-21 16:25:35','record','views/training/bookmanager/record/index',0,'table',1,NULL,2,'借阅管理',3,'bookmanager','[0],[bookmanager],',NULL,'/record');
/*!40000 ALTER TABLE `t_sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_notice`
--

DROP TABLE IF EXISTS `t_sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '通知内容',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '通知标题',
  `type` int DEFAULT NULL COMMENT '通知类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_notice`
--

LOCK TABLES `t_sys_notice` WRITE;
/*!40000 ALTER TABLE `t_sys_notice` DISABLE KEYS */;
INSERT INTO `t_sys_notice` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `content`, `title`, `type`) VALUES (1,1,'2017-01-11 08:53:20',1,'2019-01-08 23:30:58','欢迎使用web-flash后台管理系统','欢迎光临',10);
/*!40000 ALTER TABLE `t_sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_operation_log`
--

DROP TABLE IF EXISTS `t_sys_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `classname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '对应类名',
  `create_time` date DEFAULT NULL COMMENT '操作日期',
  `logname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志名称',
  `logtype` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志类型',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '详细信息',
  `method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '对应方法名',
  `succeed` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '成功标识',
  `userid` int DEFAULT NULL COMMENT '操作用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_operation_log`
--

LOCK TABLES `t_sys_operation_log` WRITE;
/*!40000 ALTER TABLE `t_sys_operation_log` DISABLE KEYS */;
INSERT INTO `t_sys_operation_log` (`id`, `classname`, `create_time`, `logname`, `logtype`, `message`, `method`, `succeed`, `userid`) VALUES (13,'cn.enilu.flash.api.controller.system.MenuController','2022-06-15','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(14,'cn.enilu.flash.api.controller.system.MenuController','2022-06-15','编辑菜单','业务日志','name=学生信息;;;','save','成功',1),(15,'cn.enilu.flash.api.controller.system.RoleController','2022-06-15','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,80,81,;','setAuthority','成功',1),(16,'cn.enilu.flash.api.controller.system.MenuController','2022-06-15','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(17,'cn.enilu.flash.api.controller.system.DeptContoller','2022-06-15','编辑部门','业务日志','部门/组织简称=总公司;;;部门/组织全称:One Piece集团=>NB209','save','成功',1),(18,'cn.enilu.flash.api.controller.system.TaskController','2022-06-15','禁用定时任务','业务日志','taskId=1;','disable','成功',1),(19,'cn.enilu.flash.api.controller.training.StudentController','2022-06-15','新增学生信息','业务日志','birthday=123;name=ces;id=;age=11;','add','成功',1),(20,'cn.enilu.flash.api.controller.training.StudentController','2022-06-15','删除学生信息','业务日志','id=1;','remove','成功',1),(21,'cn.enilu.flash.api.controller.system.UserController','2023-07-09','编辑账号','业务日志','name=管理员;;;','save','成功',1),(22,'cn.enilu.flash.api.controller.system.UserController','2023-07-09','编辑账号','业务日志','name=读者;;;','save','成功',1),(23,'cn.enilu.flash.api.controller.system.UserController','2023-07-09','设置账号角色','业务日志','userId=4;roleIds=2,;','setRole','成功',1),(24,'cn.enilu.flash.api.controller.system.UserController','2023-07-09','设置账号角色','业务日志','userId=5;roleIds=3,;','setRole','成功',1),(25,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(26,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(27,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(28,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=图书信息;;;','save','成功',1),(29,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=3;permissions=82,83,;','setAuthority','成功',1),(30,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=2;permissions=82,83,;','setAuthority','成功',1),(31,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,80,81,82,83,;','setAuthority','成功',1),(32,'cn.enilu.flash.api.controller.training.StudentController','2023-07-09','新增学生信息','业务日志','birthday=kkk;name=朱晗彬;id=;age=90;','add','成功',1),(33,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=3;permissions=;','setAuthority','成功',1),(34,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=2;permissions=;','setAuthority','成功',1),(35,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,80,81,;','setAuthority','成功',1),(36,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,;','setAuthority','成功',1),(37,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','删除菜单','业务日志','id=82;','remove','成功',1),(38,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','删除菜单','业务日志','id=80;','remove','成功',1),(39,'cn.enilu.flash.api.controller.system.UserController','2023-07-09','编辑账号','业务日志','name=图书管理员;;;','save','成功',1),(40,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(41,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(42,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(43,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(44,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(45,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=xuesheng;;;','save','成功',1),(46,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,84,85,;','setAuthority','成功',1),(47,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','删除菜单','业务日志','id=84;','remove','成功',1),(48,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=xuesheng;;;','save','成功',1),(49,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,86,;','setAuthority','成功',1),(50,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=xuesheng;;;','save','成功',1),(51,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=x学生;;;','save','成功',1),(52,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=学生;;;','save','成功',1),(53,'cn.enilu.flash.api.controller.system.RoleController','2023-07-09','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,86,87,;','setAuthority','成功',1),(54,'cn.enilu.flash.api.controller.training.StudentController','2023-07-09','删除学生信息','业务日志','id=2;','remove','成功',1),(55,'cn.enilu.flash.api.controller.training.StudentController','2023-07-09','新增学生信息','业务日志','birthday=2020;name=张三;id=;age=17;','add','成功',1),(56,'cn.enilu.flash.api.controller.training.StudentController','2023-07-09','更新学生信息','业务日志','birthday=2020/12/31;name=张三;id=3;age=17;','update','成功',1),(57,'cn.enilu.flash.api.controller.system.MenuController','2023-07-09','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(58,'cn.enilu.flash.api.controller.system.RoleController','2023-07-10','编辑角色','业务日志','name=读者;;;','save','成功',1),(59,'cn.enilu.flash.api.controller.training.StudentController','2023-07-10','更新学生信息','业务日志','birthday=2020/12/31;name=张三;id=3;age=18;','update','成功',1),(60,'cn.enilu.flash.api.controller.training.StudentController','2023-07-13','新增学生信息','业务日志','birthday=2002/6/12;name=李四;id=;age=21;','add','成功',1),(61,'cn.enilu.flash.api.controller.training.StudentController','2023-07-13','更新学生信息','业务日志','birthday=2005/12/31;name=张三;id=3;age=18;','update','成功',1),(62,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(63,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(64,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(65,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(66,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(67,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(68,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(69,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(70,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(71,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(72,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','删除菜单','业务日志','id=88;','remove','成功',1),(73,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(74,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(75,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(76,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(77,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(78,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(79,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(80,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(81,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','删除菜单','业务日志','id=89;','remove','成功',1),(82,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(83,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(84,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生;;;','save','成功',1),(85,'cn.enilu.flash.api.controller.system.MenuController','2023-07-13','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(86,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(87,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(88,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生;;;','save','成功',1),(89,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生;;;','save','成功',1),(90,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生;;;','save','成功',1),(91,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(92,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生;;;','save','成功',1),(93,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','删除菜单','业务日志','id=91;','remove','成功',1),(94,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(95,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生;;;','save','成功',1),(96,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=其他管理;;;','save','成功',1),(97,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生;;;','save','成功',1),(98,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生;;;','save','成功',1),(99,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','删除菜单','业务日志','id=90;','remove','成功',1),(100,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(101,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(102,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(103,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(104,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生;;;','save','成功',1),(105,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生;;;','save','成功',1),(106,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(107,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(108,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=学生管理;;;','save','成功',1),(109,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(110,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(111,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=sdfasdf aswef;;;','save','成功',1),(112,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','删除菜单','业务日志','id=94;','remove','成功',1),(113,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(114,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(115,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(116,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(117,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(118,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(119,'cn.enilu.flash.api.controller.system.MenuController','2023-07-14','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(120,'cn.enilu.flash.api.controller.system.RoleController','2023-07-14','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,86,87,93,92,;','setAuthority','成功',1),(121,'cn.enilu.flash.api.controller.system.MenuController','2023-07-15','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(122,'cn.enilu.flash.api.controller.system.MenuController','2023-07-15','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(123,'cn.enilu.flash.api.controller.system.MenuController','2023-07-15','编辑菜单','业务日志','name=图书管理;;;','save','成功',1),(124,'cn.enilu.flash.api.controller.system.MenuController','2023-07-15','编辑菜单','业务日志','name=信息管理;;;','save','成功',1),(125,'cn.enilu.flash.api.controller.system.MenuController','2023-07-15','编辑菜单','业务日志','name=分类管理;;;','save','成功',1),(126,'cn.enilu.flash.api.controller.system.RoleController','2023-07-15','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,86,87,93,92,95,;','setAuthority','成功',1),(127,'cn.enilu.flash.api.controller.training.StudentController','2023-07-17','更新学生信息','业务日志','birthday=2002/6/12;name=李四;id=4;age=19;','update','成功',1),(128,'cn.enilu.flash.api.controller.system.MenuController','2023-07-19','编辑菜单','业务日志','name=功能菜单;;;','save','成功',1),(129,'cn.enilu.flash.api.controller.system.MenuController','2023-07-19','编辑菜单','业务日志','name=图书查询;;;','save','成功',1),(130,'cn.enilu.flash.api.controller.system.RoleController','2023-07-19','配置角色权限','业务日志','roleId=3;permissions=96,97,;','setAuthority','成功',1),(131,'cn.enilu.flash.api.controller.system.UserController','2023-07-19','编辑账号','业务日志','name=张三;;;','save','成功',1),(132,'cn.enilu.flash.api.controller.system.UserController','2023-07-19','设置账号角色','业务日志','userId=5;roleIds=3,;','setRole','成功',1),(133,'cn.enilu.flash.api.controller.system.UserController','2023-07-19','重置密码','业务日志','userId=6;','resetPassword','成功',1),(134,'cn.enilu.flash.api.controller.system.UserController','2023-07-19','设置账号角色','业务日志','userId=6;roleIds=3,;','setRole','成功',1),(135,'cn.enilu.flash.api.controller.system.MenuController','2023-07-20','编辑菜单','业务日志','name=借阅记录;;;','save','成功',1),(136,'cn.enilu.flash.api.controller.system.RoleController','2023-07-20','配置角色权限','业务日志','roleId=3;permissions=96,97,98,;','setAuthority','成功',1),(137,'cn.enilu.flash.api.controller.system.MenuController','2023-07-21','编辑菜单','业务日志','name=借阅管理;;;','save','成功',1),(138,'cn.enilu.flash.api.controller.system.RoleController','2023-07-21','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,3,48,50,51,49,52,53,54,55,86,87,93,92,95,99,;','setAuthority','成功',1),(139,'cn.enilu.flash.api.controller.system.RoleController','2023-07-21','配置角色权限','业务日志','roleId=2;permissions=86,87,93,92,95,99,;','setAuthority','成功',1);
/*!40000 ALTER TABLE `t_sys_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_relation`
--

DROP TABLE IF EXISTS `t_sys_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menuid` bigint DEFAULT NULL COMMENT '菜单id',
  `roleid` bigint DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='菜单角色关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_relation`
--

LOCK TABLES `t_sys_relation` WRITE;
/*!40000 ALTER TABLE `t_sys_relation` DISABLE KEYS */;
INSERT INTO `t_sys_relation` (`id`, `menuid`, `roleid`) VALUES (670,96,3),(671,97,3),(672,98,3),(673,1,1),(674,4,1),(675,5,1),(676,6,1),(677,7,1),(678,8,1),(679,9,1),(680,10,1),(681,11,1),(682,12,1),(683,13,1),(684,14,1),(685,15,1),(686,16,1),(687,17,1),(688,18,1),(689,19,1),(690,20,1),(691,21,1),(692,23,1),(693,24,1),(694,28,1),(695,29,1),(696,32,1),(697,22,1),(698,25,1),(699,26,1),(700,27,1),(701,30,1),(702,31,1),(703,33,1),(704,34,1),(705,35,1),(706,36,1),(707,37,1),(708,38,1),(709,39,1),(710,40,1),(711,47,1),(712,3,1),(713,48,1),(714,50,1),(715,51,1),(716,49,1),(717,52,1),(718,53,1),(719,54,1),(720,55,1),(721,86,1),(722,87,1),(723,93,1),(724,92,1),(725,95,1),(726,99,1),(727,86,2),(728,87,2),(729,93,2),(730,92,2),(731,95,2),(732,99,2);
/*!40000 ALTER TABLE `t_sys_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_role`
--

DROP TABLE IF EXISTS `t_sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `deptid` bigint DEFAULT NULL COMMENT '角色所属部门',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `num` int DEFAULT NULL COMMENT '排序',
  `pid` bigint DEFAULT NULL COMMENT '父角色id',
  `tips` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色编码',
  `version` int DEFAULT NULL COMMENT '角色版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_role`
--

LOCK TABLES `t_sys_role` WRITE;
/*!40000 ALTER TABLE `t_sys_role` DISABLE KEYS */;
INSERT INTO `t_sys_role` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `deptid`, `name`, `num`, `pid`, `tips`, `version`) VALUES (1,NULL,NULL,NULL,NULL,1,'超级管理员',1,0,'administrator',1),(2,NULL,NULL,NULL,NULL,1,'图书管理员',1,0,'gly',NULL),(3,NULL,NULL,1,'2023-07-10 14:39:06',1,'读者',1,0,'dz1',NULL);
/*!40000 ALTER TABLE `t_sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_task`
--

DROP TABLE IF EXISTS `t_sys_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `concurrent` tinyint DEFAULT NULL COMMENT '是否允许并发',
  `cron` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '定时规则',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '执行参数',
  `disabled` tinyint DEFAULT NULL COMMENT '是否禁用',
  `exec_at` datetime DEFAULT NULL COMMENT '执行时间',
  `exec_result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '执行结果',
  `job_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行类',
  `job_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务组名',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务名',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_task`
--

LOCK TABLES `t_sys_task` WRITE;
/*!40000 ALTER TABLE `t_sys_task` DISABLE KEYS */;
INSERT INTO `t_sys_task` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `concurrent`, `cron`, `data`, `disabled`, `exec_at`, `exec_result`, `job_class`, `job_group`, `name`, `note`) VALUES (1,1,'2018-12-28 09:54:00',1,'2022-06-15 10:47:23',0,'0 0/30 * * * ?','{\n\"appname\": \"web-flash\",\n\"version\":1\n}\n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            ',1,'2019-03-27 11:47:00','执行成功','cn.enilu.flash.service.task.job.HelloJob','default','测试任务','测试任务,每30分钟执行一次');
/*!40000 ALTER TABLE `t_sys_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_task_log`
--

DROP TABLE IF EXISTS `t_sys_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_task_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exec_at` datetime DEFAULT NULL COMMENT '执行时间',
  `exec_success` int DEFAULT NULL COMMENT '执行结果（成功:1、失败:0)',
  `id_task` bigint DEFAULT NULL COMMENT '对应任务id',
  `job_exception` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '抛出异常',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_task_log`
--

LOCK TABLES `t_sys_task_log` WRITE;
/*!40000 ALTER TABLE `t_sys_task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sys_task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_user`
--

DROP TABLE IF EXISTS `t_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账户',
  `avatar` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `deptid` bigint DEFAULT NULL COMMENT '部门id',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'email',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `roleid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id列表，以逗号分隔',
  `salt` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码盐',
  `sex` int DEFAULT NULL COMMENT '性别:1:男,2:女',
  `status` int DEFAULT NULL COMMENT '状态1:启用,2:禁用',
  `version` int DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='账号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_user`
--

LOCK TABLES `t_sys_user` WRITE;
/*!40000 ALTER TABLE `t_sys_user` DISABLE KEYS */;
INSERT INTO `t_sys_user` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `account`, `avatar`, `birthday`, `deptid`, `email`, `name`, `password`, `phone`, `roleid`, `salt`, `sex`, `status`, `version`) VALUES (-1,NULL,'2016-01-29 08:49:53',1,'2019-03-20 23:45:24','system',NULL,NULL,NULL,NULL,'应用系统',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,NULL,'2016-01-29 08:49:53',1,'2019-03-20 23:45:24','admin',NULL,'2017-05-05',2,'eniluzt@qq.com','管理员','b5a51391f271f062867e5984e2fcffee','15021222222','1','8pgby',2,1,2),(4,1,'2023-07-09 20:49:02',1,'2023-07-09 22:12:59','guanliyuan',NULL,'2023-07-09',1,'1034482767@qq.com','图书管理员','f95f8a7ea478804b60c7b6ae65ceb0c2','1111','2,','or08g',1,1,NULL),(5,1,'2023-07-09 20:49:49',1,'2023-07-09 20:50:06','reader',NULL,'2023-07-09',1,'2222','读者','e91b90bef2e5c4249c8f186a91439ddc','434324','3,','21wsy',1,1,NULL),(6,1,'2023-07-19 15:00:19',1,'2023-07-19 15:03:37','zhangsan',NULL,'1999-07-13',1,'222','张三','8e5e883594befa8bd05d5999087646fd','166666','3,','q2lim',1,1,NULL);
/*!40000 ALTER TABLE `t_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_test_boy`
--

DROP TABLE IF EXISTS `t_test_boy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_test_boy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `age` int DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生日',
  `has_girl_friend` tinyint DEFAULT NULL COMMENT '是否有女朋友',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='男孩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_test_boy`
--

LOCK TABLES `t_test_boy` WRITE;
/*!40000 ALTER TABLE `t_test_boy` DISABLE KEYS */;
INSERT INTO `t_test_boy` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `age`, `birthday`, `has_girl_friend`, `name`) VALUES (1,NULL,NULL,NULL,NULL,18,'2000-01-01',1,'张三');
/*!40000 ALTER TABLE `t_test_boy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_test_girl`
--

DROP TABLE IF EXISTS `t_test_girl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_test_girl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `age` int DEFAULT NULL COMMENT '年龄',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `has_boy_friend` tinyint DEFAULT NULL COMMENT '是否有男朋友',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='女孩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_test_girl`
--

LOCK TABLES `t_test_girl` WRITE;
/*!40000 ALTER TABLE `t_test_girl` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_test_girl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_training_student`
--

DROP TABLE IF EXISTS `t_training_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_training_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `age` int DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生日',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='学生信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_training_student`
--

LOCK TABLES `t_training_student` WRITE;
/*!40000 ALTER TABLE `t_training_student` DISABLE KEYS */;
INSERT INTO `t_training_student` (`id`, `create_by`, `create_time`, `modify_by`, `modify_time`, `age`, `birthday`, `name`) VALUES (3,1,'2023-07-09 23:46:34',1,'2023-07-13 09:29:16',18,'2005/12/31','张三'),(4,1,'2023-07-13 09:28:18',1,'2023-07-17 17:40:43',19,'2002/6/12','李四');
/*!40000 ALTER TABLE `t_training_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-25  9:47:07
