#!/usr/bin/env bash

# terminate already running bar instance 
killall -q polybar

# launch bar
echo "---" | tee -a /tmp/polybar_i3bar.log
polybar i3bar 2>&1 | tee -a /tmp/polybar_i3bar.log & disown

echo "Bars launched..."



