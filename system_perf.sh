#!/bin/bash
echo -e "RAM stats:"
free -h
echo
echo -e "Disk space:"
df -h | awk '{print $1,$2,$4,$5}' | column -t
echo
echo -e 'Uptime:'
uptime
