#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q spotifyd

# Wait until the processes have been shut down
while pgrep -u $UID -x spotifyd >/dev/null; do sleep 1; done

spotifyd --config-path ~/.config/spotifyd --no-daemon -b pulseaudio -B 320
