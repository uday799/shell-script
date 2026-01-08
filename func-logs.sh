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

if [$1 -ne 0 ]
then
echo "$2... failure"
exit 1
else
echo "$2.. success"
fi

}

if [ $?-ne 0 ]
then
echo "you must have sudo access to execute this script pls try with sudo access"
exit 1
fi

dnf installed mysql
if [ $? -ne 0 ]
then
dnf install mysq1
VALIDATE $? "INSTALLING MYSQL"
else
echo "mysql already installed"
fi

dnf installed git
if [ $? -ne 0 ]
then
dnf install git
VALIDATE $? "INSTALLING GIT"
else
echo "git already installed"
fi