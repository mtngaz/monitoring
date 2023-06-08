#!/bin/bash

parametr=$1;

if [[ $parametr == *[0-9]* ]]
then 
    if [[ $parametr == *[A-Za-z]* ]]
    then
        echo "invalid input"
    else
        echo "invalid input"
    fi
else 
    echo "$parametr"
fi