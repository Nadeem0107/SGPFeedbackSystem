# 🔴 BUTTONS NOT SHOWING - FIX GUIDE

## Why Buttons Are Not Showing

The complaint buttons ARE in the code (I can see them in welcome.jsp), but they're not showing because:

**The application needs to be REBUILT and RESTARTED** for the changes to take effect.

---

## ✅ Quick Fix (Choose Your Method)

### Method 1: Using Your IDE (Recommended)

#### If using Eclipse:
1. **Stop the running application** (click the red square in Console)
2. **Clean the project:**
   - Right-click on project → Run As → Maven build
   - Goals: `clean`
   - Click Run
3. **Build the project:**
   - Right-click on project → Run As → Maven build
   - Goals: `install`
   - Click Run
4. **Run again:**
   - Right-click on project → Run As → Maven build
   - Goals: `jetty:run`
   - Click Run
5. **Clear browser cache** (Ctrl+Shift+Delete)
6. **Refresh the page** (Ctrl+F5)

#### If using IntelliJ IDEA:
1. **Stop the running application** (click the red square)
2. **Open Maven tool window** (View → Tool Windows → Maven)
3. **Run Lifecycle:**
   - Click `clean`
   - Click `install`
4. **Run Plugins:**
   - Expand Plugins → jetty
   - Double-click `jetty:run`
5. **Clear browser cache** (Ctrl+Shift+Delete)
6. **Refresh the page** (Ctrl+F5)

---

### Method 2: Manual File Check

If the buttons still don't show after rebuild, let's verify the files:

1. **Check if welcome.jsp was updated:**
   - Open: `src/main/webapp/jsp/welcome.jsp`
   - Search for: "Submit Complaint" (should be on line 76)
   - Search for: "Student Complaints" (should be on line 172)

2. **If you DON'T see these lines**, the file wasn't updated. Let me know and I'll fix it.

---

### Method 3: Force Browser Refresh

Sometimes the browser caches the old page:

1. **Hard refresh:** Press `Ctrl + Shift + R` (or `Ctrl + F5`)
2. **Clear cache:**
   - Chrome: Ctrl+Shift+Delete → Clear browsing data
   - Firefox: Ctrl+Shift+Delete → Clear recent history
3. **Incognito/Private mode:** Try opening in incognito mode

---

## 🔍 Verification Checklist

After rebuilding, you should see:

### For Students (roleId = 2):
- ✅ College Facilities Feedback card
- ✅ Course End Feedback card
- ✅ Parents Feedback card
- ✅ Teacher Feedback card
- ✅ **Submit Complaint card** (RED button) ← NEW
- ✅ My Profile card

### For Admins (roleId = 1):
- ✅ Manage Students card
- ✅ Manage Faculty card
- ✅ Teacher Feedback card
- ✅ College Facilities Feedback card
- ✅ Course End Feedback card
- ✅ Parents Feedback card
- ✅ **Student Complaints card** (RED button) ← NEW
- ✅ My Profile card

---

## 🐛 Still Not Working?

### Check 1: Are you logged in?
- You must be logged in to see the dashboard
- Student login shows student cards
- Admin login shows admin cards

### Check 2: Is the application running?
- Check console for errors
- Application should be running on port 8080
- Try accessing: http://localhost:8080/CustomerFeedbackSystem

### Check 3: Check browser console
- Press F12 to open developer tools
- Check Console tab for JavaScript errors
- Check Network tab to see if files are loading

### Check 4: Check the deployed files
The application deploys to a target folder. Check:
- `target/CustomerFeedbackSystem/jsp/welcome.jsp`
- This should have the complaint buttons

If this file doesn't have the buttons, the build didn't copy the updated file.

---

## 🔧 Nuclear Option (If Nothing Works)

If buttons still don't show after all the above:

1. **Stop the application completely**
2. **Delete the target folder:**
   - Navigate to project root
   - Delete the `target` folder
3. **Clean and rebuild:**
   ```
   mvn clean install
   ```
4. **Run again:**
   ```
   mvn jetty:run
   ```
5. **Clear ALL browser data**
6. **Try in incognito mode**

---

## 📞 What to Tell Me

If it's still not working, please tell me:

1. **Which IDE are you using?** (Eclipse/IntelliJ/Other)
2. **Did you rebuild the project?** (Yes/No)
3. **Did you restart the application?** (Yes/No)
4. **Did you clear browser cache?** (Yes/No)
5. **What do you see on the dashboard?** (List the cards you see)
6. **Any errors in console?** (Copy-paste any red errors)

---

## 🎯 Most Likely Solution

**90% of the time, this fixes it:**

1. Stop application
2. Run: `mvn clean install`
3. Run: `mvn jetty:run`
4. Clear browser cache (Ctrl+Shift+Delete)
5. Hard refresh page (Ctrl+F5)

**Try this first!**

---

*The buttons ARE in the code. They just need to be deployed. Rebuild and restart!*
