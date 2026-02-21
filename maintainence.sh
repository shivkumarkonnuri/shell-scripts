#!/bin/bash
set -euo pipefail

LOG_FILE="/var/log/maintenance.log"

exec >> "$LOG_FILE" 2>&1

echo "============================================"
echo "$(date) : maintenance started"
./log_rotate.sh /var/log/myapp
./backup.sh /source /backup
echo "$(date) : maintenance completed"
echo "============================================"
