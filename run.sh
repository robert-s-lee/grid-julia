#!/usr/bin/env bash

# raw argment list
echo "Arguments"
echo "$@"

# pop the first argment as the scripe name
script="$1"
shift
echo "Arguments"
echo "$@"

# run
echo julia  --project --threads auto -O1 $script $@    
julia  --project --threads auto -O1 $script $@    