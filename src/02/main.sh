#!/bin/bash
bash text.sh

read -p "Хотите вы записать результат в файл: " parametr
if [[ $parametr == *[0-9]* ]]
then 
    if [[ $parametr == *[A-Za-z]* ]]
    then
        echo "invalid input"
    else
        echo "invalid input"
    fi
else 
    if [[ $parametr == *[Y]* ||  $parametr == *[y]* ]]
    then
        bash text.sh >> $(date +"%d_%m_%y_%H_%M_%S").status
    else
        echo "До свидания"
    fi
fi