#!/bin/bash
echo "RAM stats:"
free -h
echo " "
echo "Disk space"
df -h | awk '{print $0 $3 $4 $5}'
echo " "
uptime -p
