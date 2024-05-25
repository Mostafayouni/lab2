# lab2



#At first we must install reqired packages 


sudo apt update


sudo apt install postfix ,  sudo apt install mailutils

#Atfirst we need to check disk space 
$df -H
#but we don’t want unwanted file systems so we will use grep and use awk command to cut the first column and fifth coulmn
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }'
#then we will create our bash file 
![2](https://github.com/Mostafayouni/lab2/assets/105316729/011c4983-1bea-4bd4-98e2-21f3f650b36d)
df -H --output=pcent / displays the disk usage of the root partition (/) in percentage format.

tail -n 1 selects the last line of the output, which contains the disk usage percentage.

tr -d ' %' removes any spaces and percentage signs from the output
#then  we must install reqired packages 
sudo apt update
sudo apt install postfix ,  sudo apt install mailutils
#then we must edit or add some lines in the /etc/postfix/main.cf
relayhost = [smtp.example.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
#then we must use our Gmail credintial and add it to this file /etc/postfix/sasl_passwd
[smtp.example.com]:587 username:Apppassword
![Screenshot 2024-05-25 333](https://github.com/Mostafayouni/lab2/assets/105316729/6d416806-7908-40ad-bb6b-12d2634a319f)
#then we must dmake some securit command 
postmap /etc/postfix/sasl_passwd
$  sudo postmap /etc/postfix/sasl_passwd
$ sudo ls  /etc/postfix/
$  sudo chmod 600 /etc/postfix/sasl_passwd
$  sudo chmod 600 /etc/postfix/sasl_passwd.db
$  ll /etc/postfix/sasl_passwd
$  ll /etc/postfix/sasl_passwd.db
#then we must certain that postfix runing
systemctl status postfix.service  
systemctl reload postfix.service
#then we will test our mail server
sudo echo "This is a test" | mail -s "Test" mostafayounis600@gmail.com
#then we run our script
@$sudo chmod +x lab2.sh
$sudo ./lab2.sh
#####output####
![1](https://github.com/Mostafayouni/lab2/assets/105316729/a37cfebc-e8d5-4aa3-9316-2899cbc43921)





