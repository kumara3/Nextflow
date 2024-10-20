#!/bin/bash -euo pipefail
module unload java
module load java/20  fastqc/0.12.1
mkdir -p Sample_NA06984_T_RG2_outfastqc
fastqc -t 2 --nogroup --extract Sample_NA06984_T_RG2/*.fastq.gz --outdir Sample_NA06984_T_RG2_outfastqc
