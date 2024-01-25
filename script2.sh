#!/bin/bash

heainit

# Set the path to the directory containing folders
directory_path="/mnt/d/Research_Work/PSR_J05144002E"

# Check if the directory exists
if [ -d "$directory_path" ]; then
    # Loop through all folders in the directory
    for folder in "$directory_path"/*/; do
        # Extract the folder name from the path
        folder_name=$(basename "$folder")
        echo "Processing folder: $folder"
        cd "${folder}/xti/event_cl"
	barycorr infile="ni${folder_name}_0mpu7_cl.evt" outfile="bc${folder_name}_0mpu7_cl.evt" orbitfiles="${folder}auxil/ni${folder_name}.orb" refframe=ICRS
	cd "$directory_path"
    done
else
    echo "Directory does not exist: $directory_path"
fi
