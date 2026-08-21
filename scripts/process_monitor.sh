#!/bin/bash
set -euo pipefail

THRESHOLD=${1:-80}

# Extract free RAM percentage using 'free' and 'awk'
MEM_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

echo "Current Memory Usage: ${MEM_USAGE}%"
echo "Memory Limit Threshold: ${THRESHOLD}%"

if [ "$MEM_USAGE" -gt "$THRESHOLD" ]; then
    echo "[ALERT] Memory usage exceeds threshold! ($MEM_USAGE% > $THRESHOLD%)"
    exit 1
else
    echo "[OK] Memory usage is within safe limits."
    exit 0
fi
