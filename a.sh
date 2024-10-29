#!/bin/bash
set -e

TIMEOUT=15
while [ $TIMEOUT -gt 0 ]; do
    nc -z mysql 3306 && break
    echo "Waiting for MySQL..."
    sleep 1
    TIMEOUT=$((TIMEOUT - 1))
done

if [ $TIMEOUT -eq 0 ]; then
    echo "Timeout while waiting for MySQL"
    exit 1
fi

echo "MySQL is up!"
exec "$@"
