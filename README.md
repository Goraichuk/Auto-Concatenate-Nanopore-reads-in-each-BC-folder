# Auto Concatenate Nanopore reads in each BC folder
This script is to **automate the concatenatination of Nanopore's fastq.gz files in each barcode folder created after demultiplexing.

# Usage
### Requirements
This script requires that the 'fastq.gz' files are arranged in the normal output/directory structure from Guppy/Dorado basecalling. 

### Setup
- The script concatenates `fastq.gz` files from each barcode folder (e.g., `barcode01`, `barcode02`, etc.) into a single file for each barcode, stored in a specified output directory.
- The output files are named according to the barcode number, for example: `BC01.fastq.gz`, `BC02.fastq.gz`, etc.


### Run
You can either use the **script below** or the provided **concatenate_fastq.sh** file. 

#### 1. **Using the Script Below**:

- Modify the following variables in the script:
   - **`${INPUT_DIR}`**: The path to the input directory where the barcode folders are located.
   - **`${OUTPUT_DIR}`**: The path to the output directory where the concatenated files will be saved.

```bash
# Change "${INPUT_DIR}" and "${OUTPUT_DIR}" to the actual input/output paths
for barcodeDir in ${INPUT_DIR}/barcode*; do
  BC=$(echo $barcodeDir | sed "s|.*barcode|BC|")
  echo "barcode is set to: ${BC}"
  echo "concatenating reads for:" $barcodeDir
  cat ${barcodeDir}/*.fastq.gz > ${OUTPUT_DIR}/${BC}.fastq.gz
done
```

#### 2. **Using the Provided concatenate_fastq.sh File**:
If you prefer to use the provided concatenate_fastq.sh script, follow these instructions:
- Navigate to the Folder Containing the pass Directory:
  - The pass folder should contain all the fastq.gz files for each barcode. The script expects the files to be organized within the barcode* directories under the pass folder.
    
- Execute the Script:
  - You must run the script from within the directory containing the pass folder.
  - Run the script using the following command:
```
bash concatenate_fastq.sh
```
  - This will concatenate all the fastq.gz files in each barcode folder inside pass and create a new output folder ("concatenated_fastq" by default), where concatenated files will be saved.
  - The output files will be named based on the barcode (e.g., BC01.fastq.gz, BC02.fastq.gz, etc.) and stored in the "concatenated_fastq" folder.
