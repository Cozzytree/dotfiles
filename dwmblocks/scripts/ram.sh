#!/bin/bash
# Display RAM usage using the 'free' command
free -h | awk '/^Mem:/ {
  used=$3; total=$2; available=$7;
  printf " %s/%s", used, total
}'
