#!/bin/bash

# Get input data
read_path=$1
output_path=$2

R1=`ls -C ${read_path}/*1.fastq.gz`
R2=`ls -C ${read_path}/*2.fastq.gz`

# Create files to merge
for i in $R1; do
	basename=`basename $i`
	samplename=${basename%%_1.fastq.gz}
	echo $samplename >> samplename.list
done

printf '%s\n' "${R1}" > R1.list
printf '%s\n' "${R2}" > R2.list

# Merge files into tab-separated file

paste samplename.list R1.list R2.list > ${output_path}/snippy_samples.list
sed -i '1i #ID	R1	R2' ${output_path}/snippy_samples.list

# Cleanup
rm samplename.list
rm R1.list
rm R2.list
