#!/bin/bash

#Install Requirements
sudo apt install p7zip-full p7zip-rar python3

script="3mf-thumbnailer.py"
script_dest="/usr/bin/3mf-thumbnailer"
helper="3mf.thumbnailer"
helper_dest="/usr/share/thumbnailers/"

move_file() {
    sudo mkdir -p "$2"
    sudo cp "$1" "$2"
}

move_file "$script" "$script_dest"
move_file "$helper" "$helper_dest"

# Set appropriate permissions
sudo chmod +x "$script_dest"

# Display a message indicating successful installation
echo -e "\e[32mThumbnailer installed successfully\e[0m"