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
# for loop for multiple packages to install
 for package in $@
       do
       dnf list installed $package
       if [ $? -ne 0 ]
then 
   echo "$package not installed , install the $package"
   dnf install $package -y
   VALIDATE $? "Installing $package"
    
else
      echo "$package already installed , nothing to do"
    
fi
done
