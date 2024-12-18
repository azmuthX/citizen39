#!/bin/bash

# Define log file path
LOGFILE="../logs/v0icex.log"

# Ensure the log directory exists
mkdir -p ../logs

# Create the log file if it doesn't exist
touch $LOGFILE

# Check if SoX is installed
if ! command -v sox &> /dev/null; then
    echo "[!] SoX is not installed. Please run setup.sh to install dependencies." | tee -a $LOGFILE
    exit 1
fi

# Start voice modulation
echo "[+] Starting voice modulation..." | tee -a $LOGFILE
sox -t pulseaudio default -t pulseaudio default pitch -500 reverb 30 echo 0.8 0.88 60 0.4 || {
    echo "[!] Voice modulation failed." | tee -a $LOGFILE
    exit 1
}

echo "[+] Voice modulation active." | tee -a $LOGFILE
