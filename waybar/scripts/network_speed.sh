#!/bin/bash

INTERFACE=$(ip route | awk '/default/ {print $5; exit}')
RX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
sleep 1
RX_CUR=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)

RX_DIFF=$((RX_CUR - RX_PREV))
RX_KB=$((RX_DIFF / 1024))

if [ "$RX_KB" -lt 1024 ]; then
    echo " ${RX_KB}KB/s"
else
    RX_MB=$(echo "scale=2; $RX_KB / 1024" | bc)
    echo " ${RX_MB}MB/s"
fi
