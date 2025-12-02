#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOG_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log

echo "script started executed at $TIMESTAMP" &>>$LOG_FILE_NAME

USERID=$(id -u)
if [ $? -ne 0 ]
then
echo "pls check your sudo access and try"
exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]
then
echo "$2...FAILURE"
exit 1
else
echo "$2...SUCCESS
fi
}

dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
dnf install mysql -y &>>$LOG_FILE_NAME
VALIDATE $? "installing mysql"
else
echo "mysql already installed"
fi

dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
dnf install git -y &>>$LOG_FILE_NAME
VALIDATE $? "installing git"
else
echo "git already installed"
fi