#!/bin/sh
sed -i \
         -e 's/#000000/rgb(0%,0%,0%)/g' \
         -e 's/#efefef/rgb(100%,100%,100%)/g' \
    -e 's/#000000/rgb(50%,0%,0%)/g' \
     -e 's/#016b6b/rgb(0%,50%,0%)/g' \
     -e 's/#070707/rgb(50%,0%,50%)/g' \
     -e 's/#eaeaea/rgb(0%,0%,50%)/g' \
	$@
