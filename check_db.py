import subprocess, sys

mysql = r"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

def run_query(q):
    r = subprocess.run([mysql, "-u", "root", "-pnadeemm0107#", "--batch", "--silent", "-e", q],
                       capture_output=True, text=True)
    return r.stdout + r.stderr

print("=== USERS ===")
print(run_query("USE CustomerFeedbackSystem; SELECT userName, password, roleName FROM user;"))
print("=== TABLES ===")
print(run_query("USE CustomerFeedbackSystem; SHOW TABLES;"))
