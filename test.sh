#!/usr/bin/env bash

SLEEP=${SLEEP:-10}
out="results.txt"

while true; do
  echo -e "[$(date)] Checking internet speed via speedtest.net CLI tools..\n" | tee -a $out
  echo "Connected to WiFi network:" | tee -a $out
  /Sy*/L*/Priv*/Apple8*/V*/C*/R*/airport -I | grep SSID | tee -a $out
  echo "Running speedtest.net via CLI.." | tee -a $out
  speedtest --progress=no 2>&1 | tee -a $out
  echo -e "\n" | tee -a $out
  echo "Sleeping for $SLEEP seconds.."
  sleep $SLEEP
done
