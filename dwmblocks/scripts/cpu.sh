#!/bin/bash
# Simple CPU usage monitor using /proc/stat
cpu=($(head -n1 /proc/stat))
prev_total=$((cpu[1] + cpu[2] + cpu[3] + cpu[4] + cpu[5] + cpu[6] + cpu[7] + cpu[8]))
prev_idle=$((cpu[4] + cpu[5]))

sleep 1

cpu=($(head -n1 /proc/stat))
total=$((cpu[1] + cpu[2] + cpu[3] + cpu[4] + cpu[5] + cpu[6] + cpu[7] + cpu[8]))
idle=$((cpu[4] + cpu[5]))

total_delta=$((total - prev_total))
idle_delta=$((idle - prev_idle))

usage=$((100 * (total_delta - idle_delta) / total_delta))
printf " %d%%\n" "$usage"
