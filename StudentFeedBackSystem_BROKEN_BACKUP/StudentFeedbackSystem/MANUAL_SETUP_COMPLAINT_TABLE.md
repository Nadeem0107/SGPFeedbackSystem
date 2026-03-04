# Manual Setup Instructions for Complaint Table

Since command-line tools (MySQL, Maven) are not in your PATH, here are the manual steps to complete the setup:

## Option 1: Using MySQL Workbench (Recommended)

1. **Open MySQL Workbench**
2. **Connect to your database** (localhost, root, password: nadeemm0107#)
3. **Select the database**: Click on `CustomerFeedbackSystem` in the left panel
4. **Open the SQL file**: 
   - Click File → Open SQL Script
   - Navigate to: `d:\StudentFeedbackSystem\StudentFeedBackSystem\StudentFeedbackSystem\database\create_complaint_table.sql`
5. **Execute the script**: Click the lightning bolt icon (⚡) or press Ctrl+Shift+Enter
6. **Verify**: You should see "complaint" table in the Tables list

## Option 2: Using phpMyAdmin

1. **Open phpMyAdmin** in your browser (usually http://localhost/phpmyadmin)
2. **Login** with your MySQL credentials
3. **Select database**: Click on `CustomerFeedbackSystem` in the left panel
4. **Go to SQL tab**
5. **Copy and paste** the following SQL:

```sql
CREATE TABLE IF NOT EXISTS `complaint` (
  `id` bigint(20) NOT NULL,
  `program` varchar(50) DEFAULT NULL,
  `academicYear` varchar(20) DEFAULT NULL,
  `complaintType` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `createdDatetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedDatetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

6. **Click "Go"** to execute
7. **Verify**: Check the "Structure" tab to see the table

## Option 3: Using Your IDE (Eclipse/IntelliJ)

### If you're using Eclipse:
1. **Open Database Perspective**: Window → Perspective → Open Perspective → Other → Database Development
2. **Create Connection** to MySQL (if not already done)
3. **Right-click** on your connection → SQL Scrapbook
4. **Paste the SQL** from `create_complaint_table.sql`
5. **Execute** (Ctrl+Alt+X or right-click → Execute All)

### If you're using IntelliJ IDEA:
1. **Open Database Tool**: View → Tool Windows → Database
2. **Connect to MySQL** (if not already done)
3. **Right-click** on `CustomerFeedbackSystem` → New → Query Console
4. **Paste the SQL** from `create_complaint_table.sql`
5. **Execute** (Ctrl+Enter or click the green play button)

## Option 4: Run the Java Utility (If Maven is configured in your IDE)

1. **Open the project** in your IDE (Eclipse/IntelliJ)
2. **Navigate to**: `src/main/java/in/co/customer/feedback/sys/util/CreateComplaintTable.java`
3. **Right-click** on the file
4. **Select**: "Run As" → "Java Application" (Eclipse) or "Run 'CreateComplaintTable.main()'" (IntelliJ)
5. **Check console** for success message

## Verification

After creating the table, verify it exists:

### Using MySQL Workbench:
- Refresh the schema
- Look for "complaint" table under CustomerFeedbackSystem → Tables

### Using phpMyAdmin:
- Click on CustomerFeedbackSystem
- You should see "complaint" in the table list

### Using SQL Query:
```sql
SHOW TABLES LIKE 'complaint';
```

Should return:
```
Tables_in_CustomerFeedbackSystem (complaint)
complaint
```

## Next Steps After Table Creation

Once the table is created:

1. **Build the project** in your IDE:
   - Eclipse: Right-click project → Run As → Maven build → Goals: `clean install`
   - IntelliJ: Maven tool window → Lifecycle → clean, then install

2. **Run the application**:
   - Eclipse: Right-click project → Run As → Maven build → Goals: `jetty:run`
   - IntelliJ: Maven tool window → Plugins → jetty → jetty:run

3. **Access the application**:
   - Open browser: `http://localhost:8080/CustomerFeedbackSystem`

## Troubleshooting

### Table already exists error:
- This is fine! The SQL uses `CREATE TABLE IF NOT EXISTS`
- The table won't be recreated if it already exists

### Access denied error:
- Check your MySQL credentials in `system.properties`
- Make sure MySQL server is running

### Database not found error:
- Create the database first:
  ```sql
  CREATE DATABASE IF NOT EXISTS CustomerFeedbackSystem;
  ```

## Need Help?

If you're stuck, please let me know:
1. Which method you're trying (MySQL Workbench, phpMyAdmin, IDE, etc.)
2. What error message you're seeing
3. I'll help you troubleshoot!

---

**Quick Copy-Paste SQL:**
```sql
CREATE TABLE IF NOT EXISTS `complaint` (
  `id` bigint(20) NOT NULL,
  `program` varchar(50) DEFAULT NULL,
  `academicYear` varchar(20) DEFAULT NULL,
  `complaintType` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `createdDatetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedDatetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```
