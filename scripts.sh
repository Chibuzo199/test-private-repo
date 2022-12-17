#!/bin/bash

echo ".............. if statement ................"

read a

if [ $a -lt 10 ]
then    
    echo " that is not correct"
    exit 1
fi

if [ $a -gt 10 ]
then    
    echo " that is not correct"
    exit 1
fi


until [ $a -gt 100 ]
do 
    a=`expr a + 1`
done 
