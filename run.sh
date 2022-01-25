#!/usr/bin/env bash

# raw argment list
echo "Arguments"
echo "$@"

if [ "$#" == "0" ]; then
  echo "the first argement must be a script name"
  exit 1
fi

# pop the first argment as the scripe name
script="$1"
shift
echo "Arguments"
echo "$@"

# run
echo julia  --project --threads auto -O1 $script $@    
julia  --project --threads auto -O1 $script $@    