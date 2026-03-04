@echo off
set "JAVA_BIN=java"
set "PROJECT_DIR=d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem"
set "CLASSPATH=%PROJECT_DIR%\target\classes;%PROJECT_DIR%\target\CustomerFeedbackSystem\WEB-INF\lib\*"

echo ========================================
echo Database Table Creator
echo ========================================

"%JAVA_BIN%" -cp "%CLASSPATH%" in.co.customer.feedback.sys.util.CreateComplaintTable

echo.
echo Process finished.
pause
