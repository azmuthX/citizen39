#!/bin/bash

# Define log file path
LOGFILE="../logs/v0icex.log"

# Ensure the log directory exists
mkdir -p ../logs

# Create the log file if it doesn't exist
touch $LOGFILE

# Check if Linphone CLI is installed
if ! command -v linphonecsh &> /dev/null; then
    echo "[!] Linphone CLI is not installed. Please run setup.sh to install dependencies." | tee -a $LOGFILE
    exit 1
fi

# Prompt for country code and mobile number
echo "[+] Enter the country code (e.g., +1):"
read COUNTRY_CODE
echo "[+] Enter the mobile number:"
read MOBILE_NUMBER

# Validate inputs
if [ -z "$COUNTRY_CODE" ] || [ -z "$MOBILE_NUMBER" ]; then
    echo "[!] Both country code and mobile number are required." | tee -a $LOGFILE
    exit 1
fi

# Dial the number
echo "[+] Dialing ${COUNTRY_CODE}${MOBILE_NUMBER}..." | tee -a $LOGFILE
linphonecsh dial "${COUNTRY_CODE}${MOBILE_NUMBER}" || {
    echo "[!] Failed to dial the number." | tee -a $LOGFILE
    exit 1
}

echo "[+] Call initiated to ${COUNTRY_CODE}${MOBILE_NUMBER}." | tee -a $LOGFILE
