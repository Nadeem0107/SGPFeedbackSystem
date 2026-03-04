# 🎨 UI/UX Design Specification
**Project:** Student Feedback System  
**Version:** 1.0  
**Latest Update:** February 16, 2026

---

## 1. Design Philosophy
The User Interface (UI) is built on a **Modern Material Design** foundation, prioritizing cleanliness, accessibility, and responsiveness. The design uses **Glassmorphism** concepts (subtle shadows, rounded corners, translucent overlays) to create a premium, academic-friendly aesthetic.

**Key Principles:**
*   **Minimalism:** Reduced clutter, focusing user attention on the primary task (Feedback/Complaint).
*   **Role-Awareness:** The interface adapts dynamically based on whether the logged-in user is a Student, Admin, or Faculty.
*   **Feedback-Driven:** Interaction states (hover, focus, active) provide immediate visual feedback.

---

## 2. Technology Framework
The UI is implemented using the following libraries:

| Component | Library/Version | Purpose |
| :--- | :--- | :--- |
| **CSS Framework** | **MDB (Material Design for Bootstrap) 5** | Core layout, grid system, and components. |
| **Icons** | **FontAwesome 6.0** | scalable vector icons for actions and navigation. |
| **Typography** | **Google Fonts** | Primary font: *Outfit* (Modern Sans-Serif); Secondary: *Roboto*. |
| **Interactivity** | **jQuery & jQuery UI** | Datepickers and dynamic DOM manipulation. |

---

## 3. Color Palette
The application uses a semantic color system to denote status and categories.

### Primary Colors
*   **Brand Primary:** `#3b71ca` (Deep Blue) - Used for primary buttons (Login, Submit) and active states.
*   **Background:** `#f5f7fa` (Light Blue-Grey) - Reduces eye strain compared to pure white.
*   **Surface White:** `#ffffff` - Used for cards and content containers.

### Typography Colors
*   **Primary Text:** `#1e293b` (Dark Slate) - Headings and main content.
*   **Secondary Text:** `#64748b` (Slate Grey) - Metadata, labels, and descriptions.

### Functional/Dashboard Colors
Used to visually distinguish different modules on the dashboard:
*   🔴 **Danger/Complaints:** `#dc3545` (Red) - Used for critical actions like "Submit Complaint".
*   🟢 **Success/Completion:** `#198754` (Green) - Used for "End-Sem Feedback" and "Course End Feedback".
*   🔵 **Info/Teacher:** `#0dcaf0` (Cyan) - Used for "Teacher Feedback".
*   🟡 **Warning/Parents:** `#ffc107` (Amber) - Used for "Parents Feedback".

---

## 4. Typography
*   **Font Family:** `'Outfit', sans-serif`
*   **Weights:**
    *   300 (Light) - Body text
    *   500 (Medium) - Navigation links, Buttons
    *   700 (Bold) - Headings, Brand Name

---

## 5. Layout & Structure

### 5.1 Global Navigation (`header.jsp`)
*   **Style:** Fixed-top, White background with subtle bottom border (`border-bottom`).
*   **Brand:** "FeedbackHub" text with a square primary-colored icon.
*   **Navigation Items:**
    *   **Dynamic Dropdowns:** Visibility changes based on Role (e.g., "Manage Faculty" only appears for Admins).
    *   **Profile Section:** Dropdown for "My Profile" and "Change Password".

### 5.2 Authentication Pages (`login.jsp`, `userRegistration.jsp`)
*   **Layout:** Centralized Card layout centered vertically and horizontally on the screen.
*   **Card Style:**
    *   Border Radius: `24px` (Highly rounded modern look).
    *   Shadow: `0 10px 30px rgba(0, 0, 0, 0.05)` (Soft, deep shadow).
*   **Role Switcher:** A unique "Pill-shaped" toggle allows users to switch between **Student**, **HOD**, and **Admin**.
    *   *Interaction:* Clicking a role updates the input placeholder (e.g., "Enter Register Number" for Students vs "Enter Username" for Admins).

### 5.3 Dashboard (`welcome.jsp`)
*   **Hero Section:** A welcoming area with a title and call-to-action buttons.
*   **Grid Layout:** Uses Bootstrap's 12-column grid.
    *   **Desktop:** 3 Cards per row (`col-md-4`).
    *   **Mobile:** Stacked single column.
*   **Action Cards:**
    *   Each module is represented by a large clickable card.
    *   Contains a large central icon (`fa-3x`), Title, Description, and a colored Action Button.
    *   **Hover Effect:** Slight lift and shadow deepening to indicate interactivity.

### 5.4 Forms (Feedback & Complaints)
*   **Input Fields:**
    *   Styling: Light gray background (`#f8fafc`) with a thin border (`#e2e8f0`).
    *   Focus State: White background with a primary colored ring (`box-shadow`).
*   **Date Pickers:** jQuery UI styling integrated with the main theme.
*   **Validation:** Error messages appear in red (`#dc3545`) below the specific field.

---

## 6. Iconography Usage
Icons are used extensively to speed up user recognition of features:

| Module | Icon Class | Visual |
| :--- | :--- | :--- |
| **Login** | `fa-lock` | 🔒 |
| **College Facilities** | `fa-university` | 🏛️ |
| **Course Feedback** | `fa-graduation-cap` | 🎓 |
| **Teacher Feedback** | `fa-chalkboard-teacher` | 👨‍🏫 |
| **Complaints** | `fa-exclamation-circle` | ❗ |
| **Parents Feedback** | `fa-user-friends` | 👪 |
| **Profile** | `fa-user-circle` | 👤 |

---

## 7. Responsive Behavior
The application is "Mobile-First" but optimized for Desktop.
*   **Navigation:** Collapses into a "Hamburger Menu" on screens smaller than 992px (Bootstrap `lg` breakpoint).
*   **Tables:** Horizontal scrolling enabled on small screens to prevent layout breaking.
*   **Cards:** Automatically stack vertically on mobile devices for better readability.

---

## 8. UX Interactions
*   **Role Selection:** Instant DOM updates without page reload when switching login roles.
*   **Feedback Submission:** Form validation occurs client-side (HTML5) and server-side.
*   **States:**
    *   *Default:* Clean, flat design.
    *   *Hover:* Elements lift (`transform: translateY(-2px)`).
    *   *Active/Focus:* clearly defined borders to aid accessibility.

---
**End of UI Specification**
