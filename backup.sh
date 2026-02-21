#!/bin/bash
set -euo pipefail
SOURCE="${1:-}"
DESTINATION="${2:-}"

if [ $# -ne 2 ]
then
	echo "Source or destination not available"
	exit 1
elif [ ! -d "$SOURCE" ]
then
	echo "Error: Source directory does not exists: $SOURCE"
	exit 1
elif [ ! -d "$DESTINATION" ]
then
	echo "Error: Destination directory does not exists: $DESTINATION" 
	exit 1
fi

DATE=$(date +"%Y-%m-%d")
ARCHIVE="$DESTINATION"/backup-"$DATE".tar.gz

tar -czf "$ARCHIVE" "$SOURCE"


if [ ! -f "$ARCHIVE" ] || [ ! -s "$ARCHIVE" ]
then
	echo "Backup not created"
	exit 1
fi

echo "Backup created successfully"
echo "Size : "
ls -lh "$ARCHIVE"

find "$DESTINATION" -type f -name "backup-*.tar.gz" -mtime +14 -exec rm -f {} \;
