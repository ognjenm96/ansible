#!/bin/bash

# Define separator
SEPARATOR='****************************************************************************************'

# Define logging function
log() {
    echo "$(date): $1" >> /home/ognjen/system_stats.log
}

# Check if commands exist
commands=(free df uptime top vmstat)
for cmd in "${commands[@]}"; do
    if ! command -v $cmd &> /dev/null; then
        echo "$cmd could not be found"
        exit
    fi
done

# Define functions for each system statistic
get_date() {
    log "Date and time:"
    log "$(date)"
}

get_ram_stats() {
    log "RAM stats:"
    log "$(free -h)"
}

get_disk_space() {
    log "Disk space:"
    log "$(df -h | grep -vE '^(tmpfs|efivarfs)' | awk '{print $1,$2,$4,$5}' | column -t)"
}

get_uptime() {
    log 'UPTIME:'
    log "$(uptime)"
}

get_cpu_usage() {
    log 'CPU usage:'
    log "$(top -b -n1 | grep "Cpu(s)" | awk '{print $2,$3,$4,$5,$6,$7,$8,$9,$10,$11}')"
}

get_details_stats() {
    log 'Details stats:'
    log "$(vmstat 1 5)"
}

# Call functions
log 'NEW SCRIPT STARTED'
log $SEPARATOR
get_date
log $SEPARATOR
get_ram_stats
log $SEPARATOR
get_disk_space
log $SEPARATOR
get_uptime
log $SEPARATOR
get_cpu_usage
log $SEPARATOR
get_details_stats
log $SEPARATOR
log 'END OF SCRIPT'