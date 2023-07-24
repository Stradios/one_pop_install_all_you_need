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
# Install Telegram Desktop 
print_large_text "${GREEN}Installing Telegram Desktop...${NC}"
countdown
sudo apt install telegram-desktop -y

clear
# Run Brave installation script
print_large_text "${GREEN}Running Brave Browser...${NC}"
countdown
sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

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

clear
# Install Yaru themes
print_large_text "${GREEN}Installing Yaru themes...${NC}"
countdown
sudo apt install yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon yaru-theme-sound -y

clear
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
# Display initial message
print_large_text "${RED}Installing Pop_Shop icons${NC}"
countdown
cd ~/Downloads/one_pop_install_all_you_need/io
sudo ./remove_icons.sh
sudo cp ~/Downloads/one_pop_install_all_you_need/io/16x16/apps/io.elementary.appcenter.png /usr/share/icons/hicolor/16x16/apps
sudo cp ~/Downloads/one_pop_install_all_you_need/io/16x16@2xapps/io.elementary.appcenter.png /usr/share/icons/hicolor/16x16@2x/apps
sudo cp ~/Downloads/one_pop_install_all_you_need/io/24x24/apps/io.elementary.appcenter.png /usr/share/icons/hicolor/24x24/apps
sudo cp ~/Downloads/one_pop_install_all_you_need/io/24x24@2xapps/io.elementary.appcenter.png /usr/share/icons/hicolor/24x24@2x/apps
sudo cp ~/Downloads/one_pop_install_all_you_need/io/32x32/apps/io.elementary.appcenter.png /usr/share/icons/hicolor/32x32/apps
sudo cp ~/Downloads/one_pop_install_all_you_need/io/32x32@2xapps/io.elementary.appcenter.png /usr/share/icons/hicolor/32x32@2x/apps
sudo cp ~/Downloads/one_pop_install_all_you_need/io/48x48/apps/io.elementary.appcenter.png /usr/share/icons/hicolor/48x48/apps
sudo cp ~/Downloads/one_pop_install_all_you_need/io/48x48@2xapps/io.elementary.appcenter.png /usr/share/icons/hicolor/48x48@2x/apps
sudo cp ~/Downloads/one_pop_install_all_you_need/io/512x512/apps/io.elementary.appcenter.png /usr/share/icons/hicolor/512x512/apps
sudo cp ~/Downloads/one_pop_install_all_you_need/io/512x512@2xapps/io.elementary.appcenter.png /usr/share/icons/hicolor/512x512@2x/apps

clear
# Display initial message
print_large_text "${RED}Installing Pop_Logo icons${NC}"
countdown
# Pop logo Yaru 
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru/24x24/places/*.svg /usr/share/icons/Yaru/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru/32x32/places/*.svg /usr/share/icons/Yaru/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru/48x48/places/*.svg /usr/share/icons/Yaru/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru/64x64/places/*.svg /usr/share/icons/Yaru/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru/128x128/places/*.svg /usr/share/icons/Yaru/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru/256x256/places/*.svg /usr/share/icons/Yaru/256x256/places/
# Pop logo Yaru-bark
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-bark/24x24/places/*.svg /usr/share/icons/Yaru-bark/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-bark/32x32/places/*.svg /usr/share/icons/Yaru-bark/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-bark/48x48/places/*.svg /usr/share/icons/Yaru-bark/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-bark/64x64/places/*.svg /usr/share/icons/Yaru-bark/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-bark/128x128/places/*.svg /usr/share/icons/Yaru-bark/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-bark/256x256/places/*.svg /usr/share/icons/Yaru-bark/256x256/places/
# Pop logo Yaru-blue 
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-blue/24x24/places/*.svg /usr/share/icons/Yaru-blue/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-blue/32x32/places/*.svg /usr/share/icons/Yaru-blue/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-blue/48x48/places/*.svg /usr/share/icons/Yaru-blue/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-blue/64x64/places/*.svg /usr/share/icons/Yaru-blue/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-blue/128x128/places/*.svg /usr/share/icons/Yaru-blue/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-blue/256x256/places/*.svg /usr/share/icons/Yaru-blue/256x256/places/
# Pop logo Yaru-magenta 
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-magenta/24x24/places/*.svg /usr/share/icons/Yaru-magenta/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-magenta/32x32/places/*.svg /usr/share/icons/Yaru-magenta/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-magenta/48x48/places/*.svg /usr/share/icons/Yaru-magenta/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-magenta/64x64/places/*.svg /usr/share/icons/Yaru-magenta/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-magenta/128x128/places/*.svg /usr/share/icons/Yaru-magenta/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-magenta/256x256/places/*.svg /usr/share/icons/Yaru-magenta/256x256/places/
# Pop logo Yaru-olive 
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-olive/24x24/places/*.svg /usr/share/icons/Yaru-olive/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-olive/32x32/places/*.svg /usr/share/icons/Yaru-olive/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-olive/48x48/places/*.svg /usr/share/icons/Yaru-olive/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-olive/64x64/places/*.svg /usr/share/icons/Yaru-olive/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-olive/128x128/places/*.svg /usr/share/icons/Yaru-olive/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-olive/256x256/places/*.svg /usr/share/icons/Yaru-olive/256x256/places/
# Pop logo Yaru-prussiangreen 
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-prussiangreen/24x24/places/*.svg /usr/share/icons/Yaru-prussiangreen/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-prussiangreen/32x32/places/*.svg /usr/share/icons/Yaru-prussiangreen/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-prussiangreen/48x48/places/*.svg /usr/share/icons/Yaru-prussiangreen/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-prussiangreen/64x64/places/*.svg /usr/share/icons/Yaru-prussiangreen/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-prussiangreen/128x128/places/*.svg /usr/share/icons/Yaru-prussiangreen/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-prussiangreen/256x256/places/*.svg /usr/share/icons/Yaru-prussiangreen/256x256/places/
# Pop logo Yaru-purple 
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-purple/24x24/places/*.svg /usr/share/icons/Yaru-purple/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-purple/32x32/places/*.svg /usr/share/icons/Yaru-purple/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-purple/48x48/places/*.svg /usr/share/icons/Yaru-purple/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-purple/64x64/places/*.svg /usr/share/icons/Yaru-purple/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-purple/128x128/places/*.svg /usr/share/icons/Yaru-purple/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-purple/256x256/places/*.svg /usr/share/icons/Yaru-purple/256x256/places/
# Pop logo Yaru-red 
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-red/24x24/places/*.svg /usr/share/icons/Yaru-red/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-red/32x32/places/*.svg /usr/share/icons/Yaru-red/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-red/48x48/places/*.svg /usr/share/icons/Yaru-red/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-red/64x64/places/*.svg /usr/share/icons/Yaru-red/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-red/128x128/places/*.svg /usr/share/icons/Yaru-red/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-red/256x256/places/*.svg /usr/share/icons/Yaru-red/256x256/places/
# Pop logo Yaru-sage 
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-sage/24x24/places/*.svg /usr/share/icons/Yaru-sage/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-sage/32x32/places/*.svg /usr/share/icons/Yaru-sage/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-sage/48x48/places/*.svg /usr/share/icons/Yaru-sage/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-sage/64x64/places/*.svg /usr/share/icons/Yaru-sage/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-sage/128x128/places/*.svg /usr/share/icons/Yaru-sage/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-sage/256x256/places/*.svg /usr/share/icons/Yaru-sage/256x256/places/
# Pop logo Yaru-viridian 
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-viridian/24x24/places/*.svg /usr/share/icons/Yaru-viridian/24x24/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-viridian/32x32/places/*.svg /usr/share/icons/Yaru-viridian/32x32/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-viridian/48x48/places/*.svg /usr/share/icons/Yaru-viridian/48x48/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-viridian/64x64/places/*.svg /usr/share/icons/Yaru-viridian/64x64/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-viridian/128x128/places/*.svg /usr/share/icons/Yaru-viridian/128x128/places/
sudo cp ~/Downloads/one_pop_install_all_you_need/pop-logo/Yaru-pop/Yaru-viridian/256x256/places/*.svg /usr/share/icons/Yaru-viridian/256x256/places/

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

# Set the directory path
directory="$HOME/Downloads/one_pop_install_all_you_need/wallpaper/"

# Launch the file manager
xdg-open "$directory"

clear
# Install Extension Manager via Flatpak
print_large_text "${GREEN}Install one of the following packages:'gir1.2-gmenu-3.0'or'gnome-menus for ArcMenu by andrew_z '${NC}"
countdown
sudo apt install gir1.2-gmenu-3.0 gnome-menus

clear
# Install Extension Manager via Flatpak
print_large_text "${GREEN}Installing Extension Manager via Flatpak...${NC}"
countdown
flatpak install flathub com.mattjakeman.ExtensionManager

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
sudo ./login_wallpapaer.sh
cd $HOME/.login
chmod +x jammy-change-gdm-background
sudo ./jammy-change-gdm-background login-wallpaper.jpg

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

