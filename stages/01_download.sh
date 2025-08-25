#!/usr/bin/env bash

# Script to download files

# Get local path
localpath=$(pwd)
echo "Local path: $localpath"

# Create the download directory
export downloadpath="$localpath/download"
echo "Download path: $downloadpath"

base_url="https://gene.sfari.org//wp-content/themes/sfari-gene/utilities/download-csv.php?api-endpoint="
endpoints=("genes" "animal-genes" "cnvs")

mkdir -p "$downloadpath"

for endpoint in "${endpoints[@]}"; do
    url="${base_url}${endpoint}"
    output_file="$downloadpath/${endpoint}"
    echo "Downloading $url to $output_file"
    wget -q -O "$output_file" "$url"
done



echo "Download done."
