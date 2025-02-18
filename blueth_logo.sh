#!/bin/bash

# Define Bluetooth icons
disconnected_icon="󰂰 "
connected_icon=" "
off_icon="󰂰 "

# Function to check Bluetooth status
get_bluetooth_status() {
    if ! bluetoothctl show | grep -q "Powered: yes"; then
        echo "$off_icon"
    else
        device=$(bluetoothctl info | grep "Connected: yes")
        if [ -n "$device" ]; then
            echo "$connected_icon"
        else
            echo "$disconnected_icon"
        fi
    fi
}

# Continuously update the status without exiting
while true; do
    get_bluetooth_status
    sleep 1  # Faster update interval
done

