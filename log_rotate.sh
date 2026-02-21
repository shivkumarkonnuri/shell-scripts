#!/bin/bash
set -euo pipefail

DIR="${1:-}"

if [ "$DIR" = "" ] || [ ! -d "$DIR" ]
then 
	echo "Directory does not exists or not passed in the parameter"
	exit 1
fi

ZIP_COUNT=$(find "$DIR" -type f -name "*.log" -mtime +7 | wc -l)
DEL_COUNT=$(find "$DIR" -type f -name "*.gz" -mtime +30 | wc -l)
find "$DIR" -type f -name "*.log" -mtime +7 -exec gzip {} \;
find "$DIR" -type f -name "*.gz" -mtime +30 -exec rm -f {} \;
echo "Log zipped count : $ZIP_COUNT"
echo "Log deleted count : $DEL_COUNT"
