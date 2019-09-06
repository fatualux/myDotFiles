#!/bin/bash
# piccolo script scritto con zenity
# per cercare worm, trojan ecc.
var=`zenity --text="gui-rkhunter" --list --checklist --column=" " --column="Fai una scelta" false "Aggiorna-programma" false "Scansiona sistema" false "Visualizza risultati"`

if [ "$var" = "Aggiorna-programma" ]; then
sudo rkhunter --update

elif [ "$var" = "Scansiona sistema" ]; then
sudo rkhunter -c --enable all --disable none --rwo

elif [ "$var" = "Visualizza risultati" ]; then
sudo nano /var/log/rkhunter.log

fi