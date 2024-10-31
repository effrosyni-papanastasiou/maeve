#!/bin/bash

# Directory containing the images
# FILES="./abstractions/"
FILES=$1
# Loop through each .png and .jpg file in the directory
for file in "$FILES"*.JPG "$FILES"*.jpg; do
    # Check if the file exists (to avoid errors if there are no matching files)
    if [ -e "$file" ]; then
        # Extract the file name without extension
        filename=$(basename "$file" | cut -f 1 -d '.')
        
        # Convert the file to .webp using cwebp
        cwebp "$file" -o "$FILES$filename.webp"
        
        echo "Converted: $file to $FILES$filename.webp"
    fi
done

