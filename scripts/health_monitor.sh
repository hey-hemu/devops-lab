#!/bin/bash
set -euo pipefail

THRESHOLD=80
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "Current Root Disk Usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "[CRITICAL] Disk space exceeds ${THRESHOLD}%!"
    exit 1
else
    echo "[OK] Disk space is within safe limits."
fi

# Verify Nginx status
if systemctl is-active --quiet nginx; then
    echo "[OK] Nginx service is running."
else
    echo "[WARN] Nginx service is stopped!"
    exit 2
fi
