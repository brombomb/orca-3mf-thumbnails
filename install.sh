#!/bin/bash

#Install Requirements
sudo apt install p7zip-full p7zip-rar python3

script="3mf-thumbnailer.py"
script_dest="/usr/bin/"
script_name="3mf-thumbnailer"
helper="3mf.thumbnailer"
helper_dest="/usr/share/thumbnailers/"

sudo cp "$script" "$script_dest/$script_name"
sudo chmod +x "$script_dest/$script_name"

sudo mkdir -p "$helper_dest"
sudo cp "$helper" "$helper_dest"

# Display a message indicating successful installation
echo -e "\e[32mThumbnailer installed successfully\e[0m"