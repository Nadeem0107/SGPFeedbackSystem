@echo off
echo ========================================
echo Starting Student Feedback System...
echo ========================================
echo.
echo The server is starting up.
echo The application will open automatically in your default browser in 20 seconds.
echo.
echo Press Ctrl+C to stop the server.
echo.

:: Start a background task to open the browser after 20 seconds
start /b cmd /c "timeout /t 20 >nul & start http://localhost:8080/CustomerFeedbackSystem"

:: Run the server using Maven Cargo
call .\mvnw cargo:run
