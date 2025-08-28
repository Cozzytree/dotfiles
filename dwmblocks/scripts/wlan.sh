#!/bin/bash

case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
up) printf " 󰤨  Connected" ;;
down) printf "Disconnected" ;;
esac
