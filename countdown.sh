#!/bin/bash
read -p "Enter the start point of the countdown:" START_NUM
while [ $START_NUM -ge 0 ]
do
        echo $START_NUM
        START_NUM=$((START_NUM - 1))
done
echo "Done!!!!"
