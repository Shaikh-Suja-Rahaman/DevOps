#!/bin/bash

# 1. Variables to store data
CURRENT_DATE=$(date)
HOST_NAME=$(hostname)
USER_NAME=$(whoami)

# 2. Print basic information
echo "==================================="
echo "       SYSTEM INFORMATION          "
echo "==================================="
echo "Date: $CURRENT_DATE"
echo "Hostname: $HOST_NAME"
echo "Username: $USER_NAME"
echo "==================================="
echo ""

# 3. Print Disk Usage
echo ">>> Disk Usage (df -h):"
df -h
echo ""

# 4. Take User Input using read -p
read -p "Enter a name for a new directory to store the process logs: " DIR_NAME

# 5. Create a directory using mkdir
mkdir -p "$DIR_NAME"
echo "Directory '$DIR_NAME' has been created."

# Define the file path using variables
FILE_PATH="$DIR_NAME/processes.txt"

# 6. Create a file using touch
touch "$FILE_PATH"
echo "File '$FILE_PATH' has been created."

# 7. Print Running Processes and Store them using > output redirection
echo "Gathering running processes..."
ps aux > "$FILE_PATH"

echo "Success! The running processes have been saved to '$FILE_PATH'."
