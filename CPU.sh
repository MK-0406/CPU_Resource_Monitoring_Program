#!/bin/bash

# a) clear previous content in CPU.csv file
> CPU.csv

# g) read first input parameter as period and set period to default value of 60 if no input
period=${1:-60}

# f) use infinite while loop and stop it by using Ctrl-c keys
trap 'echo; echo "Stopping CPU monitoring..."; exit' SIGINT
echo "Starting CPU monitoring every $period seconds. Press Ctrl+C to stop."
while true
do
    # b) use date command to get the current time (hr:min:sec)
    timestamp=$(date +"%H:%M:%S")

    # c) use ps to capture the highest %CPU task name and its %CPU by sorting the output in descending order
    top_process=$(ps -eo comm,%cpu --sort=-%cpu | grep -v "ps" | awk 'NR==2')
    task_name=$(echo "$top_process" | awk '{print $1}')

    # d) record down the %CPU in (c)
    cpu_usage=$(echo "$top_process" | awk '{print $2}')

    # e) store values in (b) to (d) into one row on CPU.csv and each value is separated by semicolon(;)
    echo "$timestamp; $task_name; $cpu_usage" >> CPU.csv

    # g) record down the reading for every "period" second(s)
    sleep "$period"
done
