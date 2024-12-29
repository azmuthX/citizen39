#!/bin/bash

# Colors for terminal output
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
MAGENTA="\033[35m"
RESET="\033[0m"

# Centered ASCII art logo
clear
printf "${CYAN}"
cat ./assets/logo.txt
printf "${RESET}\n"

# GitHub information
printf "${YELLOW}GitHub Repository:${RESET} https://github.com/azmuthX/citizen39.git\n"
printf "${MAGENTA}Author:${RESET} Dr. AZ \n\n"

# Step1: Configure network(Tor+VPN)
printf "${CYAN} Configuring network ...${RESET}\n"
bash ./script/network_setup.sh

# Step2: Setting up hotspot(optional)
printf "${YELLOW} Setting up hotspot ...${RESET}\n"
bash ./script/hotspot.sh

# Menu-driven setup
while true; do
    printf " #1 Make a Call\n"
    printf " #2 View logs\n"
    printf " #3 EXIT\n"
    printf "${GREEN}Enter your choice: ${RESET}"
    read CHOICE

    case $CHOICE in
        1)
            printf "${CYAN}Starting voice modulation and dialing...${RESET}\n"
            bash ./script/voice_mod.sh &
            bash ./script/voip_call.sh
            ;;
        2)
            printf "${CYAN}Displaying logs:${RESET}\n"
            cat ./logs/v0icex.log
            ;;
        3)
            printf "${RED}Cleaning up logs...${RESET}\n"
            rm -f ./logs/v0icex.log
            printf "${CYAN}Deleting logs successfull... Now Exiting...${RESET}\n"
            exit 0
            ;;
        *)
            printf "${RED}Invalid option! Try again.${RESET}\n"
            ;;
    esac
done
