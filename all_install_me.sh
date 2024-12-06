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

  echo -e "\\n${line}"
  echo -e "${message}"
  echo -e "${line}\\n"
}

# Function to detect the Linux distribution
detect_distro() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo $ID
  else
    echo "unknown"
  fi
}

# Install dependencies based on the detected distro
install_dependencies() {
  local distro=$(detect_distro)
  case "$distro" in
    ubuntu|debian)
      sudo apt-get update
      sudo apt-get install -y telegram-desktop gnome-tweaks
      ;;
    fedora)
      sudo dnf install -y telegram-desktop gnome-tweaks
      ;;
    arch|manjaro)
      sudo pacman -Syu --noconfirm telegram-desktop gnome-tweaks
      ;;
    *)
      echo -e "${RED}Unsupported Linux distribution: $distro${NC}"
      exit 1
      ;;
  esac
}

# Main script logic
print_large_text "${GREEN}Detecting Linux distribution and installing dependencies...${NC}"
install_dependencies

# Install Flatpak Extension Manager
flatpak install flathub com.mattjakeman.ExtensionManager -y

# Clone and install Fluent GTK theme
print_large_text "${GREEN}Running Fluent GTK theme installation script...${NC}"
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git
cd Fluent-gtk-theme
./install.sh
cd ..

# Clone and install Pop Cosmic Applications - Yaru Colors
git clone https://github.com/Stradios/pop-cosmic-applications-yaru-colors.git
cd pop-cosmic-applications-yaru-colors
./install.sh
cd ..

# Clone and install Flat-Remix-Pop-Blue-Dark icon pack
print_large_text "${GREEN}Running Flat-Remix-Pop-Blue-Dark icon pack installation script...${NC}"
git clone https://github.com/Stradios/Flat-Remix-Pop-Blue-Dark.git

# Clone and install Segoe UI Linux font
print_large_text "${GREEN}Running Segoe UI Linux installation script...${NC}"
git clone https://github.com/SpudGunMan/segoe-ui-linux
cd segoe-ui-linux
sudo ./install.sh
cd ..

# Copy wallpapers
cp -r ~/Downloads/one_pop_install_all_you_need/wallpaper ~/Pictures/

# Handle additional configurations (login and extensions setup)
cd ~/Downloads/one_pop_install_all_you_need/login/
cd ~/Downloads/one_pop_install_all_you_need/Extentins-config

# Script execution complete
print_large_text "${GREEN}Setup Complete!${NC}"

