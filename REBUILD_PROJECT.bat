@echo off
echo ========================================
echo Rebuilding Student Feedback System
echo ========================================
echo.
echo Step 1: Cleaning previous build...
call mvn clean
echo.
echo Step 2: Compiling and Installing...
call mvn install
echo.
echo Step 3: Deployment completed.
echo.
echo Now you can run the server using run-server.bat
echo ========================================
pause
