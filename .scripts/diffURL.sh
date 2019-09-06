#!/bin/bash

URL="https://www.androidworld.it/2017/07/14/disinstallare-app-sistema-senza-root-489576/"

cd Downloads/tmp;

wget -nc -O "old.html" $URL;

wget -O "new.html" $URL;

sleep 7;

DIFF=$(diff "old.html" "new.html");

if [ "$DIFF" != "" ]
  then rm "old.html" && mv "new.html" "old.html";
  echo "CHANGED.";
else
  echo "SAME";
fi
