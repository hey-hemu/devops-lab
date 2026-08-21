#!/bin/bash

# Positional Arguments
TARGET_DIR=${1:-"/var/log"}

echo "=== System Health Snapshot for Host: $(hostname) ==="
echo "User: $(whoami)"
echo "Checking disk usage for: $TARGET_DIR"
echo "--------------------------------------------------"
df -h "$TARGET_DIR"
