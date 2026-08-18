date=date
hostname=hostname
username=whoami
ps=ps

echo "Current Date: $(date)"
echo "Hostname: $(hostname)"
echo "Username: $(whoami)"
echo "Current processes are as follows"
echo "$(ps)"
echo "$(ps)" > process.log

read -p "Enter your Name: " name
read -p "Enter your Roll Number: " rollNumber
read -p "Enter your Comment: " comment

echo "Your Name is: "$name
echo "Your RollNumber is: "$rollNumber
echo "Your RollNumber is: "$comment

