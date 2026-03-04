# Student Feedback System - How to Run

This document provides two methods to run the Student Feedback System project:
1. **Quick Start** - Get the project running in 5 minutes
2. **Detailed Procedure** - Complete step-by-step guide with explanations

---

## 🚀 METHOD 1: QUICK START (5 Minutes)

### Prerequisites Check
- ✅ MySQL Server installed and running
- ✅ Java JDK 8+ installed
- ✅ Database already created (if not, see detailed procedure)

### Quick Steps

**1. Configure Database** (30 seconds)
```bash
# Edit this file:
d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem\src\main\resources\system.properties

# Update your MySQL password:
password=YOUR_MYSQL_PASSWORD
```

**2. Start the Server** (2 minutes)
```bash
# Navigate to project directory
cd d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem

# Option A: Double-click the batch file
run-server.bat

# Option B: Or run in PowerShell/CMD
.\run-server.bat
```

**3. Access Application** (10 seconds)
```
Open browser: http://localhost:8080/CustomerFeedbackSystem
```

**4. Login**
```
Admin: Username: Admin123, Password: Pa$$w0rd!
User:  Username: User123,  Password: Pa$$w0rd!
```

**5. Stop Server**
```
Press Ctrl+C in the Tomcat console window
```

### Quick Troubleshooting
- **Port 8080 busy?** → `netstat -ano | findstr :8080` then kill the process
- **Database error?** → Check MySQL is running and password is correct
- **Server won't start?** → Check logs in `target/cargo/configurations/tomcat8x/logs/`

---

## 📚 METHOD 2: DETAILED PROCEDURE (Complete Guide)

### Part 1: System Prerequisites

#### 1.1 Java Development Kit (JDK)

**Check if Java is installed:**
```bash
java -version
```

**Expected output:**
```
java version "21.0.x" or "1.8.x" or higher
```

**If not installed:**
1. Download JDK from: https://www.oracle.com/java/technologies/downloads/
2. Install and set JAVA_HOME environment variable
3. Add `%JAVA_HOME%\bin` to PATH

#### 1.2 MySQL Server

**Check if MySQL is running:**
```bash
# In PowerShell
Get-Service MySQL*

# Or in CMD
sc query MySQL
```

**If not running:**
```bash
# Start MySQL service
net start MySQL80
```

**If not installed:**
1. Download MySQL from: https://dev.mysql.com/downloads/mysql/
2. Install with default settings
3. Remember the root password you set during installation

---

### Part 2: Database Setup

#### 2.1 Create Database

**Option A: Using MySQL Workbench (Recommended)**

1. Open MySQL Workbench
2. Connect to your local MySQL server (localhost:3306)
3. Click on "File" → "Open SQL Script"
4. Navigate to: `d:\StudentFeedbackSystem\StudentFeedBackSystem\Database\CustomerFeedBackSys.sql`
5. Click "Execute" (⚡ lightning bolt icon)
6. Wait for completion message

**Option B: Using MySQL Command Line**

1. Open Command Prompt as Administrator
2. Login to MySQL:
   ```bash
   mysql -u root -p
   ```
3. Enter your MySQL root password
4. Run the database script:
   ```sql
   source d:/StudentFeedbackSystem/StudentFeedBackSystem/Database/CustomerFeedBackSys.sql;
   ```

#### 2.2 Import Additional Feedback Tables

If you need the new feedback tables (College Facilities, Course End, Parents):

```sql
source d:/StudentFeedbackSystem/new_tables.sql;
```

#### 2.3 Verify Database Creation

```sql
-- Show all databases
SHOW DATABASES;

-- Use the feedback database
USE CustomerFeedbackSystem;

-- Show all tables
SHOW TABLES;

-- Expected tables:
-- - st_user (users table)
-- - st_product (faculty table)
-- - st_feedback (teacher feedback)
-- - college_facilities_feedback
-- - course_end_feedback
-- - parents_feedback
```

#### 2.4 Verify Default Users

```sql
-- Check if default users exist
SELECT * FROM st_user;

-- You should see:
-- Admin123 (roleId = 1)
-- User123  (roleId = 2)
```

---

### Part 3: Project Configuration

#### 3.1 Database Connection Settings

1. **Navigate to configuration file:**
   ```
   d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem\src\main\resources\system.properties
   ```

2. **Open in any text editor** (Notepad, VS Code, etc.)

3. **Update the following properties:**

   ```properties
   # Database URL (usually no change needed)
   url=jdbc:mysql://localhost:3306/CustomerFeedbackSystem
   
   # Database Driver (no change needed)
   driver=com.mysql.cj.jdbc.Driver
   
   # Database Username (change if you use different user)
   username=root
   
   # Database Password (IMPORTANT: Update this!)
   password=YOUR_MYSQL_ROOT_PASSWORD
   
   # Image upload path (usually no change needed)
   path=d://StudentFeedbackSystem//StudentFeedBackSystem//StudentFeedbackSystem//src//main//webapp//image
   ```

4. **Save the file**

#### 3.2 Verify Project Structure

Ensure these directories exist:
```
d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem\
├── src\
│   ├── main\
│   │   ├── java\
│   │   ├── resources\
│   │   │   └── system.properties  ← Configuration file
│   │   └── webapp\
│   │       ├── jsp\
│   │       ├── css\
│   │       └── image
├── target\
│   ├── CustomerFeedbackSystem.war  ← Built application
│   └── cargo\
│       └── configurations\
│           └── tomcat8x  ← Embedded Tomcat
├── pom.xml
└── run-server.bat  ← Startup script
```

---

### Part 4: Running the Application

#### 4.1 Using the Batch Script (Easiest)

1. **Open File Explorer**
2. **Navigate to:**
   ```
   d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem
   ```
3. **Double-click:** `run-server.bat`
4. **A new console window will open** showing Tomcat startup logs
5. **Wait for the message:**
   ```
   INFO: Server startup in [XXXX] milliseconds
   ```
6. **Server is now running!**

#### 4.2 Using PowerShell/Command Prompt

1. **Open PowerShell or Command Prompt**
2. **Navigate to project directory:**
   ```bash
   cd d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem
   ```
3. **Run the batch file:**
   ```bash
   .\run-server.bat
   ```
4. **Wait for server startup message**

#### 4.3 Using Maven (Alternative - For Developers)

If you have Maven installed and want to rebuild:

1. **Clean previous build:**
   ```bash
   mvnw clean
   ```

2. **Build and run:**
   ```bash
   mvnw clean package cargo:run -DskipTests
   ```

3. **Or use system Maven:**
   ```bash
   mvn clean package cargo:run -DskipTests
   ```

---

### Part 5: Accessing the Application

#### 5.1 Open Web Browser

Use any modern web browser:
- Google Chrome (Recommended)
- Microsoft Edge
- Mozilla Firefox

#### 5.2 Navigate to Application

**URL:**
```
http://localhost:8080/CustomerFeedbackSystem
```

**Alternative URLs:**
```
http://127.0.0.1:8080/CustomerFeedbackSystem
http://localhost:8080/CustomerFeedbackSystem/login
http://localhost:8080/CustomerFeedbackSystem/welcome
```

#### 5.3 Login Credentials

**Admin Account:**
- **Username:** `Admin123`
- **Password:** `Pa$$w0rd!`
- **Access:** Full system access, can view all feedback, manage users and faculty

**Student/User Account:**
- **Username:** `User123`
- **Password:** `Pa$$w0rd!`
- **Access:** Submit feedback, view faculty, update profile

**Create New Account:**
1. Click "Sign Up" on the login page
2. Fill in registration form
3. Default role will be "Student" (roleId = 2)

---

### Part 6: Using the Application

#### 6.1 Student Dashboard Features

After logging in as a student, you can:

1. **Submit College Facilities Feedback**
   - Rate library, infrastructure, staff behavior, etc.
   - Navigate: Home → College Facilities → Give Feedback

2. **Submit Course End Feedback**
   - Provide feedback on course outcomes
   - Navigate: Home → Course End Feedback → Give Feedback

3. **Submit Parents Feedback**
   - Submit feedback on behalf of parents
   - Navigate: Home → Parents Feedback → Give Feedback

4. **Rate Teachers**
   - View faculty directory
   - Submit teacher feedback
   - Navigate: Home → Teacher Feedback → View Teachers

5. **Manage Profile**
   - Update personal information
   - Change password
   - Navigate: Home → My Profile

#### 6.2 Admin Dashboard Features

After logging in as admin, you can:

1. **View All Feedback**
   - College Facilities Feedback List
   - Course End Feedback List
   - Parents Feedback List
   - Teacher Feedback List

2. **Manage Students**
   - View all registered students
   - Search and filter users
   - Navigate: Home → Manage Students

3. **Manage Faculty**
   - Add new faculty members
   - Edit faculty details
   - Delete faculty records
   - Navigate: Home → Manage Faculty

4. **View Reports**
   - Analyze feedback data
   - Export reports (if implemented)

---

### Part 7: Stopping the Server

#### 7.1 Normal Shutdown

1. **Go to the Tomcat console window** (the black window that opened when you started the server)
2. **Press:** `Ctrl + C`
3. **If prompted "Terminate batch job (Y/N)?", type:** `Y`
4. **Wait for shutdown message:**
   ```
   INFO: Stopping service [Catalina]
   ```

#### 7.2 Force Stop (If server hangs)

**Using Task Manager:**
1. Press `Ctrl + Shift + Esc` to open Task Manager
2. Find "java.exe" or "javaw.exe"
3. Right-click → End Task

**Using Command Line:**
```bash
# Find Java processes using port 8080
netstat -ano | findstr :8080

# Note the PID (Process ID) from the output
# Kill the process (replace XXXX with actual PID)
taskkill /PID XXXX /F
```

---

### Part 8: Troubleshooting Guide

#### 8.1 Port 8080 Already in Use

**Problem:** Error message "Port 8080 is already in use"

**Solution:**
```bash
# Step 1: Find what's using port 8080
netstat -ano | findstr :8080

# Step 2: Note the PID (last column)
# Example output: TCP  0.0.0.0:8080  0.0.0.0:0  LISTENING  12345

# Step 3: Kill the process
taskkill /PID 12345 /F

# Step 4: Try starting server again
.\run-server.bat
```

#### 8.2 Database Connection Error

**Problem:** "Cannot connect to database" or "Access denied for user"

**Solutions:**

1. **Check MySQL is running:**
   ```bash
   Get-Service MySQL*
   # If stopped, start it:
   net start MySQL80
   ```

2. **Verify credentials:**
   - Open `system.properties`
   - Check username (usually `root`)
   - Check password matches your MySQL root password

3. **Test connection manually:**
   ```bash
   mysql -u root -p
   # Enter password
   # If successful, type:
   USE CustomerFeedbackSystem;
   SHOW TABLES;
   ```

4. **Check database exists:**
   ```sql
   SHOW DATABASES LIKE 'CustomerFeedbackSystem';
   ```

#### 8.3 Application Not Loading / 404 Error

**Problem:** Browser shows "404 Not Found" or blank page

**Solutions:**

1. **Check server started successfully:**
   - Look for "Server startup in [X] milliseconds" in console
   - No red ERROR messages should appear

2. **Verify WAR file exists:**
   ```bash
   dir target\CustomerFeedbackSystem.war
   ```

3. **Check deployment:**
   - Look in console for: "Deploying web application"
   - Should see: "Deployment of web application directory [CustomerFeedbackSystem] has finished"

4. **Try different URL:**
   ```
   http://localhost:8080/CustomerFeedbackSystem/
   http://localhost:8080/CustomerFeedbackSystem/welcome
   http://localhost:8080/CustomerFeedbackSystem/login
   ```

#### 8.4 Java Not Found Error

**Problem:** "'java' is not recognized as an internal or external command"

**Solution:**

1. **Verify Java installation:**
   ```bash
   java -version
   ```

2. **If not found, check JAVA_HOME:**
   ```bash
   echo %JAVA_HOME%
   ```

3. **Set JAVA_HOME (if needed):**
   - Right-click "This PC" → Properties
   - Advanced system settings → Environment Variables
   - Add new System Variable:
     - Name: `JAVA_HOME`
     - Value: `C:\Program Files\Java\jdk-21` (or your JDK path)
   - Edit PATH variable, add: `%JAVA_HOME%\bin`

#### 8.5 Maven Build Errors (If rebuilding)

**Problem:** Build fails with errors

**Solutions:**

1. **Clean and rebuild:**
   ```bash
   mvnw clean install -U
   ```

2. **Skip tests:**
   ```bash
   mvnw clean package -DskipTests
   ```

3. **Use offline mode (if internet issues):**
   ```bash
   mvnw -o clean package
   ```

#### 8.6 Page Styling Issues / CSS Not Loading

**Problem:** Pages look unstyled or broken

**Solutions:**

1. **Clear browser cache:**
   - Chrome: `Ctrl + Shift + Delete`
   - Select "Cached images and files"
   - Clear data

2. **Hard refresh:**
   - Press `Ctrl + F5` on the page

3. **Check browser console:**
   - Press `F12`
   - Look for 404 errors on CSS/JS files

---

### Part 9: Advanced Configuration

#### 9.1 Changing Server Port

If you need to use a different port (e.g., 9090 instead of 8080):

1. **Edit `pom.xml`:**
   ```xml
   <configuration>
     <properties>
       <cargo.servlet.port>9090</cargo.servlet.port>
     </properties>
   </configuration>
   ```

2. **Rebuild and run:**
   ```bash
   mvnw clean package cargo:run
   ```

3. **Access at:**
   ```
   http://localhost:9090/CustomerFeedbackSystem
   ```

#### 9.2 Database Connection Pooling

For better performance, connection pooling is already configured in the code. Settings in `system.properties`:

```properties
# Connection pool settings (if using)
initialPoolSize=5
maxPoolSize=20
minPoolSize=2
```

#### 9.3 Logging Configuration

Check application logs:
```
target\cargo\configurations\tomcat8x\logs\
├── catalina.log      ← Tomcat server logs
├── localhost.log     ← Application logs
└── manager.log       ← Deployment logs
```

---

### Part 10: Project Information

#### 10.1 Technology Stack

- **Backend:** Java Servlets, JSP
- **Frontend:** HTML, CSS, JavaScript, Bootstrap
- **Database:** MySQL 8.0
- **Server:** Apache Tomcat 8.5
- **Build Tool:** Maven
- **Architecture:** MVC (Model-View-Controller)

#### 10.2 Project Structure

```
StudentFeedbackSystem/
├── src/main/java/in/co/customer/feedback/sys/
│   ├── bean/          # Data models (POJOs)
│   ├── ctl/           # Controllers (Servlets)
│   ├── model/         # Database operations (DAO)
│   └── util/          # Utility classes
├── src/main/webapp/
│   ├── jsp/           # View files (JSP pages)
│   ├── css/           # Stylesheets
│   ├── image/         # Images and uploads
│   └── WEB-INF/       # Configuration files
└── src/main/resources/
    └── system.properties  # Database config
```

#### 10.3 Database Schema

**Main Tables:**
- `st_user` - User accounts (students and admins)
- `st_product` - Faculty/Teacher information
- `st_feedback` - Teacher feedback submissions
- `college_facilities_feedback` - Facilities feedback
- `course_end_feedback` - Course end feedback
- `parents_feedback` - Parents feedback

---

## 📋 Quick Reference Card

### Essential Commands

```bash
# Start Server
.\run-server.bat

# Stop Server
Ctrl + C (in console window)

# Check Port Usage
netstat -ano | findstr :8080

# Start MySQL
net start MySQL80

# Stop MySQL
net stop MySQL80

# Check Java Version
java -version

# Rebuild Project (if needed)
mvnw clean package -DskipTests
```

### Essential URLs

```
Application:  http://localhost:8080/CustomerFeedbackSystem
Login Page:   http://localhost:8080/CustomerFeedbackSystem/login
Welcome Page: http://localhost:8080/CustomerFeedbackSystem/welcome
```

### Default Credentials

```
Admin:  Admin123 / Pa$$w0rd!
User:   User123  / Pa$$w0rd!
```

### Important Files

```
Config:     src\main\resources\system.properties
Startup:    run-server.bat
Database:   Database\CustomerFeedBackSys.sql
New Tables: new_tables.sql
Logs:       target\cargo\configurations\tomcat8x\logs\
```

---

## ✅ Success Checklist

Before running the project, ensure:

- [ ] MySQL Server is installed and running
- [ ] Java JDK 8+ is installed
- [ ] Database `CustomerFeedbackSystem` is created
- [ ] All tables are created (run SQL scripts)
- [ ] `system.properties` has correct MySQL password
- [ ] Port 8080 is available (not used by another application)
- [ ] `run-server.bat` file exists in project root
- [ ] `target\CustomerFeedbackSystem.war` file exists

After starting server, verify:

- [ ] Console shows "Server startup in [X] milliseconds"
- [ ] No red ERROR messages in console
- [ ] Browser can access http://localhost:8080/CustomerFeedbackSystem
- [ ] Login page loads correctly
- [ ] Can login with default credentials
- [ ] Dashboard displays properly

---

## 🆘 Getting Help

If you encounter issues:

1. **Check console logs** for error messages
2. **Verify database connection** using MySQL Workbench
3. **Ensure all prerequisites** are met
4. **Review troubleshooting section** above
5. **Check Tomcat logs** in `target/cargo/configurations/tomcat8x/logs/`

---

**Last Updated:** February 2026  
**Project:** Student Feedback System  
**Version:** 1.0
