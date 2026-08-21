#!/bin/bash

TARGET_LOGS=("/var/log/nginx/access.log" "/var/log/syslog")

for LOG_FILE in "${TARGET_LOGS[@]}"; do
    if [ -f "$LOG_FILE" ]; then
        SIZE=$(du -sh "$LOG_FILE" | cut -f1)
        echo "[FOUND] $LOG_FILE - Current Size: $SIZE"
    else
        echo "[MISSING] $LOG_FILE does not exist."
    fi
done
