#!/bin/bash
USERID=$(id -u)
#echo " print the value $USERID"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "$2 is .. installation failed"
    else
    echo "$2 is .. installation sucess"
    fi
}
 if [ $USERID -ne 0 ]
 then 
   echo "User not have previlleged access stop execute the script"
   exit 1
fi
dnf list install git

if [ $? -ne 0 ]
then 
   echo "package not installed , install the package"
   dnf install git -y
   VALIDATE $? "Installing Git"
    
else
      echo "package already installed , nothing to do"
    
fi