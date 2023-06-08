#!bin/bash

if [[ $# -eq 1 ]] 
then
    if [[ ${1: -1} == "/"  ]]
    then
        START=$(date +%s%N)
        echo "Total number of folders (including all nested ones) = $(sudo find $1 -type d | wc -l)"
        echo "TOP 5 folders of maximum size arranged in descending order (path and size): "
        echo "$(sudo du -Sh $1 | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}')"
        echo "Total number of files = $(sudo find $1 -type f | wc -l)"
        echo "Number of:"
        echo "Configuration files (with the .conf extension) = $(sudo find $1 -type f -name "*.conf" | wc -l)"
        echo "Text files = $(sudo find $1 -type f -name "*.txt" | wc -l)"
        echo "Executable file = $(sudo find $1 -type f -name "*.exe" | wc -l)"
        echo "Log files (with the extension .log) = $(sudo find $1 -type f -name "*.log" | wc -l)"
        echo "Archive files = $(sudo find $1 -type f -name "*.Gz" | wc -l)"
        echo "Symbolic links = $(sudo find -L $1 | wc -l)"
        echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
        echo "$(sudo find $1 -type f -exec du -Sh {} + | sort -rh | head -10 | cat -n | awk '{print $1" - "$3", "$2}')"
        echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
        echo "$(find $1 -type f -printf "%s %p\n" | sort -hr  | head -10 | awk -F '.' '{print $0 " " $NF}' | awk '{print NR " - " $2 ", " $1 " kb"", " $3 ""}')"
        END=$(date +%s%N)
        DIFF=$((($END - $START)/1000000))
        echo "Script execution time (in seconds) = $DIFF"
    else
        echo "Error"
    fi
else
    echo "Error"
fi