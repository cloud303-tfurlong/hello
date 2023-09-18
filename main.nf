// #!/usr/bin/env nextflow

nextflow.enable.dsl=2

process downloadFromS3 {
    input:
    val bucket
    val filename
    
    output:
    path "downloaded_file.txt"

    script:
    """
    aws s3 cp s3://${bucket}/${filename} downloaded_file.txt
    """
}

process printFileContents {
    input:
    path file
    
    script:
    """
    cat $file
    """
}

workflow {
    // 's3://interline-warehouse-proteomics-analysis-raw/quilt-experiment-universal.json
    bucket = "interline-warehouse-proteomics-analysis-raw"
    filename = "quilt-experiment-universal.json"
    
    downloadFromS3(bucket, filename)
    printFileContents(downloadFromS3.out)
}
