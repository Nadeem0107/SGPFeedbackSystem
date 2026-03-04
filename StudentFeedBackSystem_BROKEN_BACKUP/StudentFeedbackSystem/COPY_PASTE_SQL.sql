-- ========================================
-- COMPLAINT TABLE - COPY & PASTE THIS SQL
-- ========================================
-- Just copy everything below and paste into:
-- - MySQL Workbench SQL Editor
-- - phpMyAdmin SQL tab
-- - Your IDE's database console
-- ========================================

USE CustomerFeedbackSystem;

CREATE TABLE IF NOT EXISTS `complaint` (
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

-- ========================================
-- VERIFICATION QUERY
-- ========================================
-- After creating the table, run this to verify:

SHOW TABLES LIKE 'complaint';

-- You should see: complaint

-- ========================================
-- CHECK TABLE STRUCTURE
-- ========================================
-- Run this to see the table structure:

DESCRIBE complaint;

-- You should see 12 columns:
-- id, program, academicYear, complaintType, subject, 
-- description, priority, status, createdBy, modifiedBy,
-- createdDatetime, modifiedDatetime

-- ========================================
-- DONE! Table is ready.
-- Next: Build and run your application
-- ========================================
