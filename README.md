# Customer Feedback System

## Prerequisites
To run this project, you need the following installed on your system:
- **Java Development Kit (JDK) 8**: The project is configured for Java 1.8.
- **Apache Maven**: For building the project and managing dependencies.
- **MySQL Server**: Version 8.0 or compatible.
- **Apache Tomcat**: Version 8.5 or 9.0 (to deploy the WAR file).

## Database Setup
1. **Create Database**:
   - Open your MySQL client (e.g., MySQL Workbench, Command Line).
   - Execute the SQL script located at:
     `../Database/CustomerFeedBackSys.sql`
   - This will create a database named `customerfeedbacksystem` and populate it with initial data.

2. **Configure Connection**:
   - Open `src/main/resources/system.properties`.
   - Update the `username` and `password` fields to match your local MySQL credentials:
     ```properties
     username=your_mysql_username
     password=your_mysql_password
     ```

## Configuration
**Important**: There is a hardcoded path in `src/main/resources/system.properties` that needs to be updated to match your local project location:
```properties
path=D://CustomerFeedBackSystem//CustomerFeedbackSystem//src//main//webapp//image
```
Change this to your actual project path:
```properties
path=C://Users//Asus//OneDrive//Desktop//StudentFeedBackSystem//StudentFeedBackSystem//CustomerFeedbackSystem//src//main//webapp//image
```
(Note: Use double slashes `//` or forward slashes `/` for paths).

## Build and Run
1. **Build the Project**:
   Open a terminal in the `CustomerFeedbackSystem` directory and run:
   ```bash
   mvn clean install
   ```
   This will generate a `CustomerFeedbackSystem.war` file in the `target` directory.

2. **Deploy**:
   - Copy the generated WAR file to your Tomcat `webapps` directory.
   - Start the Tomcat server.

3. **Access**:
   - Open a browser and go to: `http://localhost:8080/CustomerFeedbackSystem`

## Default Credentials
- **Admin**:
  - Username: `Admin123`
  - Password: `Pa$$w0rd!`
- **User**:
  - Username: `User123`
  - Password: `Pa$$w0rd!`
