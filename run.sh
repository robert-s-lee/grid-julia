#!/usr/bin/env bash

# raw argment list
echo "Arguments"
echo "$@"

if [ "$#" == "0" ]; then
  echo "the first argement must be a script name"
  exit 1
fi

# Grid.ai put the last as the script name and the next to last as the --of the script
script="${@: -1}"
# remove the last two
set -- "${@:1:$(($#-2))}"
echo "Arguments"
echo "$@"

# run
echo julia  --project --threads auto -O1 $script $@    
julia  --project --threads auto -O1 $script $@    