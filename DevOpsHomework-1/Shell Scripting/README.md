# System Information Shell Script

Welcome to my Shell Scripting assignment! For this task, I built a bash script (`system_info.sh`) that acts as a quick system diagnostic tool. It gathers basic info about the machine, checks disk usage, and saves a list of currently running processes to a file that the user specifies.

## Commands Used

Here is a quick breakdown of the commands I used to build this script:
* `date`: Prints the current system date and time.
* `hostname`: Grabs the name of the machine.
* `whoami`: Figures out the current user logged in.
* `df -h`: Shows disk space usage in a human-readable format.
* `read -p`: Prompts the user to type in an answer and saves it to a variable.
* `mkdir -p`: Creates a new directory safely.
* `touch`: Creates an empty file.
* `ps aux`: Lists every process currently running on the system.
* `>`: Redirects the output of a command (like the running processes) and saves it straight into a text file.

## Script Output

Here is what it looks like when I run the script on my machine. It asks me to enter a directory name, and I chose `logs`.

![Terminal Output](<screenshots/Screenshot 2026-09-03 at 8.55.27 PM.png>)

