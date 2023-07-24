#!/bin/bash

# Function to copy logo files
copy_logo() {
    size=$1
    color=$2

    src_path=~/pop-logo/Yaru-pop/Yaru-${color}/${size}/places
    dest_path=/usr/share/icons/Yaru-${color}/${size}/places

    sudo cp "${src_path}"/*.svg "${dest_path}/"
}

# List of sizes and colors
sizes=("24x24" "32x32" "48x48" "64x64" "128x128" "256x256")
colors=("" "bark" "blue" "magenta" "olive" "prussiangreen" "purple" "red" "sage" "viridian")

# Loop over sizes and colors to copy the logos
for size in "${sizes[@]}"; do
    for color in "${colors[@]}"; do
        copy_logo "${size}" "${color}"
    done
done

