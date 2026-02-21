#!/bin/bash
set -euo pipefail

server_info()
{
        echo "==========================="
        echo "        SERVER-INFO        "
        echo "==========================="
        HOST=$(hostname)
        echo "Hostname : $HOST"
        OS=$(uname -o)
        echo "OS : $OS"
}

server_uptime()
{
	echo "==========================="
	echo "           UPTIME          "
	echo "==========================="
	SERVER_UPTIME=$(uptime -p)
	echo "Server Up Time : $SERVER_UPTIME"
}

server_disk_usage()
{
	echo "============================"
	echo "     SERVER-DISK-USAGE      "
	echo "============================"
	SERVER_DISK_USAGE=$(du -sh /* 2>/dev/null | sort -hr | head -n 5)
	echo "Server Disk Usage : "
	echo "$SERVER_DISK_USAGE"
}

server_memory()
{
	echo "============================"
        echo "       SERVER-MEMORY        "
        echo "============================"
	echo "Server Memory : "
	free -h
}

server_cpu_usage()
{
	echo "============================"
        echo "         CPU-USAGE          "
        echo "============================"
	echo "CPU Usage : "
	ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
}

main()
{
	server_info
	server_uptime
	server_disk_usage
	server_memory
	server_cpu_usage
}
main
