#!/bin/sh
sed -i \
         -e 's/#020202/rgb(0%,0%,0%)/g' \
         -e 's/#01f2d1/rgb(100%,100%,100%)/g' \
    -e 's/#020202/rgb(50%,0%,0%)/g' \
     -e 's/#0e9491/rgb(0%,50%,0%)/g' \
     -e 's/#041a1e/rgb(50%,0%,50%)/g' \
     -e 's/#eaeaea/rgb(0%,0%,50%)/g' \
	$@
