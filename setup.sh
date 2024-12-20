#!/bin/bash

# Colors for terminal output
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RESET="\033[0m"

# Function to check if a command exists and install it if missing
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${YELLOW}[!] $1 not found. Installing...${RESET}"
        sudo apt install -y $1 || {
            echo -e "${RED}[!] Failed to install $1. Exiting setup.${RESET}"
            exit 1
        }
    else
        echo -e "${GREEN}[+] $1 is already installed.${RESET}"
    fi
}

# Function to configure Linphone SIP account
configure_linphone() {
    echo -e "${CYAN}[+] Configuring Linphone SIP account...${RESET}"
    cat << EOF > ~/.linphonerc
[auth_info_0]
username=prithvi669
userid=prithvi669
password=jvNcKSUr@x5f@jB
realm=sip.linphone.org

[proxy_0]
reg_proxy=sip:sip.linphone.org
reg_identity=sip:prithvi669@sip.linphone.org
reg_expires=3600
EOF
    echo -e "${GREEN}[+] Linphone SIP account configured successfully.${RESET}"
}

# Start setup
clear
echo -e "${CYAN}Starting V0iceX-Anonymizer Setup...${RESET}"

# Update package list
echo -e "${CYAN}[+] Updating package list...${RESET}"
sudo apt update || {
    echo -e "${RED}[!] Failed to update package list. Please check your network connection.${RESET}"
    exit 1
}

# Install dependencies
echo -e "${CYAN}[+] Installing required tools...${RESET}"
for tool in sox linphone pulseaudio openvpn tor nmcli; do
    check_command $tool
done

# Check WiFi adapter compatibility for hotspot
echo -e "${CYAN}[+] Checking WiFi adapter compatibility...${RESET}"
if nmcli device wifi list &> /dev/null; then
    echo -e "${GREEN}[+] WiFi adapter is compatible for hotspot.${RESET}"
else
    echo -e "${RED}[!] No compatible WiFi adapter found. Hotspot functionality may not work.${RESET}"
fi

# Configure Linphone SIP account
configure_linphone

# Final message
echo -e "${GREEN}[+] Setup completed successfully. You are ready to use V0iceX-Anonymizer!${RESET}"
