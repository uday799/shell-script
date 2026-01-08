#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

LOG_FOLDER=/var/log/shell-script-log
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME=$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log

VALIDATE() {

if [ $1 -ne 0 ]
then
echo -e  "$2... $R failure"
exit 1
else
echo -e "$2.. $G success"
fi

}

if [ $?-ne 0 ]
then
echo "you must have sudo access to execute this script pls try with sudo access"
exit 1
fi

echo "script started executing at : $TIMESTAMP"

dnf installed mysql  &>>LOG_FILE_NAME
if [ $? -ne 0 ]
then
dnf install mysql -y &>>LOG_FILE_NAME
VALIDATE $? "INSTALLING MYSQL"
else
echo -e  "mysql already $Y installed"
fi

dnf installed git &>>LOG_FILE_NAME
if [ $? -ne 0 ]
then
dnf install git -y &>>LOG_FILE_NAME
VALIDATE $? "INSTALLING GIT"
else
echo -e "git already $Y installed"
fi