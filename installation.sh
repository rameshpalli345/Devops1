#!/bin/bash
USERID=$(id -u)
if [ $USERID -eq 0]
then 
    echo "User have previlleged access then proceed with the script"
else
    echo "User not have previlleged access then stop the script"
    exit 1
fi
