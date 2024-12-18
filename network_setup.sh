#!/bin/bash
echo "[+] Starting Tor..."
sudo service tor start

echo "[+] Starting VPN..."
sudo openvpn --config /path/to/vpn-config.ovpn --daemon
