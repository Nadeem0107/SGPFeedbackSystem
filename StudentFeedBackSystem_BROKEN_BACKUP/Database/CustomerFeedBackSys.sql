/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.22 : Database - customerfeedbacksystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`customerfeedbacksystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `customerfeedbacksystem`;

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `ID` bigint NOT NULL,
  `feedback` varchar(1500) DEFAULT NULL,
  `productId` bigint DEFAULT NULL,
  `productName` varchar(225) DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `userName` varchar(225) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `created_by` varchar(225) DEFAULT NULL,
  `modified_by` varchar(225) DEFAULT NULL,
  `created_datetime` timestamp NULL DEFAULT NULL,
  `modified_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `feedback` */

insert  into `feedback`(`ID`,`feedback`,`productId`,`productName`,`userId`,`userName`,`Date`,`created_by`,`modified_by`,`created_datetime`,`modified_datetime`) values 
(1,'nfnfhrfgnrfgn',1,'Bianca Lynn',2,'Nevada Goodman','2021-12-27','User123','User123','2021-12-27 16:26:07','2021-12-27 16:26:07'),
(2,'rfbhdthrt',1,'Bianca Lynn',3,'Blythe Baxter','2021-12-27','denuhuluvy','denuhuluvy','2021-12-27 16:56:22','2021-12-27 16:56:22');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `ID` bigint NOT NULL,
  `Name` varchar(225) DEFAULT NULL,
  `price` varchar(225) DEFAULT NULL,
  `Description` varchar(1500) DEFAULT NULL,
  `Image` varchar(755) DEFAULT NULL,
  `created_by` varchar(225) DEFAULT NULL,
  `modified_by` varchar(225) DEFAULT NULL,
  `created_datetime` timestamp NULL DEFAULT NULL,
  `modified_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`ID`,`Name`,`price`,`Description`,`Image`,`created_by`,`modified_by`,`created_datetime`,`modified_datetime`) values 
(1,'Bianca Lynn','780','Non delectus volupt','Bianca Lynnphoto-1505740420928-5e560c06d30e.jpeg','Admin123','Admin123','2021-12-27 12:32:28','2021-12-27 12:32:28');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `ID` bigint NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `userName` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `contactNo` varchar(225) DEFAULT NULL,
  `gender` varchar(225) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `roleId` bigint DEFAULT NULL,
  `RoleName` varchar(225) DEFAULT NULL,
  `created_By` varchar(225) DEFAULT NULL,
  `modified_by` varchar(225) DEFAULT NULL,
  `created_datetime` timestamp NULL DEFAULT NULL,
  `modified_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`ID`,`name`,`userName`,`password`,`email`,`contactNo`,`gender`,`dob`,`roleId`,`RoleName`,`created_By`,`modified_by`,`created_datetime`,`modified_datetime`) values 
(1,'Leigh Salinas','Admin123','Pa$$w0rd!','xija@mailinator.com','7454253565','Male','1994-01-12',1,'Admin','root','root','2021-12-27 11:20:30','2021-12-27 11:20:30'),
(2,'Nevada Goodman','User123','Pa$$w0rd!','veteqi@mailinator.com','7414253652','Male','1994-01-12',2,'USER','root','root','2021-12-27 13:09:25','2021-12-27 13:09:25'),
(3,'Blythe Baxter','denuhuluvy','Pa$$w0rd!','miveqacyx@mailinator.com','8545658585','Male','1994-01-06',2,'USER','root','root','2021-12-27 16:55:59','2021-12-27 16:55:59');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
