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
dnf list installed mysql
if [ $? -ne 0 ]
then 
   echo "package already installed"
   exit 1
else
   echo "install the package"
   dnf install mysql -y
    if [ $? -ne 0]
    then 
     echo "package installation failed"
     exit 1
    else
      echo "package installation sucessful"
    fi
fi