@echo off
set MYSQL="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
set DB_NAME=CustomerFeedbackSystem
set DB_USER=root
set DB_PASS=nadeemm0107#

echo Creating database if not exists...
%MYSQL% -u %DB_USER% -p%DB_PASS% -e "CREATE DATABASE IF NOT EXISTS %DB_NAME%;"

echo Running CustomerFeedBackSys.sql...
%MYSQL% -u %DB_USER% -p%DB_PASS% %DB_NAME% < "d:\StudentFeedbackSystem\StudentFeedBackSystem\Database\CustomerFeedBackSys.sql"

echo Running new_tables.sql...
%MYSQL% -u %DB_USER% -p%DB_PASS% %DB_NAME% < "d:\StudentFeedbackSystem\new_tables.sql"

echo Running create_complaint_table.sql...
%MYSQL% -u %DB_USER% -p%DB_PASS% %DB_NAME% < "d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem\database\create_complaint_table.sql"

echo Running feedback.sql...
%MYSQL% -u %DB_USER% -p%DB_PASS% %DB_NAME% < "d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem\src\main\resources\feedback.sql"

echo Creating additional missing tables if needed...
%MYSQL% -u %DB_USER% -p%DB_PASS% %DB_NAME% -e "USE %DB_NAME%; CREATE TABLE IF NOT EXISTS teachers (ID bigint NOT NULL, Name varchar(225) DEFAULT NULL, price varchar(225) DEFAULT NULL, Description varchar(1500) DEFAULT NULL, Image varchar(755) DEFAULT NULL, created_by varchar(225) DEFAULT NULL, modified_by varchar(225) DEFAULT NULL, created_datetime timestamp NULL DEFAULT NULL, modified_datetime timestamp NULL DEFAULT NULL, PRIMARY KEY (ID));"
%MYSQL% -u %DB_USER% -p%DB_PASS% %DB_NAME% -e "USE %DB_NAME%; CREATE TABLE IF NOT EXISTS st_midsem_feedback (ID BIGINT PRIMARY KEY, reg_no VARCHAR(50), student_name VARCHAR(255), branch VARCHAR(100), semester INT, faculty VARCHAR(255), subject VARCHAR(255), q1 INT, q2 INT, q3 INT, q4 INT, q5 INT, q6 INT, q7 INT, q8 INT, q9 INT, q10 INT, q11 INT, q12 INT, created_by VARCHAR(255), modified_by VARCHAR(255), created_datetime TIMESTAMP, modified_datetime TIMESTAMP NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;"
%MYSQL% -u %DB_USER% -p%DB_PASS% %DB_NAME% -e "USE %DB_NAME%; CREATE TABLE IF NOT EXISTS st_endsem_feedback (ID BIGINT PRIMARY KEY, reg_no VARCHAR(50), student_name VARCHAR(255), branch VARCHAR(100), semester VARCHAR(50), faculty VARCHAR(255), subject VARCHAR(255), a1 INT, a2 INT, a3 INT, a4 INT, a5 INT, a6 INT, a7 INT, b1 INT, b2 INT, b3 INT, b4 INT, b5 INT, b6 INT, b7 INT, b8 INT, b9 INT, c1 INT, c2 INT, c3 INT, c4 INT, c5 INT, c6 INT, created_by VARCHAR(255), modified_by VARCHAR(255), created_datetime TIMESTAMP, modified_datetime TIMESTAMP NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;"

echo Database setup complete.
