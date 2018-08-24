#!/bin/sh

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

[ -f ~/.cache/wal/colors.sh ] && . ~/.cache/wal/colors.sh
export color0_alpha="#DD${color0/'#'}"

polybar top &
polybar bottom &
