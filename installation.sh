#!/bin/bash
USERID=$(id -u)
#echo " print the value $USERID"
 if [ $USERID -eq 0 ]
 then 
   echo "User not have previlleged access stop execute the script"
   exit 1
fi
ls -lr