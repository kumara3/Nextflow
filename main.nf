nextflow.enable.dsl = 2
// Execution environment setup

params.help = ""

if(params.help){

    Usage()
    exit(0)
}


def Usage(){
    println """

    Usage:
    options:
     ===========================================
         F A S T Q C   P I P E L I N E
  
         Usage:
        -------------------------------------------
         --projectDir    : Project directory
         --reads         : samplesheet with path to fastq files
         --title         : MultiQC report title, default is "Summarized fastp report"
         --help          : See the usage
        ===========================================
         """
         .stripIndent()

}

/* check the correctness of file (datatype of fastq files and then datatype of config files)*/

//println(WorkflowMain.initialise(workflow, params, log))

// Include modules
include { fastqc } from './modules/fastqc/fastqc.nf'


workflow {

    // Create input channel from samplesheet in CSV format (via CLI parameter)
    reads_ch = Channel.fromPath(params.reads, checkIfExists: true)
                        .splitCsv(header: true)
                        .map{row -> [row.ID, file(row.reads)]}
    
    
    def check_file = file(params.reads)
    //println(check_file)
    def fastq_items = check_file.readLines()
    
    //println(fastq_items)

    // Call variants from the indexed BAM file
    fastqc(reads_ch)
}
