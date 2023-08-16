#!/bin/bash

# Color variables
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'
NC='\033[0m' # No Color



# Function to display larger text
print_large_text() {
  local message="$1"
  local length=${#message}
  local line=""

  for ((i = 0; i < length; i++)); do
    line+="="
  done

  echo -e "\n${line}"
  echo -e "${message}"
  echo -e "${line}\n"
}


# Display 

echo -e "${LBLUE}             /////////////                "*"${WHITE}https://github.com/Stradios"
echo -e "${LBLUE}         /////////////////////            "*"${WHITE}----------------------------- "
echo -e "${LBLUE}      ///////"${WHITE}767"${LBLUE}////////////////          "*"${WHITE}OS: Pop!_OS 22.04 LTS x86_64" 
echo -e "${LBLUE}    +//////"${WHITE}7676767676"${LBLUE}////////////         "*"${WHITE}DE: GNOME 42.5 "
echo -e "${LBLUE}   /////"${WHITE}76767"${LBLUE}//"${WHITE}7676767"${LBLUE}//////////////      "
echo -e "${LBLUE}  /////"${WHITE}767676"${LBLUE}///*"${WHITE}76767"${LBLUE}///////////////     "
echo -e "${LBLUE} ///////"${WHITE}767676"${LBLUE}///"${WHITE}76767."${LBLUE}///"${WHITE}7676*"${LBLUE}///////    "
echo -e "${LBLUE}/////////"${WHITE}767676"${LBLUE}//"${WHITE}76767"${LBLUE}///"${WHITE}767676"${LBLUE}////////   "
echo -e "${LBLUE}//////////"${WHITE}76767676767"${LBLUE}////"${WHITE}76767"${LBLUE}/////////   "
echo -e "${LBLUE}///////////"${WHITE}76767676"${LBLUE}//////"${WHITE}7676"${LBLUE}//////////   "
echo -e "${LBLUE}////////////"${WHITE},7676,"${LBLUE}///////"${WHITE}767"${LBLUE}///////////  "
echo -e "${LBLUE}/////////////"${WHITE}*7676"${LBLUE}///////"${WHITE}76"${LBLUE}////////////   "
echo -e "${LBLUE}///////////////"${WHITE}7676"${LBLUE}////////////////////    "
echo -e "${LBLUE} ///////////////"${WHITE}7676"${LBLUE}///"${WHITE}767"${LBLUE}////////////     "
echo -e "${LBLUE}  //////////////////////'////////////     "
echo -e "${LBLUE}   //////"${WHITE}.7676767676767676767,"${LBLUE}//////      "
echo -e "${LBLUE}    /////"${WHITE}767676767676767676767"${LBLUE}/////       "
echo -e "${LBLUE}      ///////////////////////////        "
echo -e "${LBLUE}         /////////////////////"
echo -e "${LBLUE}             /////////////     "                                   
echo -e "${RED}       Installing the Perfect Pop!_OS Distro: A Step-by-Step Guide"


# Function to display a 3-second countdown
countdown() {
  for ((i = 3; i > 0; i--)); do
    echo -e "${BLUE}Starting in $i seconds...${NC}"
    sleep 1
  done
}


# Update and upgrade packages
print_large_text "${GREEN}Updating and upgrading packages...${NC}"
countdown
sudo apt update && sudo apt upgrade -y

clear

# Install Ubuntu restricted extras
print_large_text "${GREEN}Installing Ubuntu restricted extras...${NC}"
countdown
sudo apt-get install ubuntu-restricted-extras -y

clear
# Remove fprintd
print_large_text "${GREEN}Install open-fprintd and Adding open-fprintd repository...${NC}"
countdown
sudo apt remove fprintd
sudo add-apt-repository -y ppa:uunicorn/open-fprintd
sudo apt-get update
sudo apt install open-fprintd fprintd-clients python3-validity -y

clear
# Enroll fingerprint
print_large_text "${GREEN}Enrolling fingerprint...${NC}"
countdown
fprintd-enroll

clear
# Configure PAM authentication
print_large_text "${GREEN}Configuring PAM authentication...${NC}"
countdown
sudo pam-auth-update

clear
# Install Brave 
print_large_text "${GREEN}Installing Telegram Desktop...${NC}"
countdown
flatpak install flathub com.brave.Browser -y

clear# Install 
Telegram Desktop 
print_large_text "${GREEN}Installing Telegram Desktop...${NC}"
countdown
sudo apt install telegram-desktop -y

clear

# Run Fluent GTK theme installation script
print_large_text "${GREEN}Running Fluent GTK theme installation script...${NC}"
countdown
cd ~/Downloads

# Clone the GitHub repository
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git

# Change directory to the cloned repository
cd Fluent-gtk-theme

# Run the install.sh script
./install.sh

# Optional: Ask user if they want to remove the folder
read -p "Do you want to remove the 'Fluent-gtk-theme' folder from Downloads? (yes/no): " remove_folder

if [[ "$remove_folder" =~ ^[Yy][Ee][Ss]$ ]]; then
    # Remove the folder
    cd ..
    rm -rf Fluent-gtk-theme
    echo "Folder removed successfully!"
else
    echo "Folder not removed."
fi

# Optional: Print a success message
echo "Installation completed successfully!"

cclear
# Run Pop Cosmic Applications Yaru Colors script
print_large_text "${GREEN}Running Pop Cosmic Applications Yaru Colors script...${NC}"
countdown
cd ~/Downloads/one_pop_install_all_you_need

# Clone the GitHub repository
git clone https://github.com/Stradios/pop-cosmic-applications-yaru-colors.git

# Change directory to the cloned repository
cd ~/Downloads/one_pop_install_all_you_need/pop-cosmic-applications-yaru-colors

chmod +x remove_icons.sh copy_icons.sh
# Run the install.sh script
sudo ./remove_icons.sh
sudo ./copy_icons.sh

clear
# Run Flat-Remix-Pop-Blue-Dark icon pack installation script
print_large_text "${GREEN}Running Flat-Remix-Pop-Blue-Dark icon pack installation script...${NC}"
countdown
cd ~/Downloads

# Clone the repository
git clone https://github.com/Stradios/Flat-Remix-Pop-Blue-Dark.git

# Check if the clone was successful
if [ $? -eq 0 ]; then
    echo "Repository cloned successfully."
else
    echo "Repository clone failed. Exiting."
    exit 1
fi

# Create target directories if they don't exist
sudo mkdir -p /usr/share/icons
sudo mkdir -p /usr/share/icons/.icons

# Copy the icon theme to the target directories
sudo cp -r Flat-Remix-Pop-Blue-Dark/ /usr/share/icons/
sudo cp -r Flat-Remix-Pop-Blue-Dark/ /usr/share/icons/.icons/

# Set appropriate permissions
sudo chown -R root:root /usr/share/icons/Flat-Remix-Pop-Blue-Dark
sudo chown -R root:root /usr/share/icons/.icons/Flat-Remix-Pop-Blue-Dark

# Clean up
rm -rf Flat-Remix-Pop-Blue-Dark

echo "Icon theme copied successfully to /usr/share/icons/ and /.icons/"


clear
# Run Segoe UI Linux installation script
print_large_text "${GREEN}Running Segoe UI Linux installation script...${NC}"
countdown
cd ~/Downloads

# Clone the GitHub repository
git clone https://github.com/SpudGunMan/segoe-ui-linux

# Change directory to the cloned repository
cd segoe-ui-linux

# Run the install.sh script
sudo ./install.sh

# Optional: Ask user if they want to remove the folder
read -p "Do you want to remove the 'segoe-ui-linux' folder from Downloads? (yes/no): " remove_folder

if [[ "$remove_folder" =~ ^[Yy][Ee][Ss]$ ]]; then
    # Remove the folder
    cd ..
    rm -rf segoe-ui-linux
    echo "Folder removed successfully!"
else
    echo "Folder not removed."
fi

# Optional: Print a success message
echo "Installation completed successfully!"

clear
# Insttaling GDM Login Wallpaper
print_large_text "${GREEN}Insttaling Wallpaper...${NC}"
print_large_text "${GREEN}Do Not if you dont want but it wil not mache the login!${NC}"
countdown
sudo cp -r ~/Downloads/one_pop_install_all_you_need/wallpaper ~/Pictures/


clear
# Install Extension Manager via Flatpak
print_large_text "${GREEN}Install one of the following packages:'gir1.2-gmenu-3.0'or'gnome-menus for ArcMenu by andrew_z '${NC}"
countdown
sudo apt install gir1.2-gmenu-3.0 gnome-menus

clear
# Install Extension Manager via Flatpak
print_large_text "${GREEN}Installing Extension Manager via Flatpak...${NC}"
countdown
flatpak install flathub com.mattjakeman.ExtensionManager -y

clear
# Install GNOME Tweaks
print_large_text "${GREEN}Installing GNOME Tweaks...${NC}"
countdown
sudo apt install gnome-tweaks -y

clear
## Installing gnome-shell-Extension
print_large_text "${GREEN}Installing gnome-shell-Extension...${NC}"
# Display initial message
print_large_text "${RED}You need to reboot for this to apply!..${NC}"
countdown
cd ~/Downloads/one_pop_install_all_you_need
# Define the source and destination paths
source_dir="gnome-shell"
destination_dir="$HOME/.local/share"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Source directory '$source_dir' does not exist."
    exit 1
fi

# Create the destination directory if it doesn't exist
if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

# Copy the source directory to the destination
cp -r "$source_dir" "$destination_dir"

echo "Directory '$source_dir' copied to '$destination_dir'."

clear

# Edit GDM custom configuration
print_large_text "${GREEN}Opening GDM custom configuration file...${NC}"
echo -e "${GREEN}Set the - WaylandEnable=true${NC}"
echo -e "${GREEN}Press Ctrl+x and Enter{NC}"

countdown
sudo nano /etc/gdm3/custom.conf

clear
# Insttaling GDM Login Wallpaper
print_large_text "${GREEN}Insttaling GDM Login Wallpaper...${NC}"
print_large_text "${GREEN}Do Not accept (y/yes)!!!${NC}"
print_large_text "${GREEN}You will be prompted to reboot after!!!${NC}"
countdown

cd ~/Downloads/one_pop_install_all_you_need/login
sudo ./jammy-change-gdm-background 1272636.png

clear
# Setting uppdconf
print_large_text "${GREEN}Setting uppdconf...${NC}"
countdown
cd ~/Downloads/one_pop_install_all_you_need/Extentins-config
dconf load -f / < saved_settings.dconf

clear
# Display initial message
print_large_text "${RED}Installation was Successful! ${NC}"
print_large_text "${GREEN}Reboot for all to take effect !!!${NC}"
countdown
# Prompt the user
read -p "Would you like to Reboot the system? (yes/y or no/n): " answer

# Convert the answer to lowercase
answer="${answer,,}"

# Check the user's response
if [[ $answer == "yes" || $answer == "y" ]]; then
    echo "Rebooting..."
    sudo reboot
elif [[ $answer == "no" || $answer == "n" ]]; then
    echo "Exiting terminal."
    exit 0
else
    echo "Invalid input. Exiting terminal."
    exit 1
fi

