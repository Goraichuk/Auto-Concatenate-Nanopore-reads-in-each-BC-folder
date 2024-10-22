# Auto Concatenate Nanopore reads in each BC folder
This script is to automate the concatenatination of Nanopore's fastq.gz files in each barcode folder created after demultiplexing.

# Usage
### Requirements
This script requires that fastq.gz files are arranged in the normal output/directory structure from Guppy/Dorado basecalling. 

### Setup
This concatenates the fastq files into the specified output directory with a name according to the barcode number (example: BC01.fastq.gz).

### Run
```bash
#Change "${INPUT_DIR}" and "${OUTPUT_DIR}" to the actual input/output pathways
for barcodeDir in ${INPUT_DIR}/barcode*; do
  BC=$(echo $barcodeDir | sed "s|.*barcode|BC|")
  echo "barcode is set to: ${BC}"
  echo "concatenating reads for:" $barcodeDir
  cat ${barcodeDir}/*.fastq.gz > ${OUTPUT_DIR}/${BC}.fastq.gz
done
