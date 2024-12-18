#!/bin/bash

# Define log file path
LOGFILE="../logs/v0icex.log"

# Ensure the log directory exists
mkdir -p ../logs

# Create the log file if it doesn't exist
touch $LOGFILE

# Enable WiFi
nmcli r wifi on || {
    echo "[!] Failed to enable WiFi." | tee -a $LOGFILE
    exit 1
}

# Ask if the user wants to set up a hotspot
echo "[+] Do you want to set up a hotspot? (y/n):"
read HOTSPOT_OPTION

if [ "$HOTSPOT_OPTION" == "y" ]; then
    echo "[+] Enter hotspot SSID:"
    read SSID
    echo "[+] Enter hotspot password:"
    read PASSWORD

    # Set up the hotspot
    nmcli device wifi hotspot ssid="$SSID" password="$PASSWORD" || {
        echo "[!] Hotspot setup failed." | tee -a $LOGFILE
        exit 1
    }

    echo "[+] Hotspot enabled: SSID=$SSID" | tee -a $LOGFILE
else
    echo "[+] Skipping hotspot setup." | tee -a $LOGFILE
fi
