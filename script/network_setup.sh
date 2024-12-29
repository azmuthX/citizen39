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

echo "[+] TOR setup complete." | tee -a $LOGFILE
