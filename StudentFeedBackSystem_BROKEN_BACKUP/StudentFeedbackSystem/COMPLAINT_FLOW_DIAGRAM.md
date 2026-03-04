# Complaint System Flow Diagram

## Student Complaint Submission Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                        STUDENT LOGIN                             │
│                     (roleId = 2)                                 │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                    STUDENT DASHBOARD                             │
│                    (welcome.jsp)                                 │
│                                                                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐         │
│  │   College    │  │  Course End  │  │   Parents    │         │
│  │  Facilities  │  │   Feedback   │  │   Feedback   │         │
│  └──────────────┘  └──────────────┘  └──────────────┘         │
│                                                                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐         │
│  │   Teacher    │  │ ★ SUBMIT     │  │  My Profile  │         │
│  │   Feedback   │  │  COMPLAINT ★ │  │              │         │
│  └──────────────┘  └──────────────┘  └──────────────┘         │
└────────────────────────────┬────────────────────────────────────┘
                             │ Click "Submit Complaint"
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                  COMPLAINT FORM                                  │
│                  (complaint.jsp)                                 │
│                                                                  │
│  Program: [Dropdown: CSE/EEE/ME/CE]                            │
│  Academic Year: [Dropdown: 2023-24/2024-25/2025-26]            │
│  Complaint Type: [Dropdown: Academic/Infrastructure/...]        │
│  Priority: [Dropdown: Low/Medium/High/Urgent]                   │
│  Subject: [Text Input]                                          │
│  Description: [Text Area]                                       │
│                                                                  │
│  ⚠️ Privacy Notice:                                             │
│  "Your complaint will be submitted anonymously.                 │
│   Your identity will not be disclosed to anyone."               │
│                                                                  │
│  [Save Button]  [Reset Button]                                  │
└────────────────────────────┬────────────────────────────────────┘
                             │ Submit
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                  COMPLAINT CONTROLLER                            │
│                  (ComplaintCtl.java)                             │
│                                                                  │
│  1. Validate input fields                                       │
│  2. Create ComplaintBean                                        │
│  3. Set status = "Pending"                                      │
│  4. Set createdBy = current user ID (hidden)                    │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                  COMPLAINT MODEL                                 │
│                  (ComplaintModel.java)                           │
│                                                                  │
│  1. Generate next PK                                            │
│  2. Insert into database                                        │
│  3. Return success                                              │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                     DATABASE                                     │
│              (complaint table)                                   │
│                                                                  │
│  Stored Fields:                                                 │
│  - id, program, academicYear                                    │
│  - complaintType, subject, description                          │
│  - priority, status                                             │
│  - createdBy (user ID - NOT displayed)                          │
│  - createdDatetime, modifiedDatetime                            │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                  SUCCESS MESSAGE                                 │
│  "Complaint submitted successfully!                              │
│   We will review it soon."                                       │
└─────────────────────────────────────────────────────────────────┘
```

## Admin Complaint Management Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                        ADMIN LOGIN                               │
│                     (roleId = 1)                                 │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                    ADMIN DASHBOARD                               │
│                    (welcome.jsp)                                 │
│                                                                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐         │
│  │   Manage     │  │   Manage     │  │   Teacher    │         │
│  │   Students   │  │   Faculty    │  │   Feedback   │         │
│  └──────────────┘  └──────────────┘  └──────────────┘         │
│                                                                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐         │
│  │  Facilities  │  │  Course End  │  │   Parents    │         │
│  │   Feedback   │  │   Feedback   │  │   Feedback   │         │
│  └──────────────┘  └──────────────┘  └──────────────┘         │
│                                                                  │
│  ┌──────────────┐  ┌──────────────┐                            │
│  │ ★ STUDENT    │  │  My Profile  │                            │
│  │  COMPLAINTS★ │  │              │                            │
│  └──────────────┘  └──────────────┘                            │
└────────────────────────────┬────────────────────────────────────┘
                             │ Click "Student Complaints"
                             │
                ┌────────────┴────────────┐
                │                         │
                ▼                         ▼
    From Dashboard            From Faculty Directory
                │                         │
                └────────────┬────────────┘
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              COMPLAINT LIST PAGE                                 │
│              (complaintList.jsp)                                 │
│                                                                  │
│  ⚠️ Privacy Notice:                                             │
│  "All complaints are displayed anonymously to protect           │
│   student privacy. Student identities are not shown."           │
│                                                                  │
│  Search/Filter:                                                 │
│  [Subject] [Type Dropdown] [Status Dropdown] [Search] [Reset]  │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ # │ Date │ Program │ Type │ Subject │ Desc │ Pri │ Status│  │
│  ├──────────────────────────────────────────────────────────┤  │
│  │ 1 │02-13 │CSE 24-25│Infra│Lab Issue│...   │High│Pending│  │
│  │   │      │         │     │         │      │    │[Update▼]│  │
│  ├──────────────────────────────────────────────────────────┤  │
│  │ 2 │02-12 │EEE 24-25│Facul│Teaching │...   │Med │In Prog│  │
│  │   │      │         │     │         │      │    │[Update▼]│  │
│  └──────────────────────────────────────────────────────────┘  │
│                                                                  │
│  Note: Student names are NOT shown - only Program & Year        │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              ADMIN ACTIONS                                       │
│                                                                  │
│  1. VIEW: See all complaint details (anonymous)                 │
│  2. SEARCH: Filter by subject                                   │
│  3. FILTER: By complaint type or status                         │
│  4. UPDATE STATUS:                                              │
│     - Pending → In Progress → Resolved → Closed                 │
└─────────────────────────────────────────────────────────────────┘
```

## Privacy Protection Mechanism

```
┌─────────────────────────────────────────────────────────────────┐
│                  STUDENT SUBMITS COMPLAINT                       │
│                                                                  │
│  Student: John Doe (ID: 12345)                                  │
│  Program: CSE                                                   │
│  Subject: "Lab computers not working"                           │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                  STORED IN DATABASE                              │
│                                                                  │
│  id: 1                                                          │
│  program: "CSE"                                                 │
│  academicYear: "2024-25"                                        │
│  subject: "Lab computers not working"                           │
│  createdBy: "12345" ← User ID stored (NOT displayed)            │
│  createdDatetime: 2026-02-13 10:30:00                           │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                  DISPLAYED TO ADMIN                              │
│                                                                  │
│  Date: 02-13-2026                                               │
│  Program: CSE (2024-25)                                         │
│  Subject: "Lab computers not working"                           │
│  Priority: High                                                 │
│  Status: Pending                                                │
│                                                                  │
│  ❌ Student Name: NOT SHOWN                                     │
│  ❌ Student ID: NOT SHOWN                                       │
│  ✅ Only Program & Year shown                                   │
└─────────────────────────────────────────────────────────────────┘
```

## Status Update Flow

```
┌─────────────────────────────────────────────────────────────────┐
│              ADMIN UPDATES STATUS                                │
│                                                                  │
│  Admin selects new status from dropdown:                        │
│  [Pending] → [In Progress]                                      │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              JAVASCRIPT CONFIRMATION                             │
│                                                                  │
│  "Are you sure you want to update the complaint status?"        │
│  [OK] [Cancel]                                                  │
└────────────────────────────┬────────────────────────────────────┘
                             │ Click OK
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              FORM SUBMISSION                                     │
│                                                                  │
│  POST to: /ctl/complaintList                                    │
│  Parameters:                                                    │
│    - id: 1                                                      │
│    - newStatus: "In Progress"                                   │
│    - operation: "UpdateStatus"                                  │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              COMPLAINT LIST CONTROLLER                           │
│              (ComplaintListCtl.java)                             │
│                                                                  │
│  1. Receive parameters                                          │
│  2. Call model.updateStatus(id, status)                         │
│  3. Set success message                                         │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              COMPLAINT MODEL                                     │
│              (ComplaintModel.java)                               │
│                                                                  │
│  UPDATE complaint                                               │
│  SET status = 'In Progress',                                    │
│      modifiedDatetime = NOW()                                   │
│  WHERE id = 1                                                   │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              SUCCESS MESSAGE                                     │
│  "Complaint status updated successfully"                        │
│                                                                  │
│  Page refreshes with updated status                             │
└─────────────────────────────────────────────────────────────────┘
```

## Component Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                            │
│                                                                  │
│  ┌──────────────────┐         ┌──────────────────┐             │
│  │  complaint.jsp   │         │complaintList.jsp │             │
│  │  (Student Form)  │         │  (Admin View)    │             │
│  └────────┬─────────┘         └────────┬─────────┘             │
└───────────┼──────────────────────────────┼──────────────────────┘
            │                              │
            ▼                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                    CONTROLLER LAYER                              │
│                                                                  │
│  ┌──────────────────┐         ┌──────────────────┐             │
│  │  ComplaintCtl    │         │ComplaintListCtl  │             │
│  │  - validate()    │         │  - search()      │             │
│  │  - populateBean()│         │  - updateStatus()│             │
│  │  - doPost()      │         │  - doGet()       │             │
│  └────────┬─────────┘         └────────┬─────────┘             │
└───────────┼──────────────────────────────┼──────────────────────┘
            │                              │
            └──────────────┬───────────────┘
                           ▼
┌─────────────────────────────────────────────────────────────────┐
│                    MODEL LAYER                                   │
│                                                                  │
│  ┌────────────────────────────────────────────┐                │
│  │         ComplaintModel                      │                │
│  │  - add(ComplaintBean)                       │                │
│  │  - findByPK(long)                           │                │
│  │  - search(ComplaintBean, page, size)        │                │
│  │  - list(page, size)                         │                │
│  │  - updateStatus(id, status)                 │                │
│  └────────────────┬───────────────────────────┘                │
└───────────────────┼──────────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────────────────┐
│                    DATA LAYER                                    │
│                                                                  │
│  ┌────────────────────────────────────────────┐                │
│  │         ComplaintBean                       │                │
│  │  - id, program, academicYear                │                │
│  │  - complaintType, subject, description      │                │
│  │  - priority, status                         │                │
│  │  - createdBy, modifiedBy                    │                │
│  │  - createdDatetime, modifiedDatetime        │                │
│  └────────────────┬───────────────────────────┘                │
└───────────────────┼──────────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────────────────┐
│                    DATABASE                                      │
│              (MySQL - complaint table)                           │
└─────────────────────────────────────────────────────────────────┘
```

---
**Legend:**
- ★ = New Feature
- ⚠️ = Privacy Notice
- ✅ = Shown to Admin
- ❌ = Hidden from Admin
- → = Flow Direction
