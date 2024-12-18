#!/bin/bash
nmcli r wifi on
nmcli device wifi hotspot ssid=V0iceX password=12345678 || {
    echo "[!] Hotspot setup failed."
    exit 1
}
echo "[+] Hotspot enabled."
