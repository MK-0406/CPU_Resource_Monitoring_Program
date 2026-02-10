# CPU Resource Monitoring Program

A simple Bash-based utility that logs the highest CPU-consuming process on your system at a fixed interval. Each sample records the current time, the process name, and its %CPU into a CSV file.

## Overview
- Monitors the process with the highest CPU usage at each sample.
- Writes semicolon-separated records to `CPU.csv`.
- Default sampling period is 60 seconds; configurable via a command-line argument.

## Files
- [CPU.sh](CPU.sh): main monitoring script
- [CPU-stop.sh](CPU-stop.sh): helper to stop a running monitor
- [CPU.csv](CPU.csv): output data file (overwritten at start)

## Usage
### Start monitoring
- Run with default 60s period:

```bash
./CPU.sh
```

- Run with custom period (e.g., 5 seconds):

```bash
./CPU.sh 5
```

- Optional: make scripts executable and run directly:

```bash
chmod 755 CPU.sh CPU-stop.sh
./CPU.sh 5
```

- The script prints a start message and can be stopped with `Ctrl+C`. It also overwrites `CPU.csv` at the beginning of each run.

- The monitor runs in the foreground by default. To run it in the background, append `&` to the command:

```bash
./CPU.sh 5 &
```

### Stop monitoring
- If the monitor is running in the background or a different terminal, stop it via:

```bash
./CPU-stop.sh
```

This finds the PID of `CPU.sh` and terminates it if running.

### Show running monitors
- To check if any `CPU.sh` instances are running, use:

```bash
ps -all
```

## Output Format
- File: `CPU.csv`
- Separator: semicolon `;`
- Columns: `HH:MM:SS; <process_name>; <percent_cpu>`

Example:

```text
14:16:30; firefox; 11.7
14:16:34; firefox; 11.6
14:16:38; firefox; 11.6
```

