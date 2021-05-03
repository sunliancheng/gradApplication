CREATE DATABASE  IF NOT EXISTS `grad` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `grad`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 192.168.157.2    Database: grad
-- ------------------------------------------------------
-- Server version	5.6.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` bigint(25) NOT NULL,
  `title` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `createdate` bigint(25) DEFAULT NULL,
  `userid` bigint(25) DEFAULT NULL,
  `other` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (13,'这是个测试','这是个测试的内容',1619316058183,3,NULL),(17,'买水','今晚回家记得买水',1619576512487,3,NULL),(20,'写题目','今天要写算法题哦..',1619577329728,3,NULL),(21,'浇水','今晚记得要给花花浇水',1619577439215,3,NULL),(22,'买猫粮','家里猫粮没了，需要买新的Go猫粮了',1619577491101,3,NULL),(23,'回去买杯咖啡','明天要考试了，今晚回去买一杯咖啡好好学习,明天要考试了，今晚回去买一杯咖啡好好学习,明天要考试了，今晚回去买一杯咖啡好好学习',1619577555840,3,NULL),(28,'测试','root用户的测试 id 8',1619986927067,8,NULL),(29,'毕设快结束咯','终于把毕设快写完了，写了好多个夜晚，终于要结束了',1619990324418,3,NULL),(30,'毕设终于结束了','毕设终于写完了！！！',1619990344702,3,NULL),(31,'开始写毕业论文了','做完毕设，该写论文咯',1619990359769,3,NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` bigint(25) NOT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `telephone` bigint(25) DEFAULT NULL,
  `email` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `remarks` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `notes` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `other` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `userid` bigint(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'过儿',13866372487,'guoer@gmail.com','同学',NULL,'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2796144188,439704386&fm=26&gp=0.jpg',NULL,3),(3,'小王',13848372940,'xiaowang@qq.com','同事','这是负责前端的前辈，可以多问问他','https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2909072015,3629141008&fm=26&gp=0.jpg',NULL,3),(4,'小王',NULL,'','','root 用户 id 8的测试','https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2909072015,3629141008&fm=26&gp=0.jpg',NULL,8);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `userid` bigint(25) NOT NULL,
  `logoutdate` bigint(25) DEFAULT NULL,
  `logindate` bigint(25) DEFAULT NULL,
  `token` varchar(150) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `common` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `createdate` bigint(25) DEFAULT NULL,
  `body` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `isfinished` int(11) DEFAULT NULL,
  `owner` bigint(20) DEFAULT NULL,
  `finishdate` bigint(25) DEFAULT NULL,
  `other` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (7,NULL,1619849381546,'今天要背完单词',0,3,1619971200000,NULL),(8,NULL,1619849401584,'今天要写十个算法题',0,3,1619884800000,NULL),(9,NULL,1619849473336,'做完毕设的用户登陆功能和跳转界面',1,3,1619798400000,NULL),(10,NULL,1619986949273,'id 8 root用户的测试',0,8,1619971200000,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `registerdate` bigint(25) DEFAULT NULL,
  `other` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin2',18,'test1@baomidou.com',NULL,NULL,NULL,NULL),(2,'Jack',20,'test2@baomidou.com',NULL,NULL,NULL,NULL),(3,'admin',28,'test3@baomidou.com',NULL,NULL,NULL,'123456'),(4,'Sandy',21,'test4@baomidou.com',NULL,NULL,NULL,NULL),(5,'Billie',24,'test5@baomidou.com',NULL,NULL,NULL,NULL),(7,'testName',21,NULL,NULL,NULL,NULL,NULL),(8,'root',33,'asdf@gmail.com',1619193401760,NULL,13445443222,'root'),(9,'test',19,'test@gmail.com',1619989480027,NULL,13343245643,'test');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-03 12:14:50
