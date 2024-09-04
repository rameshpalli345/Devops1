#!/bin/bash
USERID=$(id -u)
#echo " print the value $USERID"
 if [ $USERID -ne 0 ]
 then 
   echo "User not have previlleged access stop execute the script"
   exit 1
else 
   echo "User have previlleged access proceed with the script"
fi
dnf list install mysql

if [ $? -ne 0 ]
then 
   echo "package not installed , install the package"
   dnf install mysql -y
    if [ $? -ne 0]
    then 
     echo "package installation successful"
    else
      echo "package installation faild"
      exit 1
    fi
else
   echo "package already installed , nothing to do"
fi