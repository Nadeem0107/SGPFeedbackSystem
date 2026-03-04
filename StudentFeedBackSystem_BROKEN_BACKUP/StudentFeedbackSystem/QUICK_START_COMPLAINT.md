# 🚀 Quick Start Guide - Complaint System

## ⚡ 3-Step Setup

### Step 1: Create Database Table
```bash
# Run this command in the project root directory:
setup_complaint_table.bat
```

### Step 2: Build Project
```bash
mvn clean install
```

### Step 3: Run Application
```bash
mvn jetty:run
```

**Access at:** `http://localhost:8080/CustomerFeedbackSystem`

---

## 📋 Quick Test Checklist

### ✅ Student Test (5 minutes)
1. Login as student
2. Click "Submit Complaint" card (red)
3. Fill form:
   - Program: CSE
   - Year: 2024-25
   - Type: Infrastructure
   - Priority: High
   - Subject: "Test complaint"
   - Description: "This is a test"
4. Click Save
5. ✓ See success message

### ✅ Admin Test (5 minutes)
1. Login as admin
2. Click "Student Complaints" card (red)
3. ✓ See complaint (without student name)
4. Change status to "In Progress"
5. ✓ See success message

---

## 🎯 Key Features

### For Students:
- 🔒 **100% Anonymous** - Your name is never shown
- 📝 **Easy Form** - Simple, quick submission
- 🏷️ **9 Categories** - Academic, Infrastructure, Faculty, etc.
- ⚠️ **4 Priority Levels** - Low, Medium, High, Urgent

### For Admins:
- 👁️ **Anonymous View** - See complaints without student names
- 🔍 **Search & Filter** - By subject, type, status
- 📊 **Status Updates** - Pending → In Progress → Resolved → Closed
- 🎨 **Color Coded** - Easy visual identification

---

## 📁 Important Files

| File | Purpose |
|------|---------|
| `setup_complaint_table.bat` | Auto-create database table |
| `COMPLAINT_SYSTEM_GUIDE.md` | Full documentation |
| `COMPLAINT_IMPLEMENTATION_SUMMARY.md` | What was added |
| `COMPLAINT_FLOW_DIAGRAM.md` | Visual flow diagrams |
| `database/create_complaint_table.sql` | SQL schema |

---

## 🔗 URLs

| Page | URL | Access |
|------|-----|--------|
| Submit Complaint | `/ctl/complaint` | Students |
| View Complaints | `/ctl/complaintList` | Admins |
| Home | `/welcome` | All |

---

## 🎨 Visual Guide

### Student Dashboard - New Card:
```
┌──────────────────────┐
│  🔴 Submit Complaint │
│                      │
│  Report issues or    │
│  concerns anonymously│
│                      │
│  [Submit Complaint]  │
└──────────────────────┘
```

### Admin Dashboard - New Card:
```
┌──────────────────────┐
│  ⚠️ Student Complaints│
│                      │
│  View and manage     │
│  student complaints  │
│  (anonymous)         │
│                      │
│  [View Complaints]   │
└──────────────────────┘
```

---

## 🔐 Privacy Features

✅ **What's Hidden:**
- Student names
- Student IDs
- Personal information

✅ **What's Shown:**
- Program (CSE, EEE, etc.)
- Academic year
- Complaint details
- Date submitted

---

## 🎨 Color Codes

### Priority Badges:
- 🟢 **Low** - Green
- 🟡 **Medium** - Yellow
- 🟠 **High** - Orange
- 🔴 **Urgent** - Red

### Status Badges:
- ⚫ **Pending** - Gray
- 🔵 **In Progress** - Blue
- 🟢 **Resolved** - Green
- ⚫ **Closed** - Dark

---

## ❓ Troubleshooting

### Problem: Table doesn't exist
**Solution:** Run `setup_complaint_table.bat`

### Problem: 404 Error
**Solution:** Run `mvn clean install` then `mvn jetty:run`

### Problem: Can't see complaints
**Solution:** 
1. Check you're logged in as admin
2. Verify database has data
3. Check database connection

### Problem: Status update not working
**Solution:** 
1. Check browser console for errors
2. Verify JavaScript is enabled
3. Try refreshing the page

---

## 📞 Need Help?

1. Read `COMPLAINT_SYSTEM_GUIDE.md` for detailed docs
2. Check `COMPLAINT_FLOW_DIAGRAM.md` for visual flows
3. Review `COMPLAINT_IMPLEMENTATION_SUMMARY.md` for technical details

---

## 🎉 You're All Set!

The complaint system is now fully integrated and ready to use. Students can submit complaints anonymously, and admins can view and manage them while respecting student privacy.

**Happy Testing! 🚀**

---

*Last Updated: February 13, 2026*
*Version: 1.0*
