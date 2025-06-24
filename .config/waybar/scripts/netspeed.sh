#!/bin/bash

# Interface to monitor (change to your network interface, e.g., wlan0, eth0)
INTERFACE="wlan0"

# Get initial RX and TX
RX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
TIME_PREV=$(date +%s)

sleep 1

while true; do
    RX_CURR=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
    TX_CURR=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
    TIME_CURR=$(date +%s)

    TIME_DELTA=$((TIME_CURR - TIME_PREV))
    RX_DELTA=$((RX_CURR - RX_PREV))
    TX_DELTA=$((TX_CURR - TX_PREV))

    RX_RATE=$((RX_DELTA / TIME_DELTA))
    TX_RATE=$((TX_DELTA / TIME_DELTA))

    # Format speed
    RX_HUMAN=$(numfmt --to=iec-i --suffix=B $RX_RATE)
    TX_HUMAN=$(numfmt --to=iec-i --suffix=B $TX_RATE)

    echo "{\"text\": \"↓ $RX_HUMAN ↑ $TX_HUMAN\", \"class\": \"net_speed\"}"

    RX_PREV=$RX_CURR
    TX_PREV=$TX_CURR
    TIME_PREV=$TIME_CURR

    sleep 1
done

