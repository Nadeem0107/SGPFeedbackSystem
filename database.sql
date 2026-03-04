/*
*********************************************************************
Student Feedback System - Consolidated Database Script
Combined from multiple SQL files across the project
*********************************************************************
*/

-- Create Database
CREATE DATABASE IF NOT EXISTS `StudentFeedbackSystem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `StudentFeedbackSystem`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
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

-- ----------------------------
-- Table structure for faculty (formerly product/teachers)
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
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

-- ----------------------------
-- Table structure for feedback (General)
-- ----------------------------
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

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
DROP TABLE IF EXISTS `complaint`;
CREATE TABLE `complaint` (
  `id` bigint(20) NOT NULL,
  `program` varchar(50) DEFAULT NULL,
  `academicYear` varchar(20) DEFAULT NULL,
  `complaintType` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `targetRole` varchar(20) DEFAULT NULL,
  `targetDepartment` varchar(50) DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `createdDatetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedDatetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for st_feedback (Teacher Feedback)
-- ----------------------------
DROP TABLE IF EXISTS `st_feedback`;
CREATE TABLE `st_feedback` (
    `ID` BIGINT PRIMARY KEY,
    `teacher_id` BIGINT,
    `student_id` BIGINT,
    `student_name` VARCHAR(255),
    `k_rating` INT,
    `c_rating` INT,
    `m_rating` INT,
    `p_rating` INT,
    `o_rating` INT,
    `comments` TEXT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `created_by` VARCHAR(255),
    `modified_by` VARCHAR(255),
    `created_datetime` TIMESTAMP,
    `modified_datetime` TIMESTAMP
);

-- ----------------------------
-- Table structure for college_facilities_feedback
-- ----------------------------
DROP TABLE IF EXISTS `college_facilities_feedback`;
CREATE TABLE `college_facilities_feedback` (
  `ID` bigint(20) NOT NULL,
  `program` varchar(255) DEFAULT NULL,
  `academic_year` varchar(50) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `q1` int(11) DEFAULT NULL,
  `q2` int(11) DEFAULT NULL,
  `q3` int(11) DEFAULT NULL,
  `q4` int(11) DEFAULT NULL,
  `q5` int(11) DEFAULT NULL,
  `q6` int(11) DEFAULT NULL,
  `q7` int(11) DEFAULT NULL,
  `q8` int(11) DEFAULT NULL,
  `q9` int(11) DEFAULT NULL,
  `q10` int(11) DEFAULT NULL,
  `q11` int(11) DEFAULT NULL,
  `q12` int(11) DEFAULT NULL,
  `q13` int(11) DEFAULT NULL,
  `q14` int(11) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `created_datetime` timestamp NULL DEFAULT NULL,
  `modified_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for course_end_feedback
-- ----------------------------
DROP TABLE IF EXISTS `course_end_feedback`;
CREATE TABLE `course_end_feedback` (
  `ID` bigint(20) NOT NULL,
  `coordinator` varchar(255) DEFAULT NULL,
  `sem` varchar(50) DEFAULT NULL,
  `sec` varchar(50) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `course_code` varchar(50) DEFAULT NULL,
  `academic_year` varchar(50) DEFAULT NULL,
  `reg_no` varchar(50) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `co1` int(11) DEFAULT NULL,
  `co2` int(11) DEFAULT NULL,
  `co3` int(11) DEFAULT NULL,
  `co4` int(11) DEFAULT NULL,
  `co5` int(11) DEFAULT NULL,
  `co6` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `created_datetime` timestamp NULL DEFAULT NULL,
  `modified_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for parents_feedback
-- ----------------------------
DROP TABLE IF EXISTS `parents_feedback`;
CREATE TABLE `parents_feedback` (
  `ID` bigint(20) NOT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `academic_year` varchar(50) DEFAULT NULL,
  `q1` int(11) DEFAULT NULL,
  `q2` int(11) DEFAULT NULL,
  `q3` int(11) DEFAULT NULL,
  `q4` int(11) DEFAULT NULL,
  `q5` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `created_datetime` timestamp NULL DEFAULT NULL,
  `modified_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `ID` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for st_midsem_feedback
-- ----------------------------
DROP TABLE IF EXISTS `st_midsem_feedback`;
CREATE TABLE `st_midsem_feedback` (
    `ID` BIGINT PRIMARY KEY,
    `reg_no` VARCHAR(50),
    `student_name` VARCHAR(255),
    `branch` VARCHAR(100),
    `semester` INT,
    `faculty` VARCHAR(255),
    `subject` VARCHAR(255),
    `q1` INT, `q2` INT, `q3` INT, `q4` INT, `q5` INT, `q6` INT,
    `q7` INT, `q8` INT, `q9` INT, `q10` INT, `q11` INT, `q12` INT,
    `created_by` VARCHAR(255),
    `modified_by` VARCHAR(255),
    `created_datetime` TIMESTAMP,
    `modified_datetime` TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for st_endsem_feedback
-- ----------------------------
DROP TABLE IF EXISTS `st_endsem_feedback`;
CREATE TABLE `st_endsem_feedback` (
    `ID` BIGINT PRIMARY KEY,
    `reg_no` VARCHAR(50),
    `student_name` VARCHAR(255),
    `branch` VARCHAR(100),
    `semester` VARCHAR(50),
    `faculty` VARCHAR(255),
    `subject` VARCHAR(255),
    `a1` INT, `a2` INT, `a3` INT, `a4` INT, `a5` INT, `a6` INT, `a7` INT,
    `b1` INT, `b2` INT, `b3` INT, `b4` INT, `b5` INT, `b6` INT, `b7` INT, `b8` INT, `b9` INT,
    `c1` INT, `c2` INT, `c3` INT, `c4` INT, `c5` INT, `c6` INT,
    `created_by` VARCHAR(255),
    `modified_by` VARCHAR(255),
    `created_datetime` TIMESTAMP,
    `modified_datetime` TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `test_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Populate data for department
-- ----------------------------
INSERT INTO `department` (`ID`, `name`, `description`) VALUES 
(1, 'Computer Science Engineering', 'All CSE related activities'),
(2, 'Electrical and Electronics Engineering', 'All EEE related activities'),
(3, 'Mechanical Engineering', 'All ME related activities'),
(4, 'Civil Engineering', 'All CE related activities'),
(5, 'Electronics and Communication Engineering', 'All ECE related activities');

-- ----------------------------
-- Populate data for user
-- ----------------------------
INSERT INTO `user`(`ID`,`name`,`userName`,`password`,`email`,`contactNo`,`gender`,`dob`,`roleId`,`RoleName`,`created_By`,`modified_by`,`created_datetime`,`modified_datetime`) VALUES 
(1, 'System Admin', 'Admin123', 'Pa$$w0rd!', 'admin@college.com', '1234567890', 'Male', '1990-01-01', 1, 'Admin', 'root', 'root', NOW(), NOW()),
(2, 'HOD User', 'HOD123', 'Pa$$w0rd!', 'hod@college.com', '0987654321', 'Female', '1985-05-15', 3, 'HOD', 'root', 'root', NOW(), NOW()),
(3, 'Principal User', 'Principal123', 'Pa$$w0rd!', 'principal@college.com', '1122334455', 'Male', '1980-10-20', 3, 'Principal', 'root', 'root', NOW(), NOW()),
(4, 'Nevada Goodman', 'User123', 'Pa$$w0rd!', 'student1@college.com', '7414253652', 'Male', '1994-01-12', 2, 'Student', 'root', 'root', NOW(), NOW()),
(5, 'Blythe Baxter', 'denuhuluvy', 'Pa$$w0rd!', 'student2@college.com', '8545658585', 'Male', '1994-01-06', 2, 'Student', 'root', 'root', NOW(), NOW());

-- ----------------------------
-- Populate data for dummy teacher
-- ----------------------------
INSERT INTO `user` (ID, NAME, USERNAME, PASSWORD, EMAIL, CONTACTNO, GENDER, DOB, ROLEID, ROLENAME, CREATED_BY, MODIFIED_BY, CREATED_DATETIME, MODIFIED_DATETIME)
VALUES (1001, 'John Doe', 'teacher1', 'teacher123', 'john.doe@college.edu', '9876543210', 'Male', '1980-01-01', 3, 'TEACHER', 'admin', 'admin', NOW(), NOW())
ON DUPLICATE KEY UPDATE NAME='John Doe';

-- ----------------------------
-- Populate data for faculty
-- ----------------------------
INSERT INTO `faculty`(`ID`, `Name`, `price`, `Description`, `Image`, `created_by`, `modified_by`, `created_datetime`, `modified_datetime`) VALUES 
(1, 'Bianca Lynn', '780', 'Non delectus volupt', 'Bianca Lynnphoto-1505740420928-5e560c06d30e.jpeg', 'Admin123', 'Admin123', NOW(), NOW());

-- ----------------------------
-- Populate data for feedback
-- ----------------------------
INSERT INTO `feedback`(`ID`,`feedback`,`productId`,`productName`,`userId`,`userName`,`Date`,`created_by`,`modified_by`,`created_datetime`,`modified_datetime`) VALUES 
(1,'nfnfhrfgnrfgn',1,'Bianca Lynn',2,'Nevada Goodman','2021-12-27','User123','User123','2021-12-27 16:26:07','2021-12-27 16:26:07'),
(2,'rfbhdthrt',1,'Bianca Lynn',3,'Blythe Baxter','2021-12-27','denuhuluvy','denuhuluvy','2021-12-27 16:56:22','2021-12-27 16:56:22');

SET FOREIGN_KEY_CHECKS = 1;
