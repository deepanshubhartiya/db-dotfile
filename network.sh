#!/bin/bash
INTERFACE="wlan0" # Replace with your interface

RX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
RX_NEXT=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_NEXT=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

RX_RATE=$((($RX_NEXT - $RX_PREV) / 1024))
TX_RATE=$((($TX_NEXT - $TX_PREV) / 1024))

echo "{\"text\":\"$RX_RATE KB/s ↓↑ $TX_RATE KB/s\", \"tooltip\":\"Download: $RX_RATE KB/s\nUpload: $TX_RATE KB/s\"}"

