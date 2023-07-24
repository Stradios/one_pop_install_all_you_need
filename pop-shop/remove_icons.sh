#!/bin/bash

# Define the file to be removed
file_to_remove="io.elementary.appcenter.png"

# Define an array with directories to search for the file
directories=(
    "/usr/share/icons/hicolor/16x16/apps"
    "/usr/share/icons/hicolor/16x16@2x/apps"
    "/usr/share/icons/hicolor/24x24/apps"
    "/usr/share/icons/hicolor/24x24@2x/apps"
    "/usr/share/icons/hicolor/32x32/apps"
    "/usr/share/icons/hicolor/32x32@2x/apps"
    "/usr/share/icons/hicolor/48x48/apps"
    "/usr/share/icons/hicolor/48x48@2x/apps"
    "/usr/share/icons/hicolor/512x512/apps"
    "/usr/share/icons/hicolor/512x512@2x/apps"
)

# Loop through each directory and remove the file if it exists
for dir in "${directories[@]}"; do
    file_path="$dir/$file_to_remove"
    if [ -f "$file_path" ]; then
        echo "Removing $file_path"
        rm -f "$file_path"
    else
        echo "$file_path not found, skipping..."
    fi
done

