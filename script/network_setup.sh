#!/bin/bash

# Define log file path
LOGFILE="../logs/v0icex.log"

# Ensure the log directory exists
mkdir -p ../logs

# Create the log file if it doesn't exist
touch $LOGFILE

# Start Tor
echo "[+] Starting Tor..." | tee -a $LOGFILE
sudo service tor start || {
    echo "[!] Failed to start Tor." | tee -a $LOGFILE
    exit 1
}

# Ask the user for VPN configuration file path
echo "[+] Enter the path to your VPN configuration file:"
read VPN_CONFIG

if [ ! -f "$VPN_CONFIG" ]; then
    echo "[!] VPN configuration file not found at $VPN_CONFIG." | tee -a $LOGFILE
    exit 1
fi

# Start VPN
echo "[+] Starting VPN with configuration: $VPN_CONFIG..." | tee -a $LOGFILE
sudo openvpn --config "$VPN_CONFIG" --daemon || {
    echo "[!] Failed to start VPN." | tee -a $LOGFILE
    exit 1
}

echo "[+] Network setup complete (Tor + VPN)." | tee -a $LOGFILE
