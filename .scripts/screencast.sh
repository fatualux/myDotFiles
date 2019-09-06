#!/bin/bash

DATE=$(date +'%Y-%m-%d--%H-%M-%S')
NAME="/home/fz/Videos/screencast/Screencast-${DATE}.mp4"
RESO=$(xrandr -q --current | grep '*' | awk '{print$1}' | cut -f1 -d\ )
TMPP=/tmp/screencast.pid
function screencast_kill(){
    kill -2 $(cat $TMPP) 2> /dev/null
    rm $TMPP
}

function screencast_start(){
    nohup ffmpeg -f x11grab -s $RESO -framerate 30 -i :0 -c:v libx264 -pix_fmt yuv420p "$NAME" > /dev/null 2>&1 &
    PID=$!
    echo -n $PID > $TMPP
}

if [[ -f $TMPP ]];
then
    screencast_kill
else
    screencast_start
fi
