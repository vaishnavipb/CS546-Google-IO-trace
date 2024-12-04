#!/bin/bash

# Set up logging
exec 1> darshan_parsing_$(date +%Y%m%d_%H%M%S).log 2>&1

# Export Darshan binary path
DARSHAN_PATH="/home/vpapudesibabu/vpb/darshan/darshan-3.4.6/darshan-util/darshaninstall/bin"
export LD_LIBRARY_PATH="/home/vpapudesibabu/vpb/darshan/darshan-3.4.6/darshan-util/darshaninstall/lib:$LD_LIBRARY_PATH"

export PATH="$DARSHAN_PATH:$PATH"

LOGS_DIR="/home/vpapudesibabu/vpb/darshan/darshan-logs/2024/11/22"

OUTPUT_DIR="darshan_parsed_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

echo "Starting Darshan parsing at $(date)"
echo "================================="

# Check if directory exists
if [ ! -d "$LOGS_DIR" ]; then
    echo "Error: Directory $LOGS_DIR does not exist"
    exit 1
fi

# Check if any .darshan files exist
if [ ! "$(ls -A $LOGS_DIR/*.darshan 2>/dev/null)" ]; then
    echo "Error: No .darshan files found in $LOGS_DIR"
    exit 1
fi

# For each .darshan file, parse and generate the text file.
for file in "$LOGS_DIR"/*.darshan; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        echo "Processing $filename"

        output_file="$OUTPUT_DIR/${filename%.darshan}_parsed.txt"
        echo "Parsing $filename at $(date)"
        echo "Output will be saved to $output_file"

        # Run darshan-parser with --all flag
        darshan-parser --all "$file" > "$output_file"

        if [ $? -eq 0 ]; then
            echo "Successfully parsed $filename"
        else
            echo "Error parsing $filename"
        fi
        echo "----------------------------------------"
    fi
done

echo "================================="
echo "Parsing completed at $(date)"
echo "Parsed files are saved in $OUTPUT_DIR"
echo "Total files processed: $(ls -1 "$OUTPUT_DIR" | wc -l)"