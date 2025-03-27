#!/bin/bash
echo 'trans svg to eps under this dir'
rdir=$(pwd)
subdirs=$(ls -R | grep ':'| tr -d :)

    for d in $subdirs; do
    cd $rdir
    cd $d
    pwd

for i in *.svg ; do
	if test -f $i  ; then 
	  inkscape -z  $i -E ${i%.svg}.eps
	fi
done

done

echo ' trans end'
# you can translate eps to svg using
# inkscape z $- -l ${i%.eps}.svg
# but, file size became large than inkscape inside
# because sodipodi was not used in case of '-l'
# so insiside inkscape translation was recommended
 
