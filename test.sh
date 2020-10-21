#!/usr/bin/env bash

SLEEP=${SLEEP:-10}

while true; do
  echo "[$(date)] Checking net speeds.."
  echo -e "[$(date)] Checking internet speed via speedtest.net CLI tools..\n" >> results.txt
  echo "Running speedtest.net via CLI.."
  speedtest --progress=no >> results.txt
  echo -e "\n" >> results.txt
  echo "Sleeping for $SLEEP seconds.."
  sleep $SLEEP
done
