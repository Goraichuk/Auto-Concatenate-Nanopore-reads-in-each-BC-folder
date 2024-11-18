#!/bin/bash

# Create the "concatenated_fastq" output directory if it doesn't exist
mkdir -p concatenated_fastq

# Loop through all barcode directories in the pass folder
for barcodeDir in pass/barcode*; do
  BC=$(echo $barcodeDir | sed "s|.*barcode|BC|")
  echo "barcode is set to: ${BC}"
  echo "concatenating reads for:" $barcodeDir
  
# Check if the input directory exists before attempting to concatenate
  if [ -d "$barcodeDir" ]; then
    # Concatenate all .fastq.gz files in the barcode directory and output to DMP folder
    cat ${barcodeDir}/*.fastq.gz > concatenated_fastq/${BC}.fastq.gz
  else
    echo "Directory $barcodeDir does not exist or is empty."
  fi
done