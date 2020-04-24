#!/bin/bash

for i in `find $1 -name $2`
do
	f=`basename $i`
	f1=${i%%$f}
	f2=`basename $f1`
	cp $i ${3}/${f2}_${f}
done
