#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

SOURCE_DIR=/home/ec2-user/app-logs
LOG_FOLDER=/var/log/expense-log
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME=$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "files to delete is :$FILES_TO_DELETE"

while read -r files
do

echo "files deleting are: $FILES_TO_DELETE"

rm -rf $files

done <<< $FILES_TO_DELETE

