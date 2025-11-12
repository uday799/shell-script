#!/bin/bash
USERID=$(id -u)
if [$USERID -ne 0]
then
echo "ERROR:PLs check the root access to execute this script
exit 1
fi
dnf list installed mysql
if [$? -ne 0]
then
dnf install mysql -y
if [$? -ne 0]
then
echo "installing MYSQL FAILURE"
exit 1
else
echo "installing MYSQL SUCCESS"
fi
else 
echo "MYSQL is already installed"
fi
dnf list installed git
if [$? -ne 0]
then 
dnf install git -y
if [$? -ne 0]
then
echo "installing git is failure"
exit 1
else
echo "installing git is success"
fi
else
echo "git is alraedy installed"
fi
