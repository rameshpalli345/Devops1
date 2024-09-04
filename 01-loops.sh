#!/bin/bash
USERID=$(id -u)
#echo " print the value $USERID"
CHECK_ROOT() {
    if [ $USERID -ne 0 ]
    then 
   echo "User not have previlleged access stop execute the script"
   exit 1
   fi
}
R="\e[31m"
G="\e[32m"
N="\e[0m"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "$1 is ..$R installation failed $N"
    else
    echo -e "$1 is ..$G installation sucess $N"
    fi
}
 CHECK_ROOT

dnf list installed mysql

if [ $? -ne 0 ]
then 
   echo "package not installed , install the package"
   dnf install mysql -y
   VALIDATE $? "Installing mysql"
    
else
      echo "package already installed , nothing to do"
    
fi

