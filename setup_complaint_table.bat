@echo off
REM Script to create the complaint table in the database
REM Make sure MySQL is running before executing this script

echo ========================================
echo Student Feedback System - Complaint Table Setup
echo ========================================
echo.

REM Database connection details (update if needed)
set DB_NAME=CustomerFeedbackSystem
set DB_USER=root
set DB_PASS=nadeemm0107#

echo Creating complaint table in database: %DB_NAME%
echo.

REM Execute the SQL script
mysql -u %DB_USER% -p%DB_PASS% %DB_NAME% < database\create_complaint_table.sql

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Complaint table created successfully.
    echo ========================================
    echo.
    echo You can now:
    echo 1. Build the project: mvn clean install
    echo 2. Run the application: mvn jetty:run
    echo 3. Access at: http://localhost:8080/CustomerFeedbackSystem
    echo.
) else (
    echo.
    echo ========================================
    echo ERROR! Failed to create complaint table.
    echo ========================================
    echo.
    echo Please check:
    echo 1. MySQL is running
    echo 2. Database credentials are correct
    echo 3. Database 'CustomerFeedbackSystem' exists
    echo.
)

pause
