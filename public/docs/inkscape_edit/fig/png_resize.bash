#!/bin/bash

#using imagemagic
#original:1920*1168,
# 1024* は53.3%
# InkscapeでA4幅にいれるため640:33%
#for p in *.jpeg; do
for p in f*.png; do
echo $p
    if test -f $p  ; then 
#	pdftoppm -jpeg  $p > $p.jpeg
#	convert $p.jpeg -crop 2001x859+0+75 $p.crop.jpeg
#	rm $p.jpeg
#	convert $p.png -resize "50%" $p.050.png #2021.bug
 	convert $p -resize "33%" ${p%.png}.033.png
    fi
done
