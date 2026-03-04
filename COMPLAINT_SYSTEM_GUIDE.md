# Student Complaint System - Implementation Guide

## Overview
The Student Complaint System has been successfully integrated into the Student Feedback System. This feature allows students to submit complaints anonymously, and enables administrators to view and manage these complaints while maintaining student privacy.

## Key Features

### For Students:
1. **Anonymous Complaint Submission** - Students can submit complaints without revealing their identity
2. **Multiple Complaint Types** - Academic, Infrastructure, Faculty, Administration, Hostel, Library, Canteen, Transport, and Other
3. **Priority Levels** - Low, Medium, High, and Urgent
4. **Detailed Description** - Students can provide comprehensive details about their concerns
5. **Easy Access** - Complaint form accessible from the student dashboard

### For Administrators:
1. **Anonymous Viewing** - Complaints are displayed without student names to protect privacy
2. **Search & Filter** - Filter by subject, complaint type, and status
3. **Status Management** - Update complaint status (Pending, In Progress, Resolved, Closed)
4. **Comprehensive View** - See all complaint details including date, program, type, priority, and description
5. **Multiple Access Points** - Available from admin dashboard and faculty directory

## Database Schema

### Table: `complaint`
```sql
- id (bigint) - Primary key
- program (varchar) - Student's program (CSE, EEE, ME, CE)
- academicYear (varchar) - Academic year
- complaintType (varchar) - Type of complaint
- subject (varchar) - Brief subject
- description (text) - Detailed description
- priority (varchar) - Priority level
- status (varchar) - Current status
- createdBy (varchar) - User ID (for tracking, not displayed)
- modifiedBy (varchar) - Last modifier
- createdDatetime (timestamp) - Submission date
- modifiedDatetime (timestamp) - Last update date
```

## Files Created/Modified

### Backend Files:
1. **ComplaintBean.java** - Data model for complaints
2. **ComplaintModel.java** - Database operations (CRUD)
3. **ComplaintCtl.java** - Controller for complaint submission
4. **ComplaintListCtl.java** - Controller for viewing/managing complaints
5. **CFSView.java** - Added routing constants

### Frontend Files:
1. **complaint.jsp** - Complaint submission form
2. **complaintList.jsp** - Admin view for managing complaints
3. **welcome.jsp** - Added complaint cards for students and admins
4. **productList.jsp** - Added "View Complaints" button for admins

### Database Files:
1. **create_complaint_table.sql** - SQL script to create the complaint table

## Setup Instructions

### 1. Database Setup
Run the SQL script to create the complaint table:
```bash
mysql -u root -p studentfeedback < database/create_complaint_table.sql
```

Or manually execute the SQL in your MySQL client:
```sql
USE studentfeedback;
SOURCE /path/to/create_complaint_table.sql;
```

### 2. Build the Project
```bash
mvn clean install
```

### 3. Deploy and Run
```bash
mvn jetty:run
```

## Usage Guide

### For Students:

1. **Login** to the system as a student
2. From the **Home/Dashboard**, click on the **"Submit Complaint"** card
3. Fill in the complaint form:
   - Select your **Program** (CSE, EEE, ME, CE)
   - Select **Academic Year**
   - Choose **Complaint Type**
   - Set **Priority** level
   - Enter a brief **Subject**
   - Provide detailed **Description**
4. Click **"Save"** to submit
5. You'll see a success message confirming submission

**Note:** Your complaint is completely anonymous. Your name will not be shown to anyone viewing the complaints.

### For Administrators:

1. **Login** as an admin
2. Access complaints through:
   - **Home Dashboard** → "Student Complaints" card
   - **Faculty Directory** → "View Complaints" button
3. Use the **search/filter** options:
   - Search by subject
   - Filter by complaint type
   - Filter by status
4. **Update Status** by selecting from the dropdown in each row:
   - Pending
   - In Progress
   - Resolved
   - Closed
5. View complaint details including:
   - Submission date
   - Program and academic year
   - Complaint type
   - Subject and description
   - Priority level
   - Current status

## Privacy & Anonymity

### How Anonymity is Maintained:
1. **No Student Names Displayed** - The complaint list shows only the program and academic year, not student names
2. **Internal Tracking Only** - The `createdBy` field stores the user ID for system tracking but is never displayed
3. **Clear Privacy Notice** - Both submission and viewing pages display privacy notices
4. **Admin Awareness** - Admins are reminded that complaints are anonymous

### Privacy Notice on Submission Form:
> "Your complaint will be submitted anonymously. Your identity will not be disclosed to anyone."

### Privacy Notice on Admin View:
> "All complaints are displayed anonymously to protect student privacy. Student identities are not shown."

## Complaint Types

1. **Academic** - Course content, exams, grading issues
2. **Infrastructure** - Building facilities, classrooms, labs
3. **Faculty** - Teaching methods, faculty behavior
4. **Administration** - Administrative processes, office staff
5. **Hostel** - Hostel facilities and management
6. **Library** - Library resources and services
7. **Canteen** - Food quality and canteen services
8. **Transport** - College transportation issues
9. **Other** - Any other concerns

## Priority Levels

- **Low** (Green badge) - Minor issues, can be addressed over time
- **Medium** (Yellow badge) - Moderate issues requiring attention
- **High** (Orange badge) - Serious issues needing prompt action
- **Urgent** (Red badge) - Critical issues requiring immediate attention

## Status Workflow

1. **Pending** (Gray) - Newly submitted, awaiting review
2. **In Progress** (Blue) - Being investigated or addressed
3. **Resolved** (Green) - Issue has been fixed
4. **Closed** (Dark) - Complaint closed (resolved or otherwise)

## Testing the Feature

### Test as Student:
1. Login with student credentials (roleId = 2)
2. Navigate to complaint form
3. Submit a test complaint
4. Verify success message

### Test as Admin:
1. Login with admin credentials (roleId = 1)
2. Navigate to complaint list
3. Verify complaint appears (without student name)
4. Test search/filter functionality
5. Update complaint status
6. Verify status update

## Troubleshooting

### Common Issues:

1. **"Table doesn't exist" error**
   - Solution: Run the SQL script to create the complaint table

2. **Routing errors (404)**
   - Solution: Rebuild the project with `mvn clean install`

3. **Complaints not showing**
   - Check database connection
   - Verify complaint table has data
   - Check user role (must be admin to view)

4. **Status update not working**
   - Check JavaScript console for errors
   - Verify form submission
   - Check database permissions

## Future Enhancements

Potential improvements for the complaint system:

1. **Email Notifications** - Notify admins of new complaints
2. **Complaint Categories** - Sub-categories for better organization
3. **Attachment Support** - Allow students to upload supporting documents
4. **Response System** - Allow admins to respond to complaints (anonymously)
5. **Analytics Dashboard** - Visualize complaint trends and statistics
6. **Auto-Assignment** - Automatically assign complaints to relevant departments
7. **Escalation System** - Auto-escalate unresolved complaints after a time period

## Security Considerations

1. **Data Protection** - Student identity is protected in the database
2. **Access Control** - Only admins can view complaints
3. **Audit Trail** - All status changes are tracked with timestamps
4. **Input Validation** - All form inputs are validated server-side
5. **SQL Injection Prevention** - Using prepared statements

## Support

For issues or questions:
1. Check the troubleshooting section
2. Review the HOW_TO_RUN.md file
3. Check application logs for errors
4. Verify database connectivity

---

**Implementation Date:** February 2026
**Version:** 1.0
**Status:** Production Ready
