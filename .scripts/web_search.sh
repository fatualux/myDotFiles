#! /bin/bash
#! /bin/sh

/bin/dunstify ".:FIREFOX WEB SEARCH:."

echo "---------------------------"
echo " What are you looking for?"
echo "---------------------------"
echo ""
echo ""

read -r query

echo "OK."

command=$(/bin/firefox "https://www.google.com/search?client=firefox-b-d&q=""$query")

exec termite -e "$command" &

exit
