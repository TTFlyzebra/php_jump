-- MySQL dump 10.13  Distrib 5.5.42, for Win32 (x86)
--
-- Host: localhost    Database: jump
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jh_access`
--

DROP TABLE IF EXISTS `jh_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_access`
--

LOCK TABLES `jh_access` WRITE;
/*!40000 ALTER TABLE `jh_access` DISABLE KEYS */;
INSERT INTO `jh_access` VALUES (8,65,1,NULL),(8,66,1,NULL),(8,67,1,NULL),(8,68,1,NULL),(8,69,1,NULL),(8,70,1,NULL),(8,71,1,NULL),(8,72,1,NULL),(8,73,1,NULL),(8,74,1,NULL),(8,75,1,NULL),(8,76,1,NULL),(8,77,1,NULL),(8,78,1,NULL),(8,79,1,NULL),(8,80,1,NULL),(8,81,1,NULL),(8,82,1,NULL),(8,83,1,NULL);
/*!40000 ALTER TABLE `jh_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_admanager`
--

DROP TABLE IF EXISTS `jh_admanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_admanager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) NOT NULL,
  `appurl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_admanager`
--

LOCK TABLES `jh_admanager` WRITE;
/*!40000 ALTER TABLE `jh_admanager` DISABLE KEYS */;
INSERT INTO `jh_admanager` VALUES (10,'/Uploads/App/2016-07-17/578a65ee9ccda.png','/Uploads/App/2016-07-17/578a65eea2e85.apk'),(11,'/Uploads/App/2016-07-17/578a666d1d606.png','/Uploads/App/2016-07-17/578a666d256f3.apk');
/*!40000 ALTER TABLE `jh_admanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_node`
--

DROP TABLE IF EXISTS `jh_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_node`
--

LOCK TABLES `jh_node` WRITE;
/*!40000 ALTER TABLE `jh_node` DISABLE KEYS */;
INSERT INTO `jh_node` VALUES (65,'Admin',NULL,1,'后台管理',NULL,0,1),(66,'Index',NULL,1,'后台主页',NULL,65,2),(67,'index',NULL,1,'后台主页页面',NULL,66,3),(68,'Node',NULL,1,'节点管理',NULL,65,2),(69,'index',NULL,1,'节点管理页面',NULL,68,3),(70,'add',NULL,1,'添加节点',NULL,68,3),(71,'del',NULL,1,'删除节点',NULL,68,3),(72,'edit',NULL,1,'修改节点',NULL,68,3),(73,'Role',NULL,1,'角色管理',NULL,65,2),(74,'index',NULL,1,'角色管理页面',NULL,73,3),(75,'add',NULL,1,'添加角色',NULL,73,3),(76,'del',NULL,1,'删除角色',NULL,73,3),(77,'edit',NULL,1,'删除角色',NULL,73,3),(78,'Access',NULL,1,'分配权限',NULL,65,2),(79,'index',NULL,1,'分配权限页面',NULL,78,3),(80,'setAccess',NULL,1,'分配角色权限',NULL,78,3),(81,'Verify',NULL,1,'分配角色',NULL,65,2),(82,'index',NULL,1,'分配角色页面',NULL,81,3),(83,'verify',NULL,1,'分配角色权限',NULL,81,3);
/*!40000 ALTER TABLE `jh_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_proxy`
--

DROP TABLE IF EXISTS `jh_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_proxy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proxy` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_proxy`
--

LOCK TABLES `jh_proxy` WRITE;
/*!40000 ALTER TABLE `jh_proxy` DISABLE KEYS */;
INSERT INTO `jh_proxy` VALUES (1,'192.168.1.1',80,1);
/*!40000 ALTER TABLE `jh_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_role`
--

DROP TABLE IF EXISTS `jh_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_role`
--

LOCK TABLES `jh_role` WRITE;
/*!40000 ALTER TABLE `jh_role` DISABLE KEYS */;
INSERT INTO `jh_role` VALUES (8,'Admin',NULL,1,'系统管理员');
/*!40000 ALTER TABLE `jh_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_role_user`
--

DROP TABLE IF EXISTS `jh_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_role_user`
--

LOCK TABLES `jh_role_user` WRITE;
/*!40000 ALTER TABLE `jh_role_user` DISABLE KEYS */;
INSERT INTO `jh_role_user` VALUES (8,'2');
/*!40000 ALTER TABLE `jh_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_url`
--

DROP TABLE IF EXISTS `jh_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_url` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `client` varchar(255) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_url`
--

LOCK TABLES `jh_url` WRITE;
/*!40000 ALTER TABLE `jh_url` DISABLE KEYS */;
INSERT INTO `jh_url` VALUES (11,'http://m.3manbetx.com','app'),(12,'http://www.manbetx.cc','pc');
/*!40000 ALTER TABLE `jh_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_user`
--

DROP TABLE IF EXISTS `jh_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) NOT NULL,
  `loginword` varchar(64) NOT NULL,
  `regtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_user`
--

LOCK TABLES `jh_user` WRITE;
/*!40000 ALTER TABLE `jh_user` DISABLE KEYS */;
INSERT INTO `jh_user` VALUES (1,'flyzebra','10e208ffd957f5488f795e555f483af8',1463756267),(2,'admin','28c8edde3d61a0411511d3b1866f0636',1468136066);
/*!40000 ALTER TABLE `jh_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_user_log`
--

DROP TABLE IF EXISTS `jh_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_user_log` (
  `user_id` int(10) unsigned DEFAULT NULL,
  `loginIP` varchar(32) NOT NULL,
  `logintime` int(11) NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_user_log`
--

LOCK TABLES `jh_user_log` WRITE;
/*!40000 ALTER TABLE `jh_user_log` DISABLE KEYS */;
INSERT INTO `jh_user_log` VALUES (1,'192.168.1.88',1468034543),(1,'192.168.1.88',1468052866),(1,'192.168.1.88',1468053079),(1,'192.168.1.88',1468053128),(1,'192.168.1.88',1468061869),(1,'192.168.1.88',1468118959),(1,'192.168.1.88',1468123924),(1,'192.168.1.88',1468124000),(1,'192.168.1.88',1468124010),(1,'192.168.1.88',1468124149),(1,'192.168.1.88',1468124312),(1,'192.168.1.88',1468124699),(1,'192.168.1.88',1468124800),(1,'192.168.1.88',1468124910),(1,'192.168.1.88',1468126870),(1,'192.168.1.88',1468128270),(1,'192.168.1.88',1468128568),(1,'192.168.1.88',1468128595),(1,'192.168.1.88',1468133018),(1,'192.168.1.88',1468134072),(1,'192.168.1.88',1468135262),(2,'192.168.1.88',1468136079),(1,'192.168.1.88',1468136090),(1,'192.168.1.88',1468136185),(1,'192.168.1.88',1468136318),(1,'192.168.1.88',1468140195),(1,'192.168.1.88',1468151662),(1,'192.168.1.88',1468335270),(1,'192.168.1.88',1468335615),(1,'192.168.1.88',1468413937),(1,'192.168.1.88',1468419022),(1,'192.168.1.88',1468420598),(1,'192.168.1.88',1468497003),(1,'192.168.1.88',1468503513),(1,'192.168.1.88',1468505108),(1,'192.168.1.88',1468507237),(1,'192.168.1.88',1468595885),(1,'192.168.1.88',1468666032),(1,'192.168.1.88',1468666435),(1,'192.168.1.88',1468684539),(1,'192.168.1.88',1468687841),(1,'192.168.1.88',1468688518),(1,'192.168.1.88',1468690171),(1,'192.168.1.88',1468729795),(1,'192.168.1.88',1468739045),(1,'192.168.1.88',1468751738),(1,'192.168.1.88',1469015911);
/*!40000 ALTER TABLE `jh_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_welcome`
--

DROP TABLE IF EXISTS `jh_welcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_welcome` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imageurl` varchar(255) NOT NULL,
  `show` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_welcome`
--

LOCK TABLES `jh_welcome` WRITE;
/*!40000 ALTER TABLE `jh_welcome` DISABLE KEYS */;
INSERT INTO `jh_welcome` VALUES (12,'/Uploads/welcome/images/2016-07-17/578b5fa86ad5f.jpg',1);
/*!40000 ALTER TABLE `jh_welcome` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-20 20:26:34
