#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

while IFS= read -r line; do
    echo "https://$line"
done < "$filename"
