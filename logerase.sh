#!/bin/bash
# ============================================
# [⚡ USB LOG ERASER v1.0 ⚡]
# ================== BY WADekarHarshVardhan ==================
# ============================================
# 🕶️ The Ultimate Covert Footprint Cleaner 🕶️
# Run as root. Stay anonymous. Stay hidden.
# ============================================

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo -e "\e[31m[!] ACCESS DENIED: ROOT REQUIRED.\e[0m"
  echo -e "\e[33m[*] Run with: sudo $0\e[0m"
  exit 1
fi

echo -e "\e[32m[*] Initiating Shadow Protocol...\e[0m"
sleep 1

# Clear kernel ring buffer
echo -e "\e[34m[*] Evading kernel traces...\e[0m"
dmesg --clear

# Search logs for 'usb' signatures
echo -e "\e[36m[*] Hunting for 'usb' fingerprints in kern.log...\e[0m"
grep usb /var/log/kern.log

# Remove old kernel logs
echo -e "\e[36m[*] Eliminating old kernel logs...\e[0m"
rm -rf /var/log/kern*

# Search compressed logs
echo -e "\e[36m[*] Analyzing compressed logs for 'usb'...\e[0m"
zcat /var/log/kern.log.2.gz 2>/dev/null | grep usb

# Search syslog
echo -e "\e[36m[*] Scanning syslog for 'usb'...\e[0m"
grep usb /var/log/syslog

# Remove syslog backups
echo -e "\e[36m[*] Wiping syslog archives...\e[0m"
rm -rf /var/log/syslog*

# Cover tracks in bash history
echo -e "\e[35m[*] Erasing bash history...\e[0m"
cat /dev/null > ~/.bash_history
history -c

# Final message
echo -e "\e[32m[+] Shadow mode activated. Footprints erased.\e[0m"
echo -e "\e[32m[!] Discretion is your armor. Stay hidden.\e[0m"
