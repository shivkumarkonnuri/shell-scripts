#!/bin/bash
check_disk(){
	df -h /
}

check_memory(){
	free -h
}

main(){
echo ===============================
echo           Disk Space
echo ===============================
check_disk
echo " "
echo ===============================
echo 	       RAM Space
echo ===============================
check_memory
}
main
