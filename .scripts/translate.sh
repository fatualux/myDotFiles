#! /bin/bash

/bin/dunstify ".:TRANSLATOR:."

COLS=$(tput cols)
text="Word or phrase?"
h_text=${#text}

printf "%*s\n" $((COLS/2+h_text/2)) "$text"

read -r term

echo Translating...

trans -p -t it "$term"
