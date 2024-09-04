#!/bin/bash
USERID=$(id -u)
#echo " print the value $USERID"
R="\e[32m"
G="\e[33m"
N="\e[0m"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "$1 is ..$R installation failed $N"
    else
    echo -e "$1 is ..$G installation sucess $N"
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

