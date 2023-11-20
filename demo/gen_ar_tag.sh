#!/bin/bash

# Determine the directory where the script is located
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Run the Docker container with volume binding
docker run --rm -it -v "${script_dir}/ar_tag:/ar_tag" ar-test rosrun ar_track_alvar createMarker 123 -s 15.0
