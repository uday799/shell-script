#!/bin/bash
DISK_USAGE=$(df -hT | grep xfs )
DISK_THRESHOLD=5
MSG=""

while read -r line

do
USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" f1)
PARTITION=$(echo $ line | awk -F " " '{print $NF}')
echo "PARTITION is:$PARTITION,USAGE is: $USAGE"
if [ $USAGE -ge $DISK_THRESHOLD ]
then
MSG+="High Disk usage on partition: $PARTITION Usage is: $USAGE \n "
fi
done <<< DISK_USAGE
echo -e "MSG is:$MSG"
echo "$MSG" | mutt -s "High Disk Usage" udaysai299@gmail.com