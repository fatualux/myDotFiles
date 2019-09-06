#! /bin/bash
#! /bin/sh

###Ottimizzazione database di pacman

echo "This script requires superuser permissions to be executed. Please type your password."
sleep=1
sudo -s
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root." 1>&2
   exit 1
else
pacman-optimize
fi







