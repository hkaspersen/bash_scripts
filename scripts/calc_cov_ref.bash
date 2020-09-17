#!/bin/bash

bam=$1
outputname0=${bam%%.bam}
outputname=${outputname0##*/}

zero=$(bedtools genomecov -ibam $bam -bga | awk '$4==0 {bpCountZero+=($3-$2)} {print bpCountZero}' | tail -1)
nonzero=$(bedtools genomecov -ibam $bam -bga | awk '$4>0 {bpCountZero+=($3-$2)} {print bpCountZero}' | tail -1)
percent=$(bc <<< "scale=6; ($nonzero / ($zero + $nonzero))*100")

echo "Percent coverage of ref. by mapped reads from" $outputname ": " $percent
