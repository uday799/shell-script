#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOG_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

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
echo -e "$2...$R FAILURE"
exit 1
else
echo -e "$2...$G SUCCESS"
fi
}

for package in $@
do
dnf installed $package &>>$LOG_FILE_NAME
if [ $? -ne 0]
then
dnf install $package &>>$LOG_FILE_NAME
VALIDATE $? "installing $package"
else
echo -e "$Y $package already installed"
fi
done
