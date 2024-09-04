#!/bin/bash
LOGS_FOLDER= "/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%y-%m-%d-%H-%M)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER


LOG_FILE
USERID=$(id -u)
#echo " print the value $USERID"
CHECK_ROOT() {
    if [ $USERID -ne 0 ]
    then 
   echo -e "$R User not have previlleged access stop execute the script $N" &>>$LOG_FILE
   exit 1
   fi
}
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "$1 is ..$R installation failed $N" &>>$LOG_FILE
    else
    echo -e "$1 is ..$G installation sucess $N" &>>$LOG_FILE
    fi
}
 CHECK_ROOT
# for loop for multiple packages to install
 for package in $@
       do
       dnf list installed $package
       if [ $? -ne 0 ]
then 
   echo "$R $package not installed , install the $package $N" &>>$LOG_FILE
   dnf install $package -y
   VALIDATE $? "Installing $package"
    
else
      echo "$Y $package already installed , nothing to do $N" &>>$LOG_FILE
    
fi
done
