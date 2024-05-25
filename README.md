Lab2: Disk Space Monitoring and Email Alerting

This repository contains a bash script for monitoring disk space usage on a Linux system and sending email alerts when usage exceeds a certain threshold.
Installation

    Install Required Packages: Update the package list and install postfix and mailutils, which are necessary for setting up the email functionality.

    bash

sudo apt update
sudo apt install postfix


Edit Postfix Configuration: Modify the /etc/postfix/main.cf file to configure Postfix to relay emails through Gmail's SMTP server.

plaintext

relayhost = [smtp.example.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous

Add Gmail Credentials: Add your Gmail credentials to the /etc/postfix/sasl_passwd file for authentication with Gmail's SMTP server.


![Screenshot 2024-05-25 333](https://github.com/Mostafayouni/lab2/assets/105316729/d2c3c818-a368-4aae-90a0-c521df4aabda)




[smtp.example.com]:587 username:Apppassword

Secure Authentication File: Secure the /etc/postfix/sasl_passwd file and its corresponding database file using appropriate permissions.

bash

sudo chmod 600 /etc/postfix/sasl_passwd
sudo chmod 600 /etc/postfix/sasl_passwd.db

Verify Postfix: Check the status of the Postfix service and reload it to apply the configuration changes.

bash

    systemctl status postfix.service
    systemctl reload postfix.service

Usage

    Check Disk Space: Use the df command to check disk space usage.

    bash

df -H

Create Bash Script: Create a bash script named lab2.sh to automate the disk space monitoring and email alerting process.

bash

sudo vim lab2.sh


![2](https://github.com/Mostafayouni/lab2/assets/105316729/bdede07e-6dce-463f-ad12-a48a2cfed424)



Run Script: Set execute permissions for the bash script and run it to automate the process.

bash

sudo chmod +x lab2.sh
sudo ./lab2.sh

Test Email Server: Test the email functionality by sending a test email using the mail command.

bash

    echo "This is a test" | mail -s "Test" your_email@gmail.com

Output


![1](https://github.com/Mostafayouni/lab2/assets/105316729/3b8efe78-e737-4ec5-a86f-14ce01198888)







