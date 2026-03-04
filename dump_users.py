import os

# Get table data using mysql command line
cmd = '& "C:\\Program Files\\MySQL\\MySQL Server 8.0\\bin\\mysql.exe" -u root -pnadeemm0107# -e "USE CustomerFeedbackSystem; SELECT * FROM user;"'
# Use powershell to run it
stream = os.popen(f'powershell "{cmd}"')
output = stream.read()
print(output)
