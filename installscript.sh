#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "you must sudo access to install these packages"
exit 1
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
dnf install mysql -y
if [ $? -ne 0]
then
echo "installing mysql...FAILURE
exit 1
else
echo "installing mysql....SUCCESS"
fi
else
echo "mysql already installed"
fi

dnf list installed
if [ $? -ne 0 ]
then
dnf install git -y
if [ $? -ne 0 ]
then
echo " installing git is.. FAILURE"
exit 1
else
echo "installing git is..SUCCESS"
fi
else
echo "git is already installed"
fi
