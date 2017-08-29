#!/bin/bash

# https://github.com/petvas/i3lock-blur
# https://www.reddit.com/r/unixporn/comments/69008j/i3gaps_1984/

TMPBG=/tmp/screen.png
LOCK=$HOME/.config/i3-lock/lock.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')

ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=8:4,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
i3lock -i $TMPBG
rm $TMPBG
