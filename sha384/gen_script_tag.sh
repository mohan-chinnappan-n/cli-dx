#!/bin/bash

# Script tag generator
# default algorithm is sha384
# mohan chinnappan
#--------------------------------------
# Run: 
## bash gen_script_tag.sh --file file.js --algorithm sha512
## bash gen_script_tag.sh --file jquery.min.js

echo "Script tag generator with Integrity"

# Default values
file=""
algorithm="sha384"

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --file) file="$2"; shift ;;
    --algorithm) algorithm="$2"; shift ;;
    *) echo "Unknown parameter: $1"; exit 1 ;;
  esac
  shift
done

# Check if the file is provided
if [ -z "$file" ]; then
  echo "Error: Please provide a filename using --file option."
  exit 1
fi

# Generate script tag
INTEGRITY=$(openssl dgst -"$algorithm" -binary "$file" | openssl base64 -A)
script_tag="<script src=\"$file\" integrity=\"$algorithm-$INTEGRITY\" crossorigin=\"anonymous\"></script>"
echo $script_tag
