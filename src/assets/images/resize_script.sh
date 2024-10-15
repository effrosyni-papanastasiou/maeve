#!/bin/bash

# Check if the user provided an argument for the pixel size
if [ -z "$1" ]; then
    echo "Usage: $0 <max_pixel_size>"
    exit 1
fi

# Store the argument (number of pixels) in a variable
PIXELS=$1

# Directory containing the images
FILES="./souvenirs-meles/"

# Loop through each file in the directory that matches .jpeg, .jpg, or .png
for file in "$FILES"*.jpeg "$FILES"*.jpg "$FILES"*.png; do
    # Check if the file exists (to avoid errors if there are no matching files)
    if [ -e "$file" ]; then
        # Resize the image to the specified pixel size (preserving aspect ratio)
        sips -Z "$PIXELS" "$file"
        echo "Resized: $file to $PIXELS pixels"
    fi
done

