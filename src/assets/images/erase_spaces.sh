#!/bin/bash

# Check if a directory is passed as an argument, else use the current directory
DIR=${1:-.}

# Find all .jpg files and rename them by replacing spaces with underscores
find "$DIR" -name "*.jpg" | while read FILE; do
    # Use parameter expansion to replace spaces with underscores
    NEWFILE=$(echo "$FILE" | sed 's/ /_/g')
    mv "$FILE" "$NEWFILE"
    echo "Renamed: $FILE -> $NEWFILE"
done

