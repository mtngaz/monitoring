#!/bin/bash

function fon_1 {
    if [[ $1 == *[1]* ]] 
    then
        var="\033[107m"
    elif [[ $1 == *[2]* ]] 
    then
        var="\033[41m"
    elif [[ $1 == *[3]* ]] 
    then
        var="\033[42m"
    elif [[ $1 == *[4]* ]] 
    then
        var="\033[44m"
    elif [[ $1 == *[5]* ]] 
    then
        var="\033[45m"
    elif [[ $1 == *[6]* ]] 
    then
        var="\033[40m"
    fi
    echo $var
}

function text_2 {
    if [[ $1 == *[1]* ]] 
    then
        var="\033[97m"
    elif [[ $1 == *[2]* ]] 
    then
        var="\033[31m"
    elif [[ $1 == *[3]* ]]
    then
        var="\033[32m"
    elif [[ $1 == *[4]* ]]
    then
        var="\033[34m"
    elif [[ $1 == *[5]* ]]
    then
        var="\033[35m"
    elif [[ $1 == *[6]* ]]
    then
        var="\033[30m"
    fi
    echo $var
}

fon_1=$(fon_1 $1)
text_2=$(text_2 $2)
fon_3=$(fon_1 $3)
text_4=$(text_2 $4)
if [[ $# != 4 ]]
then
    echo "invalid format"
else
    if [[ $1 == *[1-9]* ]] && [[ $2 = *[0-9]* ]] && [[ $3 == *[0-9]* ]] && [[ $4 == *[0-9]* ]] && [[ $1 != *[a-zA-Z]* ]] && [[ $2 != *[a-zA-Z]* ]] && [[ $3 != *[a-zA-Z]* ]] && [[ $4 != *[a-zA-Z]* ]]
    then
        if [ $1 -ne $2 ] && [ $3 -ne $4 ]
        then
            echo -e $fon_1$text_2"HOSTNAME" ="\033[0m"$fon_3$text_4$(hostname)"\033[0m"
            echo -e $fon_1$text_2"TIMEZONE" ="\033[0m"$fon_3$text_4$(cat /etc/timezone)"\033[0m"
            echo -e $fon_1$text_2"USER" ="\033[0m"$fon_3$text_4$(whoami)"\033[0m"
            echo -e $fon_1$text_2"OS" ="\033[0m"$fon_3$text_4$(uname)"\033[0m"
            echo -e $fon_1$text_2"DATE" ="\033[0m"$fon_3$text_4$(date +"%d %B %Y %T")"\033[0m"
            echo -e $fon_1$text_2"UPTIME" ="\033[0m"$fon_3$text_4$(uptime -p)"\033[0m"
            echo -e $fon_1$text_2"UPTIME_SEC" ="\033[0m"$fon_3$text_4$(cat /proc/uptime)"\033[0m"
            echo -e $fon_1$text_2"IP" ="\033[0m"$fon_3$text_4$(hostname -I)"\033[0m"
            echo -e $fon_1$text_2"MASK" ="\033[0m"$fon_3$text_4$(ifconfig lo | grep netmask | awk '{print $4}')"\033[0m"
            echo -e $fon_1$text_2"GATEWAY" ="\033[0m"$fon_3$text_4$(hostname -i)"\033[0m"
            echo -e $fon_1$text_2"RAM_TOTAL" ="\033[0m"$fon_3$text_4$(free | grep Mem | awk '{printf("%.3f GB", $2 / 1000)}')"\033[0m"
            echo -e $fon_1$text_2"RAM_USED" ="\033[0m"$fon_3$text_4$(free | grep Mem | awk '{printf("%.3f GB", $3 / 1000)}')"\033[0m"
            echo -e $fon_1$text_2"RAM_FREE" ="\033[0m"$fon_3$text_4$(free | grep Mem | awk '{printf("%.3f GB", $4 / 1000)}')"\033[0m"
            echo -e $fon_1$text_2"SPACE_ROOT" ="\033[0m"$fon_3$text_4$(df /root/ | grep /dev/mapper/ | awk '{printf("%.2f Mb", $2 / 1000)}')"\033[0m"
            echo -e $fon_1$text_2"SPACE_ROOT_USED" ="\033[0m"$fon_3$text_4$(df /root/ | grep /dev/mapper/ | awk '{printf("%.2f Mb", $3 / 1000)}')"\033[0m"
            echo -e $fon_1$text_2"SPACE_ROOT_FREE" ="\033[0m"$fon_3$text_4$(df /root/ | grep /dev/mapper/ | awk '{printf("%.2f Mb", $4 / 1000)}')"\033[0m"
        else
            echo "Цвета шрифта и фона одного столбца совпадают"
        fi
    else
        echo invalid input
    fi
fi