#!/bin/bash

# Find the PID of the CPU.sh script
pid=$(ps -ef | grep '[C]PU.sh' | awk '{print $2}')

if [ -n "$pid" ]; then
    kill "$pid"
    echo "CPU.sh script with PID $pid has been stopped."
else
    echo "CPU.sh script is not running."
fi
