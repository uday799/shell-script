#!/bin/bash
echo "all variables passed $@"
echo "number of variables passed $#"
echo "current script name $0"
echo "present working directory $PWD"
echo "which user is running script $USER"
echo "home directory of current user $HOME"
echo "process id of current script $$"
sleep 60
echo "procees id of background last command $!"