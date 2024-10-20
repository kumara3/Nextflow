### **A Nextflow fastqc pipeline**
A simple pipline for quality control of fastq file. Fastqc was developed by authors at https://www.bioinformatics.babraham.ac.uk/projects/fastqc/ 
For running the test data simply run:
```
nextflow run main.nf

```
The pipeline has the following arguments:
```
nextflow run main.nf --help
===========================================
     F A S T Q C   P I P E L I N E

     Usage:
    -------------------------------------------
     --projectDir    : Project directory
     --reads         : samplesheet with path to fastq files
     --title         : MultiQC report title, default is "Summarized fastp report"
     --help          : See the usage
    ===========================================

```
Example of samplesheet to be provided for Input:
```
ID,reads
NA06984_T_RG1,/scratch/s163196/nextflow/fastqc/fastqc/data/Sample_NA06984_T_RG1/
NA06984_T_RG2,/scratch/s163196/nextflow/fastqc/fastqc/data/Sample_NA06984_T_RG2/
```
