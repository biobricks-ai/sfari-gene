#!/usr/bin/env bash

# Script to process unzipped files and build parquet files

# Get local path
localpath=$(pwd)
echo "Local path: $localpath"

# Create brick directory
export brickpath="$localpath/brick"
mkdir -p $brickpath
echo "Brick path: $brickpath"

# Process raw files and create parquet files in parallel
# calling a Python function with arguments input and output filenames
for file in download/*; do
  filename=$(basename "$file")
  filename_no_ext="${filename%.*}"
  python3 stages/csv2parquet.py "download/$filename" "brick/$filename_no_ext.parquet"
done