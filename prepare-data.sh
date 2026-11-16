#!/usr/bin/env bash

# get the output directory from $1, if not given, defaults to ./prepared-data
OUTPUT_DIR=${1:-data/prepared-data}

FILES="GSE234261_MXMERZ002A_01_barcodes.tsv.gz
GSE234261_MXMERZ002A_01_features.tsv.gz
GSE234261_MXMERZ002A_01_matrix.mtx.gz
GSE234261_MXMERZ002A_02_barcodes.tsv.gz
GSE234261_MXMERZ002A_02_features.tsv.gz
GSE234261_MXMERZ002A_02_matrix.mtx.gz
GSE234261_MXMERZ002A_03_barcodes.tsv.gz
GSE234261_MXMERZ002A_03_features.tsv.gz
GSE234261_MXMERZ002A_03_matrix.mtx.gz
GSE234261_MXMERZ002A_04_barcodes.tsv.gz
GSE234261_MXMERZ002A_04_features.tsv.gz
GSE234261_MXMERZ002A_04_matrix.mtx.gz
GSE234261_MXMERZ002A_05_barcodes.tsv.gz
GSE234261_MXMERZ002A_05_features.tsv.gz
GSE234261_MXMERZ002A_05_matrix.mtx.gz
GSE234261_MXMERZ002A_06_barcodes.tsv.gz
GSE234261_MXMERZ002A_06_features.tsv.gz
GSE234261_MXMERZ002A_06_matrix.mtx.gz
GSE234261_MXMERZ002A_07_barcodes.tsv.gz
GSE234261_MXMERZ002A_07_features.tsv.gz
GSE234261_MXMERZ002A_07_matrix.mtx.gz
GSE234261_MXMERZ002A_08_barcodes.tsv.gz
GSE234261_MXMERZ002A_08_features.tsv.gz
GSE234261_MXMERZ002A_08_matrix.mtx.gz
GSE234261_MXMERZ002A_09_barcodes.tsv.gz
GSE234261_MXMERZ002A_09_features.tsv.gz
GSE234261_MXMERZ002A_09_matrix.mtx.gz
GSE234261_MXMERZ002A_10_barcodes.tsv.gz
GSE234261_MXMERZ002A_10_features.tsv.gz
GSE234261_MXMERZ002A_10_matrix.mtx.gz
GSE234261_MXMERZ002A_11_barcodes.tsv.gz
GSE234261_MXMERZ002A_11_features.tsv.gz
GSE234261_MXMERZ002A_11_matrix.mtx.gz
GSE234261_MXMERZ002A_12_barcodes.tsv.gz
GSE234261_MXMERZ002A_12_features.tsv.gz
GSE234261_MXMERZ002A_12_matrix.mtx.gz
GSE234261_MXMERZ002A_13_barcodes.tsv.gz
GSE234261_MXMERZ002A_13_features.tsv.gz
GSE234261_MXMERZ002A_13_matrix.mtx.gz
GSE234261_MXMERZ002A_14_barcodes.tsv.gz
GSE234261_MXMERZ002A_14_features.tsv.gz
GSE234261_MXMERZ002A_14_matrix.mtx.gz
GSE234261_MXMERZ002A_15_barcodes.tsv.gz
GSE234261_MXMERZ002A_15_features.tsv.gz
GSE234261_MXMERZ002A_15_matrix.mtx.gz
GSE234261_MXMERZ002A_16_barcodes.tsv.gz
GSE234261_MXMERZ002A_16_features.tsv.gz
GSE234261_MXMERZ002A_16_matrix.mtx.gz
GSE234261_MXMERZ002A_17_barcodes.tsv.gz
GSE234261_MXMERZ002A_17_features.tsv.gz
GSE234261_MXMERZ002A_17_matrix.mtx.gz
GSE234261_MXMERZ002A_18_barcodes.tsv.gz
GSE234261_MXMERZ002A_18_features.tsv.gz
GSE234261_MXMERZ002A_18_matrix.mtx.gz
GSE234261_MXMERZ002A_19_barcodes.tsv.gz
GSE234261_MXMERZ002A_19_features.tsv.gz
GSE234261_MXMERZ002A_19_matrix.mtx.gz
GSE234261_MXMERZ002A_20_barcodes.tsv.gz
GSE234261_MXMERZ002A_20_features.tsv.gz
GSE234261_MXMERZ002A_20_matrix.mtx.gz
GSE234261_MXMERZ002A_21_barcodes.tsv.gz
GSE234261_MXMERZ002A_21_features.tsv.gz
GSE234261_MXMERZ002A_21_matrix.mtx.gz
GSE234261_MXMERZ002A_22_barcodes.tsv.gz
GSE234261_MXMERZ002A_22_features.tsv.gz
GSE234261_MXMERZ002A_22_matrix.mtx.gz
GSE234261_MXMERZ002A_23_barcodes.tsv.gz
GSE234261_MXMERZ002A_23_features.tsv.gz
GSE234261_MXMERZ002A_23_matrix.mtx.gz
GSE234261_MXMERZ002A_24_barcodes.tsv.gz
GSE234261_MXMERZ002A_24_features.tsv.gz
GSE234261_MXMERZ002A_24_matrix.mtx.gz
GSE234261_MXMERZ002A_25_barcodes.tsv.gz
GSE234261_MXMERZ002A_25_features.tsv.gz
GSE234261_MXMERZ002A_25_matrix.mtx.gz"


# The URL to the tar file
DATAURL="https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE234261&format=file&file="

echo "- Make the directory for prepared data ..."
mkdir -p "$OUTPUT_DIR"

echo "- Downloading data for each sample ..."
for file in $FILES; do
    sample="S$(echo "$file" | cut -d_ -f3)"
    filename=$(echo "$file" | cut -d_ -f4)
    echo "  - Downloading $file for sample $sample ..."
    mkdir -p "$OUTPUT_DIR/$sample"
    if [ ! -e "$OUTPUT_DIR/$sample/$filename" ]; then
        wget -O "$OUTPUT_DIR/$sample/$filename" "$DATAURL$file"
    fi
done

REF_URL="https://zenodo.org/records/14870431/files/seurat_harmony_pub.Rds?download=1"

echo "- Downloading reference Seurat object ..."
wget -O "$OUTPUT_DIR/seurat_harmony_pub.rds" "$REF_URL"

echo "- Done!"
