#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DES_DIR=$2
DAYS=${3:-14}
LOG_FOLDER=/home/ec2-user/shell-script-logs
LOG_FILE=$(echo $0 | awk -F "/" '{prrint $NF}' | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME=$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log

echo "script started executing at : $TIMESTAMP"
mkdir -p $LOGS_FOLDER

USAGE() {

echo " $R ERROR : $N USAGE should be: <script-name> <SOURCE_DIR> <DEST-DIR> <DAYS-OPTIONAL>"
exit 1

}

if [ $# -lt 2 ]
then
  USAGE
  fi


if [ ! -d "$SOURCE_DIR" ]
then
echo "pls check ur souce directory"
exit 1
fi 

if [ ! -d "$DES_DIR" ]
then
echo "pls check ur dest directory"
exit 1
fi

FILES=$(find $SOURCE_DIR -name ".log" -mtime +$DAYS)

if [ -n "$FILES"]
then
echo files to be zip is :$FILES
ZIP_FILE="$DES_DIR/app-logs-$TIMESTAMP.log"
find $SOURCE_DIR -name ".log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
if [ -f "$ZIP_FILE"]
then
echo "successfully created zip file for older than $DAYS"
while read -r filepath
do
echo "files to be deleting are: $filepath
rm -rf $filepath
done <<< $FILES
else
echo "zip file is not created"
exit 1
fi
else
 echo"no files found older than $DAYS to zip"
 fi

