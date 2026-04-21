#!/bin/bash

clear

# ===== MATRIX STYLE BANNER =====
banner() {
clear
echo -e "\e[32m"

echo "______ _____ _____ ______  _______   __"
echo "| ___ \_   _|  __ \| ___ \|  _  \ \ / /"
echo "| |_/ / | | | |  \/| |_/ /| | | |\ V / "
echo "| ___ \ | | | | __ | ___ \| | | | \ /  "
echo "| |_/ /_| |_| |_\ \| |_/ /\ \_/ / | |  "
echo "\____/ \___/ \____/\____/  \___/  \_/  "
echo "====================================="

boot() {
echo "[BOOT] Initializing system..."
sleep 1
echo "[BOOT] Loading kernel modules..."
sleep 1
echo "[BOOT] Establishing secure connection..."
sleep 1
echo "[BOOT] Access granted ✔"
sleep 1
echo ""
}

# ===== MATRIX EFFECT =====
matrix() {
echo "[*] Entering matrix mode..."
for i in {1..10}
do
  echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
  sleep 0.1
done
echo ""
}

# ===== SCAN EFFECT =====
scan() {
echo -n "[*] Scanning database"
for i in {1..8}
do
  echo -n "."
  sleep 0.2
done
echo ""
echo "[*] Decrypting..."
sleep 1
}

# ===== MAIN =====
boot
matrix

while true
do
  banner

  echo "[1] PASSWORD SCAN MODULE"
  echo "[2] EXIT SYSTEM"
  echo ""

  read -p ">> COMMAND: " choice

  if [ "$choice" == "1" ]; then

    read -p "Enter 4-digit key: " input

    scan

    found=0
    lineNo=0

    while read line
    do
        lineNo=$((lineNo+1))

        if [ "$line" == "$input" ]; then
            echo ""
            echo -e "\e[32m[+] ACCESS GRANTED ✔\e[0m"
            echo "[SYSTEM] Line: $lineNo"
            echo "[SYSTEM] Key: $line"
            echo ""
            found=1
            break
        fi

    done < password.txt

    if [ $found -eq 0 ]; then
        echo ""
        echo -e "\e[31m[-] ACCESS DENIED ✖\e[0m"
        echo ""
    fi

    read -p "Press Enter to continue..."

  elif [ "$choice" == "2" ]; then
    echo "[SYSTEM] Shutting down..."
    sleep 1
    break
  else
    echo "INVALID COMMAND"
    sleep 1
  fi

done
