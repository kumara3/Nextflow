/*
Run fastqc to access the quality of fastq files
*/

process fastqc{
    tag "$id" // Tag process by sample name, improves readability, useful for debugging and monitoring.
    label 'process_medium'

    input:
        tuple val(id), path(input_fastq)

    output:
        tuple val(id), path("${input_fastq}_outfastqc")

        publishDir "${input_fastq}_outfastqc", mode: 'move' /*  publishDir : outputs results in a user specified location */
        
        /* Error if you want to specify the user's output directory without publishDir 
        "Caused by: File `/scratch/s163196/nextflow/fastqc/fastqc/fastqc_res/Sample_CDK12-p_outfastqc` is outside the scope of the process work directory: /scratch/s163196/nextflow/fastqc/fastqc/22/d36e799803eb3a9ce3565e597bbc40
        */
    
     
    """
    module unload java
    module load java/20  fastqc/0.12.1
    mkdir -p ${input_fastq}_outfastqc
    fastqc -t ${params.thread} --nogroup --extract ${input_fastq}/*.fastq.gz --outdir ${input_fastq}_outfastqc 
    """

}