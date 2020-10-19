#!/bin/bash

input_file=$1
gene_name=$2
output_dir=$3
output_file=$(basename "$input_file" | cut -d. -f1)

grep $gene_name $input_file | awk '{print $1}' | tr --delete ">" | while read -r line; do samtools faidx $input_file $line >> ${output_dir}/${output_file}_${gene_name}.fasta; done
