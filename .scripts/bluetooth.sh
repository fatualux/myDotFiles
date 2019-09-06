#! /bin/bash

sudo bluetooth off;
sleep 2;
pulseaudio -k;
pulseaudio --start;
echo "Restarting Pulseaudio..." && sleep 2;
sudo bluetooth on && echo "Done.";
sleep 2;
exit

