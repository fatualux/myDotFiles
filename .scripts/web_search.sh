#! /bin/bash
#! /bin/sh

/bin/dunstify ".:W3M - Web Browser:."

COLS=$(tput cols)
text="What are you looking for?"
h_text=${#text}

printf "%*s\n" $((COLS/2+h_text/2)) "$text"
echo ""
echo ""

read -r query

URL=$(echo -ne "http://www.google.com/search?ie=ISO-8859-1&hl=it&source=hp&q=""$query")

w3m "$URL"


