#!/bin/bash

ERROR_RATE=$(shuf -i 1-4 -n 1)
LATENCY=$(shuf -i 200-700 -n 1)

echo "ERROR_RATE=$ERROR_RATE"
echo "LATENCY=$LATENCY"

if [ "$ERROR_RATE" -gt 2 ] || [ "$LATENCY" -gt 500 ]; then
    echo "UNHEALTHY"
else
    echo "HEALTHY"
fi
