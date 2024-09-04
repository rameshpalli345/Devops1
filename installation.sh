#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "User not have previlleged access stop execute the script"
    exit 1
else
    echo "User not have previlleged access then stop the script"
    
fi
