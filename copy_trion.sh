#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <from DEVICEPACKAGE> <to DEVICEPACKAGE>"
  ehco "exemple: $0 T13F256 T20F256"
  exit 1
fi

# Set the DP variable
DP_FROM=$1
DP_FROM_LOWER=$(echo "$DP_FROM" | tr '[:upper:]' '[:lower:]')
DP_FROM_UPPER=$(echo "$DP_FROM" | tr '[:lower:]' '[:upper:]')
DP_TO=$2
DP_TO_LOWER=$(echo "$DP_TO" | tr '[:upper:]' '[:lower:]')
DP_TO_UPPER=$(echo "$DP_TO" | tr '[:lower:]' '[:upper:]')

# Create the new directory
mkdir -p "spiOverJtag_efinix_$DP_TO"

# Copy the XML files with new names
cp "spiOverJtag_efinix_$DP_FROM_LOWER/spiOverJtag_efinix_$DP_FROM_LOWER.xml" "spiOverJtag_efinix_$DP_TO/spiOverJtag_efinix_$DP_TO_LOWER.xml"
cp "spiOverJtag_efinix_$DP_FROM_LOWER/spiOverJtag_efinix_$DP_FROM_LOWER.peri.xml" "spiOverJtag_efinix_$DP_TO/spiOverJtag_efinix_$DP_TO_LOWER.peri.xml"

# Replace t20f256 with DP_LOWER and T20F256 with DP_UPPER in the XML files
sed -i "s/$DP_FROM_LOWER/$DP_TO_LOWER/g" "spiOverJtag_efinix_$DP_TO/spiOverJtag_efinix_$DP_TO_LOWER.xml"
sed -i "s/$DP_FROM_UPPER/$DP_TO_UPPER/g" "spiOverJtag_efinix_$DP_TO/spiOverJtag_efinix_$DP_TO_LOWER.xml"
sed -i "s/$DP_FROM_LOWER/$DP_TO_LOWER/g" "spiOverJtag_efinix_$DP_TO/spiOverJtag_efinix_$DP_TO_LOWER.peri.xml"
sed -i "s/$DP_FROM_UPPER/$DP_TO_UPPER/g" "spiOverJtag_efinix_$DP_TO/spiOverJtag_efinix_$DP_TO_LOWER.peri.xml"

echo "Folder spiOverJtag_efinix_$DP_TO and files created and modified successfully."
