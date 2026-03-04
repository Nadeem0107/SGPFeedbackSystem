-- Create complaint table for Student Feedback System
-- This table stores student complaints anonymously

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

-- Sample data (optional)
-- INSERT INTO `complaint` VALUES 
-- (1, 'CSE', '2024-25', 'Infrastructure', 'Lab Equipment Issue', 'The computers in the lab are outdated and frequently crash during practical sessions.', 'High', 'Pending', 'student', 'student', NOW(), NOW()),
-- (2, 'EEE', '2024-25', 'Faculty', 'Teaching Method Concern', 'Need more practical demonstrations in the classroom.', 'Medium', 'In Progress', 'student', 'student', NOW(), NOW());
