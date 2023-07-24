cd ~/Downloads/one_pop_install_all_you_need/io

# Define the source and destination paths
source_dir="/16x16/apps/io.elementary.appcenter.png"
source_dir_2="/16x16@2x/apps/io.elementary.appcenter.png"
source_dir_3="/24x24/apps/io.elementary.appcenter.png"
source_dir_4="/24x24@2x/apps/io.elementary.appcenter.png"
source_dir_5="/32x32/apps/io.elementary.appcenter.png"
source_dir_6="/32x32@2x/apps/io.elementary.appcenter.png"
source_dir_7="/48x48/apps/io.elementary.appcenter.png"
source_dir_8="/48x48@2x/apps/io.elementary.appcenter.png"
source_dir_9="/512x512/apps/io.elementary.appcenter.png"
source_dir_10="/512x512@2x/apps/io.elementary.appcenter.png"

destination_dir="$HOME/.local/share"
destination_dir_1="/usr/share/icons/hicolor/16x16/apps"
destination_dir_2="/usr/share/icons/hicolor/116x16@2x/apps"
destination_dir_3="/usr/share/icons/hicolor/24x24/apps"
destination_dir_4="/usr/share/icons/hicolor/24x24@2x/apps"
destination_dir_5="/usr/share/icons/hicolor/32x32/apps"
destination_dir_6="/usr/share/icons/hicolor/32x32@2x/apps"
destination_dir_7="/usr/share/icons/hicolor/48x48/apps"
destination_dir_8="/usr/share/icons/hicolor/48x48@2x/apps"
destination_dir_9="/usr/share/icons/hicolor/512x512/apps"
destination_dir_10="/usr/share/icons/hicolor/512x512@2x/apps"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Source directory '$source_dir' does not exist."
    exit 1
fi

# Create the destination directory if it doesn't exist
if [ ! -d "$destination_dir_1" ]; then
    sudo mkdir -p "$destination_dir_1"
    if [ ! -d "$destination_dir_2" ]; then
    sudo mkdir -p "$destination_dir_2"
    if [ ! -d "$destination_dir_3" ]; then
    sudo mkdir -p "$destination_dir_3"
    if [ ! -d "$destination_dir_4" ]; then
    sudo mkdir -p "$destination_dir_4"
    if [ ! -d "$destination_dir_5" ]; then
    sudo mkdir -p "$destination_dir_5"
    if [ ! -d "$destination_dir_6" ]; then
    sudo mkdir -p "$destination_dir_6"
    if [ ! -d "$destination_dir_7" ]; then
    sudo mkdir -p "$destination_dir_7"
    if [ ! -d "$destination_dir_8" ]; then
    sudo mkdir -p "$destination_dir_8"
    if [ ! -d "$destination_dir_9" ]; then
    sudo mkdir -p "$destination_dir_9"
    if [ ! -d "$destination_dir_10" ]; then
    sudo mkdir -p "$destination_dir_10"
fi

# Copy the source directories to the destinations
sudo cp -r "$source_dir" "$destination_dir_1"
sudo cp -r "$source_dir_2" "$destination_dir_2"
sudo cp -r "$source_dir_3" "$destination_dir_3"
sudo cp -r "$source_dir_4" "$destination_dir_4"
sudo cp -r "$source_dir_5" "$destination_dir_5"
sudo cp -r "$source_dir_6" "$destination_dir_6"
sudo cp -r "$source_dir_7" "$destination_dir_7"
sudo cp -r "$source_dir_8" "$destination_dir_8"
sudo cp -r "$source_dir_9" "$destination_dir_9"
sudo cp -r "$source_dir_10" "$destination_dir_10"

echo "Directories copied to their respective destinations."
