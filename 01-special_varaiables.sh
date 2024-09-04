#!/bin/bash
echo "All variables passed to the script: $@"
echo "Number of variables passed to the script: $#"
echo "script name : $0"
echo "PID of current script execution: $$"
echo "current path of the directory: $PWD"
echo "home directory of the user : $HOME"
sleep 100 &
echo "PID of backgorud process: $!"
