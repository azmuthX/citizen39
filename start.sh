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
printf "${YELLOW}GitHub Repository:${RESET} https://github.com/V0iceX-Anonymizer.git\n"
printf "${MAGENTA}Author:${RESET} Dr.Zenith\n\n"

# Menu-driven setup
while true; do
    printf "\n${CYAN}Select an option:${RESET}\n"
    printf "1. Configure network (VPN + Tor)\n"
    printf "2. Set up hotspot (optional)\n"
    printf "3. Dial a call with voice modulation\n"
    printf "4. View logs\n"
    printf "5. Exit\n"
    printf "${GREEN}Enter your choice: ${RESET}"
    read CHOICE

    case $CHOICE in
        1)
            printf "${CYAN}Configuring network...${RESET}\n"
            bash ./script/network_setup.sh
            ;;
        2)
            printf "${CYAN}Setting up hotspot...${RESET}\n"
            bash ./script/hotspot.sh
            ;;
        3)
            printf "${CYAN}Starting voice modulation and dialing...${RESET}\n"
            bash ./script/voice_mod.sh &
            bash ./script/voip_call.sh
            ;;
        4)
            printf "${CYAN}Displaying logs:${RESET}\n"
            cat ./logs/v0icex.log
            ;;
        5)
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
