@echo off
set "MVN=C:\Program Files\JetBrains\IntelliJ IDEA 2024.2.4\plugins\maven\lib\maven3\bin\mvn.cmd"
set "JAVA_HOME=C:\Program Files\Java\jdk-21"
set "PROJECT_ROOT=d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem"
set "WEBAPP_SRC=%PROJECT_ROOT%\src\main\webapp"
set "DEPLOY=%PROJECT_ROOT%\target\cargo\configurations\tomcat8x\webapps\CustomerFeedbackSystem"

echo ========================================
echo        ULTIMATE REPAIR SCRIPT (MAVEN)
echo ========================================

echo.
echo [1/3] Building Project with Maven...
cd /d "%PROJECT_ROOT%"
call "%MVN%" clean install -DskipTests

echo.
echo [2/3] Creating Database Table...
set "CP=%PROJECT_ROOT%\target\classes;%PROJECT_ROOT%\target\CustomerFeedbackSystem\WEB-INF\lib\*"
"%JAVA_HOME%\bin\java.exe" -cp "%CP%" in.co.customer.feedback.sys.util.CreateComplaintTable > "%PROJECT_ROOT%\db_creation_result.txt" 2>&1

echo.
echo [3/3] Forced Deployment to Server...
echo Copying JSPs...
xcopy /S /Y "%WEBAPP_SRC%\jsp\*.jsp" "%DEPLOY%\jsp\"
echo Copying CSS...
xcopy /S /Y "%WEBAPP_SRC%\css\*.css" "%DEPLOY%\css\"
echo Copying Compiled Classes...
xcopy /S /Y "%PROJECT_ROOT%\target\classes\*" "%DEPLOY%\WEB-INF\classes\"

echo.
echo ========================================
echo        REPAIR COMPLETED!
echo ========================================
echo Check db_creation_result.txt for database status.
echo.
echo 1. Close any running Tomcat windows.
echo 2. Run run-server.bat inside StudentFeedBackSystem\StudentFeedbackSystem\
echo 3. Refresh your browser (hard refresh: Ctrl+F5)
echo ========================================
pause
