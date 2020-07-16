/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.16 : Database - boot_cangku
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`boot_cangku` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `boot_cangku`;

/*Table structure for table `bus_customer` */

DROP TABLE IF EXISTS `bus_customer`;

CREATE TABLE `bus_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_customer` */

insert  into `bus_customer`(`id`,`customername`,`zip`,`address`,`telephone`,`connectionperson`,`phone`,`bank`,`account`,`email`,`fax`,`available`) values (1,'小张超市','111','武汉','027-9123131','张大明','13812312312321312','中国银行','654431331343413','213123@sina.com','430000',1),(2,'小明超市','222','深圳','0755-9123131','张小明','13812312312321312','中国银行','654431331343413','213123@sina.com','430000',1),(3,'快七超市','430000','武汉','027-11011011','雷生','13434134131','招商银行','6543123341334133','6666@66.com','545341',1);

/*Table structure for table `bus_goods` */

DROP TABLE IF EXISTS `bus_goods`;

CREATE TABLE `bus_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `produceplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goodspackage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `productcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `promitcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `dangernum` int(11) DEFAULT NULL,
  `goodsimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sq0btr2v2lq8gt8b4gb8tlk0i` (`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_goods` */

insert  into `bus_goods`(`id`,`goodsname`,`produceplace`,`size`,`goodspackage`,`productcode`,`promitcode`,`description`,`price`,`number`,`dangernum`,`goodsimg`,`available`,`providerid`) values (1,'娃哈哈','武汉','120ML','瓶','PH12345','PZ1234','小孩子都爱的',2,488,10,'2018-12-25/userface1.jpg',1,3),(2,'旺旺雪饼[小包]','仙桃','包','袋','PH12312312','PZ12312','好吃不上火',4,1100,10,'2018-12-25/userface2.jpg',1,1),(3,'旺旺大礼包','仙桃','盒','盒','11','11','111',28,1021,100,'2018-12-25/userface3.jpg',1,1),(4,'娃哈哈','武汉','200ML','瓶','11','111','12321',3,1100,10,'2018-12-25/userface4.jpg',1,3),(5,'娃哈哈','武汉','300ML','瓶','1234','12321','22221111',3,1000,100,'2018-12-25/userface5.jpg',1,3);

/*Table structure for table `bus_inport` */

DROP TABLE IF EXISTS `bus_inport`;

CREATE TABLE `bus_inport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inporttime` datetime DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inportprice` double DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_1o4bujsyd2kl4iqw48fie224v` (`providerid`) USING BTREE,
  KEY `FK_ho29poeu4o2dxu4rg1ammeaql` (`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_inport` */

insert  into `bus_inport`(`id`,`paytype`,`inporttime`,`operateperson`,`number`,`remark`,`inportprice`,`providerid`,`goodsid`) values (1,'微信','2018-05-07 00:00:00','张三',100,'备注',3.5,1,1),(2,'支付宝','2018-05-07 00:00:00','张三',1000,'无',2.5,3,3),(3,'银联','2018-05-07 00:00:00','张三',100,'1231',111,3,3),(4,'银联','2018-05-07 00:00:00','张三',1000,'无',2,3,1),(5,'银联','2018-05-07 00:00:00','张三',100,'无',1,3,1),(6,'银联','2018-05-07 00:00:00','张三',100,'1231',2.5,1,2),(8,'支付宝','2018-05-07 00:00:00','张三',100,'',1,3,1),(10,'支付宝','2018-08-07 17:17:57','超级管理员',100,'sadfasfdsa',1.5,3,1),(11,'支付宝','2018-09-17 16:12:25','超级管理员',21,'21',21,1,3),(12,'微信','2018-12-25 16:48:24','超级管理员',100,'123213213',12321321,3,1);

/*Table structure for table `bus_outport` */

DROP TABLE IF EXISTS `bus_outport`;

CREATE TABLE `bus_outport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `outputtime` datetime DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `outportprice` double(10,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_outport` */

insert  into `bus_outport`(`id`,`providerid`,`paytype`,`outputtime`,`operateperson`,`outportprice`,`number`,`remark`,`goodsid`) values (1,3,'微信','2019-08-16 08:19:50','超级管理员',12321321.00,1,'',1),(2,3,'微信','2019-08-16 08:26:54','超级管理员',12321321.00,11,'11',1);

/*Table structure for table `bus_provider` */

DROP TABLE IF EXISTS `bus_provider`;

CREATE TABLE `bus_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_provider` */

insert  into `bus_provider`(`id`,`providername`,`zip`,`address`,`telephone`,`connectionperson`,`phone`,`bank`,`account`,`email`,`fax`,`available`) values (1,'旺旺食品','434000','仙桃','0728-4124312','小明','13413441141','中国农业银行','654124345131','12312321@sina.com','5123123',1),(2,'达利园食品','430000','汉川','0728-4124312','大明','13413441141','中国农业银行','654124345131','12312321@sina.com','5123123',1),(3,'娃哈哈集团','513131','杭州','21312','小晨','12312','建设银行','512314141541','123131','312312',1);

/*Table structure for table `bus_sales` */

DROP TABLE IF EXISTS `bus_sales`;

CREATE TABLE `bus_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salestime` datetime DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_sales` */

/*Table structure for table `bus_salesback` */

DROP TABLE IF EXISTS `bus_salesback`;

CREATE TABLE `bus_salesback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salesbacktime` datetime DEFAULT NULL,
  `salebackprice` double(10,2) DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bus_salesback` */

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码【为了调事显示顺序】',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`id`,`pid`,`title`,`open`,`remark`,`address`,`available`,`ordernum`,`createtime`) values (1,0,'总经办',1,'大BOSS','深圳',1,1,'2019-04-10 14:06:32'),(2,1,'销售部',0,'程序员屌丝','武汉',1,2,'2019-04-10 14:06:32'),(3,1,'运营部',0,'无','武汉',1,3,'2019-04-10 14:06:32'),(4,1,'生产部',0,'无','武汉',1,4,'2019-04-10 14:06:32'),(5,2,'销售一部',0,'销售一部','武汉',1,5,'2019-04-10 14:06:32'),(6,2,'销售二部',0,'销售二部','武汉',1,6,'2019-04-10 14:06:32'),(7,3,'运营一部',0,'运营一部','武汉',1,7,'2019-04-10 14:06:32'),(8,2,'销售三部',0,'销售三部','11',1,8,'2019-04-10 14:06:32'),(9,2,'销售四部',0,'销售四部','222',1,9,'2019-04-10 14:06:32'),(10,2,'销售五部',0,'销售五部','33',1,10,'2019-04-10 14:06:32'),(18,4,'生产一部',0,'生产食品','武汉',1,11,'2019-04-13 09:49:38'),(19,3,'1',1,'1','1',1,12,'2019-12-31 02:55:05');

/*Table structure for table `sys_loginfo` */

DROP TABLE IF EXISTS `sys_loginfo`;

CREATE TABLE `sys_loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_loginfo` */

insert  into `sys_loginfo`(`id`,`loginname`,`loginip`,`logintime`) values (2,'超级管理员-system','127.0.0.1','2018-12-21 16:54:52'),(3,'超级管理员-system','127.0.0.1','2018-12-21 16:55:15'),(4,'超级管理员-system','127.0.0.1','2018-12-21 17:29:22'),(5,'超级管理员-system','127.0.0.1','2018-12-22 09:05:22'),(6,'超级管理员-system','127.0.0.1','2018-12-22 09:20:43'),(7,'超级管理员-system','127.0.0.1','2018-12-22 09:25:40'),(8,'超级管理员-system','127.0.0.1','2018-12-22 09:27:11'),(9,'超级管理员-system','127.0.0.1','2018-12-22 09:29:58'),(10,'超级管理员-system','127.0.0.1','2018-12-22 09:36:49'),(11,'超级管理员-system','127.0.0.1','2018-12-22 09:46:56'),(12,'超级管理员-system','127.0.0.1','2018-12-22 09:48:29'),(13,'超级管理员-system','127.0.0.1','2018-12-22 09:49:13'),(14,'超级管理员-system','127.0.0.1','2018-12-22 09:49:57'),(15,'超级管理员-system','127.0.0.1','2018-12-22 09:57:46'),(16,'超级管理员-system','127.0.0.1','2018-12-22 10:21:53'),(17,'超级管理员-system','127.0.0.1','2018-12-22 10:38:25'),(18,'超级管理员-system','127.0.0.1','2018-12-22 10:49:21'),(19,'超级管理员-system','127.0.0.1','2018-12-22 14:01:42'),(20,'超级管理员-system','127.0.0.1','2018-12-22 14:19:48'),(21,'超级管理员-system','127.0.0.1','2018-12-22 14:45:29'),(22,'超级管理员-system','127.0.0.1','2018-12-22 15:58:05'),(23,'超级管理员-system','127.0.0.1','2018-12-22 16:40:53'),(24,'超级管理员-system','127.0.0.1','2018-12-22 17:12:01'),(25,'超级管理员-system','127.0.0.1','2018-12-24 09:19:15'),(26,'超级管理员-system','127.0.0.1','2018-12-24 09:37:28'),(27,'超级管理员-system','127.0.0.1','2018-12-24 09:46:51'),(28,'超级管理员-system','127.0.0.1','2018-12-24 09:50:40'),(29,'超级管理员-system','127.0.0.1','2018-12-24 09:52:52'),(30,'超级管理员-system','127.0.0.1','2018-12-24 10:00:26'),(31,'超级管理员-system','127.0.0.1','2018-12-24 10:10:58'),(32,'超级管理员-system','127.0.0.1','2018-12-24 10:21:28'),(33,'超级管理员-system','127.0.0.1','2018-12-24 11:22:27'),(34,'超级管理员-system','127.0.0.1','2018-12-24 11:35:28'),(35,'超级管理员-system','127.0.0.1','2018-12-24 14:05:28'),(36,'超级管理员-system','127.0.0.1','2018-12-24 15:16:29'),(37,'李四-ls','127.0.0.1','2018-12-24 15:16:50'),(38,'王五-ww','127.0.0.1','2018-12-24 15:17:36'),(39,'赵六-zl','127.0.0.1','2018-12-24 15:17:47'),(40,'孙七-sq','127.0.0.1','2018-12-24 15:17:58'),(41,'刘八-lb','127.0.0.1','2018-12-24 15:18:09'),(42,'超级管理员-system','127.0.0.1','2018-12-24 15:34:59'),(43,'超级管理员-system','127.0.0.1','2018-12-24 15:35:09'),(44,'刘八-lb','127.0.0.1','2018-12-24 15:36:09'),(45,'刘八-lb','127.0.0.1','2018-12-24 15:42:58'),(46,'刘八-lb','127.0.0.1','2018-12-24 15:43:04'),(47,'超级管理员-system','127.0.0.1','2018-12-24 15:46:01'),(48,'超级管理员-system','127.0.0.1','2018-12-24 17:03:54'),(49,'超级管理员-system','127.0.0.1','2018-12-24 17:26:32'),(50,'超级管理员-system','127.0.0.1','2018-12-25 09:07:42'),(51,'超级管理员-system','127.0.0.1','2018-12-25 09:16:27'),(52,'超级管理员-system','127.0.0.1','2018-12-25 09:59:03'),(53,'超级管理员-system','127.0.0.1','2018-12-25 10:05:13'),(54,'超级管理员-system','127.0.0.1','2018-12-25 10:05:47'),(55,'超级管理员-system','127.0.0.1','2018-12-25 10:11:17'),(56,'超级管理员-system','127.0.0.1','2018-12-25 10:14:06'),(57,'超级管理员-system','127.0.0.1','2018-12-25 10:36:16'),(58,'超级管理员-system','127.0.0.1','2018-12-25 14:17:21'),(59,'超级管理员-system','127.0.0.1','2018-12-25 14:20:00'),(60,'超级管理员-system','127.0.0.1','2018-12-25 14:34:22'),(61,'超级管理员-system','127.0.0.1','2018-12-25 14:34:27'),(62,'超级管理员-system','127.0.0.1','2018-12-25 14:38:37'),(63,'超级管理员-system','127.0.0.1','2018-12-25 14:50:37'),(64,'超级管理员-system','127.0.0.1','2018-12-25 16:01:35'),(65,'超级管理员-system','127.0.0.1','2018-12-25 16:25:28'),(66,'超级管理员-system','127.0.0.1','2018-12-25 16:27:37'),(67,'超级管理员-system','127.0.0.1','2018-12-25 16:28:28'),(68,'超级管理员-system','127.0.0.1','2018-12-25 16:44:02'),(69,'超级管理员-system','127.0.0.1','2018-12-25 16:47:55'),(70,'超级管理员-system','127.0.0.1','2018-12-28 15:59:34'),(71,'超级管理员-system','127.0.0.1','2018-12-28 17:27:16'),(72,'超级管理员-system','127.0.0.1','2018-12-28 17:29:40'),(73,'超级管理员-system','127.0.0.1','2018-12-28 17:51:10'),(74,'超级管理员-system','127.0.0.1','2019-04-15 17:05:02'),(75,'超级管理员-system','127.0.0.1','2019-04-15 17:05:12'),(76,'超级管理员-system','127.0.0.1','2019-04-15 17:10:22'),(77,'刘八-lb','127.0.0.1','2019-04-15 17:11:45'),(78,'刘八-lb','127.0.0.1','2019-04-15 17:28:50'),(79,'超级管理员-system','127.0.0.1','2019-04-15 17:29:13'),(80,'刘八-lb','127.0.0.1','2019-04-15 17:30:59'),(81,'刘八-lb','127.0.0.1','2019-04-15 17:32:42'),(82,'刘八-lb','127.0.0.1','2019-04-15 17:33:48'),(83,'刘八-lb','127.0.0.1','2019-04-15 17:34:17'),(84,'超级管理员-system','127.0.0.1','2019-04-15 17:36:40'),(85,'超级管理员-system','127.0.0.1','2019-04-15 17:47:21'),(86,'超级管理员-system','127.0.0.1','2019-04-15 17:54:10'),(87,'超级管理员-system','127.0.0.1','2019-04-15 17:55:52'),(88,'超级管理员-system','127.0.0.1','2019-04-16 09:26:01'),(89,'超级管理员-system','127.0.0.1','2019-04-16 09:26:25'),(90,'超级管理员-system','127.0.0.1','2019-04-16 09:46:54'),(91,'超级管理员-system','127.0.0.1','2019-04-16 10:07:48'),(92,'超级管理员-system','127.0.0.1','2019-04-16 10:10:30'),(93,'超级管理员-system','127.0.0.1','2019-04-16 10:14:29'),(94,'超级管理员-system','127.0.0.1','2019-04-16 10:15:04'),(95,'超级管理员-system','127.0.0.1','2019-04-16 10:15:58'),(96,'超级管理员-system','127.0.0.1','2019-04-16 10:28:14'),(97,'超级管理员-system','127.0.0.1','2019-04-16 10:32:42'),(98,'超级管理员-system','127.0.0.1','2019-04-16 10:33:03'),(99,'超级管理员-system','127.0.0.1','2019-04-16 11:02:01'),(100,'超级管理员-system','127.0.0.1','2019-04-16 11:03:09'),(101,'超级管理员-system','127.0.0.1','2019-04-16 11:13:42'),(102,'超级管理员-system','127.0.0.1','2019-04-16 11:24:55'),(104,'超级管理员-system','127.0.0.1','2019-08-14 01:11:34'),(105,'超级管理员-system','127.0.0.1','2019-08-14 01:24:03'),(106,'李四-ls','127.0.0.1','2019-08-14 01:25:47'),(107,'李四-ls','127.0.0.1','2019-08-14 01:26:41'),(108,'孙七-sq','127.0.0.1','2019-08-14 01:28:22'),(109,'刘八-lb','127.0.0.1','2019-08-14 01:28:32'),(110,'超级管理员-system','127.0.0.1','2019-08-14 01:46:18'),(111,'超级管理员-system','127.0.0.1','2019-08-14 02:18:44'),(112,'超级管理员-system','127.0.0.1','2019-08-14 02:32:06'),(113,'李四-ls','127.0.0.1','2019-08-14 03:00:19'),(114,'李四-ls','127.0.0.1','2019-08-14 03:00:56'),(115,'李四-ls','127.0.0.1','2019-08-14 03:01:31'),(116,'李四-ls','127.0.0.1','2019-08-14 03:01:39'),(117,'李四-ls','127.0.0.1','2019-08-14 03:02:25'),(118,'李四-ls','127.0.0.1','2019-08-14 03:04:57'),(119,'李四-ls','127.0.0.1','2019-08-14 03:07:19'),(120,'李四-ls','127.0.0.1','2019-08-14 03:07:54'),(121,'超级管理员-system','127.0.0.1','2019-08-14 03:13:06'),(122,'李四-ls','127.0.0.1','2019-08-14 03:14:46'),(123,'超级管理员-system','127.0.0.1','2019-08-14 06:03:47'),(124,'超级管理员-system','127.0.0.1','2019-08-14 07:20:12'),(125,'超级管理员-system','127.0.0.1','2019-08-14 07:23:05'),(126,'超级管理员-system','127.0.0.1','2019-08-14 07:25:30'),(127,'超级管理员-system','127.0.0.1','2019-08-14 07:26:34'),(128,'超级管理员-system','127.0.0.1','2019-08-14 07:27:22'),(129,'超级管理员-system','127.0.0.1','2019-08-14 07:27:51'),(130,'超级管理员-system','127.0.0.1','2019-08-14 08:22:05'),(131,'超级管理员-system','127.0.0.1','2019-08-14 08:43:53'),(132,'超级管理员-system','127.0.0.1','2019-08-14 08:45:55'),(133,'超级管理员-system','127.0.0.1','2019-08-14 08:47:13'),(134,'超级管理员-system','127.0.0.1','2019-08-14 09:35:20'),(135,'超级管理员-system','127.0.0.1','2019-08-14 09:41:02'),(136,'超级管理员-system','127.0.0.1','2019-08-14 09:44:04'),(137,'超级管理员-system','127.0.0.1','2019-08-14 09:50:27'),(138,'超级管理员-system','127.0.0.1','2019-08-14 09:56:57'),(139,'超级管理员-system','127.0.0.1','2019-08-14 09:59:02'),(140,'超级管理员-system','127.0.0.1','2019-08-16 01:05:37'),(141,'超级管理员-system','127.0.0.1','2019-08-16 02:01:44'),(142,'超级管理员-system','127.0.0.1','2019-08-16 02:05:57'),(143,'超级管理员-system','127.0.0.1','2019-08-16 02:07:04'),(144,'超级管理员-system','127.0.0.1','2019-08-16 02:20:02'),(145,'超级管理员-system','127.0.0.1','2019-08-16 02:20:20'),(146,'超级管理员-system','127.0.0.1','2019-08-16 02:21:42'),(147,'超级管理员-system','127.0.0.1','2019-08-16 03:37:37'),(148,'超级管理员-system','127.0.0.1','2019-08-16 03:52:40'),(149,'超级管理员-system','127.0.0.1','2019-08-16 03:59:37'),(150,'超级管理员-system','127.0.0.1','2019-08-16 06:11:45'),(151,'超级管理员-system','127.0.0.1','2019-08-16 06:23:27'),(152,'超级管理员-system','127.0.0.1','2019-08-16 06:50:31'),(153,'超级管理员-system','127.0.0.1','2019-08-16 06:54:49'),(154,'超级管理员-system','127.0.0.1','2019-08-16 07:00:48'),(155,'超级管理员-system','127.0.0.1','2019-08-16 07:01:18'),(156,'超级管理员-system','127.0.0.1','2019-08-16 07:03:35'),(157,'超级管理员-system','127.0.0.1','2019-08-16 07:09:55'),(158,'超级管理员-system','127.0.0.1','2019-08-16 07:46:09'),(159,'超级管理员-system','127.0.0.1','2019-08-16 08:17:59'),(160,'超级管理员-system','127.0.0.1','2019-08-16 08:22:29'),(161,'超级管理员-system','127.0.0.1','2019-08-16 08:23:32'),(162,'超级管理员-system','127.0.0.1','2019-08-16 08:26:48'),(163,'超级管理员-system','127.0.0.1','2019-08-16 08:31:19'),(164,'超级管理员-system','127.0.0.1','2019-08-16 08:55:36'),(165,'超级管理员-system','127.0.0.1','2019-08-16 08:55:59'),(169,'超级管理员-system','127.0.0.1','2019-12-27 08:46:23'),(170,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 01:53:17'),(171,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 01:54:22'),(172,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 01:55:03'),(173,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 01:58:43'),(174,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 03:08:14'),(175,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 03:16:24'),(176,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 03:37:08'),(177,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 03:38:32'),(178,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 05:18:03'),(179,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 05:25:34'),(180,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 05:27:42'),(181,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 05:28:17'),(182,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 05:32:31'),(183,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 05:35:36'),(184,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 05:36:58'),(185,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 07:07:14'),(186,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 07:58:00'),(187,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 09:05:07'),(188,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-28 09:10:05'),(189,'超级管理员-system','127.0.0.1','2019-12-30 00:46:09'),(190,'超级管理员-system','127.0.0.1','2019-12-30 01:58:09'),(191,'超级管理员-system','127.0.0.1','2019-12-30 02:12:55'),(192,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 02:43:29'),(193,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 03:41:57'),(194,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 05:27:15'),(195,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 05:31:29'),(196,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 06:25:56'),(197,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 06:31:19'),(198,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 06:33:05'),(199,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 06:37:21'),(200,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 06:58:09'),(201,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 06:59:46'),(202,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 07:01:39'),(203,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 07:26:53'),(204,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 07:33:07'),(205,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 07:50:51'),(206,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 07:52:17'),(207,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 08:58:33'),(208,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 09:02:10'),(209,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 09:03:34'),(210,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 09:17:26'),(211,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-30 09:25:30'),(212,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-31 02:52:51'),(213,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-31 02:54:41'),(214,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-31 03:13:38'),(215,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-31 03:14:55'),(216,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-31 03:17:57'),(217,'超级管理员-system','0:0:0:0:0:0:0:1','2019-12-31 03:31:13'),(218,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-02 01:35:05'),(219,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-02 02:11:14'),(220,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-02 07:47:26'),(221,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-02 08:57:31'),(222,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-02 09:00:48'),(223,'超级管理员-system','127.0.0.1','2020-01-03 00:52:35'),(224,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-03 05:47:34'),(225,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-03 05:55:17'),(226,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-03 06:00:49'),(227,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-03 06:01:43'),(228,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-03 08:12:38'),(229,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-03 09:15:21'),(230,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-03 09:20:21'),(231,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-03 09:28:14'),(232,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-03 09:29:13'),(233,'超级管理员-system','127.0.0.1','2020-01-06 00:52:11'),(234,'超级管理员-system','127.0.0.1','2020-01-06 01:04:42'),(235,'超级管理员-system','127.0.0.1','2020-01-06 01:06:38'),(236,'超级管理员-system','127.0.0.1','2020-01-06 01:40:14'),(237,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 05:13:29'),(238,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 05:35:46'),(239,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 06:01:48'),(240,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 06:03:42'),(241,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 06:53:56'),(242,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 07:55:47'),(243,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 08:27:00'),(244,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 08:27:50'),(245,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 08:29:37'),(246,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 08:57:33'),(247,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 08:59:55'),(248,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 09:01:41'),(249,'超级管理员-system','0:0:0:0:0:0:0:1','2020-01-06 09:24:30'),(250,'超级管理员-system','127.0.0.1','2020-01-07 02:47:53'),(251,'超级管理员-system','127.0.0.1','2020-01-07 03:13:43'),(252,'超级管理员-system','127.0.0.1','2020-01-07 03:27:54'),(253,'超级管理员-system','127.0.0.1','2020-01-07 03:31:23'),(254,'超级管理员-system','127.0.0.1','2020-01-07 03:32:11'),(255,'超级管理员-system','127.0.0.1','2020-01-07 03:34:27'),(256,'超级管理员-system','127.0.0.1','2020-01-07 03:46:02'),(257,'超级管理员-system','127.0.0.1','2020-01-07 03:54:14'),(258,'超级管理员-system','127.0.0.1','2020-01-07 05:06:42'),(259,'超级管理员-system','127.0.0.1','2020-01-07 05:09:44'),(260,'超级管理员-system','127.0.0.1','2020-01-07 05:12:02'),(261,'超级管理员-system','127.0.0.1','2020-01-07 05:14:38'),(262,'超级管理员-system','127.0.0.1','2020-01-07 05:30:19'),(263,'超级管理员-system','127.0.0.1','2020-01-07 05:33:58'),(264,'超级管理员-system','127.0.0.1','2020-01-07 07:33:06'),(265,'超级管理员-system','127.0.0.1','2020-01-07 08:29:07'),(266,'超级管理员-system','127.0.0.1','2020-01-07 09:31:38'),(267,'超级管理员-system','127.0.0.1','2020-01-08 00:36:36'),(268,'超级管理员-system','127.0.0.1','2020-01-08 00:46:36'),(269,'超级管理员-system','127.0.0.1','2020-01-08 01:02:30'),(270,'超级管理员-system','127.0.0.1','2020-01-08 01:03:39'),(271,'超级管理员-system','127.0.0.1','2020-01-08 01:09:02'),(272,'超级管理员-system','127.0.0.1','2020-01-08 01:19:09'),(273,'超级管理员-system','127.0.0.1','2020-01-08 01:54:56'),(274,'超级管理员-system','127.0.0.1','2020-01-08 02:02:04'),(275,'超级管理员-system','127.0.0.1','2020-01-08 02:06:10'),(276,'超级管理员-system','127.0.0.1','2020-01-08 02:07:42'),(277,'超级管理员-system','127.0.0.1','2020-01-08 02:09:16');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`id`,`title`,`content`,`createtime`,`opername`) values (1,'关于系统V1.3更新公告','22211111111111111111111111111111111','2018-08-07 00:00:00','管理员'),(10,'关于系统V1.2更新公告','12312312<img src=\"/resources/layui/images/face/42.gif\" alt=\"[抓狂]\">','2018-08-07 00:00:00','超级管理员'),(11,'关于系统V1.1更新公告','21321321321<img src=\"/resources/layui/images/face/18.gif\" alt=\"[右哼哼]\">','2018-08-07 00:00:00','超级管理员');

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `percode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`pid`,`type`,`title`,`percode`,`icon`,`href`,`target`,`open`,`ordernum`,`available`) values (1,0,'menu','进销存管理系统',NULL,'&#xe68e;','','',1,1,1),(2,1,'menu','基础管理',NULL,'&#xe857;','','',1,2,1),(3,1,'menu','进货管理',NULL,'&#xe645;','',NULL,0,3,1),(4,1,'menu','销售管理',NULL,'&#xe611;','','',0,4,1),(5,1,'menu','系统管理',NULL,'&#xe614;','','',0,5,1),(6,1,'menu','其它管理',NULL,'&#xe628;','','',0,6,1),(7,2,'menu','客户管理',NULL,'&#xe651;','/bus/toCustomerManager','',0,7,1),(8,2,'menu','供应商管理',NULL,'&#xe658;','/bus/toProviderManager','',0,8,1),(9,2,'menu','商品管理',NULL,'&#xe657;','/bus/toGoodsManager','',0,9,1),(10,3,'menu','商品进货',NULL,'&#xe756;','/bus/toInportManager','',0,10,1),(11,3,'menu','商品退货查询',NULL,'&#xe65a;','/bus/toOutportManager','',0,11,1),(12,4,'menu','商品销售',NULL,'&#xe65b;','','',0,12,1),(13,4,'menu','销售退货查询',NULL,'&#xe770;','','',0,13,1),(14,5,'menu','部门管理',NULL,'&#xe770;','/sys/toDeptManager','',0,14,1),(15,5,'menu','菜单管理',NULL,'&#xe857;','/sys/toMenuManager','',0,15,1),(16,5,'menu','权限管理','','&#xe857;','/sys/toPermissionManager','',0,16,1),(17,5,'menu','角色管理','','&#xe650;','/sys/toRoleManager','',0,17,1),(18,5,'menu','用户管理','','&#xe612;','/sys/toUserManager','',0,18,1),(21,6,'menu','登陆日志',NULL,'&#xe675;','/sys/toLogLoginManager','',0,21,1),(22,6,'menu','系统公告',NULL,'&#xe756;','/sys/toNoticeManager',NULL,0,22,1),(23,6,'menu','图标管理',NULL,'&#xe670;','../resources/page/icon.html',NULL,0,23,1),(30,14,'permission','添加部门','dept:create','',NULL,NULL,0,24,1),(31,14,'permission','修改部门','dept:update','',NULL,NULL,0,26,1),(32,14,'permission','删除部门','dept:delete','',NULL,NULL,0,27,1),(34,15,'permission','添加菜单','menu:create','','','',0,29,1),(35,15,'permission','修改菜单','menu:update','',NULL,NULL,0,30,1),(36,15,'permission','删除菜单','menu:delete','',NULL,NULL,0,31,1),(38,16,'permission','添加权限','permission:create','',NULL,NULL,0,33,1),(39,16,'permission','修改权限','permission:update','',NULL,NULL,0,34,1),(40,16,'permission','删除权限','permission:delete','',NULL,NULL,0,35,1),(42,17,'permission','添加角色','role:create','',NULL,NULL,0,37,1),(43,17,'permission','修改角色','role:update','',NULL,NULL,0,38,1),(44,17,'permission','角色删除','role:delete','',NULL,NULL,0,39,1),(46,17,'permission','分配权限','role:selectPermission','',NULL,NULL,0,41,1),(47,18,'permission','添加用户','user:create','',NULL,NULL,0,42,1),(48,18,'permission','修改用户','user:update','',NULL,NULL,0,43,1),(49,18,'permission','删除用户','user:delete','',NULL,NULL,0,44,1),(51,18,'permission','用户分配角色','user:selectRole','',NULL,NULL,0,46,1),(52,18,'permission','重置密码','user:resetPwd',NULL,NULL,NULL,0,47,1),(53,14,'permission','部门查询','dept:view',NULL,NULL,NULL,0,48,1),(54,15,'permission','菜单查询','menu:view',NULL,NULL,NULL,0,49,1),(55,16,'permission','权限查询','permission:view',NULL,NULL,NULL,0,50,1),(56,17,'permission','角色查询','role:view',NULL,NULL,NULL,0,51,1),(57,18,'permission','用户查询','user:view',NULL,NULL,NULL,0,52,1),(68,7,'permission','客户查询','customer:view',NULL,NULL,NULL,NULL,60,1),(69,7,'permission','客户添加','customer:create',NULL,NULL,NULL,NULL,61,1),(70,7,'permission','客户修改','customer:update',NULL,NULL,NULL,NULL,62,1),(71,7,'permission','客户删除','customer:delete',NULL,NULL,NULL,NULL,63,1),(73,21,'permission','日志查询','info:view',NULL,NULL,NULL,NULL,65,1),(74,21,'permission','日志删除','info:delete',NULL,NULL,NULL,NULL,66,1),(75,21,'permission','日志批量删除','info:batchdelete',NULL,NULL,NULL,NULL,67,1),(76,22,'permission','公告查询','notice:view',NULL,NULL,NULL,NULL,68,1),(77,22,'permission','公告添加','notice:create',NULL,NULL,NULL,NULL,69,1),(78,22,'permission','公告修改','notice:update',NULL,NULL,NULL,NULL,70,1),(79,22,'permission','公告删除','notice:delete',NULL,NULL,NULL,NULL,71,1),(81,8,'permission','供应商查询','provider:view',NULL,NULL,NULL,NULL,73,1),(82,8,'permission','供应商添加','provider:create',NULL,NULL,NULL,NULL,74,1),(83,8,'permission','供应商修改','provider:update',NULL,NULL,NULL,NULL,75,1),(84,8,'permission','供应商删除','provider:delete',NULL,NULL,NULL,NULL,76,1),(86,22,'permission','公告查看','notice:viewnotice',NULL,NULL,NULL,NULL,78,1),(91,9,'permission','商品查询','goods:view',NULL,NULL,NULL,0,79,1),(92,9,'permission','商品添加','goods:create',NULL,NULL,NULL,0,80,1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`remark`,`available`,`createtime`) values (1,'超级管理员','拥有所有菜单权限',1,'2019-04-10 14:06:32'),(4,'基础数据管理员','基础数据管理员',1,'2019-04-10 14:06:32'),(5,'仓库管理员','仓库管理员',1,'2019-04-10 14:06:32'),(6,'销售管理员','销售管理员',1,'2019-04-10 14:06:32'),(7,'系统管理员','系统管理员',1,'2019-04-10 14:06:32'),(10,'000','000',1,'2020-01-03 09:16:00');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`rid`) USING BTREE,
  KEY `FK_tcsr9ucxypb3ce1q5qngsfk33` (`rid`) USING BTREE,
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`rid`,`pid`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,21),(1,22),(1,23),(1,31),(1,34),(1,35),(1,36),(1,38),(1,39),(1,40),(1,42),(1,43),(1,44),(1,46),(1,47),(1,48),(1,49),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,68),(1,69),(1,70),(1,71),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,81),(1,82),(1,83),(1,84),(1,86),(1,91),(1,92),(4,1),(4,2),(4,5),(4,7),(4,8),(4,9),(4,14),(4,15),(4,16),(4,17),(4,18),(4,30),(4,31),(4,32),(4,34),(4,35),(4,36),(4,38),(4,39),(4,40),(4,42),(4,43),(4,44),(4,46),(4,47),(4,48),(4,49),(4,51),(4,52),(4,53),(4,54),(4,55),(4,56),(4,57),(4,68),(4,69),(4,70),(4,71),(4,81),(4,82),(4,83),(4,84),(4,91),(4,92),(5,1),(5,3),(5,4),(5,10),(5,11),(5,12),(5,13),(6,1),(6,4),(6,12),(6,13),(7,1),(7,5),(7,6),(7,14),(7,15),(7,16),(7,17),(7,18),(7,21),(7,22),(7,23),(7,30),(7,31),(7,32),(7,34),(7,35),(7,36),(7,38),(7,39),(7,40),(7,42),(7,43),(7,44),(7,46),(7,47),(7,48),(7,49),(7,51),(7,52),(7,53),(7,54),(7,55),(7,56),(7,57),(7,73),(7,74),(7,75),(7,76),(7,77),(7,78),(7,79),(7,86),(10,1),(10,2),(10,7),(10,68);

/*Table structure for table `sys_role_user` */

DROP TABLE IF EXISTS `sys_role_user`;

CREATE TABLE `sys_role_user` (
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`) USING BTREE,
  KEY `FK_203gdpkwgtow7nxlo2oap5jru` (`rid`) USING BTREE,
  CONSTRAINT `sys_role_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role_user` */

insert  into `sys_role_user`(`rid`,`uid`) values (1,2),(4,3),(5,4),(6,5),(10,13);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `mgr` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT '1',
  `ordernum` int(11) DEFAULT NULL,
  `type` int(255) DEFAULT NULL COMMENT '用户类型[0超级管理员1，管理员，2普通用户]',
  `imgpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像地址',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_3rrcpvho2w1mx1sfiuuyir1h` (`deptid`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`name`,`loginname`,`address`,`sex`,`remark`,`pwd`,`deptid`,`hiredate`,`mgr`,`available`,`ordernum`,`type`,`imgpath`,`salt`) values (1,'超级管理员','system','系统深处的男人',1,'超级管理员','532ac00e86893901af5f0be6b704dbc7',1,'2018-06-25 11:06:34',NULL,1,1,0,'../resources/images/defaultusertitle.jpg','04A93C74C8294AA09A8B974FD1F4ECBB'),(2,'李四','ls','武汉',0,'KING','b07b848d69e0553b80e601d31571797e',1,'2018-06-25 11:06:36',NULL,1,2,1,'../resources/images/defaultusertitle.jpg','FC1EE06AE4354D3FBF7FDD15C8FCDA71'),(3,'王五','ww','武汉',1,'管理员','3c3f971eae61e097f59d52360323f1c8',3,'2018-06-25 11:06:38',2,1,3,1,'../resources/images/defaultusertitle.jpg','3D5F956E053C4E85B7D2681386E235D2'),(4,'赵六','zl','武汉',1,'程序员','2e969742a7ea0c7376e9551d578e05dd',4,'2018-06-25 11:06:40',3,1,4,1,'../resources/images/defaultusertitle.jpg','6480EE1391E34B0886ACADA501E31145'),(5,'孙七','sq','武汉',1,'程序员','47b4c1ad6e4b54dd9387a09cb5a03de1',2,'2018-06-25 11:06:43',4,1,5,1,'../resources/images/defaultusertitle.jpg','FE3476C3E3674E5690C737C269FCBF8E'),(6,'刘八','lb','深圳',1,'程序员','bcee2b05b4b591106829aec69a094806',4,'2018-08-06 11:21:12',3,1,6,1,'../resources/images/defaultusertitle.jpg','E6CCF54A09894D998225878BBD139B20'),(13,'000','00000','000',1,'000','8f88e7d42602a356b664d7d85c62be82',1,'2020-01-08 01:56:14',2,1,7,1,NULL,'136ABB2D1C3F4FEF8A3775A99E2C50E7');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
