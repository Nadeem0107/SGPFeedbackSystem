@echo off
set "DEPLOY_DIR=d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem\target\cargo\configurations\tomcat8x\webapps\CustomerFeedbackSystem"
set "SRC_DIR=d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem\src\main\webapp"
set "CLASS_DIR=d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem\target\classes"

echo ========================================
echo Applying Hot-Fix Deployment
echo ========================================

echo.
echo Step 1: Copying JSPs...
xcopy /S /Y "%SRC_DIR%\jsp\*.jsp" "%DEPLOY_DIR%\jsp\"

echo.
echo Step 2: Copying CSS...
xcopy /S /Y "%SRC_DIR%\css\*.css" "%DEPLOY_DIR%\css\"

echo.
echo Step 2b: Copying WEB-INF...
xcopy /S /Y "%SRC_DIR%\WEB-INF\web.xml" "%DEPLOY_DIR%\WEB-INF\"

echo.
echo Step 3: Copying Compiled Classes...
xcopy /S /Y "%CLASS_DIR%\*" "%DEPLOY_DIR%\WEB-INF\classes\"

echo.
echo Step 4: Verifying deployment...
if exist "%DEPLOY_DIR%\WEB-INF\classes\in\co\customer\feedback\sys\ctl\ComplaintCtl.class" (
    echo [SUCCESS] ComplaintCtl.class found in deployment!
) else (
    echo [ERROR] ComplaintCtl.class NOT FOUND! Please run REBUILD_PROJECT.bat first.
)

echo.
echo Done! Please restart the server using run-server.bat
echo ========================================
pause
