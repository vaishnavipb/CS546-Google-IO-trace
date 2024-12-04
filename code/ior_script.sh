#!/bin/bash

# Darshan environment configuration
export LD_PRELOAD="/home/vpapudesibabu/vpb/darshan/darshan-3.4.6/darshan-runtime/darshaninstall/lib/libdarshan.so"
export DARSHAN_DEBUG="1"
export DXT_ENABLE_IO_TRACE="1"
export LD_LIBRARY_PATH="/home/vpapudesibabu/vpb/darshan/darshan-3.4.6/darshan-util/darshaninstall/lib"
export PATH="/home/vpapudesibabu/vpb/darshan/darshan-3.4.6/darshan-util/darshaninstall/bin:$PATH"

# Test paths
TEST_PATHS=(
    "/mnt/nvme/vpapudesibabu/iortests"
)

# Test parameters
SIZES=("512b" "4kb" "64kb" "512kb" "1mb" "8mb")
OP_TYPES=("-w" "-r")

# Function to convert size to bytes
size_to_bytes() {
    local size=$1
    size=${size,,}  # convert to lowercase

    if [[ $size =~ mb$ ]]; then
        num=${size%mb}
        echo $((num * 1024 * 1024))
    elif [[ $size =~ kb$ ]]; then
        num=${size%kb}
        echo $((num * 1024))
    elif [[ $size =~ b$ ]]; then
        num=${size%b}
        echo $((num))
    else
        echo "Invalid size format: $size"
        exit 1
    fi
}

# Main execution
for path in "${TEST_PATHS[@]}"; do
    mkdir -p "$path"
    for op in "${OP_TYPES[@]}"; do
#        iteration=1
        for iter in {0..5}; do
          for size in "${SIZES[@]}"; do

              size_in_bytes=$(size_to_bytes "$size")
              block=$size_in_bytes
              segment=1
              max_blocks=8
              while [ "$block" -ge 64 ] && [ "$max_blocks" -gt -1 ]; do
                  output_file="${path}/test-${iter}-${size}-${block}-${segment}"

                  echo "Running: mpirun -n 128 ior -t $block -b $block -s $segment -F $op -k -E -z -Z -o $output_file"
                  mpirun -n 128 ior \
                      -t "$block" \
                      -b "$block" \
                      -s "$segment" \
                      -F "$op" \
                      -k -E -z -Z \
                      -o "$output_file"

                  # Check if command was successful
                  if [ $? -ne 0 ]; then
                      echo "Error running IOR command"
                      exit 1
                  fi

                  # Update values for next iteration
                  block=$((block / 2))
                  segment=$((segment * 2))
                  max_blocks=$((max_blocks-1))
              done
#              iteration=$((iteration + 1))
          done
        done
    done
done
