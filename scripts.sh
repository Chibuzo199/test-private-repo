#!/bin/bash

echo ".............. if statement ................"

read a

if [ $a -lt 10 ]
then    
    echo " that is not correct"
    exit 1
fi
