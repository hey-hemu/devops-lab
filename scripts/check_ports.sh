#!/bin/bash
set -euo pipefail

HOST=${1:-"127.0.0.1"}
PORT=${2:-"80"}

echo "Probing $HOST on port $PORT..."

if nc -zv -w 3 "$HOST" "$PORT" > /dev/null 2>&1; then
    echo "[SUCCESS] Service on $HOST:$PORT is reachable."
    exit 0
else
    echo "[FAILURE] Cannot reach $HOST:$PORT."
    exit 1
fi
